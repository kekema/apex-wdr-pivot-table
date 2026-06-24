window.lib4x = window.lib4x || {};
window.lib4x.axt = window.lib4x.axt || {};
window.lib4x.axt.wdr = window.lib4x.axt.wdr || {};

/*
 * Region plugin, wrapping WebDataRocks Pivot Grid Component (https://www.webdatarocks.com/)
 * Tech doc: https://github.com/kekema/apex-wdr-pivot-table
 * Important: WebDataRocks license: https://www.webdatarocks.com/license-agreement/
 * 
 * Enables APEX data source integration, primary/alternative/private reports, save/load of private reports (local). 
 * Support for Drill-Through using Interactive Report (inline dialog), Chart integration, Themes, Translation.
 * 
 * Design consideration is to load pre-aggregated data from the server. The WDR build-in Drill-Through is disabled. 
 * Instead a custom Drill-Through can be achieved using IR, loading the detailed records behind a cell at Drill-Through moment.
 * Also for Chart integration, data is loaded from the server only as per the current selected Pivot table cell context.
 * 
 * WDR has a data size limit of 1MB.
 * 
 * For retrieving IR/Chart data from the server as per the current Pivot Table context, the plugin prepares a Filters JSON,
 * communicated to the server using the hidden 'Filters Page Item'.
 */
lib4x.axt.wdr.pivotTable = (function($) {
    
    const C_LIB4X_WDR_PT = 'lib4x-wdr-pt';      // region class
    const C_LIB4X_PT_DT = 'lib4x-pt-dt';        // inline dialog class
    const WDR_PT_EXT = '_pt';                   // id extension for widget id
    const C_APEX_THEME_VITA_DARK = 'apex-theme-vita-dark';
    const LOCAL_STORAGE_PREFIX = 'lib4x_wdr_pt';
    let monthMap = null;                        // mapping month names to numbers
                     
    $(function(){
        // WDR api's/events do return month names only for date types
        // monthMap is used to enable normalized values
        monthMap = apex.locale.getMonthNames().reduce((obj, month, index) => {
            obj[month.toLowerCase()] = String(index + 1).padStart(2, '0');
            return obj;
        }, {});         
    })

    /*
     * webDataRocksModule
     * - WDR instantiation
     * - toolbar customization + handlers (save, load, delete report, etc)
     * - set up event handlers (click/doubleclick)
     * - prepare Filters JSON
     */
    let webDataRocksModule = (function() 
    {
        /*
         * initPT
         * ajaxIdentifier: for any future server callbacks
         * ptStaticId: region static id
         * ptStaticIdPt: pivot table widget div id (region child div)
         * ptInternalId: region internal id
         * dtDialogStaticId: drill-through inline dialog id
         * filtersPageItem: configured (hidden) page item to hold the Filters JSON
         * options: plugin detailed options
         */
        let initPT = function(ajaxIdentifier, ptStaticId, ptStaticIdPt, ptInternalId, dtDialogStaticId, filtersPageItem, options) {
            let pt$ = $('#' + ptStaticIdPt);  
            // server-side, the JSON data resultset is added to the page using htp.p('var gPt' || l_internal_id || 'data = {"data":');
            let ptData = window['gPt' + ptInternalId + 'data']?.data;      

            // get name of current pt report
            function getReportName()
            {
                let ptWidget = pt$.data('webdatarocks');
                let ptReport = ptWidget.getReport();
                let reportName = ptReport.options.grid.title;
                return reportName;                
            }

            // get type of current pt report: classic, compact or flat
            function getReportType()
            {
                let ptWidget = pt$.data('webdatarocks');
                let ptReport = ptWidget.getReport();
                let reportType = ptReport.options.grid.type;
                return reportType;                
            }

            // get all configured reports
            function getAllReports()
            {
                return [options.primaryReport, ...(options.alternativeReports ?? []), ...(options.privateReports ?? [])];
            }

            function getReportForName(name)
            {
                let reports = getAllReports();
                return reports.find(report => report.options.grid.title === name);
            }

            function enableDisableToolbarButtons()
            {
                let reportName = getReportName();
                let cfgReport = getReportForName(reportName);
                // only private reports can be deleted
                if (cfgReport.lib4x.type == 'private')
                {
                    pt$.find('#lib4x-tab-deletereport').removeClass("is-disabled"); 
                }
                else
                {
                    pt$.find('#lib4x-tab-deletereport').addClass("is-disabled");
                }                
            }

            // customize the WDR pt toolbar as to have our own save/load/delete/maximize
            function customizeToolbar(toolbar)
            {
                // toolbar save button logic
                function saveReportConfig()
                {
                    let ptWidget = pt$.data('webdatarocks');
                    function dialogResult(result)
                    {
                        if (result)
                        {
                            // dialogResult callback is called from dialog close event: dialog is hidden, but DOM content is still there (in top page)
                            let reportName = apex.util.getTopApex().jQuery('#lib4x_pt_saveReportName').val();
                            if (reportName)
                            {
                                let ptReport = ptWidget.getReport();
                                let cfgReportToSave = JSON.parse(JSON.stringify(ptReport));
                                // just to be sure, delete any dataSource from the report - dataSource however should be with the global object only
                                if (cfgReportToSave.dataSource)
                                {
                                    delete cfgReportToSave.dataSource;
                                }                         
                                let saveReport = false;
                                let cfgExistingReport = getReportForName(reportName);
                                if (cfgExistingReport)
                                {
                                    if (cfgExistingReport.lib4x.type === 'private')
                                    {
                                        // reassign existing report config
                                        Object.keys(cfgExistingReport).forEach(key => {
                                            if (key !== "lib4x") {
                                                delete cfgExistingReport[key];
                                            }
                                        });   
                                        Object.assign(cfgExistingReport, cfgReportToSave);    // assign cfgReportToSave properties to cfgExistingReport   
                                        cfgExistingReport.options.grid.title = reportName;
                                        // change report name current loaded report
                                        let ptReportOptions = ptWidget.getOptions();
                                        ptReportOptions.grid.title = reportName;
                                        ptWidget.setOptions(ptReportOptions);   
                                        ptWidget.refresh();   
                                        saveReport = true;  
                                        enableDisableToolbarButtons();                         
                                    }
                                    else
                                    {
                                        // '\'' + reportName + '\' is a ' + cfgExistingReport.lib4x.type + ' report. Can only save as a private report.'
                                        // use lang.formatNoEscape as message.alert will escape
                                        apex.message.alert(apex.lang.formatNoEscape(getMessage('SAVE_REPORT_WRONG_TYPE'), reportName, cfgExistingReport.lib4x.type));
                                    }
                                }
                                else
                                {
                                    // change report name current loaded report
                                    let ptReportOptions = ptWidget.getOptions();
                                    ptReportOptions.grid.title = reportName; 
                                    ptWidget.setOptions(ptReportOptions);
                                    ptWidget.refresh();
                                    // new private report
                                    cfgReportToSave.lib4x = {type: 'private'};
                                    cfgReportToSave.options.grid.title = reportName; 
                                    options.privateReports.push(cfgReportToSave);
                                    saveReport = true;
                                    enableDisableToolbarButtons();
                                }
                                if (saveReport)
                                {
                                    if (apex.storage.hasLocalStorageSupport()) 
                                    {
                                        let localStorage = apex.storage.getScopedLocalStorage({prefix: LOCAL_STORAGE_PREFIX, useAppId: true, usePageId: true});
                                        if (localStorage)
                                        {
                                            localStorage.setItem(ptStaticId + '.privateReports', JSON.stringify(options.privateReports));   
                                            localStorage.setItem(ptStaticId + '.currentReport', reportName);          
                                            apex.message.showPageSuccess(getMessage('PRIVATE_REPORT_SAVED'));   
                                        }
                                    }    
                                }                            
                            }
                            else
                            {
                                // if no value was entered for the name, go back to save dialog
                                setTimeout(()=>{
                                    saveReportConfig();
                                })
                            }
                            // in case of future remote save feature, ajax callback can be used
                            /*apex.server.plugin(
                                ajaxIdentifier, 
                                { 
                                    x01: "Sometext", 
                                    x02: "Sometext2", 
                                    x03: "SomeValue3", 
                                    x04: "4",
                                    p_clob_01: JSON.stringify(reportToSend)   
                                }, 
                                { 
                                    success: function(pData) { 
                                        console.log('AJAX callback complete: ', pData); 
                                    }
                                } 
                            ); */
                        }
                    }
                    // show save report dialog for report name input
                    let ptReport = ptWidget.getReport();
                    let reportName = ptReport.options.grid.title;
                    let cfgReport = getReportForName(reportName);
                    let defaultName = '';
                    if (cfgReport.lib4x.type === 'private')
                    {
                        defaultName = reportName;
                    }
                    // apex.message.showDialog is non-official but won't go anywhere
                    apex.message.showDialog('<div class="is-required"><label for="lib4x_pt_saveReportName" class="t-Form-label">Name</label> ' +
                        '<input type="text" id="lib4x_pt_saveReportName" value="'+defaultName+'" required class="apex-item-text" style="width: 100%;"></div>',
                        {
                            title: getMessage('SAVE_PIVOT_REPORT'),
                            unsafe: false,
                            confirm: true,
                            open: function(e) {
                                // by having an open function, the input element will receive focus on open
                            },                            
                            callback: dialogResult
                        });
                }
    
                // toolbar load button logic
                function loadReportConfig()
                {
                    let ptWidget = pt$.data('webdatarocks');
                    function dialogResult(result)
                    {
                        if (result)
                        {
                            let selectedIndex = apex.util.getTopApex().jQuery('#lib4x_pt_loadReportName').val();
                            if (selectedIndex)
                            {
                                let ptReport = ptWidget.getReport();
                                if (ptReport)
                                {
                                    // get the selected report
                                    let cfgReports = getAllReports();
                                    let cfgReport = cfgReports[Number(selectedIndex)];
                                    // make it the current actual report
                                    ptWidget.setReport(cfgReport);
                                    // store selection in local storage
                                    if (apex.storage.hasLocalStorageSupport()) 
                                    {
                                        let localStorage = apex.storage.getScopedLocalStorage({prefix: LOCAL_STORAGE_PREFIX, useAppId: true, usePageId: true});
                                        if (localStorage)
                                        {
                                            localStorage.setItem(ptStaticId + '.currentReport', cfgReport.options.grid.title);          
                                        }
                                    }                                    
                                }
                            }
                        }
                    }
                    // compose selectlist options with all reports grouped to 'Default' / 'Private'
                    // where 'default' are the primary and alternative reports
                    let ptReport = ptWidget.getReport();
                    let ptTitle = ptReport.options.grid.title;
                    let cfgDefaultReports = [options.primaryReport, ...options.alternativeReports];
                    let optionsDefaultReports = cfgDefaultReports
                        .map((cfgReport, index) => {
                            let cfgReportTitle = cfgReport.options.grid.title;
                            let selected = (cfgReportTitle === ptTitle) ? 'selected' : '';
                            return `<option ${selected} value="${index}">${cfgReportTitle}</option>`;
                        }).join("");
                    let baseIndex = cfgDefaultReports.length;
                    let optionsPrivateReports = options.privateReports
                        .map((cfgReport, index) => {
                            let cfgReportTitle = cfgReport.options.grid.title;
                            let selected = (cfgReportTitle === ptTitle) ? 'selected' : '';
                            return `<option ${selected} value="${baseIndex+index}">${cfgReportTitle}</option>`;
                        }).join("");  
                    // load pivot report dialog                      
                    apex.message.showDialog('<div>' +
                        '<select id="lib4x_pt_loadReportName" class="selectlist apex-item-select" style="width: 100%;" data-native-menu="false" size="1">' + 
                        '<optgroup label="Default">' + optionsDefaultReports + '</optgroup><optgroup label="Private">' + optionsPrivateReports + '</optgroup></select>' +
                        '</div>',
                        {
                            title: getMessage('LOAD_PIVOT_REPORT'),
                            unsafe: false,
                            confirm: true,
                            open: function(e) {
                                // by having an open function, the select element will receive focus on open
                            },
                            callback: dialogResult
                        });
                }  
                
                // toolbar delete logic
                function deleteReportConfig()
                {
                    let ptWidget = pt$.data('webdatarocks');
                    function deleteReport(reportName)
                    {
                        if (reportName)
                        {
                            // remove from private reports
                            options.privateReports = options.privateReports.filter(
                                cfgPrivateReport => cfgPrivateReport.options.grid.title !== reportName
                            );
                            // switch pt to primary report
                            let cfgReport = getAllReports()[0];
                            ptWidget.setReport(cfgReport);
                            if (apex.storage.hasLocalStorageSupport()) 
                            {
                                // store changes
                                let localStorage = apex.storage.getScopedLocalStorage({prefix: LOCAL_STORAGE_PREFIX, useAppId: true, usePageId: true});
                                if (localStorage)
                                {
                                    localStorage.setItem(ptStaticId + '.privateReports', JSON.stringify(options.privateReports)); 
                                    localStorage.setItem(ptStaticId + '.currentReport', cfgReport.options.grid.title);  
                                    apex.message.showPageSuccess(getMessage('REPORT_DELETED'));  
                                }
                            }                                    
                        }
                    }
                    let ptReport = ptWidget.getReport();
                    let ptReportTitle = ptReport.options.grid.title;
                    let cfgReport = getReportForName(ptReportTitle);
                    if (cfgReport && cfgReport.lib4x.type === 'private')
                    {
                        // 'Remove private report \'%0\'?'
                        // use lang.formatNoEscape as message.confirm will escape
                        apex.message.confirm(apex.lang.formatNoEscape(getMessage('Q_REMOVE_PRIVATE_REPORT'), ptReportTitle), function(okPressed) {
                            if (okPressed) {
                                deleteReport(ptReportTitle);
                            }
                        });
                    }                 
                }
                // if the region template is the std template and configured with hidden header but 'Show Maximize Button' checked, then
                // we include a maximize button in the WDR toolbar
                // the APEX generated HTML will have the max button included in the hidden header
                // so we just use $(button).click() as to reuse the APEX UT maximize feature
                let inclMaxButton = false;
                let maxButton$ = $('#' + ptStaticId).find('.js-maximizeButtonContainer button');
                if (maxButton$.length > 0)
                {
                    // include when header is hidden or header is hidden but accessible
                    // in case of 'hidden but accessible', the region in fact is not really hidden but absolute positioned with height/width of 1px
                    if (maxButton$.closest('.t-Region-header').is(':hidden') || maxButton$.closest('.t-Region-header').css('position') === 'absolute')
                    {
                        inclMaxButton = true;
                    }
                }                
                pt$.data('webdatarockstoolbar', toolbar);
                let tabs = toolbar.getTabs(); 
                // get rid of NA toolbar items      
                tabs = tabs.filter(tab => (tab.id === "wdr-tab-format" || tab.id === "wdr-tab-options" || tab.id === "wdr-tab-fields" || tab.id === "wdr-tab-export" || (inclMaxButton && tab.id === "wdr-tab-fullscreen"))); 
                // add own buttons
                tabs.unshift({
                    id: "lib4x-tab-savereport",
                    title: getMessage('TOOLBAR.SAVE'),
                    handler: saveReportConfig,
                    icon: toolbar.icons.save
                },{
                    id: "lib4x-tab-loadreport",
                    title: getMessage('TOOLBAR.LOAD'),
                    handler: loadReportConfig,
                    icon: toolbar.icons.open_local
                },
                {
                    id: "lib4x-tab-deletereport",
                    title: getMessage('TOOLBAR.DELETE'),
                    handler: deleteReportConfig,
                    icon: '<i class="fa fa-trash-o" style="font-size:19px;"></i>'
                });
                if (inclMaxButton)
                {
                    let maxTab = tabs.find(tab => tab.id === 'wdr-tab-fullscreen');
                    maxTab.id = 'lib4x-tab-fullscreen';
                    maxTab.title = getMessage('TOOLBAR.MAXIMIZE'),
                    // instead of WDR native full screen logic, maximize the region
                    maxTab.handler = function(){
                        maxButton$.click();
                        setTimeout(()=>{
                            pt$.data('webdatarocks').refresh();
                        }, 500);
                    }
                }
                //tabs.forEach((tab,index)=>{
                    //tab.rightGroup = false;
                //})                      
                //toolbar.icons.format = '<img src="https://www.flexmonster.com/base/assets/img/svg/logo-sign.svg?v2"/>';
                toolbar.getTabs = function() {
                    return tabs;
                }
                // trigger lib4x_wdr_beforetoolbarcreated so the application developer can make any further toolbar adjustments
                let eventData = {toolbar: toolbar};
                apex.event.trigger(pt$, 'lib4xbeforetoolbarcreated', eventData);
                // reduce size of all icons
                tabs.forEach((tab, index)=>{
                    tab.icon = tab.icon.replace('width="36"', 'width="20"');
                    tab.icon = tab.icon.replace('height="36"', 'height="20"');
                });
            }

            // on cell single click, fire lib4xcellclick event
            // cell click will be triggered in case of cell click but also in case of selecting multiple cells and then releasing the mouse button
            function onCellClick(cell)
            {
                let ptWidget = pt$.data('webdatarocks');
                let ptReport = ptWidget.getReport();    
                let filters = getFilters(ptReport, cell);
                setFiltersPageItem(filters);
                // cell: the clicked cell or in case of multiple cell selection the last cell
                // selectedCells: ptWidget.getSelectedCell() will give all selected cells                  
                let eventData = {cell: cell, selectedCells: ptWidget.getSelectedCell(), filters: filters, util: getEventUtil(cell)};
                apex.event.trigger($('#' + ptStaticIdPt), 'lib4xcellclick', eventData);
            }

            // on cell double click, fire lib4xcelldblclick event
            // if an Inline Dialog for Drill-Through is configured, the IR is refreshed and the dialog openend
            function onCellDoubleClick(cell)
            {
                if (cell.measure && cell.type === 'value' && !Number.isNaN(cell.value))
                {                                   
                    // compose detail header html
                    let drillThroughHeading = getDrillThroughHeading(cell);
                    let ptWidget = pt$.data('webdatarocks');
                    let ptReport = ptWidget.getReport();
                    let filters = getFilters(ptReport, cell);
                    setFiltersPageItem(filters)                                     
                    let eventData = {cell: cell, filters: filters, util: getEventUtil(cell)};
                    apex.event.trigger($('#' + ptStaticIdPt), 'lib4xcelldblclick', eventData);
                    // start any configured dialog
                    // for flat report, WDR is not giving all columns, so we can't support
                    if (dtDialogStaticId && getReportType() != 'flat')
                    {
                        // populate any static content region with pt-dt-header class with drillThroughHeading
                        $('#' + dtDialogStaticId + ' .pt-dt-header').html(drillThroughHeading);
                        // detect region with pt-dt-report class
                        let irDomId = $('#' + dtDialogStaticId + ' .pt-dt-report').attr('id');
                        if (irDomId)
                        {
                            apex.region(irDomId).refresh();
                            apex.theme.openRegion(dtDialogStaticId);
                        }
                    }
                }
            } 

            // util functions for click event handlers
            function getEventUtil(cell)
            {
                let util = {};
                util.getChartHeading = function(exclude) {
                    return getChartHeading(cell, exclude);
                }
                util.getDrillThroughHeading = function() {
                    return getDrillThroughHeading(cell);
                }
                util.getTruncDate = function(dimension, unit)
                {
                    return getTruncDate(cell, dimension, unit);
                }  
                return util;              
            }

            function setFiltersPageItem(filters)
            {
                if (filtersPageItem)
                {
                    apex.item(filtersPageItem).setValue(JSON.stringify({filters: filters}));   
                }
            }

            function formatDimensionCaption(uniqueName) {
                const parts = uniqueName.split('.');
                return parts.length > 1
                    ? parts.slice(1).join(' - ')
                    : uniqueName;
            }

            // a predefined heading (html) for Drill-Through IR as per current selected cell
            function getDrillThroughHeading(cell)
            {
                let reportName = getReportName();
                let rowLabel = cell.rows.map(row => formatDimensionCaption(row.uniqueName)).join(' - ') || ' - ';
                let columnLabel = cell.columns.map(column => formatDimensionCaption(column.uniqueName)).join(' - ') || ' - ';
                let measureLabel = cell.label || ' - ';
                const out = apex.util.htmlBuilder();
                out.markup('<div')
                    .attr('class', 'dt-details-container')
                    .markup('><span')
                    .attr('class', 'dt-details-label')
                    .markup('><b>')
                    .content('Pivot Report: ')
                    .markup('</b>')
                    .content(reportName)
                    .markup('</span><span')
                    .attr('class', 'dt-details-label')
                    .markup('><b>')                        
                    .content('Row: ')
                    .markup('</b>')
                    .content(rowLabel)
                    .markup('</span><span')
                    .attr('class', 'dt-details-label')
                    .markup('><b>')
                    .content('Column: ')
                    .markup('</b>')
                    .content(columnLabel)
                    .markup('</span><span')
                    .attr('class', 'dt-details-label')
                    .markup('><b>')
                    .content(cell.measure.caption + ': ')
                    .markup('</b>')
                    .content(measureLabel)
                    .markup('</span></div>');   
                return out.toString();      
            }

            // a text heading for any integrated chart as per current selected cell
            // exclude: a string or an array of row/column entries to exclude from considering
            // eg: the PT might have a cell selected for a particular month but in the Chart the whole year is shown
            // when the field name is 'PERIOD', then 'PERIOD.Month' row or column can be excluded here in this example
            function getChartHeading(cell, exclude)
            {
                exclude = exclude ?? [];
                if (!Array.isArray(exclude))
                {
                    exclude = [exclude];
                }
                let result = cell.rows.concat(cell.columns).filter(dimension => !exclude.includes(dimension.hierarchyUniqueName)).map(dimension => dimension.caption).join(' - ');   
                return result;       
            }
            
            // returns a Filters JSON as per the current:
            // - selected cell in the pivot table
            // - pt report filters
            // - pt row/column filters
            function getFilters(ptReport, cell)
            {
                let filters = [];
                cell.columns.concat(cell.rows).forEach(dimension => {
                    if (dimension)
                    {
                        filters.push({
                            name: dimension.hierarchyUniqueName,
                            type: 'cell',
                            members: [
                                dimension.uniqueName
                            ],
                            negation: false
                        })
                    }
                });
                ptReport.slice.reportFilters?.forEach(reportFilter => {
                    if (reportFilter.filter?.members)
                    {
                        filters.push({
                            name: reportFilter.uniqueName,
                            type: 'report',
                            members: reportFilter.filter.members,
                            negation: Boolean(reportFilter.filter.negation)
                        });
                    }
                });
                ptReport.slice.columns.concat(ptReport.slice.rows).forEach(dimension => {
                    if (dimension?.filter)
                    {
                        filters.push({
                            name: dimension.uniqueName,
                            type: 'dimension',
                            members: dimension.filter.members,
                            negation: Boolean(dimension.filter.negation)
                        });
                    }
                });
                // in case of options.normalizeFilters, replace month/quarter names by month/quarter numbers
                if (options.normalizeFilters)
                {
                    let datePattern = options.webdatarocks.global.options.datePattern;
                    // replace month names; prefix day numbers < 10; use ISO dates; use quarter 1-4         
                    filters.forEach(filter => {
                        let type = getFieldType(filter.name);
                        let transform = filter.name.endsWith('.Month') ? value => monthMap[value.toLowerCase()] ?? value
                                : filter.name.endsWith('.Day') ? value => value.padStart(2, '0') 
                                : type == 'date string' ? value => util.date.wdrToISODate(value, datePattern)
                                : (type == 'year/month/day' || type == 'year/quarter/month/day') ? value => util.date.normalizeMultiLevelDate(value, type)
                                : null;
                        if (!transform) return;
                        filter.members = filter.members.map(member =>
                            member.replace(/[^.]+$/, transform)
                        );
                    });
                }
                return filters;
            }

            // for date fields, this function is used to return the truncated date (ISO date) as per the given unit: day, month or year
            // see the example application on how it can be used in charts to highlight the pt selected time frame
            function getTruncDate(cell, dimension, unit)
            {
                let result = null;
                unit = (unit ?? 'month').toLowerCase();
                let items = cell.rows.concat(cell.columns).filter(item => item.hierarchyUniqueName.startsWith(dimension));
                let year = items.find(item=>item.hierarchyUniqueName == dimension + '.Year')?.caption;
                let month = items.find(item=>item.hierarchyUniqueName == dimension + '.Month')?.caption;
                let day = items.find(item=>item.hierarchyUniqueName == dimension + '.Day')?.caption;
                if (unit == 'day' && year && month && day)
                {
                    result = year + '-' + monthMap[month.toLowerCase()] + '-' + day.padStart(2, '0')  + 'T00:00:00';
                }                
                if (unit == 'month' && year && month)
                {
                    result = year + '-' + monthMap[month.toLowerCase()] + '-01T00:00:00';
                }
                if (unit == 'year' && year)
                {
                    result = year + '-01-01T00:00:00';
                }                
                return result;
            }

            // get the field type from the wdr datasource metadata object (if any)
            // https://www.webdatarocks.com/doc/js/metadata-object-for-json/
            function getFieldType(name)
            {
                name = name.split('.')[0];
                let type = null;
                if (ptData?.length > 0)
                {
                    let firstValue = Object.values(ptData[0])[0];
                    // check if metaObject
                    if (Object.hasOwn(firstValue, 'type'))  
                    {
                        type = ptData[0][name]?.type;
                    }  
                }
                return type;    
            }

            // instantiate WDR
            let wdrOptions = options.webdatarocks; 
            wdrOptions.toolbar = true;
            let cfgReport = getReportForName(options.currentReport);
            if (!cfgReport)
            {
                // fallback to primary report
                cfgReport = getAllReports()[0];
            }
            wdrOptions.report = cfgReport;    
            if (wdrOptions.toolbar)
            {   
                wdrOptions.beforetoolbarcreated = customizeToolbar;   
            }
            wdrOptions.cellclick = onCellClick; 
            wdrOptions.celldoubleclick = onCellDoubleClick; 
            // instantiate
            let wdr = pt$.webdatarocks(wdrOptions);
            //wdr.on('aftergriddraw', function() {
                //
            //});
            let firstRender = true;
            wdr.on('reportcomplete', function(){
                enableDisableToolbarButtons();
                if (firstRender)
                {
                    firstRender = false;
                    // upon first render, do a refresh as WDR doesn't always get it right first time
                    setTimeout(()=>{
                        wdr.refresh();
                    }, 500);                    
                }
            });
            
            $(window).on('resize.lib4x_pt', function () {
                // refresh as without, WDR is not redetermining if a horizontal scrollbar is needed
                apex.util.debounce(() => {
                    wdr.refresh();
                }, 100);
            });        
        }

        return {
            initPT: initPT
        }
    })();   

    /*
     * drillThroughModule
     * When the Pivot Table has a related Inline Dialog with IR for Drill-Through, the below logic takes care of 
     * positioning the dialog and sizing the IR as per the dialog dimensions.
     */
    let drillThroughModule = (function()
    {
        let initDialog = function(dtDialogId) {
            if (!($('#' + dtDialogId).is(':ui-dialog'))) {
                throw new Error('Drill-Through region should be an inline Dialog or Drawer (' + dtDialogId + ')');
            }            
            let dlg$ = $('#' + dtDialogId);
            dlg$.closest('.ui-dialog').addClass(C_LIB4X_PT_DT);
            dlg$.css('overflow', 'hidden');
            let body$ = dlg$.find('.t-DialogRegion-body, .t-DrawerRegion-body');
            let bodyWrapperOut$ = dlg$.find('.t-DialogRegion-bodyWrapperOut, .t-DrawerRegion-bodyWrapperOut');   
            bodyWrapperOut$.css('overflow', 'hidden');
            let hPadding = body$.innerHeight() - body$.height();
            let wPadding = body$.innerWidth() - body$.width();
            let dlgWidget$ = dlg$.dialog("widget");  // will be the dialog wrapper
            let heightFactor = 0.8;
            function positionDialog()
            {
                dlg$.dialog('option', {
                    width: Math.floor(window.innerWidth * 0.95),
                    height: Math.floor(window.innerHeight * heightFactor)
                });
                // position left first as to make sure the centering will really work
                dlg$.dialog('option', 'position', {
                    my: 'left',
                    at: 'left',
                    of: window
                });
                dlg$.dialog('option', 'position', {
                    my: 'center',
                    at: 'center',
                    of: window
                });
                dlg$.dialog('option', 'position', {
                    my: 'top',
                    at: 'top+'+Math.floor(window.innerHeight * (((1 - heightFactor) / 2) * 0.85)),
                    of: window
                });  
            }
            positionDialog();
            dlg$.on('dialogresize',
                apex.util.debounce(() => {
                    let irContent$ = dlg$.find('.a-IRR-tableContainer');
                    if (irContent$.length)
                    {
                        let headerHeight = $('#' + dtDialogId + ' .pt-dt-header').outerHeight(true) || 0;
                        let toolbarHeight = dlg$.find('.a-IRR-toolbar').outerHeight(true) || 0;
                        let controlsContainerHeight = dlg$.find('.a-IRR-controlsContainer').outerHeight(true) || 0;   
                        let paginationbarHeight = dlg$.find('.a-IRR-paginationWrap').outerHeight(true) || 0;
                        irContent$.css({ "maxHeight": bodyWrapperOut$.height() - hPadding - headerHeight - toolbarHeight - controlsContainerHeight - paginationbarHeight - 3 + "px", "width": "auto", "maxWidth": dlg$.width() - wPadding - 2 + "px" });
                    }                   
                }, 100)
            );   
            apex.widget.util.onVisibilityChange($('#' + dtDialogId), function (visible) {
                if (visible) {
                    setTimeout(() => {
                        dlg$.trigger('dialogresize');
                    }, 50);
                }
            }); 
            let irDomId = $('#' + dtDialogId + ' .pt-dt-report').attr('id');  
            if (irDomId)
            {
                $('#' + irDomId).on('apexafterrefresh', function() {
                    setTimeout(() => {
                        dlg$.trigger('dialogresize');
                    }, 50);
                })
            }
            $(window).on('resize.lib4x_sv', function () {
                setTimeout(() => {
                    $('#' + dtDialogId + ':visible').trigger('dialogresize');
                }, 50);
            });
        }

        return {
            initDialog: initDialog
        }
    })();

    /*
     * In case of starting dialogs from an inline dialog, no overlay is appearing to the inline dialog. The overlay is actually 
     * created (on the page body), but the z-index is lower than the inline dialog. By having next code, the z-index will be 
     * corrected and the overlay will cover the inline dialog.
     * A filterClass can be given as to restrict the check to certain dialogs only.
     */    
    let utilityModule = (function()
    {
        let enableInlineDialogOverlay = function(filterClass) 
        {
            $(apex.gPageContext$).on('dialogcreate', function(jQueryEvent, data) {
                let target$ = $(jQueryEvent.target);
                if (typeof filterClass === 'undefined' || filterClass === null || target$.closest('.ui-dialog').hasClass(filterClass))
                {
                    setTimeout(()=>{
                        if ($('.ui-widget-overlay').length > 1)
                        {
                            let maxZIndex = 0;
                            $('.ui-widget-overlay').not(":last").each(function() {
                                let zIndex = parseInt($(this).css('z-index'));
                                maxZIndex = (zIndex > maxZIndex) ? zIndex : maxZIndex;
                            });        
                            let lastZIndex = parseInt($('.ui-widget-overlay').last().css('z-index'));    
                            if (lastZIndex <= maxZIndex)
                            {
                                $('.ui-widget-overlay').last().css('z-index', maxZIndex + 1);
                                target$.dialog('moveToTop');   
                            }
                        }     
                    }, 10);
                }
            });             
        }
        enableInlineDialogOverlay('a-IRR-dialog');        
    })();

    // util functions
    let util = {   
        date:
        {
            oracleDateMaskToWdrFormat: function(oracleFormat) 
            {
                // tokenizer: splits format into tokens and literals, supports FM modifier 
                function tokenizeOracleFormat(fmt) 
                {
                    const tokens = [
                        'YYYY','RRRR','RR','YY',
                        'MONTH','MON','MM',
                        'DAY','DY',
                        'DD',
                        'HH24','HH12','HH',
                        'MI','SS',
                        'AM','PM',
                        'DS','DL'
                    ];
                    // sort longest first
                    tokens.sort((a,b) => b.length - a.length);
                    let result = [];
                    let i = 0;
                    let fmActive = false;
                    const upper = fmt.toUpperCase();
                    while (i < fmt.length) 
                    {
                        // FM modifier (case-insensitive)
                        if (upper.substr(i,2) === 'FM') 
                        {
                            fmActive = true;
                            i += 2;
                            continue;
                        }
                        // quoted literal
                        if (fmt[i] === '"') 
                        {
                            let end = fmt.indexOf('"', i+1);
                            if (end === -1) end = fmt.length - 1;
                            result.push({
                                type: 'literal',
                                value: fmt.substring(i, end+1)
                            });
                            i = end + 1;
                            continue;
                        }
                        // token match
                        let matched = false;
                        for (const token of tokens) 
                        {
                            if (upper.startsWith(token, i)) 
                            {
                                result.push({
                                    type: 'token',
                                    value: token,
                                    fm: fmActive
                                });
                                fmActive = false; // reset FM after token
                                i += token.length;
                                matched = true;
                                break;
                            }
                        }
                        if (matched) continue;
                        // single-char literal
                        result.push({
                            type: 'literal',
                            value: fmt[i]
                        });
                        i++;
                    }
                    return result;
                }

                // mapper: converts tokens to WDR equivalents, respects FM rules 
                function mapTokensToWdr(tokens) 
                {
                    // Oracle → Excel mapping
                    const map = {
                        YYYY: 'yyyy',
                        RRRR: 'yyyy',
                        RR: 'yy',
                        YY: 'yy',

                        MONTH: 'MMMM',
                        MON: 'MMM',
                        MM: 'MM',

                        DAY: 'dd',
                        DY: 'dd',

                        DD: 'dd',

                        HH24: 'HH',
                        HH12: 'HH',
                        HH: 'HH',

                        MI: 'mm',
                        SS: 'ss',

                        AM: '',
                        PM: ''
                    };
                    let result = '';
                    for (const t of tokens)
                    {
                        if (t.type === 'literal') 
                        {
                            result += t.value;
                            continue;
                        }
                        // map token
                        if (map[t.value]) 
                        {
                            result += map[t.value]; 
                        }
                    }
                    return result;
                }                 
                if (/\bDS\b/g.test(oracleFormat)) 
                {
                    oracleFormat = oracleFormat.replace(/\bDS\b/ig, apex.locale.getDSDateFormat());
                }
                if (/\bDL\b/g.test(oracleFormat)) 
                {
                    oracleFormat = oracleFormat.replace(/\bDL\b/ig, apex.locale.getDLDateFormat());
                }
                const tokens = tokenizeOracleFormat(oracleFormat);
                const wdrFmt = mapTokensToWdr(tokens);
                return wdrFmt;
            },
            wdrToISODate: function(dateString, datePattern) 
            {
                const patternParts = datePattern.split(/[\/.-]/);
                const dateParts = dateString.split(/[\/.-]/);
                let day, month, year;
                patternParts.forEach((part, index) => {
                    switch (part) {
                        case 'dd':
                            day = dateParts[index];
                            break;
                        case 'MM':
                            month = dateParts[index];
                            break;
                        case 'yyyy':
                        case 'yy' :
                            year = dateParts[index];
                            break;
                    }
                });    
                // ensure 2-digit day/month
                day = day.padStart(2, '0');
                month = month.padStart(2, '0');
                return `${year}-${month}-${day}`;                
            },
            normalizeMultiLevelDate: function(value, format) 
            {
                const parts = value.split('/');
                let result = [];
                if (format === 'year/month/day') 
                {
                    const [year, month, day] = parts;
                    result.push(year);
                    if (month) 
                    {
                        result.push(
                            monthMap[month.toLowerCase()] ||
                            String(month).padStart(2, '0')
                        );
                    }
                    if (day) 
                    {
                        result.push(String(day).padStart(2, '0'));
                    }
                }
                if (format === 'year/quarter/month/day') 
                {
                    const [year, quarter, month, day] = parts;
                    result.push(year);
                    if (quarter) {
                        // Extract numeric part from values like:
                        // "Quarter 1", "Kwartaal 2", etc.
                        const quarterNumber = quarter.match(/\d+/)?.[0];
                        if (quarterNumber) {
                            result.push(quarterNumber);
                        }
                    }
                    if (month) 
                    {
                        result.push(
                            monthMap[month.toLowerCase()] ||
                            String(month).padStart(2, '0')
                        );
                    }
                    if (day) 
                    {
                        result.push(String(day).padStart(2, '0'));
                    }
                }
                return result.join('/');
            }                
        }
    };     
    
    function initMessages()
    {
        // here we can have the labels and messages for which the developer should be 
        // able to config translations in APEX
        apex.lang.addMessages({
            'LIB4X.WDR.PT.DATA_SIZE_EXCEEDED_TITLE': 'Load Error',
            'LIB4X.WDR.PT.DATA_SIZE_EXCEEDED_MESSAGE': 'The dataset is too large to display in the pivot table.',
            'LIB4X.WDR.PT.PRIVATE_REPORT_SAVED': 'Private report saved',
            'LIB4X.WDR.PT.SAVE_REPORT_WRONG_TYPE': '\'%0\' is a %1 report. Can only save as a private report.',
            'LIB4X.WDR.PT.SAVE_PIVOT_REPORT': 'Save Pivot Report',
            'LIB4X.WDR.PT.LOAD_PIVOT_REPORT': 'Load Pivot Report',
            'LIB4X.WDR.PT.REPORT_DELETED': 'Report Deleted',
            'LIB4X.WDR.PT.Q_REMOVE_PRIVATE_REPORT': 'Remove private report \'%0\'?',
            'LIB4X.WDR.PT.TOOLBAR.SAVE': 'Save',
            'LIB4X.WDR.PT.TOOLBAR.LOAD': 'Load',
            'LIB4X.WDR.PT.TOOLBAR.DELETE': 'Delete',
            'LIB4X.WDR.PT.TOOLBAR.MAXIMIZE': 'Maximize'
        });      
    }

    function getMessage(key) 
    {
        return apex.lang.getMessage('LIB4X.WDR.PT.' + key);
    }    

    /*
     * Main plugin init function
     */
    let init = function(ajaxIdentifier, ptStaticId, ptInternalId, pHeight, dtDialogStaticId, filtersPageItem, decimalPlaces, defaultSettings, initFunc)
    {
        // derive slice from any given default rows/columns/measures in the plugin region attributes
        function getSliceFromDefaults(defaultSettings)
        {
            let defaultSlice = {};

            function addItems(prop)
            {
                if (Object.hasOwn(defaultSettings, prop) && defaultSettings[prop])
                {
                    defaultSlice[prop] = [];
                    let items = defaultSettings[prop].split(",");
                    items.forEach(item => {
                        let entry = {uniqueName: item.trim()};
                        if (prop == 'measures' && defaultSettings.aggregation)
                        {
                            entry.aggregation = defaultSettings.aggregation;
                        }
                        defaultSlice[prop].push(entry);
                    });                    
                }
            }

            if (defaultSettings)
            {
                addItems('rows');
                addItems('columns');
                addItems('measures');
            }
            return Object.keys(defaultSlice).length !== 0 ? defaultSlice : null;
        }

        // if no default format configured yet, derive default wdr number format from APEX locale settings
        function configureDefaultFormat(report)
        {
            report.formats ??= [];
            let defaultFormat = report.formats.find(format => format.name === '');
            if (!defaultFormat)
            {
                report.formats.push({name: '', decimalPlaces: decimalPlaces ? Number(decimalPlaces) : 2, decimalSeparator: apex.locale.getDecimalSeparator(), thousandsSeparator: apex.locale.getGroupSeparator()});
                // in theory, decimalPlaces can also be configured using -1 (NONE). In practise that will give often numbers reflecting rounding errors, so lot of decimals.
            }            
        }

        initMessages();       
        let ptStaticIdPt = ptStaticId + WDR_PT_EXT;
        // tag the region as being a WDR PT; used in CSS
        $('#' + ptStaticId).addClass(C_LIB4X_WDR_PT);
        let options = {}; 
        options.defaultSettings = defaultSettings;
        options.webdatarocks = {};    
        if (initFunc)
        {
            // call init function
            options = initFunc(options);
            if (!options)
            {
                options = {};
            }
            if (!Object.hasOwn(options, 'webdatarocks'))
            {
                options.webdatarocks = {};  
            }
        }
        if (!pHeight && $('#'+ptStaticId).hasClass('t-Region')) // std template
        {
            pHeight = '100%';
        }
        // in case pHeight is empty and region template is IR (t-IRR-region), WDR will use a default of 500px
        if (pHeight && (!Object.hasOwn(options.webdatarocks, 'height')))
        {
            options.webdatarocks.height = pHeight;
        }
        let ptData = window['gPt' + ptInternalId + 'data']?.data;        
        // when 1MB data size limit is exceeded, WDR gives a 'File is too large' message popup
        // alternatively, options.checkDataSize can be set to true 
        if (options.checkDataSize && ptData)
        {
            // it is not documented how WDR is measuring the memory size
            // lets stick to bytes size of the full JSON
            let sizeBytes = new Blob([JSON.stringify(ptData)]).size;
            if (sizeBytes > 975000) // stay on the safe side
            {
                //throw new Error('Pivot table data exceeds 1MB - can not be analyzed');
                apex.message.alert(getMessage('DATA_SIZE_EXCEEDED_MESSAGE'), null, {
                    title: getMessage('DATA_SIZE_EXCEEDED_TITLE'),
                    style: "warning",
                    iconClasses: "fa fa-exclamation-triangle fa-2x"
                });
                return;
            }
        }  
        // global object is for all reports
        options.webdatarocks.global ??= {};
        options.webdatarocks.global.dataSource = {
            data: ptData
        };
        // See WDR available languages out of the box: https://www.webdatarocks.com/doc/js/language-localization/
        // For correct functioning of Drill-Through, APEX and WDR language should be the same as WDR
        // passes selected month as caption and not as number
        if (!Object.hasOwn(options.webdatarocks.global, 'localization'))
        {
            let language = apex.locale.getLanguage().split('-')[0];
            if (['fr', 'de', 'es', 'it', 'nl', 'pr', 'zh', 'tr', 'pl', 'ur'].includes(language))
            {
                options.webdatarocks.global.localization = 'https://cdn.webdatarocks.com/loc/' + language + '.json';
            }
        }
        if (options.metadata)
        {
            // WDR datasource metadata object
            options.webdatarocks.global.dataSource.data.unshift(options.metadata);
        }        
        options.webdatarocks.global.options ??= {};
        // Fields List button
        if (!Object.hasOwn(options.webdatarocks.global.options, 'configuratorButton'))
        {        
            options.webdatarocks.global.options.configuratorButton = false;
        }
        // date pattern
        if (!Object.hasOwn(options.webdatarocks.global.options, 'datePattern'))
        {        
            let orclDateFormat = apex.locale.getDateFormat();
            if (orclDateFormat)
            {
                let wdrDateFormat = util.date.oracleDateMaskToWdrFormat(orclDateFormat);
                if (wdrDateFormat)
                {
                    options.webdatarocks.global.options.datePattern = wdrDateFormat;
                }
            }
        }
        // dateTimePattern
        if (!Object.hasOwn(options.webdatarocks.global.options, 'dateTimePattern'))
        {    
            let orclDateFormat = apex.locale.getDateFormat();
            if (orclDateFormat)
            {
                let orclDateTimeFormat = orclDateFormat;
                if (!orclDateTimeFormat.includes('HH'))
                {
                    orclDateTimeFormat = orclDateTimeFormat + ' HH24:MI:SS';
                }
                let wdrDateTimeFormat = util.date.oracleDateMaskToWdrFormat(orclDateTimeFormat);
                if (wdrDateTimeFormat)
                {
                    options.webdatarocks.global.options.dateTimePattern = wdrDateTimeFormat;
                }
            }
        }
        // unless explicitly configured to true, assume we don't need drillThrough as 
        // mostly a server-side pre-aggregated dataset will be loaded
        if (!Object.hasOwn(options.webdatarocks.global.options, 'drillThrough'))
        {
            options.webdatarocks.global.options.drillThrough = false;
        }
        options.primaryReport ??= {};
        options.primaryReport.lib4x = options.primaryReport.lib4x ?? {};
        options.primaryReport.lib4x.type = 'primary';
        options.primaryReport.options ??= {};
        let reportName = options.primaryReport.options.grid?.title;
        if (!reportName)
        {
            options.primaryReport.options.grid ??= {};
            options.primaryReport.options.grid.title = 'Primary Report';
        }
        let slice = $.extend(true, {}, getSliceFromDefaults(options.defaultSettings), options.primaryReport.slice);
        if (Object.keys(slice).length > 0) 
        {
            options.primaryReport.slice = slice;
        }
        configureDefaultFormat(options.primaryReport);
        options.alternativeReports = (options.alternativeReports ?? []).map(report => ({
            ...report,
            lib4x: {
                ...(report.lib4x ?? {}),
                type: "alternative"
            }
        }));
        // check report title has value + check default format
        options.alternativeReports.forEach((report, index) => {
            report.options ??= {};
            report.options.grid ??= {};
            // set default title if missing or empty
            if (!report.options.grid.title) 
            {
                report.options.grid.title = `Alternative Report ${index + 1}`;
            }
            // check default format
            configureDefaultFormat(report);                      
        });        
        options.currentReport = null;
        if (apex.storage.hasLocalStorageSupport())
        {
            let localStorage = apex.storage.getScopedLocalStorage({prefix: LOCAL_STORAGE_PREFIX, useAppId: true, usePageId: true});
            if (localStorage)
            {
                let privateReports = localStorage.getItem(ptStaticId + '.privateReports');
                options.privateReports = (privateReports ? JSON.parse(privateReports) : []).map(report => ({
                    ...report,
                    lib4x: {
                        ...(report.lib4x ?? {}),
                        type: "private"
                    }
                }));  
                options.currentReport = localStorage.getItem(ptStaticId + '.currentReport');         
            }
        }         
        // create region interface
        apex.region.create(ptStaticId, {
            type: "WDRPivotTable",
            widget: function() {
                return $('#' + ptStaticIdPt);
            },
            getPivotTable: function() {
                return this.widget().data('webdatarocks');
            }
        }); 
        // init any drill-through inline dialog
        if (dtDialogStaticId && !$('#' + dtDialogStaticId).closest('.ui-dialog').hasClass(C_LIB4X_PT_DT))
        {
            drillThroughModule.initDialog(dtDialogStaticId);
        }
        // init pivot table
        let pt$ = $('#' + ptStaticIdPt);
        if (pt$.is(':visible'))
        {
            webDataRocksModule.initPT(ajaxIdentifier, ptStaticId, ptStaticIdPt, ptInternalId, dtDialogStaticId, filtersPageItem, options);
        }
        else
        {
            // when the pt is in a non-active tab, or a collapsed region, etc, then 
            // init the pt upon getting visible
            apex.widget.util.onVisibilityChange($('#' + ptStaticIdPt), function(visible){
                if (visible && pt$.data('webdatarocks') == null)
                {   
                    webDataRocksModule.initPT(ajaxIdentifier, ptStaticId, ptStaticIdPt, ptInternalId, dtDialogStaticId, filtersPageItem, options);
                }
            });
        }
    };

    // load WDR stylesheet
    let darkMode = $('body').hasClass(C_APEX_THEME_VITA_DARK);
    let fileref = document.createElement("link");
    fileref.rel = "stylesheet";
    fileref.type = "text/css";
    fileref.href = darkMode ? 
        'https://cdn.webdatarocks.com/latest/theme/dark/webdatarocks.min.css' : 
        'https://cdn.webdatarocks.com/latest/webdatarocks.min.css';
    document.getElementsByTagName("head")[0].appendChild(fileref); 
    document.documentElement.style.setProperty('--lib4x-grid-border-color', darkMode ? '#424242' : '#d5d5d5'); 

    return{
        _init: init
    }
})(apex.jQuery);
