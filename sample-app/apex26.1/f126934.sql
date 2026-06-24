prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.1'
,p_default_workspace_id=>404028009332284321
,p_default_application_id=>126934
,p_default_id_offset=>0
,p_default_owner=>'WKSP_YOLA'
);
end;
/
 
prompt APPLICATION 126934 - Sample Pivot Table
--
-- Application Export:
--   Application:     126934
--   Name:            Sample Pivot Table
--   Date and Time:   21:16 Wednesday June 24, 2026
--   Exported By:     KRL.EKEMA@GMAIL.COM
--   Flashback:       0
--   Export Type:     Application Export
--     Pages:                      4
--       Items:                    6
--       Processes:                4
--       Regions:                 12
--       Buttons:                  1
--       Dynamic Actions:          4
--     Shared Components:
--       Logic:
--         Build Options:          1
--       Navigation:
--         Lists:                  2
--         Breadcrumbs:            1
--           Entries:              1
--       Security:
--         Authentication:         1
--         Authorization:          1
--       User Interface:
--         Themes:                 1
--         Templates:
--         LOVs:                   1
--         Plug-ins:               1
--       PWA:
--       Globalization:
--       Reports:
--       E-Mail:
--     Supporting Objects:  Included
--   Version:         26.1.1
--   Instance ID:     63113759365424
--

prompt --application/delete_application
begin
wwv_flow_imp.remove_flow(wwv_flow.g_flow_id);
end;
/
prompt --application/create_application
begin
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'WKSP_YOLA')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Sample Pivot Table')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'SAMPLE-PIVOT-TABLE')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'Y'
,p_checksum_salt=>'AD52938940031165E9A5630E8589708DE6C246D2E761CA0F5B847161B7E081D3'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'26.1'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DS'
,p_timestamp_format=>'DS'
,p_timestamp_tz_format=>'DS'
,p_flow_image_prefix=>nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(11064945228399280785)
,p_application_tab_set=>0
,p_logo_type=>'T'
,p_logo_text=>'Sample Pivot Table'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'Release 1.0'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_browser_cache=>'N'
,p_browser_frame=>'D'
,p_authorize_batch_job=>'N'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'Sample Pivot Table'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260624210739Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_last_updated_by=>'KRL.EKEMA@GMAIL.COM'
,p_file_prefix=>nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>2461212145419
,p_version_scn=>'15781250472411'
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'N'
,p_pwa_is_push_enabled=>'N'
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>false
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(11064946111779280787)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>2469215554099805162
,p_nav_list_template_options=>'#DEFAULT#:t-TreeNav--styleA:js-navCollapsed--hidden'
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(11064946988843280793)
,p_nav_bar_list_template_id=>2849019392706229583
,p_nav_bar_template_options=>'#DEFAULT#'
);
end;
/
prompt --application/shared_components/plugins/region_type/lib4x_axt_wdr_pivottable
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(12163302657156180788)
,p_plugin_type=>'REGION TYPE'
,p_name=>'LIB4X.AXT.WDR.PIVOTTABLE'
,p_display_name=>'LIB4X - WDR Pivot Table'
,p_apexlang_name=>'lib4xWdrPivotTable'
,p_image_prefix=>nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','LIB4X.AXT.WDR.PIVOTTABLE'),'')
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://cdn.webdatarocks.com/latest/webdatarocks.toolbar.js',
'https://cdn.webdatarocks.com/latest/webdatarocks.js'))
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'procedure render (',
'    p_plugin in            apex_plugin.t_plugin,',
'    p_region in            apex_plugin.t_region,',
'    p_param  in            apex_plugin.t_region_render_param,',
'    p_result in out nocopy apex_plugin.t_region_render_result )',
'is ',
'    l_region_id             varchar2(50); ',
'    l_internal_id           varchar2(50); ',
'    l_default_rows          varchar2(200);',
'    l_default_columns       varchar2(200);',
'    l_default_measures      varchar2(200);',
'    l_aggregation           varchar2(200);',
'    l_height                varchar2(20);',
'    l_dt_dialog_id          varchar2(50);',
'    l_filters_page_item     varchar2(50);',
'    l_decimal_places        PLS_INTEGER;',
'    l_context               apex_exec.t_context;',
'    l_columns               APEX_EXEC.T_COLUMNS;',
'    l_json                  CLOB;  ',
'    l_apex_version          varchar2(50);  ',
'    l_major_version         NUMBER := 0;',
'    l_minor_version         NUMBER := 0;    ',
'    l_nonce_clause          VARCHAR2(100) := '''';',
'begin',
'    if apex_application.g_debug then',
'        apex_plugin_util.debug_region(p_plugin => p_plugin, p_region => p_region);',
'    end if;',
'    l_region_id := apex_escape.html_attribute(p_region.static_id);',
'    l_internal_id := p_region.id;',
'    l_default_rows := p_region.attributes.get_varchar2(''attr_default_rows'');',
'    l_default_columns := p_region.attributes.get_varchar2(''attr_default_columns'');',
'    l_default_measures := p_region.attributes.get_varchar2(''attr_default_measures'');',
'    l_aggregation := p_region.attributes.get_varchar2(''attr_aggregation'');',
'    l_height := p_region.attributes.get_varchar2(''attr_height'');',
'    l_dt_dialog_id := p_region.attributes.get_varchar2(''attr_drill_through_dialog'');',
'    l_filters_page_item := p_region.attributes.get_varchar2(''attr_filters_page_item'');',
'    l_decimal_places := p_region.attributes.get_varchar2(''attr_decimal_places'');',
'    -- add a csp nonce to the script tag which got supported in APEX 24.2',
'    l_apex_version := ''#APEX_VERSION#'';',
'    if l_apex_version is not null then',
'        begin',
'            l_major_version := TO_NUMBER(REGEXP_SUBSTR(l_apex_version, ''^\d+''));',
'            l_minor_version := TO_NUMBER(REGEXP_SUBSTR(l_apex_version, ''\.(\d+)'', 1, 1, NULL, 1));',
'            -- Check if APEX is 24.2 or later',
'            IF l_major_version > 24 OR (l_major_version = 24 AND l_minor_version >= 2) THEN',
'                l_nonce_clause := '' nonce="#APEX_CSP_NONCE_VALUE#"'';',
'            END IF;',
'        exception',
'            when others then',
'                null;',
'        end;',
'    end if;',
'    -- add data resultset as JSON to the page',
'    if ((p_region.source is not null) and (instr(lower(p_region.source), ''json_arrayagg'') > 0)) then',
'        -- JSON aggregate query',
'        l_context := apex_exec.open_query_context();',
'        if apex_exec.next_row(l_context) then',
'            l_json := apex_exec.get_clob(l_context, 1); -- Fetch JSON CLOB from first column',
'        end if;     ',
'        apex_exec.close( l_context ); ',
'        if l_json is not null then',
'            htp.p(''<script'' || l_nonce_clause || ''>'');',
'            htp.p(''var gPt'' || l_internal_id || ''data = {"data":'');',
'            apex_util.prn(p_clob => l_json, p_escape => false );',
'            htp.p(''};'');         ',
'            htp.p(''</script>'');',
'        end if;       ',
'    else',
'        -- regular query',
'        l_context := apex_exec.open_query_context();',
'        apex_json.initialize_clob_output;',
'        apex_json.write_context(p_context => l_context, p_write_null => true);',
'        htp.p(''<script'' || l_nonce_clause || ''>'');',
'        htp.p(''var gPt'' || l_internal_id || ''data = {"data":'');',
'        apex_util.prn(p_clob => apex_json.get_clob_output( p_free => true), p_escape => false );',
'        htp.p(''};'');',
'        htp.p(''</script>''); ',
'        apex_exec.close( l_context );       ',
'    end if;',
'',
'    htp.p(''<div id="'' || l_region_id || ''_pt"></div>'');',
' ',
'    -- When specifying the library declaratively, it fails to load the minified version. So using the API:',
'    apex_javascript.add_library(',
'        p_name      => ''lib4x-wdrpivottable'',',
'        p_check_to_add_minified => true,',
'        --p_directory => ''#WORKSPACE_FILES#javascript/'',          ',
'        p_directory => p_plugin.file_prefix || ''js/'',',
'        p_version   => NULL',
'    );',
'',
'    -- this one is not having the check minified parameter',
'    apex_css.add_file (',
'        p_name => ''lib4x-wdrpivottable''||case when v(''DEBUG'') = ''NO'' then ''.min'' end,',
'        --p_directory => ''#WORKSPACE_FILES#css/''',
'        p_directory => p_plugin.file_prefix || ''css/'' ',
'    );',
'',
'    -- add call to init in js',
'    apex_javascript.add_onload_code(',
'        p_code => apex_string.format(',
'            ''lib4x.axt.wdr.pivotTable._init("%s", "%s", "%s", "%s", "%s", "%s", "%s",''',
'            , apex_plugin.get_ajax_identifier',
'            , l_region_id',
'            , l_internal_id',
'            , l_height',
'            , l_dt_dialog_id',
'            , l_filters_page_item',
'            , l_decimal_places',
'        ) || ''{'' || APEX_JAVASCRIPT.ADD_ATTRIBUTE(''rows'', l_default_rows) || ',
'                    APEX_JAVASCRIPT.ADD_ATTRIBUTE(''columns'', l_default_columns) || ',
'                    APEX_JAVASCRIPT.ADD_ATTRIBUTE(''measures'', l_default_measures) || ',
'                    APEX_JAVASCRIPT.ADD_ATTRIBUTE(''aggregation'', l_aggregation, true, false) || ',
'        ''}, ''',
'        || p_region.init_javascript_code || '');''',
'    );',
'end;',
'',
'-- a future feature can be to save report configs remotely in SODA collection',
'/* procedure region_ajax (',
'    p_plugin in            apex_plugin.t_plugin,',
'    p_region in            apex_plugin.t_region,',
'    p_param  in            apex_plugin.t_region_ajax_param,',
'    p_result in out nocopy apex_plugin.t_region_ajax_result )',
'is',
'    --l_json_clob             clob;',
'    --l_json                  json_object_t;  ',
'    c_use_clob              constant   VARCHAR2(1000) := ',
'                               ''{"keyColumn":{"assignmentMethod": "CLIENT"},',
'                                "contentColumn":{"sqlType": "CLOB"}}'';    ',
'    l_collection            SODA_COLLECTION_T;',
'    l_document              SODA_DOCUMENT_T;',
'    l_status                NUMBER;',
'begin',
'    if apex_application.g_debug then',
'        apex_plugin_util.debug_region(p_plugin => p_plugin, p_region => p_region);',
'    end if;',
'    --l_json_clob := apex_application.g_clob_01;',
'    --l_json := json_object_t.parse(l_json_clob);',
'    l_collection := dbms_soda.open_collection(''LIB4X_CONFIG_STORE'');',
'    if l_collection is null then',
'        l_collection := dbms_soda.create_collection(''LIB4X_CONFIG_STORE'', c_use_clob);',
'    end if;',
'    l_document := soda_document_t(key => ''K007'', c_content => apex_application.g_clob_01, media_type => ''application/json'');',
'    l_status := l_collection.insert_one(l_document);',
'    apex_json.open_object;  ',
'    apex_json.write(''status'', l_status);  ',
'    apex_json.write(''key'', l_document.get_key);  ',
'    apex_json.close_object;  ',
'end; */'))
,p_api_version=>3
,p_render_function=>'render'
,p_standard_attributes=>'SOURCE_LOCATION:INIT_JAVASCRIPT_CODE'
,p_version_scn=>'487018205'
,p_help_text=>'Region wrapping WebDataRocks Pivot Grid component. Supports Drill-Through using Interactive Report.'
,p_version_identifier=>'1.0.0'
,p_about_url=>'https://github.com/kekema/apex-wdr-pivot-table'
,p_files_version=>19
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(12163480328076389519)
,p_plugin_id=>wwv_flow_imp.id(12163302657156180788)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'attr_aggregation'
,p_prompt=>'Aggregation'
,p_apexlang_name=>'aggregation'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(12163489838646477917)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(12163482417027411075)
,p_plugin_attribute_id=>wwv_flow_imp.id(12163480328076389519)
,p_display_sequence=>40
,p_display_value=>'Average'
,p_return_value=>'average'
,p_apexlang_name=>'average'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(12163481623179407908)
,p_plugin_attribute_id=>wwv_flow_imp.id(12163480328076389519)
,p_display_sequence=>20
,p_display_value=>'Count'
,p_return_value=>'count'
,p_apexlang_name=>'count'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(12163486013624437098)
,p_plugin_attribute_id=>wwv_flow_imp.id(12163480328076389519)
,p_display_sequence=>130
,p_display_value=>'Difference'
,p_return_value=>'difference'
,p_apexlang_name=>'difference'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(12163486403837440223)
,p_plugin_attribute_id=>wwv_flow_imp.id(12163480328076389519)
,p_display_sequence=>140
,p_display_value=>'% Difference'
,p_return_value=>'%difference'
,p_apexlang_name=>'difference2'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(12163482029707409670)
,p_plugin_attribute_id=>wwv_flow_imp.id(12163480328076389519)
,p_display_sequence=>30
,p_display_value=>'Distinct Count'
,p_return_value=>'distinctcount'
,p_apexlang_name=>'distinctCount'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(12163485645953435331)
,p_plugin_attribute_id=>wwv_flow_imp.id(12163480328076389519)
,p_display_sequence=>120
,p_display_value=>'Index'
,p_return_value=>'index'
,p_apexlang_name=>'index'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(12163484072489424863)
,p_plugin_attribute_id=>wwv_flow_imp.id(12163480328076389519)
,p_display_sequence=>80
,p_display_value=>'Max'
,p_return_value=>'max'
,p_apexlang_name=>'max'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(12163482878153421830)
,p_plugin_attribute_id=>wwv_flow_imp.id(12163480328076389519)
,p_display_sequence=>50
,p_display_value=>'Median'
,p_return_value=>'median'
,p_apexlang_name=>'median'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(12163483648038424334)
,p_plugin_attribute_id=>wwv_flow_imp.id(12163480328076389519)
,p_display_sequence=>70
,p_display_value=>'Min'
,p_return_value=>'min'
,p_apexlang_name=>'min'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(12163484854000432816)
,p_plugin_attribute_id=>wwv_flow_imp.id(12163480328076389519)
,p_display_sequence=>100
,p_display_value=>'% of Column'
,p_return_value=>'percentofcolumn'
,p_apexlang_name=>'ofColumn'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(12163484441341430789)
,p_plugin_attribute_id=>wwv_flow_imp.id(12163480328076389519)
,p_display_sequence=>90
,p_display_value=>'% of Grand Total'
,p_return_value=>'percent'
,p_apexlang_name=>'ofGrandTotal'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(12163485219349434048)
,p_plugin_attribute_id=>wwv_flow_imp.id(12163480328076389519)
,p_display_sequence=>110
,p_display_value=>'% of Row'
,p_return_value=>'percentofrow'
,p_apexlang_name=>'ofRow'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(12163486830856446842)
,p_plugin_attribute_id=>wwv_flow_imp.id(12163480328076389519)
,p_display_sequence=>150
,p_display_value=>'Population StDev'
,p_return_value=>'stdevp'
,p_apexlang_name=>'populationStdev'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(12163483230252423730)
,p_plugin_attribute_id=>wwv_flow_imp.id(12163480328076389519)
,p_display_sequence=>60
,p_display_value=>'Product'
,p_return_value=>'product'
,p_apexlang_name=>'product'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(12163487261244452894)
,p_plugin_attribute_id=>wwv_flow_imp.id(12163480328076389519)
,p_display_sequence=>160
,p_display_value=>'Sample StDev'
,p_return_value=>'stdevs'
,p_apexlang_name=>'sampleStdev'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(12163481269941406191)
,p_plugin_attribute_id=>wwv_flow_imp.id(12163480328076389519)
,p_display_sequence=>10
,p_display_value=>'Sum'
,p_return_value=>'sum'
,p_apexlang_name=>'sum'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(12213368479439627542)
,p_plugin_id=>wwv_flow_imp.id(12163302657156180788)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>45
,p_static_id=>'attr_decimal_places'
,p_prompt=>'Decimal Places'
,p_apexlang_name=>'decimalPlaces'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_show_in_wizard=>false
,p_max_length=>1
,p_is_translatable=>false
,p_help_text=>'Number of decimals to appear after decimal separator in the fractional part of numbers. When left empty, 2 will be taken.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(12163478593148373161)
,p_plugin_id=>wwv_flow_imp.id(12163302657156180788)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'attr_default_columns'
,p_prompt=>'Default Columns'
,p_apexlang_name=>'defaultColumns'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_help_text=>'List of comma-separated field or hierarchy names. Case sensitive.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(12163489838646477917)
,p_plugin_id=>wwv_flow_imp.id(12163302657156180788)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'attr_default_measures'
,p_prompt=>'Default Measures'
,p_apexlang_name=>'defaultMeasures'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_help_text=>'List of comma-separated fields. Case sensitive.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(12163477678361371403)
,p_plugin_id=>wwv_flow_imp.id(12163302657156180788)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'attr_default_rows'
,p_prompt=>'Default Rows'
,p_apexlang_name=>'defaultRows'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_help_text=>'List of comma-separated field or hierarchy names. Case sensitive.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(12210886491292168970)
,p_plugin_id=>wwv_flow_imp.id(12163302657156180788)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_static_id=>'attr_drill_through_dialog'
,p_prompt=>'Drill-Through Inline Dialog'
,p_apexlang_name=>'drillThroughInlineDialog'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_help_text=>'ID of an Inline Dialog which is supporting Drill-Trough functionality. For APEX 26.1 and higher, give the HTML DOM ID. For earlier versions, give the Static ID.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(12212222765239457861)
,p_plugin_id=>wwv_flow_imp.id(12163302657156180788)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_static_id=>'attr_filters_page_item'
,p_prompt=>'Filters Page Item'
,p_apexlang_name=>'filtersPageItem'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_help_text=>'Specify a hidden Page Item. The item will be set by the plugin with a Filters JSON as per the selected cell upon click/double click. These filters can be used in server-side queries to build where conditions as to query data associated with the selec'
||'ted cell. Under the (region) Source section (of your Drill-Through report or your Chart), include this item in ''Page Items to Submit''. The Session State Storage can be ''Per Request (Memory Only).'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(12164394607159139130)
,p_plugin_id=>wwv_flow_imp.id(12163302657156180788)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'attr_height'
,p_prompt=>'Height'
,p_apexlang_name=>'height'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Either give a number (reflecting number of pixels) or a percentage. Examples:</p>',
'<p>600<br>',
'100%</p>',
'<p>When no height is given, the default is either 100% for Standard Template or 500 for Interactive Report Template.</p>',
'<p>An example configuration is to use the Standard Template on the region and set the height in the Template Properties to one of the options in pixels from the dropdown. Then, set the value over here to 100% (or leave empty as the that is also the d'
||'efault). This configuration will also work fine with the Maximize button enabled.<br>Another configuration is to use the Interactive Report Template, and set the value over here to a fixed number of pixels (or leave to the default of 500).</p>'))
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(12163368435827335273)
,p_plugin_id=>wwv_flow_imp.id(12163302657156180788)
,p_name=>'INIT_JAVASCRIPT_CODE'
,p_is_required=>false
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(12163303096170188966)
,p_plugin_id=>wwv_flow_imp.id(12163302657156180788)
,p_name=>'SOURCE_LOCATION'
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(12164447386500326478)
,p_plugin_id=>wwv_flow_imp.id(12163302657156180788)
,p_name=>'lib4xcellclick'
,p_display_name=>'Cell Click'
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(12210313480133609981)
,p_plugin_id=>wwv_flow_imp.id(12163302657156180788)
,p_name=>'lib4xcelldblclick'
,p_display_name=>'Cell Double Click'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '626F64793A6E6F74282E617065782D7468656D652D766974612D6461726B2920237764722D7069766F742D76696577202E7764722D677269642D6C61796F7574206469763A6E6F74282E7764722D66696C7465722D686561646572292E7764722D686561';
wwv_flow_imp.g_varchar2_table(2) := '646572207B0D0A202020206261636B67726F756E642D636F6C6F723A20236661666166613B0D0A7D0D0A0D0A2F2A207265647563652069636F6E206C6162656C20666F6E742D73697A652066726F6D20313420746F203132202A2F0D0A237764722D746F';
wwv_flow_imp.g_varchar2_table(3) := '6F6C6261722D7772617070657220237764722D746F6F6C6261722C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C62617220612C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C62617220646976';
wwv_flow_imp.g_varchar2_table(4) := '2C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C62617220696E7075742C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C626172206C692C237764722D746F6F6C6261722D777261707065722023';
wwv_flow_imp.g_varchar2_table(5) := '7764722D746F6F6C62617220702C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C6261722073656C6563742C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C626172207370616E2C237764722D74';
wwv_flow_imp.g_varchar2_table(6) := '6F6F6C6261722D7772617070657220237764722D746F6F6C626172207461626C652C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C626172207461626C652074642C237764722D746F6F6C6261722D77726170706572202377';
wwv_flow_imp.g_varchar2_table(7) := '64722D746F6F6C626172207461626C652074682C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C626172207461626C652074722C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C62617220746578';
wwv_flow_imp.g_varchar2_table(8) := '74617265612C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C62617220756C207B0D0A20202020666F6E742D73697A653A20313270783B0D0A7D0D0A0909090D0A237764722D746F6F6C6261722D7772617070657220237764';
wwv_flow_imp.g_varchar2_table(9) := '722D746F6F6C6261723E2E7764722D746F6F6C6261722D67726F75702D72696768743E6C693E61207370616E2C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C6261723E6C693E61207370616E207B0D0A20202020746F703A';
wwv_flow_imp.g_varchar2_table(10) := '20333570783B0D0A7D0D0A0D0A237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C6261722061207B0D0A202020206865696768743A20363070783B0D0A7D0D0A0D0A237764722D746F6F6C6261722D77726170706572207B0D0A';
wwv_flow_imp.g_varchar2_table(11) := '202020206865696768743A20353570780D0A7D0D0A0D0A237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C626172207B0D0A202020206865696768743A20353570783B0D0A7D0D0A0D0A237764722D746F6F6C6261722D777261';
wwv_flow_imp.g_varchar2_table(12) := '7070657220237764722D746F6F6C626172202E7764722D746F6F6C6261722D67726F75702D72696768743A68617328236C696234782D7461622D66756C6C73637265656E29207B0D0A2020202070616464696E672D72696768743A20302E3572656D3B0D';
wwv_flow_imp.g_varchar2_table(13) := '0A7D0D0A0D0A237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C626172202E7764722D64726F70646F776E207B0D0A20202020746F703A20353570783B0D0A7D0D0A0D0A237764722D7069766F742D76696577202E7764722D67';
wwv_flow_imp.g_varchar2_table(14) := '7269642D6C61796F7574202E7764722D66696C74657273202E7764722D6865616465722C237764722D7069766F742D76696577202E7764722D677269642D6C61796F75742E7764722D666C61742D76696577202E7764722D686561646572207B0D0A2020';
wwv_flow_imp.g_varchar2_table(15) := '2020746578742D7472616E73666F726D3A206E6F6E653B0D0A7D0D0A0D0A237764722D636F6E746578742D6D656E75207B0D0A20202020646973706C61793A206E6F6E652021696D706F7274616E743B0D0A7D0D0A0D0A237764722D7069766F742D7669';
wwv_flow_imp.g_varchar2_table(16) := '6577202E7764722D63726564697473207B0D0A2020202070616464696E672D696E6C696E652D656E643A203570783B0D0A7D0D0A0D0A2F2A2061636869657665206120626F72646572206C696E65206265747765656E20746865207469746C6520616E64';
wwv_flow_imp.g_varchar2_table(17) := '20746865207368656574202A2F0D0A237764722D7069766F742D7669657720237764722D636F6C732D73686565742C20237764722D7069766F742D7669657720237764722D73686565742D68656164657273207B0D0A20202020626F726465722D746F70';
wwv_flow_imp.g_varchar2_table(18) := '3A2031707820736F6C696420766172282D2D6C696234782D677269642D626F726465722D636F6C6F722C2023643564356435293B200D0A7D0D0A0D0A2F2A20526567696F6E2077697468205374642054656D706C6174653A2072656D6F76652070616464';
wwv_flow_imp.g_varchar2_table(19) := '696E672062757420286578747261292070616464696E672062656C6F7720746F206163636F6D6F646174652074686520574452206C6F676F202A2F0D0A2E742D526567696F6E2E6C696234782D7764722D7074202E742D526567696F6E2D626F6479207B';
wwv_flow_imp.g_varchar2_table(20) := '0D0A2020202070616464696E672D696E6C696E652D73746172743A203070783B0D0A2020202070616464696E672D696E6C696E652D656E643A203070783B0D0A2020202070616464696E672D626C6F636B2D73746172743A203070783B0D0A2020202070';
wwv_flow_imp.g_varchar2_table(21) := '616464696E672D626C6F636B2D656E643A20312E3572656D3B0D0A7D0D0A0D0A2F2A20526567696F6E20776974682049522054656D706C6174653A20657874726120626F74746F6D2070616464696E6720746F206163636F6D6F64617465207468652057';
wwv_flow_imp.g_varchar2_table(22) := '4452206C6F676F202A2F0D0A2E742D4952522D726567696F6E2E6C696234782D7764722D7074207B0D0A2020202070616464696E672D626C6F636B2D656E643A20312E3572656D3B0D0A7D0D0A0D0A2F2A207764722068617320646973706C61793A6E6F';
wwv_flow_imp.g_varchar2_table(23) := '6E6520666F722074686520696E7075742066726F6D20776869636820636C69636B7320617265206E6F742072656769737465726564206279207468652062726F777365722E205573696E67206F7061636974793A203020696E7374656164202A2F0D0A23';
wwv_flow_imp.g_varchar2_table(24) := '7764722D746F6F6C6261722D77726170706572202E7764722D746F6F6C6261722D7569202E7764722D726164696F2D7772617020696E707574207B0D0A20202020646973706C61793A20696E6C696E652D626C6F636B3B0D0A202020206F706163697479';
wwv_flow_imp.g_varchar2_table(25) := '3A20303B0D0A7D0D0A0D0A2E7764722D746F6F6C6261722D7569206C692E69732D64697361626C6564207B0D0A202020206F7061636974793A20302E343B0D0A20202020706F696E7465722D6576656E74733A206E6F6E653B0D0A7D0D0A0D0A2E64742D';
wwv_flow_imp.g_varchar2_table(26) := '64657461696C732D636F6E7461696E6572207B0D0A2020202070616464696E672D626C6F636B2D656E643A20302E3572656D3B0D0A7D0D0A0D0A2E64742D64657461696C732D6C6162656C207B0D0A202020206D617267696E2D6C6566743A2031307078';
wwv_flow_imp.g_varchar2_table(27) := '3B0D0A7D0D0A0D0A2F2A20495252206474202A2F0D0A2E742D4952522D726567696F6E2E70742D64742D7265706F7274207B0D0A202020202D2D75742D6C696E6B2D746578742D636F6C6F723A20233131313B0D0A7D0D0A0D0A626F64792E617065782D';
wwv_flow_imp.g_varchar2_table(28) := '7468656D652D766974612D6461726B202E742D4952522D726567696F6E2E70742D64742D7265706F7274207B0D0A202020202D2D75742D6C696E6B2D746578742D636F6C6F723A20234632463246323B0D0A7D0D0A0D0A2E742D4952522D726567696F6E';
wwv_flow_imp.g_varchar2_table(29) := '2E70742D64742D7265706F7274202E612D4952522D7461626C65207464207B0D0A2020202077686974652D73706163653A206E6F777261703B0D0A7D0D0A0D0A2E742D4952522D726567696F6E2E70742D64742D7265706F7274202E612D4952522D6865';
wwv_flow_imp.g_varchar2_table(30) := '61646572207B0D0A202020206261636B67726F756E642D636F6C6F723A20236462646264623B0D0A7D0D0A0D0A626F64792E617065782D7468656D652D766974612D6461726B202E742D4952522D726567696F6E2E70742D64742D7265706F7274202E61';
wwv_flow_imp.g_varchar2_table(31) := '2D4952522D686561646572207B0D0A202020206261636B67726F756E642D636F6C6F723A20233531353135313B0D0A7D0D0A0D0A2F2A204368617274202A2F0D0A2E70742D63686172742E742D526567696F6E2D2D6E6F50616464696E67203E202E742D';
wwv_flow_imp.g_varchar2_table(32) := '526567696F6E2D626F647957726170203E202E742D526567696F6E2D626F6479207B0D0A202070616464696E673A20302E3572656D2030203020303B0D0A7D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(12213310202453664792)
,p_plugin_id=>wwv_flow_imp.id(12163302657156180788)
,p_file_name=>'css/lib4x-wdrpivottable.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260624210739Z')
,p_updated_on=>wwv_flow_imp.dz('20260624210739Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '626F64793A6E6F74282E617065782D7468656D652D766974612D6461726B2920237764722D7069766F742D76696577202E7764722D677269642D6C61796F7574206469763A6E6F74282E7764722D66696C7465722D686561646572292E7764722D686561';
wwv_flow_imp.g_varchar2_table(2) := '646572207B6261636B67726F756E642D636F6C6F723A20236661666166613B7D237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C6261722C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C62617220';
wwv_flow_imp.g_varchar2_table(3) := '612C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C626172206469762C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C62617220696E7075742C237764722D746F6F6C6261722D77726170706572';
wwv_flow_imp.g_varchar2_table(4) := '20237764722D746F6F6C626172206C692C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C62617220702C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C6261722073656C6563742C237764722D74';
wwv_flow_imp.g_varchar2_table(5) := '6F6F6C6261722D7772617070657220237764722D746F6F6C626172207370616E2C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C626172207461626C652C237764722D746F6F6C6261722D7772617070657220237764722D74';
wwv_flow_imp.g_varchar2_table(6) := '6F6F6C626172207461626C652074642C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C626172207461626C652074682C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C626172207461626C652074';
wwv_flow_imp.g_varchar2_table(7) := '722C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C6261722074657874617265612C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C62617220756C207B666F6E742D73697A653A20313270783B7D';
wwv_flow_imp.g_varchar2_table(8) := '237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C6261723E2E7764722D746F6F6C6261722D67726F75702D72696768743E6C693E61207370616E2C237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C62';
wwv_flow_imp.g_varchar2_table(9) := '61723E6C693E61207370616E207B746F703A20333570783B7D237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C6261722061207B6865696768743A20363070783B7D237764722D746F6F6C6261722D77726170706572207B6865';
wwv_flow_imp.g_varchar2_table(10) := '696768743A20353570780D0A7D237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C626172207B6865696768743A20353570783B7D237764722D746F6F6C6261722D7772617070657220237764722D746F6F6C626172202E776472';
wwv_flow_imp.g_varchar2_table(11) := '2D746F6F6C6261722D67726F75702D72696768743A68617328236C696234782D7461622D66756C6C73637265656E29207B70616464696E672D72696768743A20302E3572656D3B7D237764722D746F6F6C6261722D7772617070657220237764722D746F';
wwv_flow_imp.g_varchar2_table(12) := '6F6C626172202E7764722D64726F70646F776E207B746F703A20353570783B7D237764722D7069766F742D76696577202E7764722D677269642D6C61796F7574202E7764722D66696C74657273202E7764722D6865616465722C237764722D7069766F74';
wwv_flow_imp.g_varchar2_table(13) := '2D76696577202E7764722D677269642D6C61796F75742E7764722D666C61742D76696577202E7764722D686561646572207B746578742D7472616E73666F726D3A206E6F6E653B7D237764722D636F6E746578742D6D656E75207B646973706C61793A20';
wwv_flow_imp.g_varchar2_table(14) := '6E6F6E652021696D706F7274616E743B7D237764722D7069766F742D76696577202E7764722D63726564697473207B70616464696E672D696E6C696E652D656E643A203570783B7D237764722D7069766F742D7669657720237764722D636F6C732D7368';
wwv_flow_imp.g_varchar2_table(15) := '6565742C20237764722D7069766F742D7669657720237764722D73686565742D68656164657273207B626F726465722D746F703A2031707820736F6C696420766172282D2D6C696234782D677269642D626F726465722D636F6C6F722C20236435643564';
wwv_flow_imp.g_varchar2_table(16) := '35293B7D2E742D526567696F6E2E6C696234782D7764722D7074202E742D526567696F6E2D626F6479207B70616464696E672D696E6C696E652D73746172743A203070783B70616464696E672D696E6C696E652D656E643A203070783B70616464696E67';
wwv_flow_imp.g_varchar2_table(17) := '2D626C6F636B2D73746172743A203070783B70616464696E672D626C6F636B2D656E643A20312E3572656D3B7D2E742D4952522D726567696F6E2E6C696234782D7764722D7074207B70616464696E672D626C6F636B2D656E643A20312E3572656D3B7D';
wwv_flow_imp.g_varchar2_table(18) := '237764722D746F6F6C6261722D77726170706572202E7764722D746F6F6C6261722D7569202E7764722D726164696F2D7772617020696E707574207B646973706C61793A20696E6C696E652D626C6F636B3B6F7061636974793A20303B7D2E7764722D74';
wwv_flow_imp.g_varchar2_table(19) := '6F6F6C6261722D7569206C692E69732D64697361626C6564207B6F7061636974793A20302E343B706F696E7465722D6576656E74733A206E6F6E653B7D2E64742D64657461696C732D636F6E7461696E6572207B70616464696E672D626C6F636B2D656E';
wwv_flow_imp.g_varchar2_table(20) := '643A20302E3572656D3B7D2E64742D64657461696C732D6C6162656C207B6D617267696E2D6C6566743A20313070783B7D2E742D4952522D726567696F6E2E70742D64742D7265706F7274207B2D2D75742D6C696E6B2D746578742D636F6C6F723A2023';
wwv_flow_imp.g_varchar2_table(21) := '3131313B7D626F64792E617065782D7468656D652D766974612D6461726B202E742D4952522D726567696F6E2E70742D64742D7265706F7274207B2D2D75742D6C696E6B2D746578742D636F6C6F723A20234632463246323B7D2E742D4952522D726567';
wwv_flow_imp.g_varchar2_table(22) := '696F6E2E70742D64742D7265706F7274202E612D4952522D7461626C65207464207B77686974652D73706163653A206E6F777261703B7D2E742D4952522D726567696F6E2E70742D64742D7265706F7274202E612D4952522D686561646572207B626163';
wwv_flow_imp.g_varchar2_table(23) := '6B67726F756E642D636F6C6F723A20236462646264623B7D626F64792E617065782D7468656D652D766974612D6461726B202E742D4952522D726567696F6E2E70742D64742D7265706F7274202E612D4952522D686561646572207B6261636B67726F75';
wwv_flow_imp.g_varchar2_table(24) := '6E642D636F6C6F723A20233531353135313B7D2E70742D63686172742E742D526567696F6E2D2D6E6F50616464696E67203E202E742D526567696F6E2D626F647957726170203E202E742D526567696F6E2D626F6479207B70616464696E673A20302E35';
wwv_flow_imp.g_varchar2_table(25) := '72656D2030203020303B7D';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(12213761308751542392)
,p_plugin_id=>wwv_flow_imp.id(12163302657156180788)
,p_file_name=>'css/lib4x-wdrpivottable.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260624210739Z')
,p_updated_on=>wwv_flow_imp.dz('20260624210739Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '77696E646F772E6C69623478203D2077696E646F772E6C69623478207C7C207B7D3B0D0A77696E646F772E6C696234782E617874203D2077696E646F772E6C696234782E617874207C7C207B7D3B0D0A77696E646F772E6C696234782E6178742E776472';
wwv_flow_imp.g_varchar2_table(2) := '203D2077696E646F772E6C696234782E6178742E776472207C7C207B7D3B0D0A0D0A2F2A0D0A202A20526567696F6E20706C7567696E2C207772617070696E672057656244617461526F636B73205069766F74204772696420436F6D706F6E656E742028';
wwv_flow_imp.g_varchar2_table(3) := '68747470733A2F2F7777772E77656264617461726F636B732E636F6D2F290D0A202A205465636820646F633A2068747470733A2F2F6769746875622E636F6D2F6B656B656D612F617065782D7764722D7069766F742D7461626C650D0A202A20496D706F';
wwv_flow_imp.g_varchar2_table(4) := '7274616E743A2057656244617461526F636B73206C6963656E73653A2068747470733A2F2F7777772E77656264617461726F636B732E636F6D2F6C6963656E73652D61677265656D656E742F0D0A202A200D0A202A20456E61626C657320415045582064';
wwv_flow_imp.g_varchar2_table(5) := '61746120736F7572636520696E746567726174696F6E2C207072696D6172792F616C7465726E61746976652F70726976617465207265706F7274732C20736176652F6C6F6164206F662070726976617465207265706F72747320286C6F63616C292E200D';
wwv_flow_imp.g_varchar2_table(6) := '0A202A20537570706F727420666F72204472696C6C2D5468726F756768207573696E6720496E746572616374697665205265706F72742028696E6C696E65206469616C6F67292C20436861727420696E746567726174696F6E2C205468656D65732C2054';
wwv_flow_imp.g_varchar2_table(7) := '72616E736C6174696F6E2E0D0A202A200D0A202A2044657369676E20636F6E73696465726174696F6E20697320746F206C6F6164207072652D6167677265676174656420646174612066726F6D20746865207365727665722E2054686520574452206275';
wwv_flow_imp.g_varchar2_table(8) := '696C642D696E204472696C6C2D5468726F7567682069732064697361626C65642E200D0A202A20496E7374656164206120637573746F6D204472696C6C2D5468726F7567682063616E206265206163686965766564207573696E672049522C206C6F6164';
wwv_flow_imp.g_varchar2_table(9) := '696E67207468652064657461696C6564207265636F72647320626568696E6420612063656C6C206174204472696C6C2D5468726F756768206D6F6D656E742E0D0A202A20416C736F20666F7220436861727420696E746567726174696F6E2C2064617461';
wwv_flow_imp.g_varchar2_table(10) := '206973206C6F616465642066726F6D2074686520736572766572206F6E6C7920617320706572207468652063757272656E742073656C6563746564205069766F74207461626C652063656C6C20636F6E746578742E0D0A202A200D0A202A205744522068';
wwv_flow_imp.g_varchar2_table(11) := '6173206120646174612073697A65206C696D6974206F6620314D422E0D0A202A200D0A202A20466F722072657472696576696E672049522F436861727420646174612066726F6D207468652073657276657220617320706572207468652063757272656E';
wwv_flow_imp.g_varchar2_table(12) := '74205069766F74205461626C6520636F6E746578742C2074686520706C7567696E20707265706172657320612046696C74657273204A534F4E2C0D0A202A20636F6D6D756E69636174656420746F2074686520736572766572207573696E672074686520';
wwv_flow_imp.g_varchar2_table(13) := '68696464656E202746696C746572732050616765204974656D272E0D0A202A2F0D0A6C696234782E6178742E7764722E7069766F745461626C65203D202866756E6374696F6E282429207B0D0A202020200D0A20202020636F6E737420435F4C49423458';
wwv_flow_imp.g_varchar2_table(14) := '5F5744525F5054203D20276C696234782D7764722D7074273B2020202020202F2F20726567696F6E20636C6173730D0A20202020636F6E737420435F4C494234585F50545F4454203D20276C696234782D70742D6474273B20202020202020202F2F2069';
wwv_flow_imp.g_varchar2_table(15) := '6E6C696E65206469616C6F6720636C6173730D0A20202020636F6E7374205744525F50545F455854203D20275F7074273B202020202020202020202020202020202020202F2F20696420657874656E73696F6E20666F72207769646765742069640D0A20';
wwv_flow_imp.g_varchar2_table(16) := '202020636F6E737420435F415045585F5448454D455F564954415F4441524B203D2027617065782D7468656D652D766974612D6461726B273B0D0A20202020636F6E7374204C4F43414C5F53544F524147455F505245464958203D20276C696234785F77';
wwv_flow_imp.g_varchar2_table(17) := '64725F7074273B0D0A202020206C6574206D6F6E74684D6170203D206E756C6C3B2020202020202020202020202020202020202020202020202F2F206D617070696E67206D6F6E7468206E616D657320746F206E756D626572730D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(18) := '202020202020202020202020200D0A20202020242866756E6374696F6E28297B0D0A20202020202020202F2F205744522061706927732F6576656E747320646F2072657475726E206D6F6E7468206E616D6573206F6E6C7920666F722064617465207479';
wwv_flow_imp.g_varchar2_table(19) := '7065730D0A20202020202020202F2F206D6F6E74684D6170206973207573656420746F20656E61626C65206E6F726D616C697A65642076616C7565730D0A20202020202020206D6F6E74684D6170203D20617065782E6C6F63616C652E6765744D6F6E74';
wwv_flow_imp.g_varchar2_table(20) := '684E616D657328292E72656475636528286F626A2C206D6F6E74682C20696E64657829203D3E207B0D0A2020202020202020202020206F626A5B6D6F6E74682E746F4C6F7765724361736528295D203D20537472696E6728696E646578202B2031292E70';
wwv_flow_imp.g_varchar2_table(21) := '6164537461727428322C20273027293B0D0A20202020202020202020202072657475726E206F626A3B0D0A20202020202020207D2C207B7D293B2020202020202020200D0A202020207D290D0A0D0A202020202F2A0D0A20202020202A20776562446174';
wwv_flow_imp.g_varchar2_table(22) := '61526F636B734D6F64756C650D0A20202020202A202D2057445220696E7374616E74696174696F6E0D0A20202020202A202D20746F6F6C62617220637573746F6D697A6174696F6E202B2068616E646C6572732028736176652C206C6F61642C2064656C';
wwv_flow_imp.g_varchar2_table(23) := '657465207265706F72742C20657463290D0A20202020202A202D20736574207570206576656E742068616E646C6572732028636C69636B2F646F75626C65636C69636B290D0A20202020202A202D20707265706172652046696C74657273204A534F4E0D';
wwv_flow_imp.g_varchar2_table(24) := '0A20202020202A2F0D0A202020206C65742077656244617461526F636B734D6F64756C65203D202866756E6374696F6E2829200D0A202020207B0D0A20202020202020202F2A0D0A2020202020202020202A20696E697450540D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(25) := '2A20616A61784964656E7469666965723A20666F7220616E7920667574757265207365727665722063616C6C6261636B730D0A2020202020202020202A20707453746174696349643A20726567696F6E207374617469632069640D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(26) := '202A207074537461746963496450743A207069766F74207461626C6520776964676574206469762069642028726567696F6E206368696C6420646976290D0A2020202020202020202A207074496E7465726E616C49643A20726567696F6E20696E746572';
wwv_flow_imp.g_varchar2_table(27) := '6E616C2069640D0A2020202020202020202A2064744469616C6F6753746174696349643A206472696C6C2D7468726F75676820696E6C696E65206469616C6F672069640D0A2020202020202020202A2066696C74657273506167654974656D3A20636F6E';
wwv_flow_imp.g_varchar2_table(28) := '66696775726564202868696464656E292070616765206974656D20746F20686F6C64207468652046696C74657273204A534F4E0D0A2020202020202020202A206F7074696F6E733A20706C7567696E2064657461696C6564206F7074696F6E730D0A2020';
wwv_flow_imp.g_varchar2_table(29) := '202020202020202A2F0D0A20202020202020206C657420696E69745054203D2066756E6374696F6E28616A61784964656E7469666965722C20707453746174696349642C207074537461746963496450742C207074496E7465726E616C49642C20647444';
wwv_flow_imp.g_varchar2_table(30) := '69616C6F6753746174696349642C2066696C74657273506167654974656D2C206F7074696F6E7329207B0D0A2020202020202020202020206C657420707424203D202428272327202B20707453746174696349645074293B20200D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(31) := '202020202F2F207365727665722D736964652C20746865204A534F4E206461746120726573756C7473657420697320616464656420746F207468652070616765207573696E67206874702E7028277661722067507427207C7C206C5F696E7465726E616C';
wwv_flow_imp.g_varchar2_table(32) := '5F6964207C7C202764617461203D207B2264617461223A27293B0D0A2020202020202020202020206C657420707444617461203D2077696E646F775B2767507427202B207074496E7465726E616C4964202B202764617461275D3F2E646174613B202020';
wwv_flow_imp.g_varchar2_table(33) := '2020200D0A0D0A2020202020202020202020202F2F20676574206E616D65206F662063757272656E74207074207265706F72740D0A20202020202020202020202066756E6374696F6E206765745265706F72744E616D6528290D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(34) := '2020207B0D0A202020202020202020202020202020206C6574207074576964676574203D207074242E64617461282777656264617461726F636B7327293B0D0A202020202020202020202020202020206C65742070745265706F7274203D207074576964';
wwv_flow_imp.g_varchar2_table(35) := '6765742E6765745265706F727428293B0D0A202020202020202020202020202020206C6574207265706F72744E616D65203D2070745265706F72742E6F7074696F6E732E677269642E7469746C653B0D0A20202020202020202020202020202020726574';
wwv_flow_imp.g_varchar2_table(36) := '75726E207265706F72744E616D653B202020202020202020202020202020200D0A2020202020202020202020207D0D0A0D0A2020202020202020202020202F2F206765742074797065206F662063757272656E74207074207265706F72743A20636C6173';
wwv_flow_imp.g_varchar2_table(37) := '7369632C20636F6D70616374206F7220666C61740D0A20202020202020202020202066756E6374696F6E206765745265706F72745479706528290D0A2020202020202020202020207B0D0A202020202020202020202020202020206C6574207074576964';
wwv_flow_imp.g_varchar2_table(38) := '676574203D207074242E64617461282777656264617461726F636B7327293B0D0A202020202020202020202020202020206C65742070745265706F7274203D2070745769646765742E6765745265706F727428293B0D0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(39) := '2020206C6574207265706F727454797065203D2070745265706F72742E6F7074696F6E732E677269642E747970653B0D0A2020202020202020202020202020202072657475726E207265706F7274547970653B202020202020202020202020202020200D';
wwv_flow_imp.g_varchar2_table(40) := '0A2020202020202020202020207D0D0A0D0A2020202020202020202020202F2F2067657420616C6C20636F6E66696775726564207265706F7274730D0A20202020202020202020202066756E6374696F6E20676574416C6C5265706F72747328290D0A20';
wwv_flow_imp.g_varchar2_table(41) := '20202020202020202020207B0D0A2020202020202020202020202020202072657475726E205B6F7074696F6E732E7072696D6172795265706F72742C202E2E2E286F7074696F6E732E616C7465726E61746976655265706F727473203F3F205B5D292C20';
wwv_flow_imp.g_varchar2_table(42) := '2E2E2E286F7074696F6E732E707269766174655265706F727473203F3F205B5D295D3B0D0A2020202020202020202020207D0D0A0D0A20202020202020202020202066756E6374696F6E206765745265706F7274466F724E616D65286E616D65290D0A20';
wwv_flow_imp.g_varchar2_table(43) := '20202020202020202020207B0D0A202020202020202020202020202020206C6574207265706F727473203D20676574416C6C5265706F72747328293B0D0A2020202020202020202020202020202072657475726E207265706F7274732E66696E64287265';
wwv_flow_imp.g_varchar2_table(44) := '706F7274203D3E207265706F72742E6F7074696F6E732E677269642E7469746C65203D3D3D206E616D65293B0D0A2020202020202020202020207D0D0A0D0A20202020202020202020202066756E6374696F6E20656E61626C6544697361626C65546F6F';
wwv_flow_imp.g_varchar2_table(45) := '6C626172427574746F6E7328290D0A2020202020202020202020207B0D0A202020202020202020202020202020206C6574207265706F72744E616D65203D206765745265706F72744E616D6528293B0D0A202020202020202020202020202020206C6574';
wwv_flow_imp.g_varchar2_table(46) := '206366675265706F7274203D206765745265706F7274466F724E616D65287265706F72744E616D65293B0D0A202020202020202020202020202020202F2F206F6E6C792070726976617465207265706F7274732063616E2062652064656C657465640D0A';
wwv_flow_imp.g_varchar2_table(47) := '20202020202020202020202020202020696620286366675265706F72742E6C696234782E74797065203D3D20277072697661746527290D0A202020202020202020202020202020207B0D0A20202020202020202020202020202020202020207074242E66';
wwv_flow_imp.g_varchar2_table(48) := '696E642827236C696234782D7461622D64656C6574657265706F727427292E72656D6F7665436C617373282269732D64697361626C656422293B200D0A202020202020202020202020202020207D0D0A20202020202020202020202020202020656C7365';
wwv_flow_imp.g_varchar2_table(49) := '0D0A202020202020202020202020202020207B0D0A20202020202020202020202020202020202020207074242E66696E642827236C696234782D7461622D64656C6574657265706F727427292E616464436C617373282269732D64697361626C65642229';
wwv_flow_imp.g_varchar2_table(50) := '3B0D0A202020202020202020202020202020207D202020202020202020202020202020200D0A2020202020202020202020207D0D0A0D0A2020202020202020202020202F2F20637573746F6D697A65207468652057445220707420746F6F6C6261722061';
wwv_flow_imp.g_varchar2_table(51) := '7320746F2068617665206F7572206F776E20736176652F6C6F61642F64656C6574652F6D6178696D697A650D0A20202020202020202020202066756E6374696F6E20637573746F6D697A65546F6F6C62617228746F6F6C626172290D0A20202020202020';
wwv_flow_imp.g_varchar2_table(52) := '20202020207B0D0A202020202020202020202020202020202F2F20746F6F6C626172207361766520627574746F6E206C6F6769630D0A2020202020202020202020202020202066756E6374696F6E20736176655265706F7274436F6E66696728290D0A20';
wwv_flow_imp.g_varchar2_table(53) := '2020202020202020202020202020207B0D0A20202020202020202020202020202020202020206C6574207074576964676574203D207074242E64617461282777656264617461726F636B7327293B0D0A2020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(54) := '66756E6374696F6E206469616C6F67526573756C7428726573756C74290D0A20202020202020202020202020202020202020207B0D0A20202020202020202020202020202020202020202020202069662028726573756C74290D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(55) := '2020202020202020202020202020207B0D0A202020202020202020202020202020202020202020202020202020202F2F206469616C6F67526573756C742063616C6C6261636B2069732063616C6C65642066726F6D206469616C6F6720636C6F73652065';
wwv_flow_imp.g_varchar2_table(56) := '76656E743A206469616C6F672069732068696464656E2C2062757420444F4D20636F6E74656E74206973207374696C6C2074686572652028696E20746F702070616765290D0A202020202020202020202020202020202020202020202020202020206C65';
wwv_flow_imp.g_varchar2_table(57) := '74207265706F72744E616D65203D20617065782E7574696C2E676574546F704170657828292E6A51756572792827236C696234785F70745F736176655265706F72744E616D6527292E76616C28293B0D0A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(58) := '202020202020202020696620287265706F72744E616D65290D0A202020202020202020202020202020202020202020202020202020207B0D0A20202020202020202020202020202020202020202020202020202020202020206C65742070745265706F72';
wwv_flow_imp.g_varchar2_table(59) := '74203D2070745769646765742E6765745265706F727428293B0D0A20202020202020202020202020202020202020202020202020202020202020206C6574206366675265706F7274546F53617665203D204A534F4E2E7061727365284A534F4E2E737472';
wwv_flow_imp.g_varchar2_table(60) := '696E676966792870745265706F727429293B0D0A20202020202020202020202020202020202020202020202020202020202020202F2F206A75737420746F20626520737572652C2064656C65746520616E792064617461536F757263652066726F6D2074';
wwv_flow_imp.g_varchar2_table(61) := '6865207265706F7274202D2064617461536F7572636520686F77657665722073686F756C6420626520776974682074686520676C6F62616C206F626A656374206F6E6C790D0A202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(62) := '2020696620286366675265706F7274546F536176652E64617461536F75726365290D0A20202020202020202020202020202020202020202020202020202020202020207B0D0A202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(63) := '20202020202064656C657465206366675265706F7274546F536176652E64617461536F757263653B0D0A20202020202020202020202020202020202020202020202020202020202020207D20202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(64) := '0D0A20202020202020202020202020202020202020202020202020202020202020206C657420736176655265706F7274203D2066616C73653B0D0A20202020202020202020202020202020202020202020202020202020202020206C6574206366674578';
wwv_flow_imp.g_varchar2_table(65) := '697374696E675265706F7274203D206765745265706F7274466F724E616D65287265706F72744E616D65293B0D0A2020202020202020202020202020202020202020202020202020202020202020696620286366674578697374696E675265706F727429';
wwv_flow_imp.g_varchar2_table(66) := '0D0A20202020202020202020202020202020202020202020202020202020202020207B0D0A202020202020202020202020202020202020202020202020202020202020202020202020696620286366674578697374696E675265706F72742E6C69623478';
wwv_flow_imp.g_varchar2_table(67) := '2E74797065203D3D3D20277072697661746527290D0A2020202020202020202020202020202020202020202020202020202020202020202020207B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(68) := '202F2F20726561737369676E206578697374696E67207265706F727420636F6E6669670D0A202020202020202020202020202020202020202020202020202020202020202020202020202020204F626A6563742E6B657973286366674578697374696E67';
wwv_flow_imp.g_varchar2_table(69) := '5265706F7274292E666F7245616368286B6579203D3E207B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020696620286B657920213D3D20226C696234782229207B0D0A202020202020';
wwv_flow_imp.g_varchar2_table(70) := '20202020202020202020202020202020202020202020202020202020202020202020202020202020202064656C657465206366674578697374696E675265706F72745B6B65795D3B0D0A2020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(71) := '2020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020207D293B2020200D0A20202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(72) := '2020202020202020204F626A6563742E61737369676E286366674578697374696E675265706F72742C206366675265706F7274546F53617665293B202020202F2F2061737369676E206366675265706F7274546F536176652070726F7065727469657320';
wwv_flow_imp.g_varchar2_table(73) := '746F206366674578697374696E675265706F72742020200D0A202020202020202020202020202020202020202020202020202020202020202020202020202020206366674578697374696E675265706F72742E6F7074696F6E732E677269642E7469746C';
wwv_flow_imp.g_varchar2_table(74) := '65203D207265706F72744E616D653B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202F2F206368616E6765207265706F7274206E616D652063757272656E74206C6F61646564207265706F7274';
wwv_flow_imp.g_varchar2_table(75) := '0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020206C65742070745265706F72744F7074696F6E73203D2070745769646765742E6765744F7074696F6E7328293B0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(76) := '2020202020202020202020202020202020202020202020202020202070745265706F72744F7074696F6E732E677269642E7469746C65203D207265706F72744E616D653B0D0A202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(77) := '2020202020202020202070745769646765742E7365744F7074696F6E732870745265706F72744F7074696F6E73293B2020200D0A202020202020202020202020202020202020202020202020202020202020202020202020202020207074576964676574';
wwv_flow_imp.g_varchar2_table(78) := '2E7265667265736828293B2020200D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020736176655265706F7274203D20747275653B20200D0A20202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(79) := '202020202020202020202020202020202020656E61626C6544697361626C65546F6F6C626172427574746F6E7328293B202020202020202020202020202020202020202020202020200D0A20202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(80) := '20202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020202020202020202020656C73650D0A2020202020202020202020202020202020202020202020202020202020202020202020207B0D0A2020202020';
wwv_flow_imp.g_varchar2_table(81) := '20202020202020202020202020202020202020202020202020202020202020202020202F2F20275C2727202B207265706F72744E616D65202B20275C2720697320612027202B206366674578697374696E675265706F72742E6C696234782E7479706520';
wwv_flow_imp.g_varchar2_table(82) := '2B2027207265706F72742E2043616E206F6E6C79207361766520617320612070726976617465207265706F72742E270D0A202020202020202020202020202020202020202020202020202020202020202020202020202020202F2F20757365206C616E67';
wwv_flow_imp.g_varchar2_table(83) := '2E666F726D61744E6F457363617065206173206D6573736167652E616C6572742077696C6C206573636170650D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020617065782E6D6573736167652E61';
wwv_flow_imp.g_varchar2_table(84) := '6C65727428617065782E6C616E672E666F726D61744E6F457363617065286765744D6573736167652827534156455F5245504F52545F57524F4E475F5459504527292C207265706F72744E616D652C206366674578697374696E675265706F72742E6C69';
wwv_flow_imp.g_varchar2_table(85) := '6234782E7479706529293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(86) := '20202020202020202020202020202020202020656C73650D0A20202020202020202020202020202020202020202020202020202020202020207B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202F2F2063';
wwv_flow_imp.g_varchar2_table(87) := '68616E6765207265706F7274206E616D652063757272656E74206C6F61646564207265706F72740D0A2020202020202020202020202020202020202020202020202020202020202020202020206C65742070745265706F72744F7074696F6E73203D2070';
wwv_flow_imp.g_varchar2_table(88) := '745769646765742E6765744F7074696F6E7328293B0D0A20202020202020202020202020202020202020202020202020202020202020202020202070745265706F72744F7074696F6E732E677269642E7469746C65203D207265706F72744E616D653B20';
wwv_flow_imp.g_varchar2_table(89) := '0D0A20202020202020202020202020202020202020202020202020202020202020202020202070745769646765742E7365744F7074696F6E732870745265706F72744F7074696F6E73293B0D0A2020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(90) := '2020202020202020202020202070745769646765742E7265667265736828293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202F2F206E65772070726976617465207265706F72740D0A20202020202020';
wwv_flow_imp.g_varchar2_table(91) := '20202020202020202020202020202020202020202020202020202020206366675265706F7274546F536176652E6C69623478203D207B747970653A202770726976617465277D3B0D0A202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(92) := '2020202020202020206366675265706F7274546F536176652E6F7074696F6E732E677269642E7469746C65203D207265706F72744E616D653B200D0A2020202020202020202020202020202020202020202020202020202020202020202020206F707469';
wwv_flow_imp.g_varchar2_table(93) := '6F6E732E707269766174655265706F7274732E70757368286366675265706F7274546F53617665293B0D0A202020202020202020202020202020202020202020202020202020202020202020202020736176655265706F7274203D20747275653B0D0A20';
wwv_flow_imp.g_varchar2_table(94) := '2020202020202020202020202020202020202020202020202020202020202020202020656E61626C6544697361626C65546F6F6C626172427574746F6E7328293B0D0A20202020202020202020202020202020202020202020202020202020202020207D';
wwv_flow_imp.g_varchar2_table(95) := '0D0A202020202020202020202020202020202020202020202020202020202020202069662028736176655265706F7274290D0A20202020202020202020202020202020202020202020202020202020202020207B0D0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(96) := '2020202020202020202020202020202020202020202069662028617065782E73746F726167652E6861734C6F63616C53746F72616765537570706F7274282929200D0A202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(97) := '2020207B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020206C6574206C6F63616C53746F72616765203D20617065782E73746F726167652E67657453636F7065644C6F63616C53746F7261676528';
wwv_flow_imp.g_varchar2_table(98) := '7B7072656669783A204C4F43414C5F53544F524147455F5052454649582C2075736541707049643A20747275652C207573655061676549643A20747275657D293B0D0A202020202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(99) := '20202020202020696620286C6F63616C53746F72616765290D0A202020202020202020202020202020202020202020202020202020202020202020202020202020207B0D0A20202020202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(100) := '202020202020202020202020206C6F63616C53746F726167652E7365744974656D2870745374617469634964202B20272E707269766174655265706F727473272C204A534F4E2E737472696E67696679286F7074696F6E732E707269766174655265706F';
wwv_flow_imp.g_varchar2_table(101) := '72747329293B2020200D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020206C6F63616C53746F726167652E7365744974656D2870745374617469634964202B20272E63757272656E745265';
wwv_flow_imp.g_varchar2_table(102) := '706F7274272C207265706F72744E616D65293B202020202020202020200D0A2020202020202020202020202020202020202020202020202020202020202020202020202020202020202020617065782E6D6573736167652E73686F775061676553756363';
wwv_flow_imp.g_varchar2_table(103) := '657373286765744D6573736167652827505249564154455F5245504F52545F53415645442729293B2020200D0A202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(104) := '2020202020202020202020202020202020202020202020207D202020200D0A20202020202020202020202020202020202020202020202020202020202020207D202020202020202020202020202020202020202020202020202020200D0A202020202020';
wwv_flow_imp.g_varchar2_table(105) := '202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020656C73650D0A202020202020202020202020202020202020202020202020202020207B0D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(106) := '202020202020202020202020202020202020202020202F2F206966206E6F2076616C75652077617320656E746572656420666F7220746865206E616D652C20676F206261636B20746F2073617665206469616C6F670D0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(107) := '2020202020202020202020202020202020202073657454696D656F75742828293D3E7B0D0A202020202020202020202020202020202020202020202020202020202020202020202020736176655265706F7274436F6E66696728293B0D0A202020202020';
wwv_flow_imp.g_varchar2_table(108) := '20202020202020202020202020202020202020202020202020207D290D0A202020202020202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020202020202F2F20696E206361736520';
wwv_flow_imp.g_varchar2_table(109) := '6F66206675747572652072656D6F7465207361766520666561747572652C20616A61782063616C6C6261636B2063616E20626520757365640D0A202020202020202020202020202020202020202020202020202020202F2A617065782E7365727665722E';
wwv_flow_imp.g_varchar2_table(110) := '706C7567696E280D0A2020202020202020202020202020202020202020202020202020202020202020616A61784964656E7469666965722C200D0A20202020202020202020202020202020202020202020202020202020202020207B200D0A2020202020';
wwv_flow_imp.g_varchar2_table(111) := '202020202020202020202020202020202020202020202020202020202020207830313A2022536F6D6574657874222C200D0A2020202020202020202020202020202020202020202020202020202020202020202020207830323A2022536F6D6574657874';
wwv_flow_imp.g_varchar2_table(112) := '32222C200D0A2020202020202020202020202020202020202020202020202020202020202020202020207830333A2022536F6D6556616C756533222C200D0A20202020202020202020202020202020202020202020202020202020202020202020202078';
wwv_flow_imp.g_varchar2_table(113) := '30343A202234222C0D0A202020202020202020202020202020202020202020202020202020202020202020202020705F636C6F625F30313A204A534F4E2E737472696E67696679287265706F7274546F53656E64292020200D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(114) := '202020202020202020202020202020202020202020207D2C200D0A20202020202020202020202020202020202020202020202020202020202020207B200D0A20202020202020202020202020202020202020202020202020202020202020202020202073';
wwv_flow_imp.g_varchar2_table(115) := '7563636573733A2066756E6374696F6E28704461746129207B200D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020636F6E736F6C652E6C6F672827414A41582063616C6C6261636B20636F6D706C';
wwv_flow_imp.g_varchar2_table(116) := '6574653A20272C207044617461293B200D0A2020202020202020202020202020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202020202020202020207D200D0A20202020202020';
wwv_flow_imp.g_varchar2_table(117) := '202020202020202020202020202020202020202020293B202A2F0D0A2020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202F2F';
wwv_flow_imp.g_varchar2_table(118) := '2073686F772073617665207265706F7274206469616C6F6720666F72207265706F7274206E616D6520696E7075740D0A20202020202020202020202020202020202020206C65742070745265706F7274203D2070745769646765742E6765745265706F72';
wwv_flow_imp.g_varchar2_table(119) := '7428293B0D0A20202020202020202020202020202020202020206C6574207265706F72744E616D65203D2070745265706F72742E6F7074696F6E732E677269642E7469746C653B0D0A20202020202020202020202020202020202020206C657420636667';
wwv_flow_imp.g_varchar2_table(120) := '5265706F7274203D206765745265706F7274466F724E616D65287265706F72744E616D65293B0D0A20202020202020202020202020202020202020206C65742064656661756C744E616D65203D2027273B0D0A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(121) := '202020696620286366675265706F72742E6C696234782E74797065203D3D3D20277072697661746527290D0A20202020202020202020202020202020202020207B0D0A20202020202020202020202020202020202020202020202064656661756C744E61';
wwv_flow_imp.g_varchar2_table(122) := '6D65203D207265706F72744E616D653B0D0A20202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202F2F20617065782E6D6573736167652E73686F774469616C6F67206973206E6F6E2D6F66666963';
wwv_flow_imp.g_varchar2_table(123) := '69616C2062757420776F6E277420676F20616E7977686572650D0A2020202020202020202020202020202020202020617065782E6D6573736167652E73686F774469616C6F6728273C64697620636C6173733D2269732D7265717569726564223E3C6C61';
wwv_flow_imp.g_varchar2_table(124) := '62656C20666F723D226C696234785F70745F736176655265706F72744E616D652220636C6173733D22742D466F726D2D6C6162656C223E4E616D653C2F6C6162656C3E2027202B0D0A202020202020202020202020202020202020202020202020273C69';
wwv_flow_imp.g_varchar2_table(125) := '6E70757420747970653D2274657874222069643D226C696234785F70745F736176655265706F72744E616D65222076616C75653D22272B64656661756C744E616D652B272220726571756972656420636C6173733D22617065782D6974656D2D74657874';
wwv_flow_imp.g_varchar2_table(126) := '22207374796C653D2277696474683A20313030253B223E3C2F6469763E272C0D0A2020202020202020202020202020202020202020202020207B0D0A202020202020202020202020202020202020202020202020202020207469746C653A206765744D65';
wwv_flow_imp.g_varchar2_table(127) := '73736167652827534156455F5049564F545F5245504F525427292C0D0A20202020202020202020202020202020202020202020202020202020756E736166653A2066616C73652C0D0A202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(128) := '20636F6E6669726D3A20747275652C0D0A202020202020202020202020202020202020202020202020202020206F70656E3A2066756E6374696F6E286529207B0D0A20202020202020202020202020202020202020202020202020202020202020202F2F';
wwv_flow_imp.g_varchar2_table(129) := '20627920686176696E6720616E206F70656E2066756E6374696F6E2C2074686520696E70757420656C656D656E742077696C6C207265636569766520666F637573206F6E206F70656E0D0A20202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(130) := '2020207D2C202020202020202020202020202020202020202020202020202020200D0A2020202020202020202020202020202020202020202020202020202063616C6C6261636B3A206469616C6F67526573756C740D0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(131) := '20202020202020202020207D293B0D0A202020202020202020202020202020207D0D0A202020200D0A202020202020202020202020202020202F2F20746F6F6C626172206C6F616420627574746F6E206C6F6769630D0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(132) := '20202066756E6374696F6E206C6F61645265706F7274436F6E66696728290D0A202020202020202020202020202020207B0D0A20202020202020202020202020202020202020206C6574207074576964676574203D207074242E64617461282777656264';
wwv_flow_imp.g_varchar2_table(133) := '617461726F636B7327293B0D0A202020202020202020202020202020202020202066756E6374696F6E206469616C6F67526573756C7428726573756C74290D0A20202020202020202020202020202020202020207B0D0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(134) := '202020202020202020202069662028726573756C74290D0A2020202020202020202020202020202020202020202020207B0D0A202020202020202020202020202020202020202020202020202020206C65742073656C6563746564496E646578203D2061';
wwv_flow_imp.g_varchar2_table(135) := '7065782E7574696C2E676574546F704170657828292E6A51756572792827236C696234785F70745F6C6F61645265706F72744E616D6527292E76616C28293B0D0A202020202020202020202020202020202020202020202020202020206966202873656C';
wwv_flow_imp.g_varchar2_table(136) := '6563746564496E646578290D0A202020202020202020202020202020202020202020202020202020207B0D0A20202020202020202020202020202020202020202020202020202020202020206C65742070745265706F7274203D2070745769646765742E';
wwv_flow_imp.g_varchar2_table(137) := '6765745265706F727428293B0D0A20202020202020202020202020202020202020202020202020202020202020206966202870745265706F7274290D0A20202020202020202020202020202020202020202020202020202020202020207B0D0A20202020';
wwv_flow_imp.g_varchar2_table(138) := '20202020202020202020202020202020202020202020202020202020202020202F2F20676574207468652073656C6563746564207265706F72740D0A2020202020202020202020202020202020202020202020202020202020202020202020206C657420';
wwv_flow_imp.g_varchar2_table(139) := '6366675265706F727473203D20676574416C6C5265706F72747328293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020206C6574206366675265706F7274203D206366675265706F7274735B4E756D626572';
wwv_flow_imp.g_varchar2_table(140) := '2873656C6563746564496E646578295D3B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202F2F206D616B65206974207468652063757272656E742061637475616C207265706F72740D0A20202020202020';
wwv_flow_imp.g_varchar2_table(141) := '202020202020202020202020202020202020202020202020202020202070745769646765742E7365745265706F7274286366675265706F7274293B0D0A2020202020202020202020202020202020202020202020202020202020202020202020202F2F20';
wwv_flow_imp.g_varchar2_table(142) := '73746F72652073656C656374696F6E20696E206C6F63616C2073746F726167650D0A20202020202020202020202020202020202020202020202020202020202020202020202069662028617065782E73746F726167652E6861734C6F63616C53746F7261';
wwv_flow_imp.g_varchar2_table(143) := '6765537570706F7274282929200D0A2020202020202020202020202020202020202020202020202020202020202020202020207B0D0A202020202020202020202020202020202020202020202020202020202020202020202020202020206C6574206C6F';
wwv_flow_imp.g_varchar2_table(144) := '63616C53746F72616765203D20617065782E73746F726167652E67657453636F7065644C6F63616C53746F72616765287B7072656669783A204C4F43414C5F53544F524147455F5052454649582C2075736541707049643A20747275652C207573655061';
wwv_flow_imp.g_varchar2_table(145) := '676549643A20747275657D293B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020696620286C6F63616C53746F72616765290D0A2020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(146) := '20202020202020202020202020207B0D0A20202020202020202020202020202020202020202020202020202020202020202020202020202020202020206C6F63616C53746F726167652E7365744974656D2870745374617469634964202B20272E637572';
wwv_flow_imp.g_varchar2_table(147) := '72656E745265706F7274272C206366675265706F72742E6F7074696F6E732E677269642E7469746C65293B202020202020202020200D0A202020202020202020202020202020202020202020202020202020202020202020202020202020207D0D0A2020';
wwv_flow_imp.g_varchar2_table(148) := '202020202020202020202020202020202020202020202020202020202020202020207D2020202020202020202020202020202020202020202020202020202020202020202020200D0A202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(149) := '20202020207D0D0A202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020207D0D0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(150) := '2020202020202020202F2F20636F6D706F73652073656C6563746C697374206F7074696F6E73207769746820616C6C207265706F7274732067726F7570656420746F202744656661756C7427202F202750726976617465270D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(151) := '202020202020202020202F2F207768657265202764656661756C74272061726520746865207072696D61727920616E6420616C7465726E6174697665207265706F7274730D0A20202020202020202020202020202020202020206C65742070745265706F';
wwv_flow_imp.g_varchar2_table(152) := '7274203D2070745769646765742E6765745265706F727428293B0D0A20202020202020202020202020202020202020206C65742070745469746C65203D2070745265706F72742E6F7074696F6E732E677269642E7469746C653B0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(153) := '2020202020202020202020206C65742063666744656661756C745265706F727473203D205B6F7074696F6E732E7072696D6172795265706F72742C202E2E2E6F7074696F6E732E616C7465726E61746976655265706F7274735D3B0D0A20202020202020';
wwv_flow_imp.g_varchar2_table(154) := '202020202020202020202020206C6574206F7074696F6E7344656661756C745265706F727473203D2063666744656661756C745265706F7274730D0A2020202020202020202020202020202020202020202020202E6D617028286366675265706F72742C';
wwv_flow_imp.g_varchar2_table(155) := '20696E64657829203D3E207B0D0A202020202020202020202020202020202020202020202020202020206C6574206366675265706F72745469746C65203D206366675265706F72742E6F7074696F6E732E677269642E7469746C653B0D0A202020202020';
wwv_flow_imp.g_varchar2_table(156) := '202020202020202020202020202020202020202020206C65742073656C6563746564203D20286366675265706F72745469746C65203D3D3D2070745469746C6529203F202773656C656374656427203A2027273B0D0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(157) := '202020202020202020202020202072657475726E20603C6F7074696F6E20247B73656C65637465647D2076616C75653D22247B696E6465787D223E247B6366675265706F72745469746C657D3C2F6F7074696F6E3E603B0D0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(158) := '202020202020202020202020207D292E6A6F696E282222293B0D0A20202020202020202020202020202020202020206C65742062617365496E646578203D2063666744656661756C745265706F7274732E6C656E6774683B0D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(159) := '202020202020202020206C6574206F7074696F6E73507269766174655265706F727473203D206F7074696F6E732E707269766174655265706F7274730D0A2020202020202020202020202020202020202020202020202E6D617028286366675265706F72';
wwv_flow_imp.g_varchar2_table(160) := '742C20696E64657829203D3E207B0D0A202020202020202020202020202020202020202020202020202020206C6574206366675265706F72745469746C65203D206366675265706F72742E6F7074696F6E732E677269642E7469746C653B0D0A20202020';
wwv_flow_imp.g_varchar2_table(161) := '2020202020202020202020202020202020202020202020206C65742073656C6563746564203D20286366675265706F72745469746C65203D3D3D2070745469746C6529203F202773656C656374656427203A2027273B0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(162) := '2020202020202020202020202020202072657475726E20603C6F7074696F6E20247B73656C65637465647D2076616C75653D22247B62617365496E6465782B696E6465787D223E247B6366675265706F72745469746C657D3C2F6F7074696F6E3E603B0D';
wwv_flow_imp.g_varchar2_table(163) := '0A2020202020202020202020202020202020202020202020207D292E6A6F696E282222293B20200D0A20202020202020202020202020202020202020202F2F206C6F6164207069766F74207265706F7274206469616C6F67202020202020202020202020';
wwv_flow_imp.g_varchar2_table(164) := '202020202020202020200D0A2020202020202020202020202020202020202020617065782E6D6573736167652E73686F774469616C6F6728273C6469763E27202B0D0A202020202020202020202020202020202020202020202020273C73656C65637420';
wwv_flow_imp.g_varchar2_table(165) := '69643D226C696234785F70745F6C6F61645265706F72744E616D652220636C6173733D2273656C6563746C69737420617065782D6974656D2D73656C65637422207374796C653D2277696474683A20313030253B2220646174612D6E61746976652D6D65';
wwv_flow_imp.g_varchar2_table(166) := '6E753D2266616C7365222073697A653D2231223E27202B200D0A202020202020202020202020202020202020202020202020273C6F707467726F7570206C6162656C3D2244656661756C74223E27202B206F7074696F6E7344656661756C745265706F72';
wwv_flow_imp.g_varchar2_table(167) := '7473202B20273C2F6F707467726F75703E3C6F707467726F7570206C6162656C3D2250726976617465223E27202B206F7074696F6E73507269766174655265706F727473202B20273C2F6F707467726F75703E3C2F73656C6563743E27202B0D0A202020';
wwv_flow_imp.g_varchar2_table(168) := '202020202020202020202020202020202020202020273C2F6469763E272C0D0A2020202020202020202020202020202020202020202020207B0D0A202020202020202020202020202020202020202020202020202020207469746C653A206765744D6573';
wwv_flow_imp.g_varchar2_table(169) := '7361676528274C4F41445F5049564F545F5245504F525427292C0D0A20202020202020202020202020202020202020202020202020202020756E736166653A2066616C73652C0D0A20202020202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(170) := '636F6E6669726D3A20747275652C0D0A202020202020202020202020202020202020202020202020202020206F70656E3A2066756E6374696F6E286529207B0D0A20202020202020202020202020202020202020202020202020202020202020202F2F20';
wwv_flow_imp.g_varchar2_table(171) := '627920686176696E6720616E206F70656E2066756E6374696F6E2C207468652073656C65637420656C656D656E742077696C6C207265636569766520666F637573206F6E206F70656E0D0A20202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(172) := '2020207D2C0D0A2020202020202020202020202020202020202020202020202020202063616C6C6261636B3A206469616C6F67526573756C740D0A2020202020202020202020202020202020202020202020207D293B0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(173) := '202020207D20200D0A202020202020202020202020202020200D0A202020202020202020202020202020202F2F20746F6F6C6261722064656C657465206C6F6769630D0A2020202020202020202020202020202066756E6374696F6E2064656C65746552';
wwv_flow_imp.g_varchar2_table(174) := '65706F7274436F6E66696728290D0A202020202020202020202020202020207B0D0A20202020202020202020202020202020202020206C6574207074576964676574203D207074242E64617461282777656264617461726F636B7327293B0D0A20202020';
wwv_flow_imp.g_varchar2_table(175) := '2020202020202020202020202020202066756E6374696F6E2064656C6574655265706F7274287265706F72744E616D65290D0A20202020202020202020202020202020202020207B0D0A2020202020202020202020202020202020202020202020206966';
wwv_flow_imp.g_varchar2_table(176) := '20287265706F72744E616D65290D0A2020202020202020202020202020202020202020202020207B0D0A202020202020202020202020202020202020202020202020202020202F2F2072656D6F76652066726F6D2070726976617465207265706F727473';
wwv_flow_imp.g_varchar2_table(177) := '0D0A202020202020202020202020202020202020202020202020202020206F7074696F6E732E707269766174655265706F727473203D206F7074696F6E732E707269766174655265706F7274732E66696C746572280D0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(178) := '20202020202020202020202020202020202020636667507269766174655265706F7274203D3E20636667507269766174655265706F72742E6F7074696F6E732E677269642E7469746C6520213D3D207265706F72744E616D650D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(179) := '20202020202020202020202020202020202020293B0D0A202020202020202020202020202020202020202020202020202020202F2F2073776974636820707420746F207072696D617279207265706F72740D0A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(180) := '20202020202020202020206C6574206366675265706F7274203D20676574416C6C5265706F72747328295B305D3B0D0A2020202020202020202020202020202020202020202020202020202070745769646765742E7365745265706F7274286366675265';
wwv_flow_imp.g_varchar2_table(181) := '706F7274293B0D0A2020202020202020202020202020202020202020202020202020202069662028617065782E73746F726167652E6861734C6F63616C53746F72616765537570706F7274282929200D0A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(182) := '2020202020202020207B0D0A20202020202020202020202020202020202020202020202020202020202020202F2F2073746F7265206368616E6765730D0A20202020202020202020202020202020202020202020202020202020202020206C6574206C6F';
wwv_flow_imp.g_varchar2_table(183) := '63616C53746F72616765203D20617065782E73746F726167652E67657453636F7065644C6F63616C53746F72616765287B7072656669783A204C4F43414C5F53544F524147455F5052454649582C2075736541707049643A20747275652C207573655061';
wwv_flow_imp.g_varchar2_table(184) := '676549643A20747275657D293B0D0A2020202020202020202020202020202020202020202020202020202020202020696620286C6F63616C53746F72616765290D0A20202020202020202020202020202020202020202020202020202020202020207B0D';
wwv_flow_imp.g_varchar2_table(185) := '0A2020202020202020202020202020202020202020202020202020202020202020202020206C6F63616C53746F726167652E7365744974656D2870745374617469634964202B20272E707269766174655265706F727473272C204A534F4E2E737472696E';
wwv_flow_imp.g_varchar2_table(186) := '67696679286F7074696F6E732E707269766174655265706F72747329293B200D0A2020202020202020202020202020202020202020202020202020202020202020202020206C6F63616C53746F726167652E7365744974656D2870745374617469634964';
wwv_flow_imp.g_varchar2_table(187) := '202B20272E63757272656E745265706F7274272C206366675265706F72742E6F7074696F6E732E677269642E7469746C65293B20200D0A202020202020202020202020202020202020202020202020202020202020202020202020617065782E6D657373';
wwv_flow_imp.g_varchar2_table(188) := '6167652E73686F775061676553756363657373286765744D65737361676528275245504F52545F44454C455445442729293B20200D0A20202020202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(189) := '20202020202020202020202020202020207D2020202020202020202020202020202020202020202020202020202020202020202020200D0A2020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(190) := '2020207D0D0A20202020202020202020202020202020202020206C65742070745265706F7274203D2070745769646765742E6765745265706F727428293B0D0A20202020202020202020202020202020202020206C65742070745265706F72745469746C';
wwv_flow_imp.g_varchar2_table(191) := '65203D2070745265706F72742E6F7074696F6E732E677269642E7469746C653B0D0A20202020202020202020202020202020202020206C6574206366675265706F7274203D206765745265706F7274466F724E616D652870745265706F72745469746C65';
wwv_flow_imp.g_varchar2_table(192) := '293B0D0A2020202020202020202020202020202020202020696620286366675265706F7274202626206366675265706F72742E6C696234782E74797065203D3D3D20277072697661746527290D0A20202020202020202020202020202020202020207B0D';
wwv_flow_imp.g_varchar2_table(193) := '0A2020202020202020202020202020202020202020202020202F2F202752656D6F76652070726976617465207265706F7274205C2725305C273F270D0A2020202020202020202020202020202020202020202020202F2F20757365206C616E672E666F72';
wwv_flow_imp.g_varchar2_table(194) := '6D61744E6F457363617065206173206D6573736167652E636F6E6669726D2077696C6C206573636170650D0A202020202020202020202020202020202020202020202020617065782E6D6573736167652E636F6E6669726D28617065782E6C616E672E66';
wwv_flow_imp.g_varchar2_table(195) := '6F726D61744E6F457363617065286765744D6573736167652827515F52454D4F56455F505249564154455F5245504F525427292C2070745265706F72745469746C65292C2066756E6374696F6E286F6B5072657373656429207B0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(196) := '2020202020202020202020202020202020202020696620286F6B5072657373656429207B0D0A202020202020202020202020202020202020202020202020202020202020202064656C6574655265706F72742870745265706F72745469746C65293B0D0A';
wwv_flow_imp.g_varchar2_table(197) := '202020202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020207D293B0D0A20202020202020202020202020202020202020207D20202020202020202020202020202020200D0A';
wwv_flow_imp.g_varchar2_table(198) := '202020202020202020202020202020207D0D0A202020202020202020202020202020202F2F2069662074686520726567696F6E2074656D706C61746520697320746865207374642074656D706C61746520616E6420636F6E666967757265642077697468';
wwv_flow_imp.g_varchar2_table(199) := '2068696464656E2068656164657220627574202753686F77204D6178696D697A6520427574746F6E2720636865636B65642C207468656E0D0A202020202020202020202020202020202F2F20776520696E636C7564652061206D6178696D697A65206275';
wwv_flow_imp.g_varchar2_table(200) := '74746F6E20696E207468652057445220746F6F6C6261720D0A202020202020202020202020202020202F2F2074686520415045582067656E6572617465642048544D4C2077696C6C206861766520746865206D617820627574746F6E20696E636C756465';
wwv_flow_imp.g_varchar2_table(201) := '6420696E207468652068696464656E206865616465720D0A202020202020202020202020202020202F2F20736F207765206A75737420757365202428627574746F6E292E636C69636B282920617320746F20726575736520746865204150455820555420';
wwv_flow_imp.g_varchar2_table(202) := '6D6178696D697A6520666561747572650D0A202020202020202020202020202020206C657420696E636C4D6178427574746F6E203D2066616C73653B0D0A202020202020202020202020202020206C6574206D6178427574746F6E24203D202428272327';
wwv_flow_imp.g_varchar2_table(203) := '202B2070745374617469634964292E66696E6428272E6A732D6D6178696D697A65427574746F6E436F6E7461696E657220627574746F6E27293B0D0A20202020202020202020202020202020696620286D6178427574746F6E242E6C656E677468203E20';
wwv_flow_imp.g_varchar2_table(204) := '30290D0A202020202020202020202020202020207B0D0A20202020202020202020202020202020202020202F2F20696E636C756465207768656E206865616465722069732068696464656E206F72206865616465722069732068696464656E2062757420';
wwv_flow_imp.g_varchar2_table(205) := '61636365737369626C650D0A20202020202020202020202020202020202020202F2F20696E2063617365206F66202768696464656E206275742061636365737369626C65272C2074686520726567696F6E20696E2066616374206973206E6F7420726561';
wwv_flow_imp.g_varchar2_table(206) := '6C6C792068696464656E20627574206162736F6C75746520706F736974696F6E65642077697468206865696768742F7769647468206F66203170780D0A2020202020202020202020202020202020202020696620286D6178427574746F6E242E636C6F73';
wwv_flow_imp.g_varchar2_table(207) := '65737428272E742D526567696F6E2D68656164657227292E697328273A68696464656E2729207C7C206D6178427574746F6E242E636C6F7365737428272E742D526567696F6E2D68656164657227292E6373732827706F736974696F6E2729203D3D3D20';
wwv_flow_imp.g_varchar2_table(208) := '276162736F6C75746527290D0A20202020202020202020202020202020202020207B0D0A202020202020202020202020202020202020202020202020696E636C4D6178427574746F6E203D20747275653B0D0A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(209) := '2020207D0D0A202020202020202020202020202020207D202020202020202020202020202020200D0A202020202020202020202020202020207074242E64617461282777656264617461726F636B73746F6F6C626172272C20746F6F6C626172293B0D0A';
wwv_flow_imp.g_varchar2_table(210) := '202020202020202020202020202020206C65742074616273203D20746F6F6C6261722E6765745461627328293B200D0A202020202020202020202020202020202F2F2067657420726964206F66204E4120746F6F6C626172206974656D73202020202020';
wwv_flow_imp.g_varchar2_table(211) := '0D0A2020202020202020202020202020202074616273203D20746162732E66696C74657228746162203D3E20287461622E6964203D3D3D20227764722D7461622D666F726D617422207C7C207461622E6964203D3D3D20227764722D7461622D6F707469';
wwv_flow_imp.g_varchar2_table(212) := '6F6E7322207C7C207461622E6964203D3D3D20227764722D7461622D6669656C647322207C7C207461622E6964203D3D3D20227764722D7461622D6578706F727422207C7C2028696E636C4D6178427574746F6E202626207461622E6964203D3D3D2022';
wwv_flow_imp.g_varchar2_table(213) := '7764722D7461622D66756C6C73637265656E222929293B200D0A202020202020202020202020202020202F2F20616464206F776E20627574746F6E730D0A20202020202020202020202020202020746162732E756E7368696674287B0D0A202020202020';
wwv_flow_imp.g_varchar2_table(214) := '202020202020202020202020202069643A20226C696234782D7461622D736176657265706F7274222C0D0A20202020202020202020202020202020202020207469746C653A206765744D6573736167652827544F4F4C4241522E5341564527292C0D0A20';
wwv_flow_imp.g_varchar2_table(215) := '2020202020202020202020202020202020202068616E646C65723A20736176655265706F7274436F6E6669672C0D0A202020202020202020202020202020202020202069636F6E3A20746F6F6C6261722E69636F6E732E736176650D0A20202020202020';
wwv_flow_imp.g_varchar2_table(216) := '2020202020202020207D2C7B0D0A202020202020202020202020202020202020202069643A20226C696234782D7461622D6C6F61647265706F7274222C0D0A20202020202020202020202020202020202020207469746C653A206765744D657373616765';
wwv_flow_imp.g_varchar2_table(217) := '2827544F4F4C4241522E4C4F414427292C0D0A202020202020202020202020202020202020202068616E646C65723A206C6F61645265706F7274436F6E6669672C0D0A202020202020202020202020202020202020202069636F6E3A20746F6F6C626172';
wwv_flow_imp.g_varchar2_table(218) := '2E69636F6E732E6F70656E5F6C6F63616C0D0A202020202020202020202020202020207D2C0D0A202020202020202020202020202020207B0D0A202020202020202020202020202020202020202069643A20226C696234782D7461622D64656C65746572';
wwv_flow_imp.g_varchar2_table(219) := '65706F7274222C0D0A20202020202020202020202020202020202020207469746C653A206765744D6573736167652827544F4F4C4241522E44454C45544527292C0D0A202020202020202020202020202020202020202068616E646C65723A2064656C65';
wwv_flow_imp.g_varchar2_table(220) := '74655265706F7274436F6E6669672C0D0A202020202020202020202020202020202020202069636F6E3A20273C6920636C6173733D2266612066612D74726173682D6F22207374796C653D22666F6E742D73697A653A313970783B223E3C2F693E270D0A';
wwv_flow_imp.g_varchar2_table(221) := '202020202020202020202020202020207D293B0D0A2020202020202020202020202020202069662028696E636C4D6178427574746F6E290D0A202020202020202020202020202020207B0D0A20202020202020202020202020202020202020206C657420';
wwv_flow_imp.g_varchar2_table(222) := '6D6178546162203D20746162732E66696E6428746162203D3E207461622E6964203D3D3D20277764722D7461622D66756C6C73637265656E27293B0D0A20202020202020202020202020202020202020206D61785461622E6964203D20276C696234782D';
wwv_flow_imp.g_varchar2_table(223) := '7461622D66756C6C73637265656E273B0D0A20202020202020202020202020202020202020206D61785461622E7469746C65203D206765744D6573736167652827544F4F4C4241522E4D4158494D495A4527292C0D0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(224) := '2020202020202F2F20696E7374656164206F6620574452206E61746976652066756C6C2073637265656E206C6F6769632C206D6178696D697A652074686520726567696F6E0D0A20202020202020202020202020202020202020206D61785461622E6861';
wwv_flow_imp.g_varchar2_table(225) := '6E646C6572203D2066756E6374696F6E28297B0D0A2020202020202020202020202020202020202020202020206D6178427574746F6E242E636C69636B28293B0D0A20202020202020202020202020202020202020202020202073657454696D656F7574';
wwv_flow_imp.g_varchar2_table(226) := '2828293D3E7B0D0A202020202020202020202020202020202020202020202020202020207074242E64617461282777656264617461726F636B7327292E7265667265736828293B0D0A2020202020202020202020202020202020202020202020207D2C20';
wwv_flow_imp.g_varchar2_table(227) := '353030293B0D0A20202020202020202020202020202020202020207D0D0A202020202020202020202020202020207D0D0A202020202020202020202020202020202F2F746162732E666F724561636828287461622C696E646578293D3E7B0D0A20202020';
wwv_flow_imp.g_varchar2_table(228) := '202020202020202020202020202020202F2F7461622E726967687447726F7570203D2066616C73653B0D0A202020202020202020202020202020202F2F7D29202020202020202020202020202020202020202020200D0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(229) := '2020202F2F746F6F6C6261722E69636F6E732E666F726D6174203D20273C696D67207372633D2268747470733A2F2F7777772E666C65786D6F6E737465722E636F6D2F626173652F6173736574732F696D672F7376672F6C6F676F2D7369676E2E737667';
wwv_flow_imp.g_varchar2_table(230) := '3F7632222F3E273B0D0A20202020202020202020202020202020746F6F6C6261722E67657454616273203D2066756E6374696F6E2829207B0D0A202020202020202020202020202020202020202072657475726E20746162733B0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(231) := '20202020202020207D0D0A202020202020202020202020202020202F2F2074726967676572206C696234785F7764725F6265666F7265746F6F6C6261726372656174656420736F20746865206170706C69636174696F6E20646576656C6F706572206361';
wwv_flow_imp.g_varchar2_table(232) := '6E206D616B6520616E79206675727468657220746F6F6C6261722061646A7573746D656E74730D0A202020202020202020202020202020206C6574206576656E7444617461203D207B746F6F6C6261723A20746F6F6C6261727D3B0D0A20202020202020';
wwv_flow_imp.g_varchar2_table(233) := '202020202020202020617065782E6576656E742E74726967676572287074242C20276C696234786265666F7265746F6F6C62617263726561746564272C206576656E7444617461293B0D0A202020202020202020202020202020202F2F20726564756365';
wwv_flow_imp.g_varchar2_table(234) := '2073697A65206F6620616C6C2069636F6E730D0A20202020202020202020202020202020746162732E666F724561636828287461622C20696E646578293D3E7B0D0A20202020202020202020202020202020202020207461622E69636F6E203D20746162';
wwv_flow_imp.g_varchar2_table(235) := '2E69636F6E2E7265706C616365282777696474683D22333622272C202777696474683D2232302227293B0D0A20202020202020202020202020202020202020207461622E69636F6E203D207461622E69636F6E2E7265706C61636528276865696768743D';
wwv_flow_imp.g_varchar2_table(236) := '22333622272C20276865696768743D2232302227293B0D0A202020202020202020202020202020207D293B0D0A2020202020202020202020207D0D0A0D0A2020202020202020202020202F2F206F6E2063656C6C2073696E676C6520636C69636B2C2066';
wwv_flow_imp.g_varchar2_table(237) := '697265206C6962347863656C6C636C69636B206576656E740D0A2020202020202020202020202F2F2063656C6C20636C69636B2077696C6C2062652074726967676572656420696E2063617365206F662063656C6C20636C69636B2062757420616C736F';
wwv_flow_imp.g_varchar2_table(238) := '20696E2063617365206F662073656C656374696E67206D756C7469706C652063656C6C7320616E64207468656E2072656C656173696E6720746865206D6F75736520627574746F6E0D0A20202020202020202020202066756E6374696F6E206F6E43656C';
wwv_flow_imp.g_varchar2_table(239) := '6C436C69636B2863656C6C290D0A2020202020202020202020207B0D0A202020202020202020202020202020206C6574207074576964676574203D207074242E64617461282777656264617461726F636B7327293B0D0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(240) := '2020206C65742070745265706F7274203D2070745769646765742E6765745265706F727428293B202020200D0A202020202020202020202020202020206C65742066696C74657273203D2067657446696C746572732870745265706F72742C2063656C6C';
wwv_flow_imp.g_varchar2_table(241) := '293B0D0A2020202020202020202020202020202073657446696C74657273506167654974656D2866696C74657273293B0D0A202020202020202020202020202020202F2F2063656C6C3A2074686520636C69636B65642063656C6C206F7220696E206361';
wwv_flow_imp.g_varchar2_table(242) := '7365206F66206D756C7469706C652063656C6C2073656C656374696F6E20746865206C6173742063656C6C0D0A202020202020202020202020202020202F2F2073656C656374656443656C6C733A2070745769646765742E67657453656C656374656443';
wwv_flow_imp.g_varchar2_table(243) := '656C6C28292077696C6C206769766520616C6C2073656C65637465642063656C6C732020202020202020202020202020202020200D0A202020202020202020202020202020206C6574206576656E7444617461203D207B63656C6C3A2063656C6C2C2073';
wwv_flow_imp.g_varchar2_table(244) := '656C656374656443656C6C733A2070745769646765742E67657453656C656374656443656C6C28292C2066696C746572733A2066696C746572732C207574696C3A206765744576656E745574696C2863656C6C297D3B0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(245) := '20202020617065782E6576656E742E74726967676572282428272327202B20707453746174696349645074292C20276C6962347863656C6C636C69636B272C206576656E7444617461293B0D0A2020202020202020202020207D0D0A0D0A202020202020';
wwv_flow_imp.g_varchar2_table(246) := '2020202020202F2F206F6E2063656C6C20646F75626C6520636C69636B2C2066697265206C6962347863656C6C64626C636C69636B206576656E740D0A2020202020202020202020202F2F20696620616E20496E6C696E65204469616C6F6720666F7220';
wwv_flow_imp.g_varchar2_table(247) := '4472696C6C2D5468726F75676820697320636F6E666967757265642C207468652049522069732072656672657368656420616E6420746865206469616C6F67206F70656E656E640D0A20202020202020202020202066756E6374696F6E206F6E43656C6C';
wwv_flow_imp.g_varchar2_table(248) := '446F75626C65436C69636B2863656C6C290D0A2020202020202020202020207B0D0A202020202020202020202020202020206966202863656C6C2E6D6561737572652026262063656C6C2E74797065203D3D3D202776616C75652720262620214E756D62';
wwv_flow_imp.g_varchar2_table(249) := '65722E69734E614E2863656C6C2E76616C756529290D0A202020202020202020202020202020207B20202020202020202020202020202020202020202020202020202020202020202020200D0A20202020202020202020202020202020202020202F2F20';
wwv_flow_imp.g_varchar2_table(250) := '636F6D706F73652064657461696C206865616465722068746D6C0D0A20202020202020202020202020202020202020206C6574206472696C6C5468726F75676848656164696E67203D206765744472696C6C5468726F75676848656164696E672863656C';
wwv_flow_imp.g_varchar2_table(251) := '6C293B0D0A20202020202020202020202020202020202020206C6574207074576964676574203D207074242E64617461282777656264617461726F636B7327293B0D0A20202020202020202020202020202020202020206C65742070745265706F727420';
wwv_flow_imp.g_varchar2_table(252) := '3D2070745769646765742E6765745265706F727428293B0D0A20202020202020202020202020202020202020206C65742066696C74657273203D2067657446696C746572732870745265706F72742C2063656C6C293B0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(253) := '202020202020202073657446696C74657273506167654974656D2866696C7465727329202020202020202020202020202020202020202020202020202020202020202020202020200D0A20202020202020202020202020202020202020206C6574206576';
wwv_flow_imp.g_varchar2_table(254) := '656E7444617461203D207B63656C6C3A2063656C6C2C2066696C746572733A2066696C746572732C207574696C3A206765744576656E745574696C2863656C6C297D3B0D0A2020202020202020202020202020202020202020617065782E6576656E742E';
wwv_flow_imp.g_varchar2_table(255) := '74726967676572282428272327202B20707453746174696349645074292C20276C6962347863656C6C64626C636C69636B272C206576656E7444617461293B0D0A20202020202020202020202020202020202020202F2F20737461727420616E7920636F';
wwv_flow_imp.g_varchar2_table(256) := '6E66696775726564206469616C6F670D0A20202020202020202020202020202020202020202F2F20666F7220666C6174207265706F72742C20574452206973206E6F7420676976696E6720616C6C20636F6C756D6E732C20736F2077652063616E277420';
wwv_flow_imp.g_varchar2_table(257) := '737570706F72740D0A20202020202020202020202020202020202020206966202864744469616C6F675374617469634964202626206765745265706F727454797065282920213D2027666C617427290D0A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(258) := '207B0D0A2020202020202020202020202020202020202020202020202F2F20706F70756C61746520616E792073746174696320636F6E74656E7420726567696F6E20776974682070742D64742D68656164657220636C6173732077697468206472696C6C';
wwv_flow_imp.g_varchar2_table(259) := '5468726F75676848656164696E670D0A2020202020202020202020202020202020202020202020202428272327202B2064744469616C6F675374617469634964202B2027202E70742D64742D68656164657227292E68746D6C286472696C6C5468726F75';
wwv_flow_imp.g_varchar2_table(260) := '676848656164696E67293B0D0A2020202020202020202020202020202020202020202020202F2F2064657465637420726567696F6E20776974682070742D64742D7265706F727420636C6173730D0A202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(261) := '2020206C6574206972446F6D4964203D202428272327202B2064744469616C6F675374617469634964202B2027202E70742D64742D7265706F727427292E617474722827696427293B0D0A20202020202020202020202020202020202020202020202069';
wwv_flow_imp.g_varchar2_table(262) := '6620286972446F6D4964290D0A2020202020202020202020202020202020202020202020207B0D0A20202020202020202020202020202020202020202020202020202020617065782E726567696F6E286972446F6D4964292E7265667265736828293B0D';
wwv_flow_imp.g_varchar2_table(263) := '0A20202020202020202020202020202020202020202020202020202020617065782E7468656D652E6F70656E526567696F6E2864744469616C6F675374617469634964293B0D0A2020202020202020202020202020202020202020202020207D0D0A2020';
wwv_flow_imp.g_varchar2_table(264) := '2020202020202020202020202020202020207D0D0A202020202020202020202020202020207D0D0A2020202020202020202020207D200D0A0D0A2020202020202020202020202F2F207574696C2066756E6374696F6E7320666F7220636C69636B206576';
wwv_flow_imp.g_varchar2_table(265) := '656E742068616E646C6572730D0A20202020202020202020202066756E6374696F6E206765744576656E745574696C2863656C6C290D0A2020202020202020202020207B0D0A202020202020202020202020202020206C6574207574696C203D207B7D3B';
wwv_flow_imp.g_varchar2_table(266) := '0D0A202020202020202020202020202020207574696C2E676574436861727448656164696E67203D2066756E6374696F6E286578636C75646529207B0D0A202020202020202020202020202020202020202072657475726E206765744368617274486561';
wwv_flow_imp.g_varchar2_table(267) := '64696E672863656C6C2C206578636C756465293B0D0A202020202020202020202020202020207D0D0A202020202020202020202020202020207574696C2E6765744472696C6C5468726F75676848656164696E67203D2066756E6374696F6E2829207B0D';
wwv_flow_imp.g_varchar2_table(268) := '0A202020202020202020202020202020202020202072657475726E206765744472696C6C5468726F75676848656164696E672863656C6C293B0D0A202020202020202020202020202020207D0D0A202020202020202020202020202020207574696C2E67';
wwv_flow_imp.g_varchar2_table(269) := '65745472756E6344617465203D2066756E6374696F6E2864696D656E73696F6E2C20756E6974290D0A202020202020202020202020202020207B0D0A202020202020202020202020202020202020202072657475726E206765745472756E634461746528';
wwv_flow_imp.g_varchar2_table(270) := '63656C6C2C2064696D656E73696F6E2C20756E6974293B0D0A202020202020202020202020202020207D20200D0A2020202020202020202020202020202072657475726E207574696C3B20202020202020202020202020200D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(271) := '20207D0D0A0D0A20202020202020202020202066756E6374696F6E2073657446696C74657273506167654974656D2866696C74657273290D0A2020202020202020202020207B0D0A202020202020202020202020202020206966202866696C7465727350';
wwv_flow_imp.g_varchar2_table(272) := '6167654974656D290D0A202020202020202020202020202020207B0D0A2020202020202020202020202020202020202020617065782E6974656D2866696C74657273506167654974656D292E73657456616C7565284A534F4E2E737472696E6769667928';
wwv_flow_imp.g_varchar2_table(273) := '7B66696C746572733A2066696C746572737D29293B2020200D0A202020202020202020202020202020207D0D0A2020202020202020202020207D0D0A0D0A20202020202020202020202066756E6374696F6E20666F726D617444696D656E73696F6E4361';
wwv_flow_imp.g_varchar2_table(274) := '7074696F6E28756E697175654E616D6529207B0D0A20202020202020202020202020202020636F6E7374207061727473203D20756E697175654E616D652E73706C697428272E27293B0D0A2020202020202020202020202020202072657475726E207061';
wwv_flow_imp.g_varchar2_table(275) := '7274732E6C656E677468203E20310D0A20202020202020202020202020202020202020203F2070617274732E736C6963652831292E6A6F696E2827202D2027290D0A20202020202020202020202020202020202020203A20756E697175654E616D653B0D';
wwv_flow_imp.g_varchar2_table(276) := '0A2020202020202020202020207D0D0A0D0A2020202020202020202020202F2F206120707265646566696E65642068656164696E67202868746D6C2920666F72204472696C6C2D5468726F756768204952206173207065722063757272656E742073656C';
wwv_flow_imp.g_varchar2_table(277) := '65637465642063656C6C0D0A20202020202020202020202066756E6374696F6E206765744472696C6C5468726F75676848656164696E672863656C6C290D0A2020202020202020202020207B0D0A202020202020202020202020202020206C6574207265';
wwv_flow_imp.g_varchar2_table(278) := '706F72744E616D65203D206765745265706F72744E616D6528293B0D0A202020202020202020202020202020206C657420726F774C6162656C203D2063656C6C2E726F77732E6D617028726F77203D3E20666F726D617444696D656E73696F6E43617074';
wwv_flow_imp.g_varchar2_table(279) := '696F6E28726F772E756E697175654E616D6529292E6A6F696E2827202D202729207C7C2027202D20273B0D0A202020202020202020202020202020206C657420636F6C756D6E4C6162656C203D2063656C6C2E636F6C756D6E732E6D617028636F6C756D';
wwv_flow_imp.g_varchar2_table(280) := '6E203D3E20666F726D617444696D656E73696F6E43617074696F6E28636F6C756D6E2E756E697175654E616D6529292E6A6F696E2827202D202729207C7C2027202D20273B0D0A202020202020202020202020202020206C6574206D6561737572654C61';
wwv_flow_imp.g_varchar2_table(281) := '62656C203D2063656C6C2E6C6162656C207C7C2027202D20273B0D0A20202020202020202020202020202020636F6E7374206F7574203D20617065782E7574696C2E68746D6C4275696C64657228293B0D0A202020202020202020202020202020206F75';
wwv_flow_imp.g_varchar2_table(282) := '742E6D61726B757028273C64697627290D0A20202020202020202020202020202020202020202E617474722827636C617373272C202764742D64657461696C732D636F6E7461696E657227290D0A20202020202020202020202020202020202020202E6D';
wwv_flow_imp.g_varchar2_table(283) := '61726B757028273E3C7370616E27290D0A20202020202020202020202020202020202020202E617474722827636C617373272C202764742D64657461696C732D6C6162656C27290D0A20202020202020202020202020202020202020202E6D61726B7570';
wwv_flow_imp.g_varchar2_table(284) := '28273E3C623E27290D0A20202020202020202020202020202020202020202E636F6E74656E7428275069766F74205265706F72743A2027290D0A20202020202020202020202020202020202020202E6D61726B757028273C2F623E27290D0A2020202020';
wwv_flow_imp.g_varchar2_table(285) := '2020202020202020202020202020202E636F6E74656E74287265706F72744E616D65290D0A20202020202020202020202020202020202020202E6D61726B757028273C2F7370616E3E3C7370616E27290D0A202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(286) := '20202E617474722827636C617373272C202764742D64657461696C732D6C6162656C27290D0A20202020202020202020202020202020202020202E6D61726B757028273E3C623E27292020202020202020202020202020202020202020202020200D0A20';
wwv_flow_imp.g_varchar2_table(287) := '202020202020202020202020202020202020202E636F6E74656E742827526F773A2027290D0A20202020202020202020202020202020202020202E6D61726B757028273C2F623E27290D0A20202020202020202020202020202020202020202E636F6E74';
wwv_flow_imp.g_varchar2_table(288) := '656E7428726F774C6162656C290D0A20202020202020202020202020202020202020202E6D61726B757028273C2F7370616E3E3C7370616E27290D0A20202020202020202020202020202020202020202E617474722827636C617373272C202764742D64';
wwv_flow_imp.g_varchar2_table(289) := '657461696C732D6C6162656C27290D0A20202020202020202020202020202020202020202E6D61726B757028273E3C623E27290D0A20202020202020202020202020202020202020202E636F6E74656E742827436F6C756D6E3A2027290D0A2020202020';
wwv_flow_imp.g_varchar2_table(290) := '2020202020202020202020202020202E6D61726B757028273C2F623E27290D0A20202020202020202020202020202020202020202E636F6E74656E7428636F6C756D6E4C6162656C290D0A20202020202020202020202020202020202020202E6D61726B';
wwv_flow_imp.g_varchar2_table(291) := '757028273C2F7370616E3E3C7370616E27290D0A20202020202020202020202020202020202020202E617474722827636C617373272C202764742D64657461696C732D6C6162656C27290D0A20202020202020202020202020202020202020202E6D6172';
wwv_flow_imp.g_varchar2_table(292) := '6B757028273E3C623E27290D0A20202020202020202020202020202020202020202E636F6E74656E742863656C6C2E6D6561737572652E63617074696F6E202B20273A2027290D0A20202020202020202020202020202020202020202E6D61726B757028';
wwv_flow_imp.g_varchar2_table(293) := '273C2F623E27290D0A20202020202020202020202020202020202020202E636F6E74656E74286D6561737572654C6162656C290D0A20202020202020202020202020202020202020202E6D61726B757028273C2F7370616E3E3C2F6469763E27293B2020';
wwv_flow_imp.g_varchar2_table(294) := '200D0A2020202020202020202020202020202072657475726E206F75742E746F537472696E6728293B2020202020200D0A2020202020202020202020207D0D0A0D0A2020202020202020202020202F2F206120746578742068656164696E6720666F7220';
wwv_flow_imp.g_varchar2_table(295) := '616E7920696E7465677261746564206368617274206173207065722063757272656E742073656C65637465642063656C6C0D0A2020202020202020202020202F2F206578636C7564653A206120737472696E67206F7220616E206172726179206F662072';
wwv_flow_imp.g_varchar2_table(296) := '6F772F636F6C756D6E20656E747269657320746F206578636C7564652066726F6D20636F6E7369646572696E670D0A2020202020202020202020202F2F2065673A20746865205054206D69676874206861766520612063656C6C2073656C656374656420';
wwv_flow_imp.g_varchar2_table(297) := '666F72206120706172746963756C6172206D6F6E74682062757420696E20746865204368617274207468652077686F6C6520796561722069732073686F776E0D0A2020202020202020202020202F2F207768656E20746865206669656C64206E616D6520';
wwv_flow_imp.g_varchar2_table(298) := '69732027504552494F44272C207468656E2027504552494F442E4D6F6E74682720726F77206F7220636F6C756D6E2063616E206265206578636C75646564206865726520696E2074686973206578616D706C650D0A20202020202020202020202066756E';
wwv_flow_imp.g_varchar2_table(299) := '6374696F6E20676574436861727448656164696E672863656C6C2C206578636C756465290D0A2020202020202020202020207B0D0A202020202020202020202020202020206578636C756465203D206578636C756465203F3F205B5D3B0D0A2020202020';
wwv_flow_imp.g_varchar2_table(300) := '2020202020202020202020696620282141727261792E69734172726179286578636C75646529290D0A202020202020202020202020202020207B0D0A20202020202020202020202020202020202020206578636C756465203D205B6578636C7564655D3B';
wwv_flow_imp.g_varchar2_table(301) := '0D0A202020202020202020202020202020207D0D0A202020202020202020202020202020206C657420726573756C74203D2063656C6C2E726F77732E636F6E6361742863656C6C2E636F6C756D6E73292E66696C7465722864696D656E73696F6E203D3E';
wwv_flow_imp.g_varchar2_table(302) := '20216578636C7564652E696E636C756465732864696D656E73696F6E2E686965726172636879556E697175654E616D6529292E6D61702864696D656E73696F6E203D3E2064696D656E73696F6E2E63617074696F6E292E6A6F696E2827202D2027293B20';
wwv_flow_imp.g_varchar2_table(303) := '20200D0A2020202020202020202020202020202072657475726E20726573756C743B202020202020200D0A2020202020202020202020207D0D0A2020202020202020202020200D0A2020202020202020202020202F2F2072657475726E7320612046696C';
wwv_flow_imp.g_varchar2_table(304) := '74657273204A534F4E20617320706572207468652063757272656E743A0D0A2020202020202020202020202F2F202D2073656C65637465642063656C6C20696E20746865207069766F74207461626C650D0A2020202020202020202020202F2F202D2070';
wwv_flow_imp.g_varchar2_table(305) := '74207265706F72742066696C746572730D0A2020202020202020202020202F2F202D20707420726F772F636F6C756D6E2066696C746572730D0A20202020202020202020202066756E6374696F6E2067657446696C746572732870745265706F72742C20';
wwv_flow_imp.g_varchar2_table(306) := '63656C6C290D0A2020202020202020202020207B0D0A202020202020202020202020202020206C65742066696C74657273203D205B5D3B0D0A2020202020202020202020202020202063656C6C2E636F6C756D6E732E636F6E6361742863656C6C2E726F';
wwv_flow_imp.g_varchar2_table(307) := '7773292E666F72456163682864696D656E73696F6E203D3E207B0D0A20202020202020202020202020202020202020206966202864696D656E73696F6E290D0A20202020202020202020202020202020202020207B0D0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(308) := '202020202020202020202066696C746572732E70757368287B0D0A202020202020202020202020202020202020202020202020202020206E616D653A2064696D656E73696F6E2E686965726172636879556E697175654E616D652C0D0A20202020202020';
wwv_flow_imp.g_varchar2_table(309) := '202020202020202020202020202020202020202020747970653A202763656C6C272C0D0A202020202020202020202020202020202020202020202020202020206D656D626572733A205B0D0A202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(310) := '202020202020202064696D656E73696F6E2E756E697175654E616D650D0A202020202020202020202020202020202020202020202020202020205D2C0D0A202020202020202020202020202020202020202020202020202020206E65676174696F6E3A20';
wwv_flow_imp.g_varchar2_table(311) := '66616C73650D0A2020202020202020202020202020202020202020202020207D290D0A20202020202020202020202020202020202020207D0D0A202020202020202020202020202020207D293B0D0A202020202020202020202020202020207074526570';
wwv_flow_imp.g_varchar2_table(312) := '6F72742E736C6963652E7265706F727446696C746572733F2E666F7245616368287265706F727446696C746572203D3E207B0D0A2020202020202020202020202020202020202020696620287265706F727446696C7465722E66696C7465723F2E6D656D';
wwv_flow_imp.g_varchar2_table(313) := '62657273290D0A20202020202020202020202020202020202020207B0D0A20202020202020202020202020202020202020202020202066696C746572732E70757368287B0D0A202020202020202020202020202020202020202020202020202020206E61';
wwv_flow_imp.g_varchar2_table(314) := '6D653A207265706F727446696C7465722E756E697175654E616D652C0D0A20202020202020202020202020202020202020202020202020202020747970653A20277265706F7274272C0D0A20202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(315) := '2020206D656D626572733A207265706F727446696C7465722E66696C7465722E6D656D626572732C0D0A202020202020202020202020202020202020202020202020202020206E65676174696F6E3A20426F6F6C65616E287265706F727446696C746572';
wwv_flow_imp.g_varchar2_table(316) := '2E66696C7465722E6E65676174696F6E290D0A2020202020202020202020202020202020202020202020207D293B0D0A20202020202020202020202020202020202020207D0D0A202020202020202020202020202020207D293B0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(317) := '202020202020202070745265706F72742E736C6963652E636F6C756D6E732E636F6E6361742870745265706F72742E736C6963652E726F7773292E666F72456163682864696D656E73696F6E203D3E207B0D0A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(318) := '2020206966202864696D656E73696F6E3F2E66696C746572290D0A20202020202020202020202020202020202020207B0D0A20202020202020202020202020202020202020202020202066696C746572732E70757368287B0D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(319) := '2020202020202020202020202020202020206E616D653A2064696D656E73696F6E2E756E697175654E616D652C0D0A20202020202020202020202020202020202020202020202020202020747970653A202764696D656E73696F6E272C0D0A2020202020';
wwv_flow_imp.g_varchar2_table(320) := '20202020202020202020202020202020202020202020206D656D626572733A2064696D656E73696F6E2E66696C7465722E6D656D626572732C0D0A202020202020202020202020202020202020202020202020202020206E65676174696F6E3A20426F6F';
wwv_flow_imp.g_varchar2_table(321) := '6C65616E2864696D656E73696F6E2E66696C7465722E6E65676174696F6E290D0A2020202020202020202020202020202020202020202020207D293B0D0A20202020202020202020202020202020202020207D0D0A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(322) := '207D293B0D0A202020202020202020202020202020202F2F20696E2063617365206F66206F7074696F6E732E6E6F726D616C697A6546696C746572732C207265706C616365206D6F6E74682F71756172746572206E616D6573206279206D6F6E74682F71';
wwv_flow_imp.g_varchar2_table(323) := '756172746572206E756D626572730D0A20202020202020202020202020202020696620286F7074696F6E732E6E6F726D616C697A6546696C74657273290D0A202020202020202020202020202020207B0D0A202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(324) := '20206C657420646174655061747465726E203D206F7074696F6E732E77656264617461726F636B732E676C6F62616C2E6F7074696F6E732E646174655061747465726E3B0D0A20202020202020202020202020202020202020202F2F207265706C616365';
wwv_flow_imp.g_varchar2_table(325) := '206D6F6E7468206E616D65733B2070726566697820646179206E756D62657273203C2031303B207573652049534F2064617465733B20757365207175617274657220312D342020202020202020200D0A2020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(326) := '66696C746572732E666F72456163682866696C746572203D3E207B0D0A2020202020202020202020202020202020202020202020206C65742074797065203D206765744669656C64547970652866696C7465722E6E616D65293B0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(327) := '202020202020202020202020202020206C6574207472616E73666F726D203D2066696C7465722E6E616D652E656E64735769746828272E4D6F6E74682729203F2076616C7565203D3E206D6F6E74684D61705B76616C75652E746F4C6F77657243617365';
wwv_flow_imp.g_varchar2_table(328) := '28295D203F3F2076616C75650D0A20202020202020202020202020202020202020202020202020202020202020203A2066696C7465722E6E616D652E656E64735769746828272E4461792729203F2076616C7565203D3E2076616C75652E706164537461';
wwv_flow_imp.g_varchar2_table(329) := '727428322C2027302729200D0A20202020202020202020202020202020202020202020202020202020202020203A2074797065203D3D20276461746520737472696E6727203F2076616C7565203D3E207574696C2E646174652E776472546F49534F4461';
wwv_flow_imp.g_varchar2_table(330) := '74652876616C75652C20646174655061747465726E290D0A20202020202020202020202020202020202020202020202020202020202020203A202874797065203D3D2027796561722F6D6F6E74682F64617927207C7C2074797065203D3D202779656172';
wwv_flow_imp.g_varchar2_table(331) := '2F717561727465722F6D6F6E74682F6461792729203F2076616C7565203D3E207574696C2E646174652E6E6F726D616C697A654D756C74694C6576656C446174652876616C75652C2074797065290D0A2020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(332) := '2020202020202020202020203A206E756C6C3B0D0A20202020202020202020202020202020202020202020202069662028217472616E73666F726D292072657475726E3B0D0A20202020202020202020202020202020202020202020202066696C746572';
wwv_flow_imp.g_varchar2_table(333) := '2E6D656D62657273203D2066696C7465722E6D656D626572732E6D6170286D656D626572203D3E0D0A202020202020202020202020202020202020202020202020202020206D656D6265722E7265706C616365282F5B5E2E5D2B242F2C207472616E7366';
wwv_flow_imp.g_varchar2_table(334) := '6F726D290D0A202020202020202020202020202020202020202020202020293B0D0A20202020202020202020202020202020202020207D293B0D0A202020202020202020202020202020207D0D0A2020202020202020202020202020202072657475726E';
wwv_flow_imp.g_varchar2_table(335) := '2066696C746572733B0D0A2020202020202020202020207D0D0A0D0A2020202020202020202020202F2F20666F722064617465206669656C64732C20746869732066756E6374696F6E206973207573656420746F2072657475726E20746865207472756E';
wwv_flow_imp.g_varchar2_table(336) := '63617465642064617465202849534F206461746529206173207065722074686520676976656E20756E69743A206461792C206D6F6E7468206F7220796561720D0A2020202020202020202020202F2F2073656520746865206578616D706C65206170706C';
wwv_flow_imp.g_varchar2_table(337) := '69636174696F6E206F6E20686F772069742063616E206265207573656420696E2063686172747320746F20686967686C69676874207468652070742073656C65637465642074696D65206672616D650D0A20202020202020202020202066756E6374696F';
wwv_flow_imp.g_varchar2_table(338) := '6E206765745472756E63446174652863656C6C2C2064696D656E73696F6E2C20756E6974290D0A2020202020202020202020207B0D0A202020202020202020202020202020206C657420726573756C74203D206E756C6C3B0D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(339) := '202020202020756E6974203D2028756E6974203F3F20276D6F6E746827292E746F4C6F7765724361736528293B0D0A202020202020202020202020202020206C6574206974656D73203D2063656C6C2E726F77732E636F6E6361742863656C6C2E636F6C';
wwv_flow_imp.g_varchar2_table(340) := '756D6E73292E66696C746572286974656D203D3E206974656D2E686965726172636879556E697175654E616D652E737461727473576974682864696D656E73696F6E29293B0D0A202020202020202020202020202020206C65742079656172203D206974';
wwv_flow_imp.g_varchar2_table(341) := '656D732E66696E64286974656D3D3E6974656D2E686965726172636879556E697175654E616D65203D3D2064696D656E73696F6E202B20272E5965617227293F2E63617074696F6E3B0D0A202020202020202020202020202020206C6574206D6F6E7468';
wwv_flow_imp.g_varchar2_table(342) := '203D206974656D732E66696E64286974656D3D3E6974656D2E686965726172636879556E697175654E616D65203D3D2064696D656E73696F6E202B20272E4D6F6E746827293F2E63617074696F6E3B0D0A202020202020202020202020202020206C6574';
wwv_flow_imp.g_varchar2_table(343) := '20646179203D206974656D732E66696E64286974656D3D3E6974656D2E686965726172636879556E697175654E616D65203D3D2064696D656E73696F6E202B20272E44617927293F2E63617074696F6E3B0D0A2020202020202020202020202020202069';
wwv_flow_imp.g_varchar2_table(344) := '662028756E6974203D3D2027646179272026262079656172202626206D6F6E746820262620646179290D0A202020202020202020202020202020207B0D0A2020202020202020202020202020202020202020726573756C74203D2079656172202B20272D';
wwv_flow_imp.g_varchar2_table(345) := '27202B206D6F6E74684D61705B6D6F6E74682E746F4C6F7765724361736528295D202B20272D27202B206461792E706164537461727428322C202730272920202B20275430303A30303A3030273B0D0A202020202020202020202020202020207D202020';
wwv_flow_imp.g_varchar2_table(346) := '202020202020202020202020200D0A2020202020202020202020202020202069662028756E6974203D3D20276D6F6E7468272026262079656172202626206D6F6E7468290D0A202020202020202020202020202020207B0D0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(347) := '202020202020202020726573756C74203D2079656172202B20272D27202B206D6F6E74684D61705B6D6F6E74682E746F4C6F7765724361736528295D202B20272D30315430303A30303A3030273B0D0A202020202020202020202020202020207D0D0A20';
wwv_flow_imp.g_varchar2_table(348) := '20202020202020202020202020202069662028756E6974203D3D202779656172272026262079656172290D0A202020202020202020202020202020207B0D0A2020202020202020202020202020202020202020726573756C74203D2079656172202B2027';
wwv_flow_imp.g_varchar2_table(349) := '2D30312D30315430303A30303A3030273B0D0A202020202020202020202020202020207D202020202020202020202020202020200D0A2020202020202020202020202020202072657475726E20726573756C743B0D0A2020202020202020202020207D0D';
wwv_flow_imp.g_varchar2_table(350) := '0A0D0A2020202020202020202020202F2F2067657420746865206669656C6420747970652066726F6D20746865207764722064617461736F75726365206D65746164617461206F626A6563742028696620616E79290D0A2020202020202020202020202F';
wwv_flow_imp.g_varchar2_table(351) := '2F2068747470733A2F2F7777772E77656264617461726F636B732E636F6D2F646F632F6A732F6D657461646174612D6F626A6563742D666F722D6A736F6E2F0D0A20202020202020202020202066756E6374696F6E206765744669656C6454797065286E';
wwv_flow_imp.g_varchar2_table(352) := '616D65290D0A2020202020202020202020207B0D0A202020202020202020202020202020206E616D65203D206E616D652E73706C697428272E27295B305D3B0D0A202020202020202020202020202020206C65742074797065203D206E756C6C3B0D0A20';
wwv_flow_imp.g_varchar2_table(353) := '202020202020202020202020202020696620287074446174613F2E6C656E677468203E2030290D0A202020202020202020202020202020207B0D0A20202020202020202020202020202020202020206C657420666972737456616C7565203D204F626A65';
wwv_flow_imp.g_varchar2_table(354) := '63742E76616C756573287074446174615B305D295B305D3B0D0A20202020202020202020202020202020202020202F2F20636865636B206966206D6574614F626A6563740D0A2020202020202020202020202020202020202020696620284F626A656374';
wwv_flow_imp.g_varchar2_table(355) := '2E6861734F776E28666972737456616C75652C20277479706527292920200D0A20202020202020202020202020202020202020207B0D0A20202020202020202020202020202020202020202020202074797065203D207074446174615B305D5B6E616D65';
wwv_flow_imp.g_varchar2_table(356) := '5D3F2E747970653B0D0A20202020202020202020202020202020202020207D20200D0A202020202020202020202020202020207D0D0A2020202020202020202020202020202072657475726E20747970653B202020200D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(357) := '7D0D0A0D0A2020202020202020202020202F2F20696E7374616E7469617465205744520D0A2020202020202020202020206C6574207764724F7074696F6E73203D206F7074696F6E732E77656264617461726F636B733B200D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(358) := '20207764724F7074696F6E732E746F6F6C626172203D20747275653B0D0A2020202020202020202020206C6574206366675265706F7274203D206765745265706F7274466F724E616D65286F7074696F6E732E63757272656E745265706F7274293B0D0A';
wwv_flow_imp.g_varchar2_table(359) := '20202020202020202020202069662028216366675265706F7274290D0A2020202020202020202020207B0D0A202020202020202020202020202020202F2F2066616C6C6261636B20746F207072696D617279207265706F72740D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(360) := '202020202020206366675265706F7274203D20676574416C6C5265706F72747328295B305D3B0D0A2020202020202020202020207D0D0A2020202020202020202020207764724F7074696F6E732E7265706F7274203D206366675265706F72743B202020';
wwv_flow_imp.g_varchar2_table(361) := '200D0A202020202020202020202020696620287764724F7074696F6E732E746F6F6C626172290D0A2020202020202020202020207B2020200D0A202020202020202020202020202020207764724F7074696F6E732E6265666F7265746F6F6C6261726372';
wwv_flow_imp.g_varchar2_table(362) := '6561746564203D20637573746F6D697A65546F6F6C6261723B2020200D0A2020202020202020202020207D0D0A2020202020202020202020207764724F7074696F6E732E63656C6C636C69636B203D206F6E43656C6C436C69636B3B200D0A2020202020';
wwv_flow_imp.g_varchar2_table(363) := '202020202020207764724F7074696F6E732E63656C6C646F75626C65636C69636B203D206F6E43656C6C446F75626C65436C69636B3B200D0A2020202020202020202020202F2F20696E7374616E74696174650D0A2020202020202020202020206C6574';
wwv_flow_imp.g_varchar2_table(364) := '20776472203D207074242E77656264617461726F636B73287764724F7074696F6E73293B0D0A2020202020202020202020202F2F7764722E6F6E282761667465726772696464726177272C2066756E6374696F6E2829207B0D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(365) := '2020202020202F2F0D0A2020202020202020202020202F2F7D293B0D0A2020202020202020202020206C657420666972737452656E646572203D20747275653B0D0A2020202020202020202020207764722E6F6E28277265706F7274636F6D706C657465';
wwv_flow_imp.g_varchar2_table(366) := '272C2066756E6374696F6E28297B0D0A20202020202020202020202020202020656E61626C6544697361626C65546F6F6C626172427574746F6E7328293B0D0A2020202020202020202020202020202069662028666972737452656E646572290D0A2020';
wwv_flow_imp.g_varchar2_table(367) := '20202020202020202020202020207B0D0A2020202020202020202020202020202020202020666972737452656E646572203D2066616C73653B0D0A20202020202020202020202020202020202020202F2F2075706F6E2066697273742072656E6465722C';
wwv_flow_imp.g_varchar2_table(368) := '20646F206120726566726573682061732057445220646F65736E277420616C77617973206765742069742072696768742066697273742074696D650D0A202020202020202020202020202020202020202073657454696D656F75742828293D3E7B0D0A20';
wwv_flow_imp.g_varchar2_table(369) := '20202020202020202020202020202020202020202020207764722E7265667265736828293B0D0A20202020202020202020202020202020202020207D2C20353030293B20202020202020202020202020202020202020200D0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(370) := '20202020207D0D0A2020202020202020202020207D293B0D0A2020202020202020202020200D0A202020202020202020202020242877696E646F77292E6F6E2827726573697A652E6C696234785F7074272C2066756E6374696F6E202829207B0D0A2020';
wwv_flow_imp.g_varchar2_table(371) := '20202020202020202020202020202F2F207265667265736820617320776974686F75742C20574452206973206E6F7420726564657465726D696E696E67206966206120686F72697A6F6E74616C207363726F6C6C626172206973206E65656465640D0A20';
wwv_flow_imp.g_varchar2_table(372) := '202020202020202020202020202020617065782E7574696C2E6465626F756E6365282829203D3E207B0D0A20202020202020202020202020202020202020207764722E7265667265736828293B0D0A202020202020202020202020202020207D2C203130';
wwv_flow_imp.g_varchar2_table(373) := '30293B0D0A2020202020202020202020207D293B20202020202020200D0A20202020202020207D0D0A0D0A202020202020202072657475726E207B0D0A202020202020202020202020696E697450543A20696E697450540D0A20202020202020207D0D0A';
wwv_flow_imp.g_varchar2_table(374) := '202020207D2928293B2020200D0A0D0A202020202F2A0D0A20202020202A206472696C6C5468726F7567684D6F64756C650D0A20202020202A205768656E20746865205069766F74205461626C652068617320612072656C6174656420496E6C696E6520';
wwv_flow_imp.g_varchar2_table(375) := '4469616C6F67207769746820495220666F72204472696C6C2D5468726F7567682C207468652062656C6F77206C6F6769632074616B65732063617265206F66200D0A20202020202A20706F736974696F6E696E6720746865206469616C6F6720616E6420';
wwv_flow_imp.g_varchar2_table(376) := '73697A696E67207468652049522061732070657220746865206469616C6F672064696D656E73696F6E732E0D0A20202020202A2F0D0A202020206C6574206472696C6C5468726F7567684D6F64756C65203D202866756E6374696F6E28290D0A20202020';
wwv_flow_imp.g_varchar2_table(377) := '7B0D0A20202020202020206C657420696E69744469616C6F67203D2066756E6374696F6E2864744469616C6F67496429207B0D0A2020202020202020202020206966202821282428272327202B2064744469616C6F674964292E697328273A75692D6469';
wwv_flow_imp.g_varchar2_table(378) := '616C6F6727292929207B0D0A202020202020202020202020202020207468726F77206E6577204572726F7228274472696C6C2D5468726F75676820726567696F6E2073686F756C6420626520616E20696E6C696E65204469616C6F67206F722044726177';
wwv_flow_imp.g_varchar2_table(379) := '6572202827202B2064744469616C6F674964202B20272927293B0D0A2020202020202020202020207D2020202020202020202020200D0A2020202020202020202020206C657420646C6724203D202428272327202B2064744469616C6F674964293B0D0A';
wwv_flow_imp.g_varchar2_table(380) := '202020202020202020202020646C67242E636C6F7365737428272E75692D6469616C6F6727292E616464436C61737328435F4C494234585F50545F4454293B0D0A202020202020202020202020646C67242E63737328276F766572666C6F77272C202768';
wwv_flow_imp.g_varchar2_table(381) := '696464656E27293B0D0A2020202020202020202020206C657420626F647924203D20646C67242E66696E6428272E742D4469616C6F67526567696F6E2D626F64792C202E742D447261776572526567696F6E2D626F647927293B0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(382) := '202020206C657420626F6479577261707065724F757424203D20646C67242E66696E6428272E742D4469616C6F67526567696F6E2D626F6479577261707065724F75742C202E742D447261776572526567696F6E2D626F6479577261707065724F757427';
wwv_flow_imp.g_varchar2_table(383) := '293B2020200D0A202020202020202020202020626F6479577261707065724F7574242E63737328276F766572666C6F77272C202768696464656E27293B0D0A2020202020202020202020206C6574206850616464696E67203D20626F6479242E696E6E65';
wwv_flow_imp.g_varchar2_table(384) := '724865696768742829202D20626F6479242E68656967687428293B0D0A2020202020202020202020206C6574207750616464696E67203D20626F6479242E696E6E657257696474682829202D20626F6479242E776964746828293B0D0A20202020202020';
wwv_flow_imp.g_varchar2_table(385) := '20202020206C657420646C6757696467657424203D20646C67242E6469616C6F67282277696467657422293B20202F2F2077696C6C20626520746865206469616C6F6720777261707065720D0A2020202020202020202020206C65742068656967687446';
wwv_flow_imp.g_varchar2_table(386) := '6163746F72203D20302E383B0D0A20202020202020202020202066756E6374696F6E20706F736974696F6E4469616C6F6728290D0A2020202020202020202020207B0D0A20202020202020202020202020202020646C67242E6469616C6F6728276F7074';
wwv_flow_imp.g_varchar2_table(387) := '696F6E272C207B0D0A202020202020202020202020202020202020202077696474683A204D6174682E666C6F6F722877696E646F772E696E6E65725769647468202A20302E3935292C0D0A20202020202020202020202020202020202020206865696768';
wwv_flow_imp.g_varchar2_table(388) := '743A204D6174682E666C6F6F722877696E646F772E696E6E6572486569676874202A20686569676874466163746F72290D0A202020202020202020202020202020207D293B0D0A202020202020202020202020202020202F2F20706F736974696F6E206C';
wwv_flow_imp.g_varchar2_table(389) := '65667420666972737420617320746F206D616B652073757265207468652063656E746572696E672077696C6C207265616C6C7920776F726B0D0A20202020202020202020202020202020646C67242E6469616C6F6728276F7074696F6E272C2027706F73';
wwv_flow_imp.g_varchar2_table(390) := '6974696F6E272C207B0D0A20202020202020202020202020202020202020206D793A20276C656674272C0D0A202020202020202020202020202020202020202061743A20276C656674272C0D0A20202020202020202020202020202020202020206F663A';
wwv_flow_imp.g_varchar2_table(391) := '2077696E646F770D0A202020202020202020202020202020207D293B0D0A20202020202020202020202020202020646C67242E6469616C6F6728276F7074696F6E272C2027706F736974696F6E272C207B0D0A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(392) := '2020206D793A202763656E746572272C0D0A202020202020202020202020202020202020202061743A202763656E746572272C0D0A20202020202020202020202020202020202020206F663A2077696E646F770D0A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(393) := '207D293B0D0A20202020202020202020202020202020646C67242E6469616C6F6728276F7074696F6E272C2027706F736974696F6E272C207B0D0A20202020202020202020202020202020202020206D793A2027746F70272C0D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(394) := '202020202020202020202061743A2027746F702B272B4D6174682E666C6F6F722877696E646F772E696E6E6572486569676874202A2028282831202D20686569676874466163746F7229202F203229202A20302E383529292C0D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(395) := '20202020202020202020206F663A2077696E646F770D0A202020202020202020202020202020207D293B20200D0A2020202020202020202020207D0D0A202020202020202020202020706F736974696F6E4469616C6F6728293B0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(396) := '20202020646C67242E6F6E28276469616C6F67726573697A65272C0D0A20202020202020202020202020202020617065782E7574696C2E6465626F756E6365282829203D3E207B0D0A20202020202020202020202020202020202020206C657420697243';
wwv_flow_imp.g_varchar2_table(397) := '6F6E74656E7424203D20646C67242E66696E6428272E612D4952522D7461626C65436F6E7461696E657227293B0D0A2020202020202020202020202020202020202020696620286972436F6E74656E74242E6C656E677468290D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(398) := '20202020202020202020207B0D0A2020202020202020202020202020202020202020202020206C657420686561646572486569676874203D202428272327202B2064744469616C6F674964202B2027202E70742D64742D68656164657227292E6F757465';
wwv_flow_imp.g_varchar2_table(399) := '72486569676874287472756529207C7C20303B0D0A2020202020202020202020202020202020202020202020206C657420746F6F6C626172486569676874203D20646C67242E66696E6428272E612D4952522D746F6F6C62617227292E6F757465724865';
wwv_flow_imp.g_varchar2_table(400) := '69676874287472756529207C7C20303B0D0A2020202020202020202020202020202020202020202020206C657420636F6E74726F6C73436F6E7461696E6572486569676874203D20646C67242E66696E6428272E612D4952522D636F6E74726F6C73436F';
wwv_flow_imp.g_varchar2_table(401) := '6E7461696E657227292E6F75746572486569676874287472756529207C7C20303B2020200D0A2020202020202020202020202020202020202020202020206C657420706167696E6174696F6E626172486569676874203D20646C67242E66696E6428272E';
wwv_flow_imp.g_varchar2_table(402) := '612D4952522D706167696E6174696F6E5772617027292E6F75746572486569676874287472756529207C7C20303B0D0A2020202020202020202020202020202020202020202020206972436F6E74656E74242E637373287B20226D617848656967687422';
wwv_flow_imp.g_varchar2_table(403) := '3A20626F6479577261707065724F7574242E6865696768742829202D206850616464696E67202D20686561646572486569676874202D20746F6F6C626172486569676874202D20636F6E74726F6C73436F6E7461696E6572486569676874202D20706167';
wwv_flow_imp.g_varchar2_table(404) := '696E6174696F6E626172486569676874202D2033202B20227078222C20227769647468223A20226175746F222C20226D61785769647468223A20646C67242E77696474682829202D207750616464696E67202D2032202B2022707822207D293B0D0A2020';
wwv_flow_imp.g_varchar2_table(405) := '2020202020202020202020202020202020207D202020202020202020202020202020202020200D0A202020202020202020202020202020207D2C20313030290D0A202020202020202020202020293B2020200D0A20202020202020202020202061706578';
wwv_flow_imp.g_varchar2_table(406) := '2E7769646765742E7574696C2E6F6E5669736962696C6974794368616E6765282428272327202B2064744469616C6F674964292C2066756E6374696F6E202876697369626C6529207B0D0A20202020202020202020202020202020696620287669736962';
wwv_flow_imp.g_varchar2_table(407) := '6C6529207B0D0A202020202020202020202020202020202020202073657454696D656F7574282829203D3E207B0D0A202020202020202020202020202020202020202020202020646C67242E7472696767657228276469616C6F67726573697A6527293B';
wwv_flow_imp.g_varchar2_table(408) := '0D0A20202020202020202020202020202020202020207D2C203530293B0D0A202020202020202020202020202020207D0D0A2020202020202020202020207D293B200D0A2020202020202020202020206C6574206972446F6D4964203D20242827232720';
wwv_flow_imp.g_varchar2_table(409) := '2B2064744469616C6F674964202B2027202E70742D64742D7265706F727427292E617474722827696427293B20200D0A202020202020202020202020696620286972446F6D4964290D0A2020202020202020202020207B0D0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(410) := '20202020202428272327202B206972446F6D4964292E6F6E282761706578616674657272656672657368272C2066756E6374696F6E2829207B0D0A202020202020202020202020202020202020202073657454696D656F7574282829203D3E207B0D0A20';
wwv_flow_imp.g_varchar2_table(411) := '2020202020202020202020202020202020202020202020646C67242E7472696767657228276469616C6F67726573697A6527293B0D0A20202020202020202020202020202020202020207D2C203530293B0D0A202020202020202020202020202020207D';
wwv_flow_imp.g_varchar2_table(412) := '290D0A2020202020202020202020207D0D0A202020202020202020202020242877696E646F77292E6F6E2827726573697A652E6C696234785F7376272C2066756E6374696F6E202829207B0D0A2020202020202020202020202020202073657454696D65';
wwv_flow_imp.g_varchar2_table(413) := '6F7574282829203D3E207B0D0A20202020202020202020202020202020202020202428272327202B2064744469616C6F674964202B20273A76697369626C6527292E7472696767657228276469616C6F67726573697A6527293B0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(414) := '20202020202020207D2C203530293B0D0A2020202020202020202020207D293B0D0A20202020202020207D0D0A0D0A202020202020202072657475726E207B0D0A202020202020202020202020696E69744469616C6F673A20696E69744469616C6F670D';
wwv_flow_imp.g_varchar2_table(415) := '0A20202020202020207D0D0A202020207D2928293B0D0A0D0A202020202F2A0D0A20202020202A20496E2063617365206F66207374617274696E67206469616C6F67732066726F6D20616E20696E6C696E65206469616C6F672C206E6F206F7665726C61';
wwv_flow_imp.g_varchar2_table(416) := '7920697320617070656172696E6720746F2074686520696E6C696E65206469616C6F672E20546865206F7665726C61792069732061637475616C6C79200D0A20202020202A206372656174656420286F6E20746865207061676520626F6479292C206275';
wwv_flow_imp.g_varchar2_table(417) := '7420746865207A2D696E646578206973206C6F776572207468616E2074686520696E6C696E65206469616C6F672E20427920686176696E67206E65787420636F64652C20746865207A2D696E6465782077696C6C206265200D0A20202020202A20636F72';
wwv_flow_imp.g_varchar2_table(418) := '72656374656420616E6420746865206F7665726C61792077696C6C20636F7665722074686520696E6C696E65206469616C6F672E0D0A20202020202A20412066696C746572436C6173732063616E20626520676976656E20617320746F20726573747269';
wwv_flow_imp.g_varchar2_table(419) := '63742074686520636865636B20746F206365727461696E206469616C6F6773206F6E6C792E0D0A20202020202A2F202020200D0A202020206C6574207574696C6974794D6F64756C65203D202866756E6374696F6E28290D0A202020207B0D0A20202020';
wwv_flow_imp.g_varchar2_table(420) := '202020206C657420656E61626C65496E6C696E654469616C6F674F7665726C6179203D2066756E6374696F6E2866696C746572436C61737329200D0A20202020202020207B0D0A2020202020202020202020202428617065782E6750616765436F6E7465';
wwv_flow_imp.g_varchar2_table(421) := '787424292E6F6E28276469616C6F67637265617465272C2066756E6374696F6E286A51756572794576656E742C206461746129207B0D0A202020202020202020202020202020206C65742074617267657424203D2024286A51756572794576656E742E74';
wwv_flow_imp.g_varchar2_table(422) := '6172676574293B0D0A2020202020202020202020202020202069662028747970656F662066696C746572436C617373203D3D3D2027756E646566696E656427207C7C2066696C746572436C617373203D3D3D206E756C6C207C7C20746172676574242E63';
wwv_flow_imp.g_varchar2_table(423) := '6C6F7365737428272E75692D6469616C6F6727292E686173436C6173732866696C746572436C61737329290D0A202020202020202020202020202020207B0D0A202020202020202020202020202020202020202073657454696D656F75742828293D3E7B';
wwv_flow_imp.g_varchar2_table(424) := '0D0A202020202020202020202020202020202020202020202020696620282428272E75692D7769646765742D6F7665726C617927292E6C656E677468203E2031290D0A2020202020202020202020202020202020202020202020207B0D0A202020202020';
wwv_flow_imp.g_varchar2_table(425) := '202020202020202020202020202020202020202020206C6574206D61785A496E646578203D20303B0D0A202020202020202020202020202020202020202020202020202020202428272E75692D7769646765742D6F7665726C617927292E6E6F7428223A';
wwv_flow_imp.g_varchar2_table(426) := '6C61737422292E656163682866756E6374696F6E2829207B0D0A20202020202020202020202020202020202020202020202020202020202020206C6574207A496E646578203D207061727365496E7428242874686973292E63737328277A2D696E646578';
wwv_flow_imp.g_varchar2_table(427) := '2729293B0D0A20202020202020202020202020202020202020202020202020202020202020206D61785A496E646578203D20287A496E646578203E206D61785A496E64657829203F207A496E646578203A206D61785A496E6465783B0D0A202020202020';
wwv_flow_imp.g_varchar2_table(428) := '202020202020202020202020202020202020202020207D293B20202020202020200D0A202020202020202020202020202020202020202020202020202020206C6574206C6173745A496E646578203D207061727365496E74282428272E75692D77696467';
wwv_flow_imp.g_varchar2_table(429) := '65742D6F7665726C617927292E6C61737428292E63737328277A2D696E6465782729293B202020200D0A20202020202020202020202020202020202020202020202020202020696620286C6173745A496E646578203C3D206D61785A496E646578290D0A';
wwv_flow_imp.g_varchar2_table(430) := '202020202020202020202020202020202020202020202020202020207B0D0A20202020202020202020202020202020202020202020202020202020202020202428272E75692D7769646765742D6F7665726C617927292E6C61737428292E63737328277A';
wwv_flow_imp.g_varchar2_table(431) := '2D696E646578272C206D61785A496E646578202B2031293B0D0A2020202020202020202020202020202020202020202020202020202020202020746172676574242E6469616C6F6728276D6F7665546F546F7027293B2020200D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(432) := '202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020207D20202020200D0A20202020202020202020202020202020202020207D2C203130293B0D0A202020202020202020202020202020207D';
wwv_flow_imp.g_varchar2_table(433) := '0D0A2020202020202020202020207D293B202020202020202020202020200D0A20202020202020207D0D0A2020202020202020656E61626C65496E6C696E654469616C6F674F7665726C61792827612D4952522D6469616C6F6727293B20202020202020';
wwv_flow_imp.g_varchar2_table(434) := '200D0A202020207D2928293B0D0A0D0A202020202F2F207574696C2066756E6374696F6E730D0A202020206C6574207574696C203D207B2020200D0A2020202020202020646174653A0D0A20202020202020207B0D0A2020202020202020202020206F72';
wwv_flow_imp.g_varchar2_table(435) := '61636C65446174654D61736B546F576472466F726D61743A2066756E6374696F6E286F7261636C65466F726D617429200D0A2020202020202020202020207B0D0A202020202020202020202020202020202F2F20746F6B656E697A65723A2073706C6974';
wwv_flow_imp.g_varchar2_table(436) := '7320666F726D617420696E746F20746F6B656E7320616E64206C69746572616C732C20737570706F72747320464D206D6F646966696572200D0A2020202020202020202020202020202066756E6374696F6E20746F6B656E697A654F7261636C65466F72';
wwv_flow_imp.g_varchar2_table(437) := '6D617428666D7429200D0A202020202020202020202020202020207B0D0A2020202020202020202020202020202020202020636F6E737420746F6B656E73203D205B0D0A2020202020202020202020202020202020202020202020202759595959272C27';
wwv_flow_imp.g_varchar2_table(438) := '52525252272C275252272C275959272C0D0A202020202020202020202020202020202020202020202020274D4F4E5448272C274D4F4E272C274D4D272C0D0A20202020202020202020202020202020202020202020202027444159272C274459272C0D0A';
wwv_flow_imp.g_varchar2_table(439) := '202020202020202020202020202020202020202020202020274444272C0D0A2020202020202020202020202020202020202020202020202748483234272C2748483132272C274848272C0D0A202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(440) := '274D49272C275353272C0D0A20202020202020202020202020202020202020202020202027414D272C27504D272C0D0A202020202020202020202020202020202020202020202020274453272C27444C270D0A2020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(441) := '2020205D3B0D0A20202020202020202020202020202020202020202F2F20736F7274206C6F6E676573742066697273740D0A2020202020202020202020202020202020202020746F6B656E732E736F72742828612C6229203D3E20622E6C656E67746820';
wwv_flow_imp.g_varchar2_table(442) := '2D20612E6C656E677468293B0D0A20202020202020202020202020202020202020206C657420726573756C74203D205B5D3B0D0A20202020202020202020202020202020202020206C65742069203D20303B0D0A20202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(443) := '202020206C657420666D416374697665203D2066616C73653B0D0A2020202020202020202020202020202020202020636F6E7374207570706572203D20666D742E746F55707065724361736528293B0D0A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(444) := '207768696C65202869203C20666D742E6C656E67746829200D0A20202020202020202020202020202020202020207B0D0A2020202020202020202020202020202020202020202020202F2F20464D206D6F6469666965722028636173652D696E73656E73';
wwv_flow_imp.g_varchar2_table(445) := '6974697665290D0A2020202020202020202020202020202020202020202020206966202875707065722E73756273747228692C3229203D3D3D2027464D2729200D0A2020202020202020202020202020202020202020202020207B0D0A20202020202020';
wwv_flow_imp.g_varchar2_table(446) := '202020202020202020202020202020202020202020666D416374697665203D20747275653B0D0A2020202020202020202020202020202020202020202020202020202069202B3D20323B0D0A202020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(447) := '20202020636F6E74696E75653B0D0A2020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020202F2F2071756F746564206C69746572616C0D0A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(448) := '20202020202020202069662028666D745B695D203D3D3D2027222729200D0A2020202020202020202020202020202020202020202020207B0D0A202020202020202020202020202020202020202020202020202020206C657420656E64203D20666D742E';
wwv_flow_imp.g_varchar2_table(449) := '696E6465784F66282722272C20692B31293B0D0A2020202020202020202020202020202020202020202020202020202069662028656E64203D3D3D202D312920656E64203D20666D742E6C656E677468202D20313B0D0A20202020202020202020202020';
wwv_flow_imp.g_varchar2_table(450) := '202020202020202020202020202020726573756C742E70757368287B0D0A2020202020202020202020202020202020202020202020202020202020202020747970653A20276C69746572616C272C0D0A2020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(451) := '20202020202020202020202076616C75653A20666D742E737562737472696E6728692C20656E642B31290D0A202020202020202020202020202020202020202020202020202020207D293B0D0A2020202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(452) := '202020202069203D20656E64202B20313B0D0A20202020202020202020202020202020202020202020202020202020636F6E74696E75653B0D0A2020202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(453) := '2020202020202020202F2F20746F6B656E206D617463680D0A2020202020202020202020202020202020202020202020206C6574206D617463686564203D2066616C73653B0D0A202020202020202020202020202020202020202020202020666F722028';
wwv_flow_imp.g_varchar2_table(454) := '636F6E737420746F6B656E206F6620746F6B656E7329200D0A2020202020202020202020202020202020202020202020207B0D0A202020202020202020202020202020202020202020202020202020206966202875707065722E73746172747357697468';
wwv_flow_imp.g_varchar2_table(455) := '28746F6B656E2C20692929200D0A202020202020202020202020202020202020202020202020202020207B0D0A2020202020202020202020202020202020202020202020202020202020202020726573756C742E70757368287B0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(456) := '20202020202020202020202020202020202020202020202020202020747970653A2027746F6B656E272C0D0A20202020202020202020202020202020202020202020202020202020202020202020202076616C75653A20746F6B656E2C0D0A2020202020';
wwv_flow_imp.g_varchar2_table(457) := '20202020202020202020202020202020202020202020202020202020202020666D3A20666D4163746976650D0A20202020202020202020202020202020202020202020202020202020202020207D293B0D0A202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(458) := '2020202020202020202020202020666D416374697665203D2066616C73653B202F2F20726573657420464D20616674657220746F6B656E0D0A202020202020202020202020202020202020202020202020202020202020202069202B3D20746F6B656E2E';
wwv_flow_imp.g_varchar2_table(459) := '6C656E6774683B0D0A20202020202020202020202020202020202020202020202020202020202020206D617463686564203D20747275653B0D0A2020202020202020202020202020202020202020202020202020202020202020627265616B3B0D0A2020';
wwv_flow_imp.g_varchar2_table(460) := '20202020202020202020202020202020202020202020202020207D0D0A2020202020202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202020202020696620286D6174636865642920636F6E74696E75';
wwv_flow_imp.g_varchar2_table(461) := '653B0D0A2020202020202020202020202020202020202020202020202F2F2073696E676C652D63686172206C69746572616C0D0A202020202020202020202020202020202020202020202020726573756C742E70757368287B0D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(462) := '20202020202020202020202020202020202020747970653A20276C69746572616C272C0D0A2020202020202020202020202020202020202020202020202020202076616C75653A20666D745B695D0D0A2020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(463) := '202020207D293B0D0A202020202020202020202020202020202020202020202020692B2B3B0D0A20202020202020202020202020202020202020207D0D0A202020202020202020202020202020202020202072657475726E20726573756C743B0D0A2020';
wwv_flow_imp.g_varchar2_table(464) := '20202020202020202020202020207D0D0A0D0A202020202020202020202020202020202F2F206D61707065723A20636F6E766572747320746F6B656E7320746F20574452206571756976616C656E74732C20726573706563747320464D2072756C657320';
wwv_flow_imp.g_varchar2_table(465) := '0D0A2020202020202020202020202020202066756E6374696F6E206D6170546F6B656E73546F57647228746F6B656E7329200D0A202020202020202020202020202020207B0D0A20202020202020202020202020202020202020202F2F204F7261636C65';
wwv_flow_imp.g_varchar2_table(466) := '20E2869220457863656C206D617070696E670D0A2020202020202020202020202020202020202020636F6E7374206D6170203D207B0D0A202020202020202020202020202020202020202020202020595959593A202779797979272C0D0A202020202020';
wwv_flow_imp.g_varchar2_table(467) := '202020202020202020202020202020202020525252523A202779797979272C0D0A20202020202020202020202020202020202020202020202052523A20277979272C0D0A20202020202020202020202020202020202020202020202059593A2027797927';
wwv_flow_imp.g_varchar2_table(468) := '2C0D0A0D0A2020202020202020202020202020202020202020202020204D4F4E54483A20274D4D4D4D272C0D0A2020202020202020202020202020202020202020202020204D4F4E3A20274D4D4D272C0D0A202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(469) := '2020202020204D4D3A20274D4D272C0D0A0D0A2020202020202020202020202020202020202020202020204441593A20276464272C0D0A20202020202020202020202020202020202020202020202044593A20276464272C0D0A0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(470) := '2020202020202020202020202020202044443A20276464272C0D0A0D0A202020202020202020202020202020202020202020202020484832343A20274848272C0D0A202020202020202020202020202020202020202020202020484831323A2027484827';
wwv_flow_imp.g_varchar2_table(471) := '2C0D0A20202020202020202020202020202020202020202020202048483A20274848272C0D0A0D0A2020202020202020202020202020202020202020202020204D493A20276D6D272C0D0A20202020202020202020202020202020202020202020202053';
wwv_flow_imp.g_varchar2_table(472) := '533A20277373272C0D0A0D0A202020202020202020202020202020202020202020202020414D3A2027272C0D0A202020202020202020202020202020202020202020202020504D3A2027270D0A20202020202020202020202020202020202020207D3B0D';
wwv_flow_imp.g_varchar2_table(473) := '0A20202020202020202020202020202020202020206C657420726573756C74203D2027273B0D0A2020202020202020202020202020202020202020666F722028636F6E73742074206F6620746F6B656E73290D0A20202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(474) := '202020207B0D0A20202020202020202020202020202020202020202020202069662028742E74797065203D3D3D20276C69746572616C2729200D0A2020202020202020202020202020202020202020202020207B0D0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(475) := '2020202020202020202020202020726573756C74202B3D20742E76616C75653B0D0A20202020202020202020202020202020202020202020202020202020636F6E74696E75653B0D0A2020202020202020202020202020202020202020202020207D0D0A';
wwv_flow_imp.g_varchar2_table(476) := '2020202020202020202020202020202020202020202020202F2F206D617020746F6B656E0D0A202020202020202020202020202020202020202020202020696620286D61705B742E76616C75655D29200D0A202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(477) := '2020202020207B0D0A20202020202020202020202020202020202020202020202020202020726573756C74202B3D206D61705B742E76616C75655D3B200D0A2020202020202020202020202020202020202020202020207D0D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(478) := '202020202020202020207D0D0A202020202020202020202020202020202020202072657475726E20726573756C743B0D0A202020202020202020202020202020207D20202020202020202020202020202020200D0A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(479) := '20696620282F5C6244535C622F672E74657374286F7261636C65466F726D61742929200D0A202020202020202020202020202020207B0D0A20202020202020202020202020202020202020206F7261636C65466F726D6174203D206F7261636C65466F72';
wwv_flow_imp.g_varchar2_table(480) := '6D61742E7265706C616365282F5C6244535C622F69672C20617065782E6C6F63616C652E676574445344617465466F726D61742829293B0D0A202020202020202020202020202020207D0D0A20202020202020202020202020202020696620282F5C6244';
wwv_flow_imp.g_varchar2_table(481) := '4C5C622F672E74657374286F7261636C65466F726D61742929200D0A202020202020202020202020202020207B0D0A20202020202020202020202020202020202020206F7261636C65466F726D6174203D206F7261636C65466F726D61742E7265706C61';
wwv_flow_imp.g_varchar2_table(482) := '6365282F5C62444C5C622F69672C20617065782E6C6F63616C652E676574444C44617465466F726D61742829293B0D0A202020202020202020202020202020207D0D0A20202020202020202020202020202020636F6E737420746F6B656E73203D20746F';
wwv_flow_imp.g_varchar2_table(483) := '6B656E697A654F7261636C65466F726D6174286F7261636C65466F726D6174293B0D0A20202020202020202020202020202020636F6E737420776472466D74203D206D6170546F6B656E73546F57647228746F6B656E73293B0D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(484) := '2020202020202072657475726E20776472466D743B0D0A2020202020202020202020207D2C0D0A202020202020202020202020776472546F49534F446174653A2066756E6374696F6E2864617465537472696E672C20646174655061747465726E29200D';
wwv_flow_imp.g_varchar2_table(485) := '0A2020202020202020202020207B0D0A20202020202020202020202020202020636F6E7374207061747465726E5061727473203D20646174655061747465726E2E73706C6974282F5B5C2F2E2D5D2F293B0D0A2020202020202020202020202020202063';
wwv_flow_imp.g_varchar2_table(486) := '6F6E737420646174655061727473203D2064617465537472696E672E73706C6974282F5B5C2F2E2D5D2F293B0D0A202020202020202020202020202020206C6574206461792C206D6F6E74682C20796561723B0D0A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(487) := '207061747465726E50617274732E666F72456163682828706172742C20696E64657829203D3E207B0D0A202020202020202020202020202020202020202073776974636820287061727429207B0D0A202020202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(488) := '2020206361736520276464273A0D0A20202020202020202020202020202020202020202020202020202020646179203D206461746550617274735B696E6465785D3B0D0A2020202020202020202020202020202020202020202020202020202062726561';
wwv_flow_imp.g_varchar2_table(489) := '6B3B0D0A2020202020202020202020202020202020202020202020206361736520274D4D273A0D0A202020202020202020202020202020202020202020202020202020206D6F6E7468203D206461746550617274735B696E6465785D3B0D0A2020202020';
wwv_flow_imp.g_varchar2_table(490) := '2020202020202020202020202020202020202020202020627265616B3B0D0A20202020202020202020202020202020202020202020202063617365202779797979273A0D0A20202020202020202020202020202020202020202020202063617365202779';
wwv_flow_imp.g_varchar2_table(491) := '7927203A0D0A2020202020202020202020202020202020202020202020202020202079656172203D206461746550617274735B696E6465785D3B0D0A20202020202020202020202020202020202020202020202020202020627265616B3B0D0A20202020';
wwv_flow_imp.g_varchar2_table(492) := '202020202020202020202020202020207D0D0A202020202020202020202020202020207D293B202020200D0A202020202020202020202020202020202F2F20656E7375726520322D6469676974206461792F6D6F6E74680D0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(493) := '2020202020646179203D206461792E706164537461727428322C20273027293B0D0A202020202020202020202020202020206D6F6E7468203D206D6F6E74682E706164537461727428322C20273027293B0D0A2020202020202020202020202020202072';
wwv_flow_imp.g_varchar2_table(494) := '657475726E2060247B796561727D2D247B6D6F6E74687D2D247B6461797D603B202020202020202020202020202020200D0A2020202020202020202020207D2C0D0A2020202020202020202020206E6F726D616C697A654D756C74694C6576656C446174';
wwv_flow_imp.g_varchar2_table(495) := '653A2066756E6374696F6E2876616C75652C20666F726D617429200D0A2020202020202020202020207B0D0A20202020202020202020202020202020636F6E7374207061727473203D2076616C75652E73706C697428272F27293B0D0A20202020202020';
wwv_flow_imp.g_varchar2_table(496) := '2020202020202020206C657420726573756C74203D205B5D3B0D0A2020202020202020202020202020202069662028666F726D6174203D3D3D2027796561722F6D6F6E74682F6461792729200D0A202020202020202020202020202020207B0D0A202020';
wwv_flow_imp.g_varchar2_table(497) := '2020202020202020202020202020202020636F6E7374205B796561722C206D6F6E74682C206461795D203D2070617274733B0D0A2020202020202020202020202020202020202020726573756C742E707573682879656172293B0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(498) := '202020202020202020202020696620286D6F6E746829200D0A20202020202020202020202020202020202020207B0D0A202020202020202020202020202020202020202020202020726573756C742E70757368280D0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(499) := '20202020202020202020202020206D6F6E74684D61705B6D6F6E74682E746F4C6F7765724361736528295D207C7C0D0A20202020202020202020202020202020202020202020202020202020537472696E67286D6F6E7468292E70616453746172742832';
wwv_flow_imp.g_varchar2_table(500) := '2C20273027290D0A202020202020202020202020202020202020202020202020293B0D0A20202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020206966202864617929200D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(501) := '202020202020202020207B0D0A202020202020202020202020202020202020202020202020726573756C742E7075736828537472696E6728646179292E706164537461727428322C2027302729293B0D0A20202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(502) := '207D0D0A202020202020202020202020202020207D0D0A2020202020202020202020202020202069662028666F726D6174203D3D3D2027796561722F717561727465722F6D6F6E74682F6461792729200D0A202020202020202020202020202020207B0D';
wwv_flow_imp.g_varchar2_table(503) := '0A2020202020202020202020202020202020202020636F6E7374205B796561722C20717561727465722C206D6F6E74682C206461795D203D2070617274733B0D0A2020202020202020202020202020202020202020726573756C742E7075736828796561';
wwv_flow_imp.g_varchar2_table(504) := '72293B0D0A2020202020202020202020202020202020202020696620287175617274657229207B0D0A2020202020202020202020202020202020202020202020202F2F2045787472616374206E756D6572696320706172742066726F6D2076616C756573';
wwv_flow_imp.g_varchar2_table(505) := '206C696B653A0D0A2020202020202020202020202020202020202020202020202F2F2022517561727465722031222C20224B7761727461616C2032222C206574632E0D0A202020202020202020202020202020202020202020202020636F6E7374207175';
wwv_flow_imp.g_varchar2_table(506) := '61727465724E756D626572203D20717561727465722E6D61746368282F5C642B2F293F2E5B305D3B0D0A20202020202020202020202020202020202020202020202069662028717561727465724E756D62657229207B0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(507) := '20202020202020202020202020202020726573756C742E7075736828717561727465724E756D626572293B0D0A2020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020207D0D0A2020202020';
wwv_flow_imp.g_varchar2_table(508) := '202020202020202020202020202020696620286D6F6E746829200D0A20202020202020202020202020202020202020207B0D0A202020202020202020202020202020202020202020202020726573756C742E70757368280D0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(509) := '20202020202020202020202020202020206D6F6E74684D61705B6D6F6E74682E746F4C6F7765724361736528295D207C7C0D0A20202020202020202020202020202020202020202020202020202020537472696E67286D6F6E7468292E70616453746172';
wwv_flow_imp.g_varchar2_table(510) := '7428322C20273027290D0A202020202020202020202020202020202020202020202020293B0D0A20202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020206966202864617929200D0A20202020202020';
wwv_flow_imp.g_varchar2_table(511) := '202020202020202020202020207B0D0A202020202020202020202020202020202020202020202020726573756C742E7075736828537472696E6728646179292E706164537461727428322C2027302729293B0D0A20202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(512) := '202020207D0D0A202020202020202020202020202020207D0D0A2020202020202020202020202020202072657475726E20726573756C742E6A6F696E28272F27293B0D0A2020202020202020202020207D202020202020202020202020202020200D0A20';
wwv_flow_imp.g_varchar2_table(513) := '202020202020207D0D0A202020207D3B20202020200D0A202020200D0A2020202066756E6374696F6E20696E69744D6573736167657328290D0A202020207B0D0A20202020202020202F2F20686572652077652063616E206861766520746865206C6162';
wwv_flow_imp.g_varchar2_table(514) := '656C7320616E64206D6573736167657320666F722077686963682074686520646576656C6F7065722073686F756C64206265200D0A20202020202020202F2F2061626C6520746F20636F6E666967207472616E736C6174696F6E7320696E20415045580D';
wwv_flow_imp.g_varchar2_table(515) := '0A2020202020202020617065782E6C616E672E6164644D65737361676573287B0D0A202020202020202020202020274C494234582E5744522E50542E444154415F53495A455F45584345454445445F5449544C45273A20274C6F6164204572726F72272C';
wwv_flow_imp.g_varchar2_table(516) := '0D0A202020202020202020202020274C494234582E5744522E50542E444154415F53495A455F45584345454445445F4D455353414745273A2027546865206461746173657420697320746F6F206C6172676520746F20646973706C617920696E20746865';
wwv_flow_imp.g_varchar2_table(517) := '207069766F74207461626C652E272C0D0A202020202020202020202020274C494234582E5744522E50542E505249564154455F5245504F52545F5341564544273A202750726976617465207265706F7274207361766564272C0D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(518) := '202020274C494234582E5744522E50542E534156455F5245504F52545F57524F4E475F54595045273A20275C2725305C272069732061202531207265706F72742E2043616E206F6E6C79207361766520617320612070726976617465207265706F72742E';
wwv_flow_imp.g_varchar2_table(519) := '272C0D0A202020202020202020202020274C494234582E5744522E50542E534156455F5049564F545F5245504F5254273A202753617665205069766F74205265706F7274272C0D0A202020202020202020202020274C494234582E5744522E50542E4C4F';
wwv_flow_imp.g_varchar2_table(520) := '41445F5049564F545F5245504F5254273A20274C6F6164205069766F74205265706F7274272C0D0A202020202020202020202020274C494234582E5744522E50542E5245504F52545F44454C45544544273A20275265706F72742044656C65746564272C';
wwv_flow_imp.g_varchar2_table(521) := '0D0A202020202020202020202020274C494234582E5744522E50542E515F52454D4F56455F505249564154455F5245504F5254273A202752656D6F76652070726976617465207265706F7274205C2725305C273F272C0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(522) := '274C494234582E5744522E50542E544F4F4C4241522E53415645273A202753617665272C0D0A202020202020202020202020274C494234582E5744522E50542E544F4F4C4241522E4C4F4144273A20274C6F6164272C0D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(523) := '274C494234582E5744522E50542E544F4F4C4241522E44454C455445273A202744656C657465272C0D0A202020202020202020202020274C494234582E5744522E50542E544F4F4C4241522E4D4158494D495A45273A20274D6178696D697A65270D0A20';
wwv_flow_imp.g_varchar2_table(524) := '202020202020207D293B2020202020200D0A202020207D0D0A0D0A2020202066756E6374696F6E206765744D657373616765286B657929200D0A202020207B0D0A202020202020202072657475726E20617065782E6C616E672E6765744D657373616765';
wwv_flow_imp.g_varchar2_table(525) := '28274C494234582E5744522E50542E27202B206B6579293B0D0A202020207D202020200D0A0D0A202020202F2A0D0A20202020202A204D61696E20706C7567696E20696E69742066756E6374696F6E0D0A20202020202A2F0D0A202020206C657420696E';
wwv_flow_imp.g_varchar2_table(526) := '6974203D2066756E6374696F6E28616A61784964656E7469666965722C20707453746174696349642C207074496E7465726E616C49642C20704865696768742C2064744469616C6F6753746174696349642C2066696C74657273506167654974656D2C20';
wwv_flow_imp.g_varchar2_table(527) := '646563696D616C506C616365732C2064656661756C7453657474696E67732C20696E697446756E63290D0A202020207B0D0A20202020202020202F2F2064657269766520736C6963652066726F6D20616E7920676976656E2064656661756C7420726F77';
wwv_flow_imp.g_varchar2_table(528) := '732F636F6C756D6E732F6D6561737572657320696E2074686520706C7567696E20726567696F6E20617474726962757465730D0A202020202020202066756E6374696F6E20676574536C69636546726F6D44656661756C74732864656661756C74536574';
wwv_flow_imp.g_varchar2_table(529) := '74696E6773290D0A20202020202020207B0D0A2020202020202020202020206C65742064656661756C74536C696365203D207B7D3B0D0A0D0A20202020202020202020202066756E6374696F6E206164644974656D732870726F70290D0A202020202020';
wwv_flow_imp.g_varchar2_table(530) := '2020202020207B0D0A20202020202020202020202020202020696620284F626A6563742E6861734F776E2864656661756C7453657474696E67732C2070726F70292026262064656661756C7453657474696E67735B70726F705D290D0A20202020202020';
wwv_flow_imp.g_varchar2_table(531) := '2020202020202020207B0D0A202020202020202020202020202020202020202064656661756C74536C6963655B70726F705D203D205B5D3B0D0A20202020202020202020202020202020202020206C6574206974656D73203D2064656661756C74536574';
wwv_flow_imp.g_varchar2_table(532) := '74696E67735B70726F705D2E73706C697428222C22293B0D0A20202020202020202020202020202020202020206974656D732E666F7245616368286974656D203D3E207B0D0A2020202020202020202020202020202020202020202020206C657420656E';
wwv_flow_imp.g_varchar2_table(533) := '747279203D207B756E697175654E616D653A206974656D2E7472696D28297D3B0D0A2020202020202020202020202020202020202020202020206966202870726F70203D3D20276D65617375726573272026262064656661756C7453657474696E67732E';
wwv_flow_imp.g_varchar2_table(534) := '6167677265676174696F6E290D0A2020202020202020202020202020202020202020202020207B0D0A20202020202020202020202020202020202020202020202020202020656E7472792E6167677265676174696F6E203D2064656661756C7453657474';
wwv_flow_imp.g_varchar2_table(535) := '696E67732E6167677265676174696F6E3B0D0A2020202020202020202020202020202020202020202020207D0D0A20202020202020202020202020202020202020202020202064656661756C74536C6963655B70726F705D2E7075736828656E74727929';
wwv_flow_imp.g_varchar2_table(536) := '3B0D0A20202020202020202020202020202020202020207D293B20202020202020202020202020202020202020200D0A202020202020202020202020202020207D0D0A2020202020202020202020207D0D0A0D0A20202020202020202020202069662028';
wwv_flow_imp.g_varchar2_table(537) := '64656661756C7453657474696E6773290D0A2020202020202020202020207B0D0A202020202020202020202020202020206164644974656D732827726F777327293B0D0A202020202020202020202020202020206164644974656D732827636F6C756D6E';
wwv_flow_imp.g_varchar2_table(538) := '7327293B0D0A202020202020202020202020202020206164644974656D7328276D6561737572657327293B0D0A2020202020202020202020207D0D0A20202020202020202020202072657475726E204F626A6563742E6B6579732864656661756C74536C';
wwv_flow_imp.g_varchar2_table(539) := '696365292E6C656E67746820213D3D2030203F2064656661756C74536C696365203A206E756C6C3B0D0A20202020202020207D0D0A0D0A20202020202020202F2F206966206E6F2064656661756C7420666F726D617420636F6E66696775726564207965';
wwv_flow_imp.g_varchar2_table(540) := '742C206465726976652064656661756C7420776472206E756D62657220666F726D61742066726F6D2041504558206C6F63616C652073657474696E67730D0A202020202020202066756E6374696F6E20636F6E66696775726544656661756C74466F726D';
wwv_flow_imp.g_varchar2_table(541) := '6174287265706F7274290D0A20202020202020207B0D0A2020202020202020202020207265706F72742E666F726D617473203F3F3D205B5D3B0D0A2020202020202020202020206C65742064656661756C74466F726D6174203D207265706F72742E666F';
wwv_flow_imp.g_varchar2_table(542) := '726D6174732E66696E6428666F726D6174203D3E20666F726D61742E6E616D65203D3D3D202727293B0D0A202020202020202020202020696620282164656661756C74466F726D6174290D0A2020202020202020202020207B0D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(543) := '202020202020207265706F72742E666F726D6174732E70757368287B6E616D653A2027272C20646563696D616C506C616365733A20646563696D616C506C61636573203F204E756D62657228646563696D616C506C6163657329203A20322C2064656369';
wwv_flow_imp.g_varchar2_table(544) := '6D616C536570617261746F723A20617065782E6C6F63616C652E676574446563696D616C536570617261746F7228292C2074686F7573616E6473536570617261746F723A20617065782E6C6F63616C652E67657447726F7570536570617261746F722829';
wwv_flow_imp.g_varchar2_table(545) := '7D293B0D0A202020202020202020202020202020202F2F20696E207468656F72792C20646563696D616C506C616365732063616E20616C736F20626520636F6E66696775726564207573696E67202D3120284E4F4E45292E20496E207072616374697365';
wwv_flow_imp.g_varchar2_table(546) := '20746861742077696C6C2067697665206F6674656E206E756D62657273207265666C656374696E6720726F756E64696E67206572726F72732C20736F206C6F74206F6620646563696D616C732E0D0A2020202020202020202020207D2020202020202020';
wwv_flow_imp.g_varchar2_table(547) := '202020200D0A20202020202020207D0D0A0D0A2020202020202020696E69744D6573736167657328293B202020202020200D0A20202020202020206C657420707453746174696349645074203D2070745374617469634964202B205744525F50545F4558';
wwv_flow_imp.g_varchar2_table(548) := '543B0D0A20202020202020202F2F207461672074686520726567696F6E206173206265696E672061205744522050543B207573656420696E204353530D0A20202020202020202428272327202B2070745374617469634964292E616464436C6173732843';
wwv_flow_imp.g_varchar2_table(549) := '5F4C494234585F5744525F5054293B0D0A20202020202020206C6574206F7074696F6E73203D207B7D3B200D0A20202020202020206F7074696F6E732E64656661756C7453657474696E6773203D2064656661756C7453657474696E67733B0D0A202020';
wwv_flow_imp.g_varchar2_table(550) := '20202020206F7074696F6E732E77656264617461726F636B73203D207B7D3B202020200D0A202020202020202069662028696E697446756E63290D0A20202020202020207B0D0A2020202020202020202020202F2F2063616C6C20696E69742066756E63';
wwv_flow_imp.g_varchar2_table(551) := '74696F6E0D0A2020202020202020202020206F7074696F6E73203D20696E697446756E63286F7074696F6E73293B0D0A20202020202020202020202069662028216F7074696F6E73290D0A2020202020202020202020207B0D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(552) := '2020202020206F7074696F6E73203D207B7D3B0D0A2020202020202020202020207D0D0A20202020202020202020202069662028214F626A6563742E6861734F776E286F7074696F6E732C202777656264617461726F636B732729290D0A202020202020';
wwv_flow_imp.g_varchar2_table(553) := '2020202020207B0D0A202020202020202020202020202020206F7074696F6E732E77656264617461726F636B73203D207B7D3B20200D0A2020202020202020202020207D0D0A20202020202020207D0D0A20202020202020206966202821704865696768';
wwv_flow_imp.g_varchar2_table(554) := '742026262024282723272B70745374617469634964292E686173436C6173732827742D526567696F6E272929202F2F207374642074656D706C6174650D0A20202020202020207B0D0A20202020202020202020202070486569676874203D202731303025';
wwv_flow_imp.g_varchar2_table(555) := '273B0D0A20202020202020207D0D0A20202020202020202F2F20696E2063617365207048656967687420697320656D70747920616E6420726567696F6E2074656D706C6174652069732049522028742D4952522D726567696F6E292C205744522077696C';
wwv_flow_imp.g_varchar2_table(556) := '6C2075736520612064656661756C74206F662035303070780D0A202020202020202069662028704865696768742026262028214F626A6563742E6861734F776E286F7074696F6E732E77656264617461726F636B732C2027686569676874272929290D0A';
wwv_flow_imp.g_varchar2_table(557) := '20202020202020207B0D0A2020202020202020202020206F7074696F6E732E77656264617461726F636B732E686569676874203D20704865696768743B0D0A20202020202020207D0D0A20202020202020206C657420707444617461203D2077696E646F';
wwv_flow_imp.g_varchar2_table(558) := '775B2767507427202B207074496E7465726E616C4964202B202764617461275D3F2E646174613B20202020202020200D0A20202020202020202F2F207768656E20314D4220646174612073697A65206C696D69742069732065786365656465642C205744';
wwv_flow_imp.g_varchar2_table(559) := '522067697665732061202746696C6520697320746F6F206C6172676527206D65737361676520706F7075700D0A20202020202020202F2F20616C7465726E61746976656C792C206F7074696F6E732E636865636B4461746153697A652063616E20626520';
wwv_flow_imp.g_varchar2_table(560) := '73657420746F2074727565200D0A2020202020202020696620286F7074696F6E732E636865636B4461746153697A6520262620707444617461290D0A20202020202020207B0D0A2020202020202020202020202F2F206974206973206E6F7420646F6375';
wwv_flow_imp.g_varchar2_table(561) := '6D656E74656420686F7720574452206973206D6561737572696E6720746865206D656D6F72792073697A650D0A2020202020202020202020202F2F206C65747320737469636B20746F2062797465732073697A65206F66207468652066756C6C204A534F';
wwv_flow_imp.g_varchar2_table(562) := '4E0D0A2020202020202020202020206C65742073697A654279746573203D206E657720426C6F62285B4A534F4E2E737472696E6769667928707444617461295D292E73697A653B0D0A2020202020202020202020206966202873697A654279746573203E';
wwv_flow_imp.g_varchar2_table(563) := '2039373530303029202F2F2073746179206F6E20746865207361666520736964650D0A2020202020202020202020207B0D0A202020202020202020202020202020202F2F7468726F77206E6577204572726F7228275069766F74207461626C6520646174';
wwv_flow_imp.g_varchar2_table(564) := '61206578636565647320314D42202D2063616E206E6F7420626520616E616C797A656427293B0D0A20202020202020202020202020202020617065782E6D6573736167652E616C657274286765744D6573736167652827444154415F53495A455F455843';
wwv_flow_imp.g_varchar2_table(565) := '45454445445F4D45535341474527292C206E756C6C2C207B0D0A20202020202020202020202020202020202020207469746C653A206765744D6573736167652827444154415F53495A455F45584345454445445F5449544C4527292C0D0A202020202020';
wwv_flow_imp.g_varchar2_table(566) := '20202020202020202020202020207374796C653A20227761726E696E67222C0D0A202020202020202020202020202020202020202069636F6E436C61737365733A202266612066612D6578636C616D6174696F6E2D747269616E676C652066612D327822';
wwv_flow_imp.g_varchar2_table(567) := '0D0A202020202020202020202020202020207D293B0D0A2020202020202020202020202020202072657475726E3B0D0A2020202020202020202020207D0D0A20202020202020207D20200D0A20202020202020202F2F20676C6F62616C206F626A656374';
wwv_flow_imp.g_varchar2_table(568) := '20697320666F7220616C6C207265706F7274730D0A20202020202020206F7074696F6E732E77656264617461726F636B732E676C6F62616C203F3F3D207B7D3B0D0A20202020202020206F7074696F6E732E77656264617461726F636B732E676C6F6261';
wwv_flow_imp.g_varchar2_table(569) := '6C2E64617461536F75726365203D207B0D0A202020202020202020202020646174613A207074446174610D0A20202020202020207D3B0D0A20202020202020202F2F205365652057445220617661696C61626C65206C616E677561676573206F7574206F';
wwv_flow_imp.g_varchar2_table(570) := '662074686520626F783A2068747470733A2F2F7777772E77656264617461726F636B732E636F6D2F646F632F6A732F6C616E67756167652D6C6F63616C697A6174696F6E2F0D0A20202020202020202F2F20466F7220636F72726563742066756E637469';
wwv_flow_imp.g_varchar2_table(571) := '6F6E696E67206F66204472696C6C2D5468726F7567682C204150455820616E6420574452206C616E67756167652073686F756C64206265207468652073616D65206173205744520D0A20202020202020202F2F207061737365732073656C656374656420';
wwv_flow_imp.g_varchar2_table(572) := '6D6F6E74682061732063617074696F6E20616E64206E6F74206173206E756D6265720D0A202020202020202069662028214F626A6563742E6861734F776E286F7074696F6E732E77656264617461726F636B732E676C6F62616C2C20276C6F63616C697A';
wwv_flow_imp.g_varchar2_table(573) := '6174696F6E2729290D0A20202020202020207B0D0A2020202020202020202020206C6574206C616E6775616765203D20617065782E6C6F63616C652E6765744C616E677561676528292E73706C697428272D27295B305D3B0D0A20202020202020202020';
wwv_flow_imp.g_varchar2_table(574) := '2020696620285B276672272C20276465272C20276573272C20276974272C20276E6C272C20277072272C20277A68272C20277472272C2027706C272C20277572275D2E696E636C75646573286C616E677561676529290D0A202020202020202020202020';
wwv_flow_imp.g_varchar2_table(575) := '7B0D0A202020202020202020202020202020206F7074696F6E732E77656264617461726F636B732E676C6F62616C2E6C6F63616C697A6174696F6E203D202768747470733A2F2F63646E2E77656264617461726F636B732E636F6D2F6C6F632F27202B20';
wwv_flow_imp.g_varchar2_table(576) := '6C616E6775616765202B20272E6A736F6E273B0D0A2020202020202020202020207D0D0A20202020202020207D0D0A2020202020202020696620286F7074696F6E732E6D65746164617461290D0A20202020202020207B0D0A2020202020202020202020';
wwv_flow_imp.g_varchar2_table(577) := '202F2F205744522064617461736F75726365206D65746164617461206F626A6563740D0A2020202020202020202020206F7074696F6E732E77656264617461726F636B732E676C6F62616C2E64617461536F757263652E646174612E756E736869667428';
wwv_flow_imp.g_varchar2_table(578) := '6F7074696F6E732E6D65746164617461293B0D0A20202020202020207D20202020202020200D0A20202020202020206F7074696F6E732E77656264617461726F636B732E676C6F62616C2E6F7074696F6E73203F3F3D207B7D3B0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(579) := '2F2F204669656C6473204C69737420627574746F6E0D0A202020202020202069662028214F626A6563742E6861734F776E286F7074696F6E732E77656264617461726F636B732E676C6F62616C2E6F7074696F6E732C2027636F6E666967757261746F72';
wwv_flow_imp.g_varchar2_table(580) := '427574746F6E2729290D0A20202020202020207B20202020202020200D0A2020202020202020202020206F7074696F6E732E77656264617461726F636B732E676C6F62616C2E6F7074696F6E732E636F6E666967757261746F72427574746F6E203D2066';
wwv_flow_imp.g_varchar2_table(581) := '616C73653B0D0A20202020202020207D0D0A20202020202020202F2F2064617465207061747465726E0D0A202020202020202069662028214F626A6563742E6861734F776E286F7074696F6E732E77656264617461726F636B732E676C6F62616C2E6F70';
wwv_flow_imp.g_varchar2_table(582) := '74696F6E732C2027646174655061747465726E2729290D0A20202020202020207B20202020202020200D0A2020202020202020202020206C6574206F72636C44617465466F726D6174203D20617065782E6C6F63616C652E67657444617465466F726D61';
wwv_flow_imp.g_varchar2_table(583) := '7428293B0D0A202020202020202020202020696620286F72636C44617465466F726D6174290D0A2020202020202020202020207B0D0A202020202020202020202020202020206C65742077647244617465466F726D6174203D207574696C2E646174652E';
wwv_flow_imp.g_varchar2_table(584) := '6F7261636C65446174654D61736B546F576472466F726D6174286F72636C44617465466F726D6174293B0D0A202020202020202020202020202020206966202877647244617465466F726D6174290D0A202020202020202020202020202020207B0D0A20';
wwv_flow_imp.g_varchar2_table(585) := '202020202020202020202020202020202020206F7074696F6E732E77656264617461726F636B732E676C6F62616C2E6F7074696F6E732E646174655061747465726E203D2077647244617465466F726D61743B0D0A202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(586) := '207D0D0A2020202020202020202020207D0D0A20202020202020207D0D0A20202020202020202F2F206461746554696D655061747465726E0D0A202020202020202069662028214F626A6563742E6861734F776E286F7074696F6E732E77656264617461';
wwv_flow_imp.g_varchar2_table(587) := '726F636B732E676C6F62616C2E6F7074696F6E732C20276461746554696D655061747465726E2729290D0A20202020202020207B202020200D0A2020202020202020202020206C6574206F72636C44617465466F726D6174203D20617065782E6C6F6361';
wwv_flow_imp.g_varchar2_table(588) := '6C652E67657444617465466F726D617428293B0D0A202020202020202020202020696620286F72636C44617465466F726D6174290D0A2020202020202020202020207B0D0A202020202020202020202020202020206C6574206F72636C4461746554696D';
wwv_flow_imp.g_varchar2_table(589) := '65466F726D6174203D206F72636C44617465466F726D61743B0D0A2020202020202020202020202020202069662028216F72636C4461746554696D65466F726D61742E696E636C75646573282748482729290D0A20202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(590) := '7B0D0A20202020202020202020202020202020202020206F72636C4461746554696D65466F726D6174203D206F72636C4461746554696D65466F726D6174202B202720484832343A4D493A5353273B0D0A202020202020202020202020202020207D0D0A';
wwv_flow_imp.g_varchar2_table(591) := '202020202020202020202020202020206C6574207764724461746554696D65466F726D6174203D207574696C2E646174652E6F7261636C65446174654D61736B546F576472466F726D6174286F72636C4461746554696D65466F726D6174293B0D0A2020';
wwv_flow_imp.g_varchar2_table(592) := '2020202020202020202020202020696620287764724461746554696D65466F726D6174290D0A202020202020202020202020202020207B0D0A20202020202020202020202020202020202020206F7074696F6E732E77656264617461726F636B732E676C';
wwv_flow_imp.g_varchar2_table(593) := '6F62616C2E6F7074696F6E732E6461746554696D655061747465726E203D207764724461746554696D65466F726D61743B0D0A202020202020202020202020202020207D0D0A2020202020202020202020207D0D0A20202020202020207D0D0A20202020';
wwv_flow_imp.g_varchar2_table(594) := '202020202F2F20756E6C657373206578706C696369746C7920636F6E6669677572656420746F20747275652C20617373756D6520776520646F6E2774206E656564206472696C6C5468726F756768206173200D0A20202020202020202F2F206D6F73746C';
wwv_flow_imp.g_varchar2_table(595) := '792061207365727665722D73696465207072652D6167677265676174656420646174617365742077696C6C206265206C6F616465640D0A202020202020202069662028214F626A6563742E6861734F776E286F7074696F6E732E77656264617461726F63';
wwv_flow_imp.g_varchar2_table(596) := '6B732E676C6F62616C2E6F7074696F6E732C20276472696C6C5468726F7567682729290D0A20202020202020207B0D0A2020202020202020202020206F7074696F6E732E77656264617461726F636B732E676C6F62616C2E6F7074696F6E732E6472696C';
wwv_flow_imp.g_varchar2_table(597) := '6C5468726F756768203D2066616C73653B0D0A20202020202020207D0D0A20202020202020206F7074696F6E732E7072696D6172795265706F7274203F3F3D207B7D3B0D0A20202020202020206F7074696F6E732E7072696D6172795265706F72742E6C';
wwv_flow_imp.g_varchar2_table(598) := '69623478203D206F7074696F6E732E7072696D6172795265706F72742E6C69623478203F3F207B7D3B0D0A20202020202020206F7074696F6E732E7072696D6172795265706F72742E6C696234782E74797065203D20277072696D617279273B0D0A2020';
wwv_flow_imp.g_varchar2_table(599) := '2020202020206F7074696F6E732E7072696D6172795265706F72742E6F7074696F6E73203F3F3D207B7D3B0D0A20202020202020206C6574207265706F72744E616D65203D206F7074696F6E732E7072696D6172795265706F72742E6F7074696F6E732E';
wwv_flow_imp.g_varchar2_table(600) := '677269643F2E7469746C653B0D0A202020202020202069662028217265706F72744E616D65290D0A20202020202020207B0D0A2020202020202020202020206F7074696F6E732E7072696D6172795265706F72742E6F7074696F6E732E67726964203F3F';
wwv_flow_imp.g_varchar2_table(601) := '3D207B7D3B0D0A2020202020202020202020206F7074696F6E732E7072696D6172795265706F72742E6F7074696F6E732E677269642E7469746C65203D20275072696D617279205265706F7274273B0D0A20202020202020207D0D0A2020202020202020';
wwv_flow_imp.g_varchar2_table(602) := '6C657420736C696365203D20242E657874656E6428747275652C207B7D2C20676574536C69636546726F6D44656661756C7473286F7074696F6E732E64656661756C7453657474696E6773292C206F7074696F6E732E7072696D6172795265706F72742E';
wwv_flow_imp.g_varchar2_table(603) := '736C696365293B0D0A2020202020202020696620284F626A6563742E6B65797328736C696365292E6C656E677468203E203029200D0A20202020202020207B0D0A2020202020202020202020206F7074696F6E732E7072696D6172795265706F72742E73';
wwv_flow_imp.g_varchar2_table(604) := '6C696365203D20736C6963653B0D0A20202020202020207D0D0A2020202020202020636F6E66696775726544656661756C74466F726D6174286F7074696F6E732E7072696D6172795265706F7274293B0D0A20202020202020206F7074696F6E732E616C';
wwv_flow_imp.g_varchar2_table(605) := '7465726E61746976655265706F727473203D20286F7074696F6E732E616C7465726E61746976655265706F727473203F3F205B5D292E6D6170287265706F7274203D3E20287B0D0A2020202020202020202020202E2E2E7265706F72742C0D0A20202020';
wwv_flow_imp.g_varchar2_table(606) := '20202020202020206C696234783A207B0D0A202020202020202020202020202020202E2E2E287265706F72742E6C69623478203F3F207B7D292C0D0A20202020202020202020202020202020747970653A2022616C7465726E6174697665220D0A202020';
wwv_flow_imp.g_varchar2_table(607) := '2020202020202020207D0D0A20202020202020207D29293B0D0A20202020202020202F2F20636865636B207265706F7274207469746C65206861732076616C7565202B20636865636B2064656661756C7420666F726D61740D0A20202020202020206F70';
wwv_flow_imp.g_varchar2_table(608) := '74696F6E732E616C7465726E61746976655265706F7274732E666F724561636828287265706F72742C20696E64657829203D3E207B0D0A2020202020202020202020207265706F72742E6F7074696F6E73203F3F3D207B7D3B0D0A202020202020202020';
wwv_flow_imp.g_varchar2_table(609) := '2020207265706F72742E6F7074696F6E732E67726964203F3F3D207B7D3B0D0A2020202020202020202020202F2F207365742064656661756C74207469746C65206966206D697373696E67206F7220656D7074790D0A2020202020202020202020206966';
wwv_flow_imp.g_varchar2_table(610) := '2028217265706F72742E6F7074696F6E732E677269642E7469746C6529200D0A2020202020202020202020207B0D0A202020202020202020202020202020207265706F72742E6F7074696F6E732E677269642E7469746C65203D2060416C7465726E6174';
wwv_flow_imp.g_varchar2_table(611) := '697665205265706F727420247B696E646578202B20317D603B0D0A2020202020202020202020207D0D0A2020202020202020202020202F2F20636865636B2064656661756C7420666F726D61740D0A202020202020202020202020636F6E666967757265';
wwv_flow_imp.g_varchar2_table(612) := '44656661756C74466F726D6174287265706F7274293B202020202020202020202020202020202020202020200D0A20202020202020207D293B20202020202020200D0A20202020202020206F7074696F6E732E63757272656E745265706F7274203D206E';
wwv_flow_imp.g_varchar2_table(613) := '756C6C3B0D0A202020202020202069662028617065782E73746F726167652E6861734C6F63616C53746F72616765537570706F72742829290D0A20202020202020207B0D0A2020202020202020202020206C6574206C6F63616C53746F72616765203D20';
wwv_flow_imp.g_varchar2_table(614) := '617065782E73746F726167652E67657453636F7065644C6F63616C53746F72616765287B7072656669783A204C4F43414C5F53544F524147455F5052454649582C2075736541707049643A20747275652C207573655061676549643A20747275657D293B';
wwv_flow_imp.g_varchar2_table(615) := '0D0A202020202020202020202020696620286C6F63616C53746F72616765290D0A2020202020202020202020207B0D0A202020202020202020202020202020206C657420707269766174655265706F727473203D206C6F63616C53746F726167652E6765';
wwv_flow_imp.g_varchar2_table(616) := '744974656D2870745374617469634964202B20272E707269766174655265706F72747327293B0D0A202020202020202020202020202020206F7074696F6E732E707269766174655265706F727473203D2028707269766174655265706F727473203F204A';
wwv_flow_imp.g_varchar2_table(617) := '534F4E2E706172736528707269766174655265706F72747329203A205B5D292E6D6170287265706F7274203D3E20287B0D0A20202020202020202020202020202020202020202E2E2E7265706F72742C0D0A202020202020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(618) := '20206C696234783A207B0D0A2020202020202020202020202020202020202020202020202E2E2E287265706F72742E6C69623478203F3F207B7D292C0D0A202020202020202020202020202020202020202020202020747970653A202270726976617465';
wwv_flow_imp.g_varchar2_table(619) := '220D0A20202020202020202020202020202020202020207D0D0A202020202020202020202020202020207D29293B20200D0A202020202020202020202020202020206F7074696F6E732E63757272656E745265706F7274203D206C6F63616C53746F7261';
wwv_flow_imp.g_varchar2_table(620) := '67652E6765744974656D2870745374617469634964202B20272E63757272656E745265706F727427293B2020202020202020200D0A2020202020202020202020207D0D0A20202020202020207D2020202020202020200D0A20202020202020202F2F2063';
wwv_flow_imp.g_varchar2_table(621) := '726561746520726567696F6E20696E746572666163650D0A2020202020202020617065782E726567696F6E2E63726561746528707453746174696349642C207B0D0A202020202020202020202020747970653A20225744525069766F745461626C65222C';
wwv_flow_imp.g_varchar2_table(622) := '0D0A2020202020202020202020207769646765743A2066756E6374696F6E2829207B0D0A2020202020202020202020202020202072657475726E202428272327202B20707453746174696349645074293B0D0A2020202020202020202020207D2C0D0A20';
wwv_flow_imp.g_varchar2_table(623) := '20202020202020202020206765745069766F745461626C653A2066756E6374696F6E2829207B0D0A2020202020202020202020202020202072657475726E20746869732E77696467657428292E64617461282777656264617461726F636B7327293B0D0A';
wwv_flow_imp.g_varchar2_table(624) := '2020202020202020202020207D0D0A20202020202020207D293B200D0A20202020202020202F2F20696E697420616E79206472696C6C2D7468726F75676820696E6C696E65206469616C6F670D0A20202020202020206966202864744469616C6F675374';
wwv_flow_imp.g_varchar2_table(625) := '61746963496420262620212428272327202B2064744469616C6F675374617469634964292E636C6F7365737428272E75692D6469616C6F6727292E686173436C61737328435F4C494234585F50545F445429290D0A20202020202020207B0D0A20202020';
wwv_flow_imp.g_varchar2_table(626) := '20202020202020206472696C6C5468726F7567684D6F64756C652E696E69744469616C6F672864744469616C6F675374617469634964293B0D0A20202020202020207D0D0A20202020202020202F2F20696E6974207069766F74207461626C650D0A2020';
wwv_flow_imp.g_varchar2_table(627) := '2020202020206C657420707424203D202428272327202B20707453746174696349645074293B0D0A2020202020202020696620287074242E697328273A76697369626C652729290D0A20202020202020207B0D0A20202020202020202020202077656244';
wwv_flow_imp.g_varchar2_table(628) := '617461526F636B734D6F64756C652E696E6974505428616A61784964656E7469666965722C20707453746174696349642C207074537461746963496450742C207074496E7465726E616C49642C2064744469616C6F6753746174696349642C2066696C74';
wwv_flow_imp.g_varchar2_table(629) := '657273506167654974656D2C206F7074696F6E73293B0D0A20202020202020207D0D0A2020202020202020656C73650D0A20202020202020207B0D0A2020202020202020202020202F2F207768656E2074686520707420697320696E2061206E6F6E2D61';
wwv_flow_imp.g_varchar2_table(630) := '6374697665207461622C206F72206120636F6C6C617073656420726567696F6E2C206574632C207468656E200D0A2020202020202020202020202F2F20696E6974207468652070742075706F6E2067657474696E672076697369626C650D0A2020202020';
wwv_flow_imp.g_varchar2_table(631) := '20202020202020617065782E7769646765742E7574696C2E6F6E5669736962696C6974794368616E6765282428272327202B20707453746174696349645074292C2066756E6374696F6E2876697369626C65297B0D0A2020202020202020202020202020';
wwv_flow_imp.g_varchar2_table(632) := '20206966202876697369626C65202626207074242E64617461282777656264617461726F636B732729203D3D206E756C6C290D0A202020202020202020202020202020207B2020200D0A2020202020202020202020202020202020202020776562446174';
wwv_flow_imp.g_varchar2_table(633) := '61526F636B734D6F64756C652E696E6974505428616A61784964656E7469666965722C20707453746174696349642C207074537461746963496450742C207074496E7465726E616C49642C2064744469616C6F6753746174696349642C2066696C746572';
wwv_flow_imp.g_varchar2_table(634) := '73506167654974656D2C206F7074696F6E73293B0D0A202020202020202020202020202020207D0D0A2020202020202020202020207D293B0D0A20202020202020207D0D0A202020207D3B0D0A0D0A202020202F2F206C6F616420574452207374796C65';
wwv_flow_imp.g_varchar2_table(635) := '73686565740D0A202020206C6574206461726B4D6F6465203D20242827626F647927292E686173436C61737328435F415045585F5448454D455F564954415F4441524B293B0D0A202020206C65742066696C65726566203D20646F63756D656E742E6372';
wwv_flow_imp.g_varchar2_table(636) := '65617465456C656D656E7428226C696E6B22293B0D0A2020202066696C657265662E72656C203D20227374796C657368656574223B0D0A2020202066696C657265662E74797065203D2022746578742F637373223B0D0A2020202066696C657265662E68';
wwv_flow_imp.g_varchar2_table(637) := '726566203D206461726B4D6F6465203F200D0A20202020202020202768747470733A2F2F63646E2E77656264617461726F636B732E636F6D2F6C61746573742F7468656D652F6461726B2F77656264617461726F636B732E6D696E2E63737327203A200D';
wwv_flow_imp.g_varchar2_table(638) := '0A20202020202020202768747470733A2F2F63646E2E77656264617461726F636B732E636F6D2F6C61746573742F77656264617461726F636B732E6D696E2E637373273B0D0A20202020646F63756D656E742E676574456C656D656E747342795461674E';
wwv_flow_imp.g_varchar2_table(639) := '616D6528226865616422295B305D2E617070656E644368696C642866696C65726566293B200D0A20202020646F63756D656E742E646F63756D656E74456C656D656E742E7374796C652E73657450726F706572747928272D2D6C696234782D677269642D';
wwv_flow_imp.g_varchar2_table(640) := '626F726465722D636F6C6F72272C206461726B4D6F6465203F20272334323432343227203A20272364356435643527293B200D0A0D0A2020202072657475726E7B0D0A20202020202020205F696E69743A20696E69740D0A202020207D0D0A7D29286170';
wwv_flow_imp.g_varchar2_table(641) := '65782E6A5175657279293B';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(12213307124336647767)
,p_plugin_id=>wwv_flow_imp.id(12163302657156180788)
,p_file_name=>'js/lib4x-wdrpivottable.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260624210739Z')
,p_updated_on=>wwv_flow_imp.dz('20260624210739Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '77696E646F772E6C696234783D77696E646F772E6C696234787C7C7B7D2C77696E646F772E6C696234782E6178743D77696E646F772E6C696234782E6178747C7C7B7D2C77696E646F772E6C696234782E6178742E7764723D77696E646F772E6C696234';
wwv_flow_imp.g_varchar2_table(2) := '782E6178742E7764727C7C7B7D2C6C696234782E6178742E7764722E7069766F745461626C653D66756E6374696F6E2865297B636F6E737420743D226C696234782D70742D6474222C613D226C696234785F7764725F7074223B6C6574206F3D6E756C6C';
wwv_flow_imp.g_varchar2_table(3) := '3B65282866756E6374696F6E28297B6F3D617065782E6C6F63616C652E6765744D6F6E74684E616D657328292E726564756365282828652C742C61293D3E28655B742E746F4C6F7765724361736528295D3D537472696E6728612B31292E706164537461';
wwv_flow_imp.g_varchar2_table(4) := '727428322C223022292C6529292C7B7D297D29293B6C657420693D7B696E697450543A66756E6374696F6E28742C692C722C6C2C702C642C63297B6C657420753D65282223222B72292C673D77696E646F775B22675074222B6C2B2264617461225D3F2E';
wwv_flow_imp.g_varchar2_table(5) := '646174613B66756E6374696F6E206228297B72657475726E20752E64617461282277656264617461726F636B7322292E6765745265706F727428292E6F7074696F6E732E677269642E7469746C657D66756E6374696F6E206628297B72657475726E5B63';
wwv_flow_imp.g_varchar2_table(6) := '2E7072696D6172795265706F72742C2E2E2E632E616C7465726E61746976655265706F7274733F3F5B5D2C2E2E2E632E707269766174655265706F7274733F3F5B5D5D7D66756E6374696F6E206D2865297B72657475726E206628292E66696E64282874';
wwv_flow_imp.g_varchar2_table(7) := '3D3E742E6F7074696F6E732E677269642E7469746C653D3D3D6529297D66756E6374696F6E206828297B2270726976617465223D3D6D28622829292E6C696234782E747970653F752E66696E642822236C696234782D7461622D64656C6574657265706F';
wwv_flow_imp.g_varchar2_table(8) := '727422292E72656D6F7665436C617373282269732D64697361626C656422293A752E66696E642822236C696234782D7461622D64656C6574657265706F727422292E616464436C617373282269732D64697361626C656422297D66756E6374696F6E2052';
wwv_flow_imp.g_varchar2_table(9) := '2865297B6C657420743D7B676574436861727448656164696E673A66756E6374696F6E2874297B72657475726E2066756E6374696F6E28652C74297B743D743F3F5B5D2C41727261792E697341727261792874297C7C28743D5B745D293B6C657420613D';
wwv_flow_imp.g_varchar2_table(10) := '652E726F77732E636F6E63617428652E636F6C756D6E73292E66696C7465722828653D3E21742E696E636C7564657328652E686965726172636879556E697175654E616D652929292E6D61702828653D3E652E63617074696F6E29292E6A6F696E282220';
wwv_flow_imp.g_varchar2_table(11) := '2D2022293B72657475726E20617D28652C74297D2C6765744472696C6C5468726F75676848656164696E673A66756E6374696F6E28297B72657475726E20792865297D2C6765745472756E63446174653A66756E6374696F6E28742C61297B7265747572';
wwv_flow_imp.g_varchar2_table(12) := '6E2066756E6374696F6E28652C742C61297B6C657420693D6E756C6C3B613D28613F3F226D6F6E746822292E746F4C6F7765724361736528293B6C657420723D652E726F77732E636F6E63617428652E636F6C756D6E73292E66696C7465722828653D3E';
wwv_flow_imp.g_varchar2_table(13) := '652E686965726172636879556E697175654E616D652E7374617274735769746828742929292C6C3D722E66696E642828653D3E652E686965726172636879556E697175654E616D653D3D742B222E596561722229293F2E63617074696F6E2C6E3D722E66';
wwv_flow_imp.g_varchar2_table(14) := '696E642828653D3E652E686965726172636879556E697175654E616D653D3D742B222E4D6F6E74682229293F2E63617074696F6E2C733D722E66696E642828653D3E652E686965726172636879556E697175654E616D653D3D742B222E4461792229293F';
wwv_flow_imp.g_varchar2_table(15) := '2E63617074696F6E3B72657475726E22646179223D3D6126266C26266E262673262628693D6C2B222D222B6F5B6E2E746F4C6F7765724361736528295D2B222D222B732E706164537461727428322C223022292B225430303A30303A303022292C226D6F';
wwv_flow_imp.g_varchar2_table(16) := '6E7468223D3D6126266C26266E262628693D6C2B222D222B6F5B6E2E746F4C6F7765724361736528295D2B222D30315430303A30303A303022292C2279656172223D3D6126266C262628693D6C2B222D30312D30315430303A30303A303022292C697D28';
wwv_flow_imp.g_varchar2_table(17) := '652C742C61297D7D3B72657475726E20747D66756E6374696F6E20772865297B642626617065782E6974656D2864292E73657456616C7565284A534F4E2E737472696E67696679287B66696C746572733A657D29297D66756E6374696F6E20782865297B';
wwv_flow_imp.g_varchar2_table(18) := '636F6E737420743D652E73706C697428222E22293B72657475726E20742E6C656E6774683E313F742E736C6963652831292E6A6F696E2822202D2022293A657D66756E6374696F6E20792865297B6C657420743D6228292C613D652E726F77732E6D6170';
wwv_flow_imp.g_varchar2_table(19) := '2828653D3E7828652E756E697175654E616D652929292E6A6F696E2822202D2022297C7C22202D20222C6F3D652E636F6C756D6E732E6D61702828653D3E7828652E756E697175654E616D652929292E6A6F696E2822202D2022297C7C22202D20222C69';
wwv_flow_imp.g_varchar2_table(20) := '3D652E6C6162656C7C7C22202D20223B636F6E737420723D617065782E7574696C2E68746D6C4275696C64657228293B72657475726E20722E6D61726B757028223C64697622292E617474722822636C617373222C2264742D64657461696C732D636F6E';
wwv_flow_imp.g_varchar2_table(21) := '7461696E657222292E6D61726B757028223E3C7370616E22292E617474722822636C617373222C2264742D64657461696C732D6C6162656C22292E6D61726B757028223E3C623E22292E636F6E74656E7428225069766F74205265706F72743A2022292E';
wwv_flow_imp.g_varchar2_table(22) := '6D61726B757028223C2F623E22292E636F6E74656E742874292E6D61726B757028223C2F7370616E3E3C7370616E22292E617474722822636C617373222C2264742D64657461696C732D6C6162656C22292E6D61726B757028223E3C623E22292E636F6E';
wwv_flow_imp.g_varchar2_table(23) := '74656E742822526F773A2022292E6D61726B757028223C2F623E22292E636F6E74656E742861292E6D61726B757028223C2F7370616E3E3C7370616E22292E617474722822636C617373222C2264742D64657461696C732D6C6162656C22292E6D61726B';
wwv_flow_imp.g_varchar2_table(24) := '757028223E3C623E22292E636F6E74656E742822436F6C756D6E3A2022292E6D61726B757028223C2F623E22292E636F6E74656E74286F292E6D61726B757028223C2F7370616E3E3C7370616E22292E617474722822636C617373222C2264742D646574';
wwv_flow_imp.g_varchar2_table(25) := '61696C732D6C6162656C22292E6D61726B757028223E3C623E22292E636F6E74656E7428652E6D6561737572652E63617074696F6E2B223A2022292E6D61726B757028223C2F623E22292E636F6E74656E742869292E6D61726B757028223C2F7370616E';
wwv_flow_imp.g_varchar2_table(26) := '3E3C2F6469763E22292C722E746F537472696E6728297D66756E6374696F6E205428652C74297B6C657420613D5B5D3B696628742E636F6C756D6E732E636F6E63617428742E726F7773292E666F72456163682828653D3E7B652626612E70757368287B';
wwv_flow_imp.g_varchar2_table(27) := '6E616D653A652E686965726172636879556E697175654E616D652C747970653A2263656C6C222C6D656D626572733A5B652E756E697175654E616D655D2C6E65676174696F6E3A21317D297D29292C652E736C6963652E7265706F727446696C74657273';
wwv_flow_imp.g_varchar2_table(28) := '3F2E666F72456163682828653D3E7B652E66696C7465723F2E6D656D626572732626612E70757368287B6E616D653A652E756E697175654E616D652C747970653A227265706F7274222C6D656D626572733A652E66696C7465722E6D656D626572732C6E';
wwv_flow_imp.g_varchar2_table(29) := '65676174696F6E3A426F6F6C65616E28652E66696C7465722E6E65676174696F6E297D297D29292C652E736C6963652E636F6C756D6E732E636F6E63617428652E736C6963652E726F7773292E666F72456163682828653D3E7B653F2E66696C74657226';
wwv_flow_imp.g_varchar2_table(30) := '26612E70757368287B6E616D653A652E756E697175654E616D652C747970653A2264696D656E73696F6E222C6D656D626572733A652E66696C7465722E6D656D626572732C6E65676174696F6E3A426F6F6C65616E28652E66696C7465722E6E65676174';
wwv_flow_imp.g_varchar2_table(31) := '696F6E297D297D29292C632E6E6F726D616C697A6546696C74657273297B6C657420653D632E77656264617461726F636B732E676C6F62616C2E6F7074696F6E732E646174655061747465726E3B612E666F72456163682828743D3E7B6C657420613D66';
wwv_flow_imp.g_varchar2_table(32) := '756E6374696F6E2865297B653D652E73706C697428222E22295B305D3B6C657420743D6E756C6C3B696628673F2E6C656E6774683E30297B6C657420613D4F626A6563742E76616C75657328675B305D295B305D3B4F626A6563742E6861734F776E2861';
wwv_flow_imp.g_varchar2_table(33) := '2C22747970652229262628743D675B305D5B655D3F2E74797065297D72657475726E20747D28742E6E616D65292C693D742E6E616D652E656E64735769746828222E4D6F6E746822293F653D3E6F5B652E746F4C6F7765724361736528295D3F3F653A74';
wwv_flow_imp.g_varchar2_table(34) := '2E6E616D652E656E64735769746828222E44617922293F653D3E652E706164537461727428322C223022293A226461746520737472696E67223D3D613F743D3E6E2E646174652E776472546F49534F4461746528742C65293A22796561722F6D6F6E7468';
wwv_flow_imp.g_varchar2_table(35) := '2F646179223D3D617C7C22796561722F717561727465722F6D6F6E74682F646179223D3D613F653D3E6E2E646174652E6E6F726D616C697A654D756C74694C6576656C4461746528652C61293A6E756C6C3B69262628742E6D656D626572733D742E6D65';
wwv_flow_imp.g_varchar2_table(36) := '6D626572732E6D61702828653D3E652E7265706C616365282F5B5E2E5D2B242F2C69292929297D29297D72657475726E20617D6C657420453D632E77656264617461726F636B733B452E746F6F6C6261723D21303B6C657420763D6D28632E6375727265';
wwv_flow_imp.g_varchar2_table(37) := '6E745265706F7274293B767C7C28763D6628295B305D292C452E7265706F72743D762C452E746F6F6C626172262628452E6265666F7265746F6F6C626172637265617465643D66756E6374696F6E2874297B6C6574206F3D21312C723D65282223222B69';
wwv_flow_imp.g_varchar2_table(38) := '292E66696E6428222E6A732D6D6178696D697A65427574746F6E436F6E7461696E657220627574746F6E22293B722E6C656E6774683E30262628722E636C6F7365737428222E742D526567696F6E2D68656164657222292E697328223A68696464656E22';
wwv_flow_imp.g_varchar2_table(39) := '297C7C226162736F6C757465223D3D3D722E636C6F7365737428222E742D526567696F6E2D68656164657222292E6373732822706F736974696F6E2229292626286F3D2130292C752E64617461282277656264617461726F636B73746F6F6C626172222C';
wwv_flow_imp.g_varchar2_table(40) := '74293B6C6574206C3D742E6765745461627328293B6966286C3D6C2E66696C7465722828653D3E227764722D7461622D666F726D6174223D3D3D652E69647C7C227764722D7461622D6F7074696F6E73223D3D3D652E69647C7C227764722D7461622D66';
wwv_flow_imp.g_varchar2_table(41) := '69656C6473223D3D3D652E69647C7C227764722D7461622D6578706F7274223D3D3D652E69647C7C6F2626227764722D7461622D66756C6C73637265656E223D3D3D652E696429292C6C2E756E7368696674287B69643A226C696234782D7461622D7361';
wwv_flow_imp.g_varchar2_table(42) := '76657265706F7274222C7469746C653A732822544F4F4C4241522E5341564522292C68616E646C65723A66756E6374696F6E206528297B6C657420743D752E64617461282277656264617461726F636B7322292C6F3D742E6765745265706F727428292E';
wwv_flow_imp.g_varchar2_table(43) := '6F7074696F6E732E677269642E7469746C652C723D22223B2270726976617465223D3D3D6D286F292E6C696234782E74797065262628723D6F292C617065782E6D6573736167652E73686F774469616C6F6728273C64697620636C6173733D2269732D72';
wwv_flow_imp.g_varchar2_table(44) := '65717569726564223E3C6C6162656C20666F723D226C696234785F70745F736176655265706F72744E616D652220636C6173733D22742D466F726D2D6C6162656C223E4E616D653C2F6C6162656C3E203C696E70757420747970653D2274657874222069';
wwv_flow_imp.g_varchar2_table(45) := '643D226C696234785F70745F736176655265706F72744E616D65222076616C75653D22272B722B272220726571756972656420636C6173733D22617065782D6974656D2D7465787422207374796C653D2277696474683A20313030253B223E3C2F646976';
wwv_flow_imp.g_varchar2_table(46) := '3E272C7B7469746C653A732822534156455F5049564F545F5245504F525422292C756E736166653A21312C636F6E6669726D3A21302C6F70656E3A66756E6374696F6E2865297B7D2C63616C6C6261636B3A66756E6374696F6E286F297B6966286F297B';
wwv_flow_imp.g_varchar2_table(47) := '6C6574206F3D617065782E7574696C2E676574546F704170657828292E6A51756572792822236C696234785F70745F736176655265706F72744E616D6522292E76616C28293B6966286F297B6C657420653D742E6765745265706F727428292C723D4A53';
wwv_flow_imp.g_varchar2_table(48) := '4F4E2E7061727365284A534F4E2E737472696E67696679286529293B722E64617461536F75726365262664656C65746520722E64617461536F757263653B6C6574206C3D21312C6E3D6D286F293B6966286E296966282270726976617465223D3D3D6E2E';
wwv_flow_imp.g_varchar2_table(49) := '6C696234782E74797065297B4F626A6563742E6B657973286E292E666F72456163682828653D3E7B226C6962347822213D3D65262664656C657465206E5B655D7D29292C4F626A6563742E61737369676E286E2C72292C6E2E6F7074696F6E732E677269';
wwv_flow_imp.g_varchar2_table(50) := '642E7469746C653D6F3B6C657420653D742E6765744F7074696F6E7328293B652E677269642E7469746C653D6F2C742E7365744F7074696F6E732865292C742E7265667265736828292C6C3D21302C6828297D656C736520617065782E6D657373616765';
wwv_flow_imp.g_varchar2_table(51) := '2E616C65727428617065782E6C616E672E666F726D61744E6F45736361706528732822534156455F5245504F52545F57524F4E475F5459504522292C6F2C6E2E6C696234782E7479706529293B656C73657B6C657420653D742E6765744F7074696F6E73';
wwv_flow_imp.g_varchar2_table(52) := '28293B652E677269642E7469746C653D6F2C742E7365744F7074696F6E732865292C742E7265667265736828292C722E6C696234783D7B747970653A2270726976617465227D2C722E6F7074696F6E732E677269642E7469746C653D6F2C632E70726976';
wwv_flow_imp.g_varchar2_table(53) := '6174655265706F7274732E707573682872292C6C3D21302C6828297D6966286C2626617065782E73746F726167652E6861734C6F63616C53746F72616765537570706F72742829297B6C657420653D617065782E73746F726167652E67657453636F7065';
wwv_flow_imp.g_varchar2_table(54) := '644C6F63616C53746F72616765287B7072656669783A612C75736541707049643A21302C7573655061676549643A21307D293B65262628652E7365744974656D28692B222E707269766174655265706F727473222C4A534F4E2E737472696E6769667928';
wwv_flow_imp.g_varchar2_table(55) := '632E707269766174655265706F72747329292C652E7365744974656D28692B222E63757272656E745265706F7274222C6F292C617065782E6D6573736167652E73686F77506167655375636365737328732822505249564154455F5245504F52545F5341';
wwv_flow_imp.g_varchar2_table(56) := '564544222929297D7D656C73652073657454696D656F7574282828293D3E7B6528297D29297D7D7D297D2C69636F6E3A742E69636F6E732E736176657D2C7B69643A226C696234782D7461622D6C6F61647265706F7274222C7469746C653A732822544F';
wwv_flow_imp.g_varchar2_table(57) := '4F4C4241522E4C4F414422292C68616E646C65723A66756E6374696F6E28297B6C657420653D752E64617461282277656264617461726F636B7322292C743D652E6765745265706F727428292E6F7074696F6E732E677269642E7469746C652C6F3D5B63';
wwv_flow_imp.g_varchar2_table(58) := '2E7072696D6172795265706F72742C2E2E2E632E616C7465726E61746976655265706F7274735D2C723D6F2E6D6170282828652C61293D3E7B6C6574206F3D652E6F7074696F6E732E677269642E7469746C653B72657475726E603C6F7074696F6E2024';
wwv_flow_imp.g_varchar2_table(59) := '7B6F3D3D3D743F2273656C6563746564223A22227D2076616C75653D22247B617D223E247B6F7D3C2F6F7074696F6E3E607D29292E6A6F696E282222292C6C3D6F2E6C656E6774682C6E3D632E707269766174655265706F7274732E6D6170282828652C';
wwv_flow_imp.g_varchar2_table(60) := '61293D3E7B6C6574206F3D652E6F7074696F6E732E677269642E7469746C653B72657475726E603C6F7074696F6E20247B6F3D3D3D743F2273656C6563746564223A22227D2076616C75653D22247B6C2B617D223E247B6F7D3C2F6F7074696F6E3E607D';
wwv_flow_imp.g_varchar2_table(61) := '29292E6A6F696E282222293B617065782E6D6573736167652E73686F774469616C6F6728273C6469763E3C73656C6563742069643D226C696234785F70745F6C6F61645265706F72744E616D652220636C6173733D2273656C6563746C69737420617065';
wwv_flow_imp.g_varchar2_table(62) := '782D6974656D2D73656C65637422207374796C653D2277696474683A20313030253B2220646174612D6E61746976652D6D656E753D2266616C7365222073697A653D2231223E3C6F707467726F7570206C6162656C3D2244656661756C74223E272B722B';
wwv_flow_imp.g_varchar2_table(63) := '273C2F6F707467726F75703E3C6F707467726F7570206C6162656C3D2250726976617465223E272B6E2B223C2F6F707467726F75703E3C2F73656C6563743E3C2F6469763E222C7B7469746C653A7328224C4F41445F5049564F545F5245504F52542229';
wwv_flow_imp.g_varchar2_table(64) := '2C756E736166653A21312C636F6E6669726D3A21302C6F70656E3A66756E6374696F6E2865297B7D2C63616C6C6261636B3A66756E6374696F6E2874297B69662874297B6C657420743D617065782E7574696C2E676574546F704170657828292E6A5175';
wwv_flow_imp.g_varchar2_table(65) := '6572792822236C696234785F70745F6C6F61645265706F72744E616D6522292E76616C28293B696628742626652E6765745265706F72742829297B6C6574206F3D6628295B4E756D6265722874295D3B696628652E7365745265706F7274286F292C6170';
wwv_flow_imp.g_varchar2_table(66) := '65782E73746F726167652E6861734C6F63616C53746F72616765537570706F72742829297B6C657420653D617065782E73746F726167652E67657453636F7065644C6F63616C53746F72616765287B7072656669783A612C75736541707049643A21302C';
wwv_flow_imp.g_varchar2_table(67) := '7573655061676549643A21307D293B652626652E7365744974656D28692B222E63757272656E745265706F7274222C6F2E6F7074696F6E732E677269642E7469746C65297D7D7D7D7D297D2C69636F6E3A742E69636F6E732E6F70656E5F6C6F63616C7D';
wwv_flow_imp.g_varchar2_table(68) := '2C7B69643A226C696234782D7461622D64656C6574657265706F7274222C7469746C653A732822544F4F4C4241522E44454C45544522292C68616E646C65723A66756E6374696F6E28297B6C657420653D752E64617461282277656264617461726F636B';
wwv_flow_imp.g_varchar2_table(69) := '7322292C743D652E6765745265706F727428292E6F7074696F6E732E677269642E7469746C652C6F3D6D2874293B6F26262270726976617465223D3D3D6F2E6C696234782E747970652626617065782E6D6573736167652E636F6E6669726D2861706578';
wwv_flow_imp.g_varchar2_table(70) := '2E6C616E672E666F726D61744E6F45736361706528732822515F52454D4F56455F505249564154455F5245504F525422292C74292C2866756E6374696F6E286F297B6F262666756E6374696F6E2874297B69662874297B632E707269766174655265706F';
wwv_flow_imp.g_varchar2_table(71) := '7274733D632E707269766174655265706F7274732E66696C7465722828653D3E652E6F7074696F6E732E677269642E7469746C65213D3D7429293B6C6574206F3D6628295B305D3B696628652E7365745265706F7274286F292C617065782E73746F7261';
wwv_flow_imp.g_varchar2_table(72) := '67652E6861734C6F63616C53746F72616765537570706F72742829297B6C657420653D617065782E73746F726167652E67657453636F7065644C6F63616C53746F72616765287B7072656669783A612C75736541707049643A21302C7573655061676549';
wwv_flow_imp.g_varchar2_table(73) := '643A21307D293B65262628652E7365744974656D28692B222E707269766174655265706F727473222C4A534F4E2E737472696E6769667928632E707269766174655265706F72747329292C652E7365744974656D28692B222E63757272656E745265706F';
wwv_flow_imp.g_varchar2_table(74) := '7274222C6F2E6F7074696F6E732E677269642E7469746C65292C617065782E6D6573736167652E73686F775061676553756363657373287328225245504F52545F44454C45544544222929297D7D7D2874297D29297D2C69636F6E3A273C6920636C6173';
wwv_flow_imp.g_varchar2_table(75) := '733D2266612066612D74726173682D6F22207374796C653D22666F6E742D73697A653A313970783B223E3C2F693E277D292C6F297B6C657420653D6C2E66696E642828653D3E227764722D7461622D66756C6C73637265656E223D3D3D652E696429293B';
wwv_flow_imp.g_varchar2_table(76) := '652E69643D226C696234782D7461622D66756C6C73637265656E222C652E7469746C653D732822544F4F4C4241522E4D4158494D495A4522292C652E68616E646C65723D66756E6374696F6E28297B722E636C69636B28292C73657454696D656F757428';
wwv_flow_imp.g_varchar2_table(77) := '2828293D3E7B752E64617461282277656264617461726F636B7322292E7265667265736828297D292C353030297D7D742E676574546162733D66756E6374696F6E28297B72657475726E206C7D3B6C6574206E3D7B746F6F6C6261723A747D3B61706578';
wwv_flow_imp.g_varchar2_table(78) := '2E6576656E742E7472696767657228752C226C696234786265666F7265746F6F6C62617263726561746564222C6E292C6C2E666F7245616368282828652C74293D3E7B652E69636F6E3D652E69636F6E2E7265706C616365282777696474683D22333622';
wwv_flow_imp.g_varchar2_table(79) := '272C2777696474683D2232302227292C652E69636F6E3D652E69636F6E2E7265706C61636528276865696768743D22333622272C276865696768743D2232302227297D29297D292C452E63656C6C636C69636B3D66756E6374696F6E2874297B6C657420';
wwv_flow_imp.g_varchar2_table(80) := '613D752E64617461282277656264617461726F636B7322292C6F3D5428612E6765745265706F727428292C74293B77286F293B6C657420693D7B63656C6C3A742C73656C656374656443656C6C733A612E67657453656C656374656443656C6C28292C66';
wwv_flow_imp.g_varchar2_table(81) := '696C746572733A6F2C7574696C3A522874297D3B617065782E6576656E742E747269676765722865282223222B72292C226C6962347863656C6C636C69636B222C69297D2C452E63656C6C646F75626C65636C69636B3D66756E6374696F6E2874297B69';
wwv_flow_imp.g_varchar2_table(82) := '6628742E6D65617375726526262276616C7565223D3D3D742E747970652626214E756D6265722E69734E614E28742E76616C756529297B6C657420613D792874292C6F3D5428752E64617461282277656264617461726F636B7322292E6765745265706F';
wwv_flow_imp.g_varchar2_table(83) := '727428292C74293B77286F293B6C657420693D7B63656C6C3A742C66696C746572733A6F2C7574696C3A522874297D3B696628617065782E6576656E742E747269676765722865282223222B72292C226C6962347863656C6C64626C636C69636B222C69';
wwv_flow_imp.g_varchar2_table(84) := '292C70262622666C617422213D752E64617461282277656264617461726F636B7322292E6765745265706F727428292E6F7074696F6E732E677269642E74797065297B65282223222B702B22202E70742D64742D68656164657222292E68746D6C286129';
wwv_flow_imp.g_varchar2_table(85) := '3B6C657420743D65282223222B702B22202E70742D64742D7265706F727422292E617474722822696422293B74262628617065782E726567696F6E2874292E7265667265736828292C617065782E7468656D652E6F70656E526567696F6E287029297D7D';
wwv_flow_imp.g_varchar2_table(86) := '7D3B6C657420443D752E77656264617461726F636B732845292C4F3D21303B442E6F6E28227265706F7274636F6D706C657465222C2866756E6374696F6E28297B6828292C4F2626284F3D21312C73657454696D656F7574282828293D3E7B442E726566';
wwv_flow_imp.g_varchar2_table(87) := '7265736828297D292C35303029297D29292C652877696E646F77292E6F6E2822726573697A652E6C696234785F7074222C2866756E6374696F6E28297B617065782E7574696C2E6465626F756E6365282828293D3E7B442E7265667265736828297D292C';
wwv_flow_imp.g_varchar2_table(88) := '313030297D29297D7D2C723D7B696E69744469616C6F673A66756E6374696F6E2861297B6966282165282223222B61292E697328223A75692D6469616C6F672229297468726F77206E6577204572726F7228224472696C6C2D5468726F75676820726567';
wwv_flow_imp.g_varchar2_table(89) := '696F6E2073686F756C6420626520616E20696E6C696E65204469616C6F67206F72204472617765722028222B612B222922293B6C6574206F3D65282223222B61293B6F2E636C6F7365737428222E75692D6469616C6F6722292E616464436C6173732874';
wwv_flow_imp.g_varchar2_table(90) := '292C6F2E63737328226F766572666C6F77222C2268696464656E22293B6C657420693D6F2E66696E6428222E742D4469616C6F67526567696F6E2D626F64792C202E742D447261776572526567696F6E2D626F647922292C723D6F2E66696E6428222E74';
wwv_flow_imp.g_varchar2_table(91) := '2D4469616C6F67526567696F6E2D626F6479577261707065724F75742C202E742D447261776572526567696F6E2D626F6479577261707065724F757422293B722E63737328226F766572666C6F77222C2268696464656E22293B6C6574206C3D692E696E';
wwv_flow_imp.g_varchar2_table(92) := '6E657248656967687428292D692E68656967687428292C6E3D692E696E6E6572576964746828292D692E776964746828293B6F2E6469616C6F67282277696467657422292C6F2E6469616C6F6728226F7074696F6E222C7B77696474683A4D6174682E66';
wwv_flow_imp.g_varchar2_table(93) := '6C6F6F72282E39352A77696E646F772E696E6E65725769647468292C6865696768743A4D6174682E666C6F6F72282E382A77696E646F772E696E6E6572486569676874297D292C6F2E6469616C6F6728226F7074696F6E222C22706F736974696F6E222C';
wwv_flow_imp.g_varchar2_table(94) := '7B6D793A226C656674222C61743A226C656674222C6F663A77696E646F777D292C6F2E6469616C6F6728226F7074696F6E222C22706F736974696F6E222C7B6D793A2263656E746572222C61743A2263656E746572222C6F663A77696E646F777D292C6F';
wwv_flow_imp.g_varchar2_table(95) := '2E6469616C6F6728226F7074696F6E222C22706F736974696F6E222C7B6D793A22746F70222C61743A22746F702B222B4D6174682E666C6F6F722877696E646F772E696E6E65724865696768742A2828312D2E38292F322A2E383529292C6F663A77696E';
wwv_flow_imp.g_varchar2_table(96) := '646F777D292C6F2E6F6E28226469616C6F67726573697A65222C617065782E7574696C2E6465626F756E6365282828293D3E7B6C657420743D6F2E66696E6428222E612D4952522D7461626C65436F6E7461696E657222293B696628742E6C656E677468';
wwv_flow_imp.g_varchar2_table(97) := '297B6C657420693D65282223222B612B22202E70742D64742D68656164657222292E6F75746572486569676874282130297C7C302C733D6F2E66696E6428222E612D4952522D746F6F6C62617222292E6F75746572486569676874282130297C7C302C70';
wwv_flow_imp.g_varchar2_table(98) := '3D6F2E66696E6428222E612D4952522D636F6E74726F6C73436F6E7461696E657222292E6F75746572486569676874282130297C7C302C643D6F2E66696E6428222E612D4952522D706167696E6174696F6E5772617022292E6F75746572486569676874';
wwv_flow_imp.g_varchar2_table(99) := '282130297C7C303B742E637373287B6D61784865696768743A722E68656967687428292D6C2D692D732D702D642D332B227078222C77696474683A226175746F222C6D617857696474683A6F2E776964746828292D6E2D322B227078227D297D7D292C31';
wwv_flow_imp.g_varchar2_table(100) := '303029292C617065782E7769646765742E7574696C2E6F6E5669736962696C6974794368616E67652865282223222B61292C2866756E6374696F6E2865297B65262673657454696D656F7574282828293D3E7B6F2E7472696767657228226469616C6F67';
wwv_flow_imp.g_varchar2_table(101) := '726573697A6522297D292C3530297D29293B6C657420733D65282223222B612B22202E70742D64742D7265706F727422292E617474722822696422293B73262665282223222B73292E6F6E282261706578616674657272656672657368222C2866756E63';
wwv_flow_imp.g_varchar2_table(102) := '74696F6E28297B73657454696D656F7574282828293D3E7B6F2E7472696767657228226469616C6F67726573697A6522297D292C3530297D29292C652877696E646F77292E6F6E2822726573697A652E6C696234785F7376222C2866756E6374696F6E28';
wwv_flow_imp.g_varchar2_table(103) := '297B73657454696D656F7574282828293D3E7B65282223222B612B223A76697369626C6522292E7472696767657228226469616C6F67726573697A6522297D292C3530297D29297D7D3B6C3D22612D4952522D6469616C6F67222C6528617065782E6750';
wwv_flow_imp.g_varchar2_table(104) := '616765436F6E7465787424292E6F6E28226469616C6F67637265617465222C2866756E6374696F6E28742C61297B6C6574206F3D6528742E746172676574293B286E756C6C3D3D6C7C7C6F2E636C6F7365737428222E75692D6469616C6F6722292E6861';
wwv_flow_imp.g_varchar2_table(105) := '73436C617373286C2929262673657454696D656F7574282828293D3E7B6966286528222E75692D7769646765742D6F7665726C617922292E6C656E6774683E31297B6C657420743D303B6528222E75692D7769646765742D6F7665726C617922292E6E6F';
wwv_flow_imp.g_varchar2_table(106) := '7428223A6C61737422292E65616368282866756E6374696F6E28297B6C657420613D7061727365496E7428652874686973292E63737328227A2D696E6465782229293B743D613E743F613A747D29292C7061727365496E74286528222E75692D77696467';
wwv_flow_imp.g_varchar2_table(107) := '65742D6F7665726C617922292E6C61737428292E63737328227A2D696E6465782229293C3D742626286528222E75692D7769646765742D6F7665726C617922292E6C61737428292E63737328227A2D696E646578222C742B31292C6F2E6469616C6F6728';
wwv_flow_imp.g_varchar2_table(108) := '226D6F7665546F546F702229297D7D292C3130297D29293B766172206C3B6C6574206E3D7B646174653A7B6F7261636C65446174654D61736B546F576472466F726D61743A66756E6374696F6E2865297B2F5C6244535C622F672E746573742865292626';
wwv_flow_imp.g_varchar2_table(109) := '28653D652E7265706C616365282F5C6244535C622F67692C617065782E6C6F63616C652E676574445344617465466F726D6174282929292C2F5C62444C5C622F672E74657374286529262628653D652E7265706C616365282F5C62444C5C622F67692C61';
wwv_flow_imp.g_varchar2_table(110) := '7065782E6C6F63616C652E676574444C44617465466F726D6174282929293B636F6E737420743D66756E6374696F6E2865297B636F6E737420743D7B595959593A2279797979222C525252523A2279797979222C52523A227979222C59593A227979222C';
wwv_flow_imp.g_varchar2_table(111) := '4D4F4E54483A224D4D4D4D222C4D4F4E3A224D4D4D222C4D4D3A224D4D222C4441593A226464222C44593A226464222C44443A226464222C484832343A224848222C484831323A224848222C48483A224848222C4D493A226D6D222C53533A227373222C';
wwv_flow_imp.g_varchar2_table(112) := '414D3A22222C504D3A22227D3B6C657420613D22223B666F7228636F6E7374206F206F66206529226C69746572616C22213D3D6F2E747970653F745B6F2E76616C75655D262628612B3D745B6F2E76616C75655D293A612B3D6F2E76616C75653B726574';
wwv_flow_imp.g_varchar2_table(113) := '75726E20617D2866756E6374696F6E2865297B636F6E737420743D5B2259595959222C2252525252222C225252222C225959222C224D4F4E5448222C224D4F4E222C224D4D222C22444159222C224459222C224444222C2248483234222C224848313222';
wwv_flow_imp.g_varchar2_table(114) := '2C224848222C224D49222C225353222C22414D222C22504D222C224453222C22444C225D3B742E736F7274282828652C74293D3E742E6C656E6774682D652E6C656E67746829293B6C657420613D5B5D2C6F3D302C693D21313B636F6E737420723D652E';
wwv_flow_imp.g_varchar2_table(115) := '746F55707065724361736528293B666F72283B6F3C652E6C656E6774683B297B69662822464D223D3D3D722E737562737472286F2C3229297B693D21302C6F2B3D323B636F6E74696E75657D6966282722273D3D3D655B6F5D297B6C657420743D652E69';
wwv_flow_imp.g_varchar2_table(116) := '6E6465784F66282722272C6F2B31293B2D313D3D3D74262628743D652E6C656E6774682D31292C612E70757368287B747970653A226C69746572616C222C76616C75653A652E737562737472696E67286F2C742B31297D292C6F3D742B313B636F6E7469';
wwv_flow_imp.g_varchar2_table(117) := '6E75657D6C6574206C3D21313B666F7228636F6E73742065206F66207429696628722E7374617274735769746828652C6F29297B612E70757368287B747970653A22746F6B656E222C76616C75653A652C666D3A697D292C693D21312C6F2B3D652E6C65';
wwv_flow_imp.g_varchar2_table(118) := '6E6774682C6C3D21303B627265616B7D6C7C7C28612E70757368287B747970653A226C69746572616C222C76616C75653A655B6F5D7D292C6F2B2B297D72657475726E20617D286529293B72657475726E20747D2C776472546F49534F446174653A6675';
wwv_flow_imp.g_varchar2_table(119) := '6E6374696F6E28652C74297B636F6E737420613D742E73706C6974282F5B5C2F2E2D5D2F292C6F3D652E73706C6974282F5B5C2F2E2D5D2F293B6C657420692C722C6C3B72657475726E20612E666F7245616368282828652C74293D3E7B737769746368';
wwv_flow_imp.g_varchar2_table(120) := '2865297B63617365226464223A693D6F5B745D3B627265616B3B63617365224D4D223A723D6F5B745D3B627265616B3B636173652279797979223A63617365227979223A6C3D6F5B745D7D7D29292C693D692E706164537461727428322C223022292C72';
wwv_flow_imp.g_varchar2_table(121) := '3D722E706164537461727428322C223022292C60247B6C7D2D247B727D2D247B697D607D2C6E6F726D616C697A654D756C74694C6576656C446174653A66756E6374696F6E28652C74297B636F6E737420613D652E73706C697428222F22293B6C657420';
wwv_flow_imp.g_varchar2_table(122) := '693D5B5D3B69662822796561722F6D6F6E74682F646179223D3D3D74297B636F6E73745B652C742C725D3D613B692E707573682865292C742626692E70757368286F5B742E746F4C6F7765724361736528295D7C7C537472696E672874292E7061645374';
wwv_flow_imp.g_varchar2_table(123) := '61727428322C22302229292C722626692E7075736828537472696E672872292E706164537461727428322C22302229297D69662822796561722F717561727465722F6D6F6E74682F646179223D3D3D74297B636F6E73745B652C742C722C6C5D3D613B69';
wwv_flow_imp.g_varchar2_table(124) := '6628692E707573682865292C74297B636F6E737420653D742E6D61746368282F5C642B2F293F2E5B305D3B652626692E707573682865297D722626692E70757368286F5B722E746F4C6F7765724361736528295D7C7C537472696E672872292E70616453';
wwv_flow_imp.g_varchar2_table(125) := '7461727428322C22302229292C6C2626692E7075736828537472696E67286C292E706164537461727428322C22302229297D72657475726E20692E6A6F696E28222F22297D7D7D3B66756E6374696F6E20732865297B72657475726E20617065782E6C61';
wwv_flow_imp.g_varchar2_table(126) := '6E672E6765744D65737361676528224C494234582E5744522E50542E222B65297D6C657420703D652822626F647922292E686173436C6173732822617065782D7468656D652D766974612D6461726B22292C643D646F63756D656E742E63726561746545';
wwv_flow_imp.g_varchar2_table(127) := '6C656D656E7428226C696E6B22293B72657475726E20642E72656C3D227374796C657368656574222C642E747970653D22746578742F637373222C642E687265663D703F2268747470733A2F2F63646E2E77656264617461726F636B732E636F6D2F6C61';
wwv_flow_imp.g_varchar2_table(128) := '746573742F7468656D652F6461726B2F77656264617461726F636B732E6D696E2E637373223A2268747470733A2F2F63646E2E77656264617461726F636B732E636F6D2F6C61746573742F77656264617461726F636B732E6D696E2E637373222C646F63';
wwv_flow_imp.g_varchar2_table(129) := '756D656E742E676574456C656D656E747342795461674E616D6528226865616422295B305D2E617070656E644368696C642864292C646F63756D656E742E646F63756D656E74456C656D656E742E7374796C652E73657450726F706572747928222D2D6C';
wwv_flow_imp.g_varchar2_table(130) := '696234782D677269642D626F726465722D636F6C6F72222C703F2223343234323432223A222364356435643522292C7B5F696E69743A66756E6374696F6E286F2C6C2C702C642C632C752C672C622C66297B66756E6374696F6E206D2865297B652E666F';
wwv_flow_imp.g_varchar2_table(131) := '726D6174733F3F3D5B5D2C652E666F726D6174732E66696E642828653D3E22223D3D3D652E6E616D6529297C7C652E666F726D6174732E70757368287B6E616D653A22222C646563696D616C506C616365733A673F4E756D6265722867293A322C646563';
wwv_flow_imp.g_varchar2_table(132) := '696D616C536570617261746F723A617065782E6C6F63616C652E676574446563696D616C536570617261746F7228292C74686F7573616E6473536570617261746F723A617065782E6C6F63616C652E67657447726F7570536570617261746F7228297D29';
wwv_flow_imp.g_varchar2_table(133) := '7D617065782E6C616E672E6164644D65737361676573287B224C494234582E5744522E50542E444154415F53495A455F45584345454445445F5449544C45223A224C6F6164204572726F72222C224C494234582E5744522E50542E444154415F53495A45';
wwv_flow_imp.g_varchar2_table(134) := '5F45584345454445445F4D455353414745223A22546865206461746173657420697320746F6F206C6172676520746F20646973706C617920696E20746865207069766F74207461626C652E222C224C494234582E5744522E50542E505249564154455F52';
wwv_flow_imp.g_varchar2_table(135) := '45504F52545F5341564544223A2250726976617465207265706F7274207361766564222C224C494234582E5744522E50542E534156455F5245504F52545F57524F4E475F54595045223A22272530272069732061202531207265706F72742E2043616E20';
wwv_flow_imp.g_varchar2_table(136) := '6F6E6C79207361766520617320612070726976617465207265706F72742E222C224C494234582E5744522E50542E534156455F5049564F545F5245504F5254223A2253617665205069766F74205265706F7274222C224C494234582E5744522E50542E4C';
wwv_flow_imp.g_varchar2_table(137) := '4F41445F5049564F545F5245504F5254223A224C6F6164205069766F74205265706F7274222C224C494234582E5744522E50542E5245504F52545F44454C45544544223A225265706F72742044656C65746564222C224C494234582E5744522E50542E51';
wwv_flow_imp.g_varchar2_table(138) := '5F52454D4F56455F505249564154455F5245504F5254223A2252656D6F76652070726976617465207265706F727420272530273F222C224C494234582E5744522E50542E544F4F4C4241522E53415645223A2253617665222C224C494234582E5744522E';
wwv_flow_imp.g_varchar2_table(139) := '50542E544F4F4C4241522E4C4F4144223A224C6F6164222C224C494234582E5744522E50542E544F4F4C4241522E44454C455445223A2244656C657465222C224C494234582E5744522E50542E544F4F4C4241522E4D4158494D495A45223A224D617869';
wwv_flow_imp.g_varchar2_table(140) := '6D697A65227D293B6C657420683D6C2B225F7074223B65282223222B6C292E616464436C61737328226C696234782D7764722D707422293B6C657420523D7B7D3B522E64656661756C7453657474696E67733D622C522E77656264617461726F636B733D';
wwv_flow_imp.g_varchar2_table(141) := '7B7D2C66262628523D662852292C527C7C28523D7B7D292C4F626A6563742E6861734F776E28522C2277656264617461726F636B7322297C7C28522E77656264617461726F636B733D7B7D29292C2164262665282223222B6C292E686173436C61737328';
wwv_flow_imp.g_varchar2_table(142) := '22742D526567696F6E2229262628643D223130302522292C642626214F626A6563742E6861734F776E28522E77656264617461726F636B732C226865696768742229262628522E77656264617461726F636B732E6865696768743D64293B6C657420773D';
wwv_flow_imp.g_varchar2_table(143) := '77696E646F775B22675074222B702B2264617461225D3F2E646174613B696628522E636865636B4461746153697A65262677297B6966286E657720426C6F62285B4A534F4E2E737472696E676966792877295D292E73697A653E39373565332972657475';
wwv_flow_imp.g_varchar2_table(144) := '726E20766F696420617065782E6D6573736167652E616C65727428732822444154415F53495A455F45584345454445445F4D45535341474522292C6E756C6C2C7B7469746C653A732822444154415F53495A455F45584345454445445F5449544C452229';
wwv_flow_imp.g_varchar2_table(145) := '2C7374796C653A227761726E696E67222C69636F6E436C61737365733A2266612066612D6578636C616D6174696F6E2D747269616E676C652066612D3278227D297D696628522E77656264617461726F636B732E676C6F62616C3F3F3D7B7D2C522E7765';
wwv_flow_imp.g_varchar2_table(146) := '6264617461726F636B732E676C6F62616C2E64617461536F757263653D7B646174613A777D2C214F626A6563742E6861734F776E28522E77656264617461726F636B732E676C6F62616C2C226C6F63616C697A6174696F6E2229297B6C657420653D6170';
wwv_flow_imp.g_varchar2_table(147) := '65782E6C6F63616C652E6765744C616E677561676528292E73706C697428222D22295B305D3B5B226672222C226465222C226573222C226974222C226E6C222C227072222C227A68222C227472222C22706C222C227572225D2E696E636C756465732865';
wwv_flow_imp.g_varchar2_table(148) := '29262628522E77656264617461726F636B732E676C6F62616C2E6C6F63616C697A6174696F6E3D2268747470733A2F2F63646E2E77656264617461726F636B732E636F6D2F6C6F632F222B652B222E6A736F6E22297D696628522E6D6574616461746126';
wwv_flow_imp.g_varchar2_table(149) := '26522E77656264617461726F636B732E676C6F62616C2E64617461536F757263652E646174612E756E736869667428522E6D65746164617461292C522E77656264617461726F636B732E676C6F62616C2E6F7074696F6E733F3F3D7B7D2C4F626A656374';
wwv_flow_imp.g_varchar2_table(150) := '2E6861734F776E28522E77656264617461726F636B732E676C6F62616C2E6F7074696F6E732C22636F6E666967757261746F72427574746F6E22297C7C28522E77656264617461726F636B732E676C6F62616C2E6F7074696F6E732E636F6E6669677572';
wwv_flow_imp.g_varchar2_table(151) := '61746F72427574746F6E3D2131292C214F626A6563742E6861734F776E28522E77656264617461726F636B732E676C6F62616C2E6F7074696F6E732C22646174655061747465726E2229297B6C657420653D617065782E6C6F63616C652E676574446174';
wwv_flow_imp.g_varchar2_table(152) := '65466F726D617428293B69662865297B6C657420743D6E2E646174652E6F7261636C65446174654D61736B546F576472466F726D61742865293B74262628522E77656264617461726F636B732E676C6F62616C2E6F7074696F6E732E6461746550617474';
wwv_flow_imp.g_varchar2_table(153) := '65726E3D74297D7D696628214F626A6563742E6861734F776E28522E77656264617461726F636B732E676C6F62616C2E6F7074696F6E732C226461746554696D655061747465726E2229297B6C657420653D617065782E6C6F63616C652E676574446174';
wwv_flow_imp.g_varchar2_table(154) := '65466F726D617428293B69662865297B6C657420743D653B742E696E636C756465732822484822297C7C28742B3D2220484832343A4D493A535322293B6C657420613D6E2E646174652E6F7261636C65446174654D61736B546F576472466F726D617428';
wwv_flow_imp.g_varchar2_table(155) := '74293B61262628522E77656264617461726F636B732E676C6F62616C2E6F7074696F6E732E6461746554696D655061747465726E3D61297D7D4F626A6563742E6861734F776E28522E77656264617461726F636B732E676C6F62616C2E6F7074696F6E73';
wwv_flow_imp.g_varchar2_table(156) := '2C226472696C6C5468726F75676822297C7C28522E77656264617461726F636B732E676C6F62616C2E6F7074696F6E732E6472696C6C5468726F7567683D2131292C522E7072696D6172795265706F72743F3F3D7B7D2C522E7072696D6172795265706F';
wwv_flow_imp.g_varchar2_table(157) := '72742E6C696234783D522E7072696D6172795265706F72742E6C696234783F3F7B7D2C522E7072696D6172795265706F72742E6C696234782E747970653D227072696D617279222C522E7072696D6172795265706F72742E6F7074696F6E733F3F3D7B7D';
wwv_flow_imp.g_varchar2_table(158) := '3B6C657420783D522E7072696D6172795265706F72742E6F7074696F6E732E677269643F2E7469746C653B787C7C28522E7072696D6172795265706F72742E6F7074696F6E732E677269643F3F3D7B7D2C522E7072696D6172795265706F72742E6F7074';
wwv_flow_imp.g_varchar2_table(159) := '696F6E732E677269642E7469746C653D225072696D617279205265706F727422293B6C657420793D652E657874656E642821302C7B7D2C66756E6374696F6E2865297B6C657420743D7B7D3B66756E6374696F6E20612861297B6966284F626A6563742E';
wwv_flow_imp.g_varchar2_table(160) := '6861734F776E28652C61292626655B615D297B745B615D3D5B5D2C655B615D2E73706C697428222C22292E666F724561636828286F3D3E7B6C657420693D7B756E697175654E616D653A6F2E7472696D28297D3B226D65617375726573223D3D61262665';
wwv_flow_imp.g_varchar2_table(161) := '2E6167677265676174696F6E262628692E6167677265676174696F6E3D652E6167677265676174696F6E292C745B615D2E707573682869297D29297D7D72657475726E2065262628612822726F777322292C612822636F6C756D6E7322292C6128226D65';
wwv_flow_imp.g_varchar2_table(162) := '6173757265732229292C30213D3D4F626A6563742E6B6579732874292E6C656E6774683F743A6E756C6C7D28522E64656661756C7453657474696E6773292C522E7072696D6172795265706F72742E736C696365293B6966284F626A6563742E6B657973';
wwv_flow_imp.g_varchar2_table(163) := '2879292E6C656E6774683E30262628522E7072696D6172795265706F72742E736C6963653D79292C6D28522E7072696D6172795265706F7274292C522E616C7465726E61746976655265706F7274733D28522E616C7465726E61746976655265706F7274';
wwv_flow_imp.g_varchar2_table(164) := '733F3F5B5D292E6D61702828653D3E287B2E2E2E652C6C696234783A7B2E2E2E652E6C696234783F3F7B7D2C747970653A22616C7465726E6174697665227D7D2929292C522E616C7465726E61746976655265706F7274732E666F724561636828282865';
wwv_flow_imp.g_varchar2_table(165) := '2C74293D3E7B652E6F7074696F6E733F3F3D7B7D2C652E6F7074696F6E732E677269643F3F3D7B7D2C652E6F7074696F6E732E677269642E7469746C657C7C28652E6F7074696F6E732E677269642E7469746C653D60416C7465726E6174697665205265';
wwv_flow_imp.g_varchar2_table(166) := '706F727420247B742B317D60292C6D2865297D29292C522E63757272656E745265706F72743D6E756C6C2C617065782E73746F726167652E6861734C6F63616C53746F72616765537570706F72742829297B6C657420653D617065782E73746F72616765';
wwv_flow_imp.g_varchar2_table(167) := '2E67657453636F7065644C6F63616C53746F72616765287B7072656669783A612C75736541707049643A21302C7573655061676549643A21307D293B69662865297B6C657420743D652E6765744974656D286C2B222E707269766174655265706F727473';
wwv_flow_imp.g_varchar2_table(168) := '22293B522E707269766174655265706F7274733D28743F4A534F4E2E70617273652874293A5B5D292E6D61702828653D3E287B2E2E2E652C6C696234783A7B2E2E2E652E6C696234783F3F7B7D2C747970653A2270726976617465227D7D2929292C522E';
wwv_flow_imp.g_varchar2_table(169) := '63757272656E745265706F72743D652E6765744974656D286C2B222E63757272656E745265706F727422297D7D617065782E726567696F6E2E637265617465286C2C7B747970653A225744525069766F745461626C65222C7769646765743A66756E6374';
wwv_flow_imp.g_varchar2_table(170) := '696F6E28297B72657475726E2065282223222B68297D2C6765745069766F745461626C653A66756E6374696F6E28297B72657475726E20746869732E77696467657428292E64617461282277656264617461726F636B7322297D7D292C63262621652822';
wwv_flow_imp.g_varchar2_table(171) := '23222B63292E636C6F7365737428222E75692D6469616C6F6722292E686173436C6173732874292626722E696E69744469616C6F672863293B6C657420543D65282223222B68293B542E697328223A76697369626C6522293F692E696E69745054286F2C';
wwv_flow_imp.g_varchar2_table(172) := '6C2C682C702C632C752C52293A617065782E7769646765742E7574696C2E6F6E5669736962696C6974794368616E67652865282223222B68292C2866756E6374696F6E2865297B6526266E756C6C3D3D542E64617461282277656264617461726F636B73';
wwv_flow_imp.g_varchar2_table(173) := '22292626692E696E69745054286F2C6C2C682C702C632C752C52297D29297D7D7D28617065782E6A5175657279293B';
null;
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(12213758957592539955)
,p_plugin_id=>wwv_flow_imp.id(12163302657156180788)
,p_file_name=>'js/lib4x-wdrpivottable.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260624210739Z')
,p_updated_on=>wwv_flow_imp.dz('20260624210739Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/plugin_settings
begin
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(11064940832299280778)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>'SH256:NcagEyRP_F17oe14bnrSYSYienkBgpdRSvH17g_NxoE'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(11064941154512280779)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>'SH256:FJR60MFzlfEjx0PvnpYBK4631rNeUHXaF3eGFKxcTgE'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(11064941453829280780)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'appearance_behavior', 'MONTH-PICKER:YEAR-PICKER:TODAY-BUTTON',
  'days_outside_month', 'VISIBLE',
  'show_on', 'FOCUS',
  'time_increment', '15')).to_clob
,p_version_scn=>'SH256:dQTHqehcDG0h-d-qmHe5lf-DuViElEHDw9zMkscLr6M'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(11064941782084280780)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'background', 'default',
  'display_as', 'LIST',
  'map_preview', 'POPUP:ITEM',
  'match_mode', 'RELAX_HOUSE_NUMBER')).to_clob
,p_version_scn=>'SH256:CU9J9l4sUtY-UffjdBCosfDW6ER-I0swXpw8GekLiYQ'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(11064942020554280781)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_values_as', 'separated')).to_clob
,p_version_scn=>'SH256:jJTPfH8wphTXe7ahDytF6PbWlPl1mXrDRYylCDda0k0'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(11064942341336280781)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N')).to_clob
,p_version_scn=>'SH256:oAqKgc-cSRXHDMjfwwNIgo78WqYXKjQz8MWGBG6Euj0'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(11064942652996280781)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'default_icon', 'fa-star',
  'tooltip', '#VALUE#')).to_clob
,p_version_scn=>'SH256:uT4QhQbZQY61UFxAGl7ieo2urrCo8jUsFNprrg7lGHo'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(11064942977157280782)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH_CB',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>'SH256:wAjuCAsVhoIbbuKGWTMQ__Rd_YS_sY9KgWhpqOO11mc'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(11064943257797280782)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'match_mode', 'RELAX_HOUSE_NUMBER')).to_clob
,p_version_scn=>'SH256:GIeRbUJQ8yKfen6-dFvkghmSUZXFoUAXCCTNRhCJgh0'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(11064943561175280782)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'Y')).to_clob
,p_version_scn=>'SH256:4M27aN0U-JyQ0prILtI8ITLXOphqUdO-xWNcwkSL1SI'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(11064943803206280783)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>'SH256:tNGqNT-VaoKqWOwKbAdEqb6C0QO-GMcYRZJLXjScHMo'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(11064944169816280783)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'Y')).to_clob
,p_version_scn=>'SH256:vJP7K77hiNj1R2RE6dHVyRAhlmxDg6KGn4yRE20J9Qw'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(11065010493684288890)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'PLUGIN_LIB4X.AXT.WDR.PIVOTTABLE'
,p_version_scn=>'SH256:Ure9CIq_-KxVW8d815XxlR-cqX8lsACStqngSsjXLuI'
,p_created_on=>wwv_flow_imp.dz('20260620145540Z')
,p_updated_on=>wwv_flow_imp.dz('20260624210739Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(11064944468957280784)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>'SH256:fiSZ-OfcUl-d0e0dtJUYffG7q61xKsHlomsv7ZU1BMw'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(11064944786439280784)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>'SH256:dRkCWi6vQMhdQUSqb0QlRls9iYcsZ93IPYrbTqFqJFE'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_bar
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(11064946988843280793)
,p_name=>'Navigation Bar'
,p_static_id=>'navigation-bar'
,p_version_scn=>'SH256:vnb1-G39r80BPE-5P2Enpuf0sMSVvBeNQDVbFiNwRto'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11064960174407280818)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&APP_USER.'
,p_static_id=>'app-user'
,p_list_item_link_target=>'#'
,p_list_item_icon=>'fa-user'
,p_list_text_02=>'has-username'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11064960797962280819)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'---'
,p_static_id=>'list_item'
,p_list_item_link_target=>'separator'
,p_list_item_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_parent_list_item_id=>wwv_flow_imp.id(11064960174407280818)
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11064961292853280819)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Sign Out'
,p_static_id=>'sign-out'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_list_item_disp_cond_type=>'USER_IS_NOT_PUBLIC_USER'
,p_parent_list_item_id=>wwv_flow_imp.id(11064960174407280818)
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/shared_components/navigation/lists/navigation_menu
begin
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(11064946111779280787)
,p_name=>'Navigation Menu'
,p_static_id=>'navigation-menu'
,p_version_scn=>'SH256:h99QpHL89jmUVLUwH2kcqXh8NGCjRZ8Czrj1URg2bLY'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620165256Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11064957531135280812)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_static_id=>'home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11076402509228645746)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Sales Analysis'
,p_static_id=>'sales-analysis'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&APP_SESSION.::&DEBUG.:::'
,p_list_item_icon=>'fa-file-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'2'
,p_created_on=>wwv_flow_imp.dz('20260620165256Z')
,p_updated_on=>wwv_flow_imp.dz('20260620165256Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/shared_components/navigation/listentry
begin
null;
end;
/
prompt --application/shared_components/files/icons_app_icon_144_rounded_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000090000000900806000000E746E2B800001000494441547801EC5D69701CC7757E3D8B3DB03816F70294788214404AB15C212D90E0A572F9FA11D1614038E2119189135529954376EC7255F22347C571C58A';
wwv_flow_imp.g_varchar2_table(2) := '2CDBE5A8149592483200920248C552922AC58C44D1162996245B204091B24993E00162715138F7DEF67BBD0B1A80B0C0EECCEC31333D356FB667BAFBF5EBEF7D7CDD333D182A2037898006042481348027AB02480249166842401248137CB2B22490E480';
wwv_flow_imp.g_varchar2_table(3) := '2604248134C1272B4B02490E684240358134B52A2B9B06014920D3B832371D9104CA0DEEA6695512C834AECC4D4724817283BB695A9504328D2B73D31149A0DCE06E9A56B34FA014A01BFAA35D2583875A6B7D077FBFDE7760F7FDBE037B9A7D075A3F3B';
wwv_flow_imp.g_varchar2_table(4) := 'B0B7E5212B08F5D527FA8C7D470C080BC22405E8B25E24A704E2006C786F4BE3E0FE9683BE032D4F0FECDFF3AE6FFF9E502CE818E7617E0B22D14BC06DEF0387B780F3FF630A7B855940A8AFF13E63DF1103C28230216C1218FDEB206246D8118690C32D';
wwv_flow_imp.g_varchar2_table(5) := 'AB04BAD5DA5A3D70A075D7E0BE3DDFF4ED6FFDF1E0FE3DB7A30ABBC0813D0F9C3DC6003622167614B92F8C803D81D19F1266841D6118C7B2E51F293A5F6F6DAD58B86A66AE668D401C80313B6F669C7F8333F86B00FE1900F0A0C85D1B028821FF0C07F6';
wwv_flow_imp.g_varchar2_table(6) := '374C51BE6177F0660E803C83AC6C1927107FF451FBC0FE963F19DCD7729131F82F006846917B4610E05B9139AF6254BA30B0AFF5CB847D469A99A534A3041A7EA4F52EDFD4E81906EC5960EC9E59EDCA64661168608C3FE79B1C3D4DD3864C36953102DD';
wwv_flow_imp.g_varchar2_table(7) := 'DADFBA211AE567597C5E93C93E48DD4910C088BF4971C6CEDCDADB726F92229A2F678440837B5BB729C04FA37577A1E8B44B35AA10E0AC5E51D85B437B5B77AAAABF4425DD094491872BFC356C17277778947B3E20E08929FC7F331189742550FFA30FB9';
wwv_flow_imp.g_varchar2_table(8) := '31F27422626E14B9E717026E8C4447C9477A9AA52B816C53CEA7D1B80D2872CF4F04EE4DF84837EB7423D0E0BED64368D54114B9E737020713BED2C54A5D08844F3F0B39E3DFD1C522A924E308A0AF9ED46B28D385400E478C224F79C67B2E1BD00B810A';
wwv_flow_imp.g_varchar2_table(9) := 'DB94E3113D94692650FCB1397B5C0F6332A443AA5D000106F01771DF2D9099C625CD041A3AD0FA796CAF0145EE064280035B9FF09D26AB3513887390D1078CB9E9E13B4D04BA72E8900B57D53F6B4CF8A4D5E43BBA01D282842602B922939BB1714D3AB0';
wwv_flow_imp.g_varchar2_table(10) := 'BEDC73878052E0E44D5A9AD7E47C1B6744202DEDCBBA394640AB0F351188039704CA3101B436AFD587AA09C401F04E10B68189378B744D5310504DA0A143AD5E04B81245EEC646C03BFEC86ED57E544D205B30A6BA5163E36D3EEBC361A5566DAF541328';
wwv_flow_imp.g_varchar2_table(11) := 'A470F9CA865AD4F3AC9E165FAA2610C46C9240794604D5E668F0A56A02D96C50A8DA605931AF10B02BBC40AD41AA09C4637208530B7ABED58B31A6FA8F395513485164044A4A048365680906AA09C463EA596B147C07FC7E20318ABD6AEDD4120CD41388';
wwv_flow_imp.g_varchar2_table(12) := 'C5226A0D3642BD6B9353E0F3078450DA0836E7C246D504CA85B1D96AF3EAE424DC0E85A0D2EB1542E93E2454B6DA37523B9240F3BCF5AB8949180B85C15351016B9AB608F15456C24748A82B9837AFB8E54F25816651E0FAD4144C84C3505CEA81755BB7';
wwv_flow_imp.g_varchar2_table(13) := '83526013B2AE791B94783C308E7954665615CB2715CB23900060281080D160088A4A4AA171C70EB0D97FF36884D2F76CDB018545C5A2CC702098A8257F248190033464F54FFBC155E886C6EDDBC1E670E0D5B97B81D301F7EEDC89650AE1E6F4B4885473';
wwv_flow_imp.g_varchar2_table(14) := '4BE871663C1D962750847310C31263D0B8751B14B85C49BD68C3BC862DCDC09802D726A781EA262D6C910CCB13886ED1A348A2558DEBC1595AB2A4DB5D6565B0BCA101C913831B3867028B6F9626D068302886229A34D73434A64C855A245B7169A9B85B';
wwv_flow_imp.g_varchar2_table(15) := 'A3BBB3942B9AB0A0650944C30FCD7B1863B0F68126600ABD60999A87A96CFDA79A0018839B537EA0080616DD2C4B201F4E9AC9F12B366C4869E89ACF0F97A71468D88BF098785A3D3FDF2AE7962450201A85611CBE1C4E17145756C1D4F0882A29AAAA02';
wwv_flow_imp.g_varchar2_table(16) := 'BBC301F408201C8B59853373FA694902DDC2E84328848201387FEA4DE83D7552959CFFC92908E3136AD235A393D239909C356939020531FAD013E5CA55ABE1B7F6FF812E42BA68BDCC8A51C872049A798ABCFA8BBBC1DBF2255D64F5AEDF151160048745';
wwv_flow_imp.g_varchar2_table(17) := '91B0D0C152048AE1F39E511C7294023B789A9A7573B3677333AE99D9C532876E4A0DA24831889DBA9849CF6C88442BE969B2CBA98B4E52C2F009F5F2A626A0218C9645E89A55C452049A71AE77C7838BFA37466F22761D855FFECB3F0BF175BD04746DB1';
wwv_flow_imp.g_varchar2_table(18) := '4AB5DB778AECF17048FC5AE560190251E4990847C0595C0CC51B3725F56FE85A1F9CFDF3C7A0B7A30DFA4EFF54484FC70FC5B5D0F5EB49EB953CB0191CEE22180F459296316386650844E4E1C061E522D1874763D0FB9D27C03F3E0E1B76ED86CD5FFD1A';
wwv_flow_imp.g_varchar2_table(19) := '6C7EFCAB224DD7CE3FF5045099644458B97D8758239B8E188744C9FA92EA75CB10682A121698D424861A7132EFE0BFD00BA31881D6346F81B2B56B4101068A6213E9D5786DE4EA15087C7811926D35DB7688AC498C742261818362813E8A2EFA2351F1EB';
wwv_flow_imp.g_varchar2_table(20) := '5A64D174BAAF4F947157558BDFD987F2DF8E0F7B7E24D8ECEBB3D3AE75F1FF90889E74CFBE6EE6B4650814C0E1A9B0B46C515F3A3CF1FC6820F0B172D3BFF8505C2BC035309158E0C07059C359540492400B8063E44B747B4D8B9EEE8AC53F65EDBE27FE';
wwv_flow_imp.g_varchar2_table(21) := 'B1D95B1F7C80B3257EA7CB3477F29D3F8F031A83A27B167FEDC35D5E81048A61FD3BD54D9DB04404220291175D1595F493540A6A6AE0BE87F7C128CE75BAFFF3DFE1E689D7E0060AA547FAAEC27DB8F461AB5C5C4721E613E12216595CB50481E8B50DC0';
wwv_flow_imp.g_varchar2_table(22) := 'ADB0A2028F8BEFB57B1E86FB0F7D19021393D077EE1C5C430962FAFE3FFC63F0EEDEB37865CC756104C21F88C47E13C1E8DCAC62290239CACA96F6A3C2A01AD7B63EFDD271D8F1D40F60E7F79F8607DB8E42F5435F04C0BCA51438CBE2C3240D994B9535';
wwv_flow_imp.g_varchar2_table(23) := '747EC2784B10881E22527F9D4B0C615466B63856AE04FBDDCB813952FF78853311E566A2DE6C7D664C5B8240771C978D7949224AE1BAED9D66CD9CB0048114C6840F83B76F8BDF4C1E82A3A3427DA2499136F3C162048A3B37930E9D2190CD220CB20481';
wwv_flow_imp.g_varchar2_table(24) := '0A12CEF4DFCE3C810289360A9825A0054BF47228F1B7EC81C4F092C908E41F1911EA8716789A2D324C76303D81E8BB3EF42219F96D7A24BD0834DDDB037E14AA9BAA4C8D0C8BA2F48E34FDD5AB3831F1217D0219080CFA501491C77BD7DD5055B70C0293';
wwv_flow_imp.g_varchar2_table(25) := 'E3104D448854BA71EEFB4FC1B91F7C3795A2A24C646808427E3F542D5B06D4269188082C324D7A302581E819307D0C6A2C1486CABA65B0F2530F40455D9D70E1444FB7F84DE5C0F15E3C96C6ADFFC4B9F7855A6A8BDAACC4B689C05727274DBB36664A02';
wwv_flow_imp.g_varchar2_table(26) := 'F5A1C3C6C3489EDA5A58DBB41998C2A0C41BFF9AFF4877DCC9C2D33A1F86DFFF99D05852BB4CB4496D5778BDE26FE8C9269169B283E90834E80F08879557558BCFD30192877C5650E882628F07FADF7B0732120E3052F5BFF72E94E2524681D3414D02B5';
wwv_flow_imp.g_varchar2_table(27) := '5DDFB4053C9555C226B22D9E619EA3A90844EFE10C20815C6E37D46F6906C536B77B15B57510C4E814BC7259770F062E5F8230DE79952786CA9906E83379EB9AB782D35508645B301A9DC932C5EF5C840DDC259AF7F44D4E6170E1B076D303409FA59BDF';
wwv_flow_imp.g_varchar2_table(28) := '1D4FC2B9631918C666747A70D89CDF2ED952BF71A3B02D6EE3FC12C63D370D81A6C211A008E429AF80A2AA85DFD929C43CBBDD0ED75E3F01A0E3EB163C1A83AB275E03D25D585EBE201B4A702E4443A81F23D0B4895EBACF228116C455B78BA1587C6828';
wwv_flow_imp.g_varchar2_table(29) := 'A9AE4AAA933180BAD56BE0A39B3760FCCC5B49CBA59B31FED62998181C84BAFA758B56F554D788FC10124E244C70300D818209A794E0E47931BFD4343480ADA0007E71A45D9F288491ECC38E36117D6AD62D4EA092AA38B98309B22F66A751F24C43A099';
wwv_flow_imp.g_varchar2_table(30) := 'F76F1C38595D0C7C1B0E612B1A1A45149A387B66B1A229E58D9FF9298C0FFAE0EEC6F5609BF569E0852A3BDD45E272144927122638988640E9F8A2AA7E2D381C4EB8D4790470669B4ED5B96591081F1EEE107758556BEAE7E62D724613FE45B20D956549';
wwv_flow_imp.g_varchar2_table(31) := '02D1ADF5F2F5EB81FE5070F29DB3AA1D46116CACFF06ACD8B0FE638F0C542B3558454B12887C5489936997CB05BDCFFD1BC4F0D9105D4B47625353D0F3DC3350E87643F98A55E954355559C554BD49A3331C27B2CE42374C0E0FC1C527BF9DDE508643D7';
wwv_flow_imp.g_varchar2_table(32) := 'C527BE05D3B76F83034948BAD2681AF066309DE2795DD60804D21DC048300817DF3C0963B74781DE1CECEFFE39F88E77A6DCCE40D751E83FD72DEA8E8D8E0A5DA4336505262A683902052726E083375E8789B131A8C035ABC6320F381405E8132EFE0B1F';
wwv_flow_imp.g_varchar2_table(33) := '2CE95A7A47A8F76887A843754907E9229D617C12BEA4022C2027D108821177FA9C6FEFC937C03F3D0DB58585B0BCA808E875D795C5787BCD39BCF7AD6FCE7D5F08AFCDBE4B8BE0C3C2F7BEFD4F38DC7158555C2CEA920ED2453A7BDEF87F31AC2D858D1C';
wwv_flow_imp.g_varchar2_table(34) := 'C29642280FF3C7FAFBE1FC4FDE8448380C44182FAECECF98E9C6078B4482C0E438BCFD577F0937DB5E00DFB19720EC9F86F0F49448D3B5B7BFFE15B1185B87E42B2CB0CD5407D2453AC3A8BB9786466CEB4EA6C9139618C2067F79092EBE7D06A8B36B4B';
wwv_flow_imp.g_varchar2_table(35) := '4BA0CCE1F8985B890424FEF131B870BC0B7ADA7F28DE2EA4370C294DD70213E3822C35B3C837A38874926E05A316B5358CABF33379F37FE510361F913C3EBFD9DD0D577ABAC59C651D92A708A34D3273290ADD575E064484FA92121CA2142194A6BA9447';
wwv_flow_imp.g_varchar2_table(36) := '6520C946BAA99C1DE75497B15D9A682F54540E610BA19267D7A2A1105C3E7D1A6E602470DB6CB0CE530A4EFC5DCA4CBA2B232214E3B2042DBE9250DA8DC4A3BCA5EA531B44226AF3FAA54B70F9CC198886C24B55336CBE6258CB9318DEFDFA09387BFC18';
wwv_flow_imp.g_varchar2_table(37) := 'BCFBDFAFC2F0C02D71A7558F918726CB49AAE87E992210B5598E43E5F0AD7EB4E5156113D9A67B633956681A0289A88151A218A514174CAB9C4EA0A187EE92140A232A80F6A01E12155581DA5C8177776B4A8A816C29415D641B49114637353AF3B18E7A';
wwv_flow_imp.g_varchar2_table(38) := '0271369D4F1D2AC7673AF4AF9E64353AEDAE2237D0D0A3C546D241A245071187741091C836129A706BD1A977DD580CFC6A75AA261053F28B406A0190F500B4F8523581A251F5AC05B9E515025A7CA99A40A044F36A08CB2B8F18CD180DBE544D20474C0E';
wwv_flow_imp.g_varchar2_table(39) := '6146E349327BB5F8523581228CAB9E7825EB48DE5CB798215A7CA99A40CC619343984988A6C597AA0974CD513E82F80550E46E6C0402095FAAEA856A026D7AF6D93067A0FE856255E6CA4A7A23403E245FAAD5AB9A40D4202E0A9EA45F29C64540AB0F35';
wwv_flow_imp.g_varchar2_table(40) := '112806200904C6DEB4FA5013810205C56F237C721E842018740F247CA8DA7C4D045AFDFCF3010EFC47AA5B375D456375887C473ED462B52602C51BE6A97F44305E411EF30601EDBED34CA0DAF6E3348CC9BBB1BC2145CA869C4DF82EE50A0B15D44C2052';
wwv_flow_imp.g_varchar2_table(41) := 'CA39C82804C6DAF4F2992E04F2F60F77217C3750E46E0C046E267CA6D95A5D08C44E9E8C20A3FF4CB33552415610E031FE18F94C8FC67421101952DBD1F523C6F9F7282D257F11201FD51E3EF6AA5E16EA462032A8BAB8F2EB0CD83B94969216025929CC';
wwv_flow_imp.g_varchar2_table(42) := 'F0C12FF948CFC6742510C3F5B168D4F62534F02314B9E717023E1EB33F4C3ED2D32C5D094481D54CEB000002124944415486D51D39729545F9A701F8553A97921708F4018B7EDE7BF8B04F6F6B742710195873E4D8CFC3B6D826007602E4965B0438BC1E';
wwv_flow_imp.g_varchar2_table(43) := 'B645377ADB5EEECE8421192110197AF78B2F8FD484E00B987E0645EEB941E0C99A30FB1CF92253CD678C406430EBEC8C7ADBBB1EC3E10C0542744D4A5610F073600F23F65F231F64B2C58C1268C6706FFBB1676C36B60680FD2D2EE05D07B9650A811BC0';
wwv_flow_imp.g_varchar2_table(44) := 'E1EF10EB75B5ED9D4733D5C86CBD5921103558F562E74D6F7BE73F7843CA6A00F67B28AF01862614B96B4000AB461963AF2A8CFD4E4D88ADF27674FD3D618DD7B3B2678D4033BDA1908A447A19E50BF6102B673CB69333F638E6BF80D283124191FBC208';
wwv_flow_imp.g_varchar2_table(45) := '10363D18655EE4005F5162EC41C5192AAF69EBDC55DDD6F93F842D6479CB3A8166F7AFA2B373ACA6E3F8A9DAB6CEEF79DBBB0EA17C02C58EA094323BAB8302DB5ABCFDFC2430D80A8C7D0E1FC1EFB282505F41F439FA49C280B0204C081B944F783BBA0E';
wwv_flow_imp.g_varchar2_table(46) := 'D6B6777DB7FA70E79BD5FFF1CAC46C4CB39DCE298192759640A979BE73C0FBC2D1CB5EBCFDF4B6759DF6B675FE981EC15B41A8AFF13EBFDC4D181016844932BC72793D2F09944B4064DBE9212009941E5EB2F43C042481E601224FD3434012283DBCCC53';
wwv_flow_imp.g_varchar2_table(47) := '5AA79E4802E904A455D5480259D5F33AF55B12482720ADAA4612C8AA9ED7A9DF92403A01695535924056F5BC4EFD9604D20948EBA899DB5349A0B978C8B3341190044A1330597C2E02BF060000FFFFF56F343200000006494441540300884802995BE360';
wwv_flow_imp.g_varchar2_table(48) := 'A00000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(11064948369787280796)
,p_file_name=>'icons/app-icon-144-rounded.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_192_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000000C0000000C0080600000052DC6C0700001000494441547801EC5D7B6C1CC779FFEE45DEF178C7A75E7C53122989B6142992EDD8F50BA8DB3A0802B46E8B1668DC262950B445810269D1FC11B481DB06289A';
wwv_flow_imp.g_varchar2_table(2) := 'B4EE0368D3DA8E1D176E12205692BA8E1B47B6E2D8B12D47B6F5B0645926F5A6244B24458A47F248DE919DDFDEEDDCF078CBDBBDDBBBDBBBFD24CEEE37DF7C33F3CD6FE6B73B3BBBB7EBFDE8777E63990363E0D631E025FEC708B8180126808B3B9F9B4E';
wwv_flow_imp.g_varchar2_table(3) := 'C404E051E06A049800AEEE7E6EBC8B09C09DCF08F01488C780CB11E03380CB0780DB9BCF0470FB087079FB99002E1F006E6F3E13C08D2380DB2C1160024828587023024C0037F63AB75922C0049050B0E0460498006EEC756EB344800920A160C10D0864';
wwv_flow_imp.g_varchar2_table(4) := 'B79109908D08C75D850013C055DDCD8DCD468009908D08C75D850013C055DDCD8DCD468009908D08C75D85808B08E0AA7EE5C69A44800960122836AB4D049800B5D9AFDC2A930830014C02C566B5890013A036FB955B651201268049A0AADA8C9D374480';
wwv_flow_imp.g_varchar2_table(5) := '0960080D27B8010126801B7A99DB68880013C0101A4E7003024C0037F432B7D11001268021349C500B08E46B0313201F429C5ED30830016ABA7BB971F9106002E44388D36B1A0126404D772F372E1F024C807C08717A4D2350C304A8E97EE3C6D9840013';
wwv_flow_imp.g_varchar2_table(6) := 'C02620B998EA448009509DFDC65EDB840013C02620B998EA448009509DFDC65EDB840013C026201D550C3B631A01268069A8D8B016116002D462AF729B4C23C004300D151BD622024C805AEC556E9369049800A6A162C36A40C0AA8F4C00AB88D964BFB8';
wwv_flow_imp.g_varchar2_table(7) := 'B4442337A7B500D9A662B9188B0830012C026687F98218FC1F8AC11F4B24080132747694CD6558438009600DAFA2ADE79349FA706A9AD4A33E64E8905674055C802504980096E02ACE78561CF171B44F2C2F690585C2614240043AA4CD25928872281302';
wwv_flow_imp.g_varchar2_table(8) := '4C8032013D2306FFC8748C92CBCB5A8DA186300DDD7BBF16204389B491E969025110E7507A046A8800A507ABD01A628B091A1673FE257DF0871B69E8BEFBC91F0A6A017248E8507E8A0431026110E7505A049800A5C59770717B2E1693B58423511ABA3F';
wwv_flow_imp.g_varchar2_table(9) := '35F8752588009D4E0210E5AC385B20AF6EC3FBD220C004280DAE5AA9DAD15C1CF9B18722180AD1F67BEF257F7D3DA22B82BFBE9E86EEBD8FEA83214D8F3C2001F69A8237254180095012588930D33FA71CC5FD81000DDD735FCEC1AFBB8033C18EBBEFA6';
wwv_flow_imp.g_varchar2_table(10) := '80DFAFA9E262C508656811DE9404012640496025BA3433A3ADF1A378AFC74B3BEE1203BB318CE89AA13E1AA5ED77DF43C80343DC27B83C3B0B9143091060029400D4B1F83C4DCC2FC89207EFB8831ADA5A653C9FD0D0DA4ADB441EDDEEBA56DEBC1E5DBD';
wwv_flow_imp.g_varchar2_table(11) := '674DC10830010A862E7746ACE38F2A47ECFE9DBBA8A9A323B7F11ADAA8C8D377CB4E697169668E3025920A166C418009600B8CA942B07A733E36938A886DDBA60E5A3F3020A4C2FE366C1BA4764104E45E165715281BD7168873B0070126803D386AA55C';
wwv_flow_imp.g_varchar2_table(12) := '9D9BA3F9A5D49DDC603048FDFB6ED3F4C56CFA3EBE8FB07A84327006B83A3B0791834D0830016C021237BB3057D78B1BB8E34EF20552AB39BAAE90BDAF2E405B6FBB4366BD168FF39D628946F10213A0780CB5C71B2E88551FBDA8BE1D43962E7AF57C46';
wwv_flow_imp.g_varchar2_table(13) := 'FB707B1BF50C6E93C91762B384E99654B85828B6E94C80621114F9B14C89273A8548B8D3BB61DB7688B6864D43B7907EA718D3AC2B3C15B2055F2640913062D5475DF2DCBC772F8945FC224BCD91DDEBA12D7BF7C984B1F9795E159268142E30010AC74E';
wwv_flow_imp.g_varchar2_table(14) := 'CBA92E796EEAED25ACE16B0925D8602AB4B1A75796CC67010945C10213A060E888A61616E5539BFE40803AC59A7F11C599CADAB97327A12E18DF5CCCD48F3807EB083001AC63A6E5C07A3C963DB588D8F4DFBA937C7575422AED9FBFBE9EFA6EB9555672';
wwv_flow_imp.g_varchar2_table(15) := '79861F93906014205431010A68AD8D5926B2E6E01FBEFB0E1DDAFF6C59C2F09177654B6693499A5CC83C7621135830850013C0144C2B8DB004797536BE5259C1185F0B140E3E13A000EC6E88232E7EC35B40D69264C10F67F82C5018B44C800270BB3E97';
wwv_flow_imp.g_varchar2_table(16) := '7932F3F63FFB223DB0FFB98A84DBBFF017D27B3C812A232C98468009601AAA94E1B45879C18D28C4829128453E7117C48A84C89DBF40A1689356377E438C7B125A8437A611600298862A65A81E69B77EEAD3E4F15500C2942B5ADD9B1FFC643A463436EF';
wwv_flow_imp.g_varchar2_table(17) := '9CEB12E994C385CAF59EC381C9E51EE6DA587B479AC7E3A175BF92197CD05522ACFFA507C9E3F16855DF985FA444FACD139A823779116002E4852863A01EFD7BEFBE877C4DA9E947C6A2FC92AFAD8D7AEE4C4DC3F09B818978E6FAA4FCDE545F8D4C000B';
wwv_flow_imp.g_varchar2_table(18) := '7DA6AEB4743EF8290B394B6BAAFA322556A84A5B5B6D95CE0430D99FB8C0D49FF86C686DA7D08E219339579A25272668F4E927E9E4DF7C997EF6D987B50079F4E9A708692BADCDC51AC45DE850B45933C68DB1044F83342CCC6C980066501236FADC5F88';
wwv_flow_imp.g_varchar2_table(19) := 'D475FBEDD8590EB1B70FD3EB7FFAC7F4FEF7F7D36571E778EEE62421407EFFFBCF6A69B0B15CB0C8D0A9F874B386CF02A2A9B6FE31014CC2A912A075CF5E93B93266633F7C8EDEFCCA2334AFFC7026939A9290069BF1179E4F292C6CDB149F545F2D14E1';
wwv_flow_imp.g_varchar2_table(20) := '4A532680896EC794427F61ADD7EBA3F0C7769BC8953159B878818E3DF90DA968DFBC85F6FCD66FD39D5FF8732D406E133ADDE0D8934FD0E2E5CB7AD4D43EBC7B0F89E520C2BFE9C504E1613DC81CD6468009B0363E5AEAF4C2A2B6C766E3AE5DE4B1F0D4';
wwv_flow_imp.g_varchar2_table(21) := 'E7727289DEFB87BFA7A56402D9A94B9067F0571FA250673779D2FF216F13BACE5D296225138B74E2D1AFD2B2C8AB6532B1F18642B431FD94E892B80688891B7626B2B9DE8409606208E02EAB6EB6DEE29B1EE2A74FD1C485F35AF6FA7098BA7FF1014DCE';
wwv_flow_imp.g_varchar2_table(22) := 'B5E979E001820DD2C6468669FECC3044D361C3DECC5B28549F4D17E042432680894E9F4B26A55564D0DAEF7D17AE5F9379DBB70E68C77CA9C812704668DB3220B50BD73279A5720D21B27D874CC52B546484054304AA8800866D2879029640F54AEABA7A';
wwv_flow_imp.g_varchar2_table(23) := '74D1D47E616A4ADA051B2352361282D14699B4307943CA6684BAAE6E69164FA4BE4223152CE44480099013968C128F3F2CA72F291BDBD79127B8FAD5E619EBD552A8A3532AE3B169291B09F19B3199A4E695CA3504AF9862859A5B340B3CB0C717C21A14';
wwv_flow_imp.g_varchar2_table(24) := '6B6E98006BC243A41EFD9B941FA4E7C92693437DFD521E1F1E1654321E9620DAD8F087D23EA8E495CA3C424B6FE647F37389D485779E2CAE4E6602E4E97E752E1DEDB136FD41D17856A73BFD66B7F84C8C2E1C380075CE70E1A517696176464BEB1217DB';
wwv_flow_imp.g_varchar2_table(25) := 'BE96D4D15C5398DC44BA330498B7B08A64B2F89A336302E4E952F5D3A5E16EEB0440F15BFFE08FC85F1F8448A3C78ED007E24EF0DCE845ED6C80A37E7CF4129DFEC17E1A3D7A4CB381EDC01FFE89265BDD34F664AE03D48B77ABE5B8C59E0990A7A77113';
wwv_flow_imp.g_varchar2_table(26) := '4C3709B4B5E9A2A53DCE02BB7EEFF332CFF899117AF73BDFA637FEF16B5A78E73BDFA2B1911199BEEB73BF4FBE56E57B023225BF1068C9F8985CE60BE17C883101F2209414379574135FA841172DEF5B1FFC247DE24B5F96EBFCB90AC03D00D8B4FEF283';
wwv_flow_imp.g_varchar2_table(27) := 'B9924DE97C0D191F55DF4D6576A11113204FA72F2B04F0A63F6097278B6172E3DE7D74D73FFF1BEDF8B55FA78EDD7BA83E12A18696564D1E7AE837B534D818166022C127EE08EB668925E30B6EDDC6ED7BAFDB01C8D77EF528AA1E5DF3E5334AC7D4A6F3';
wwv_flow_imp.g_varchar2_table(28) := 'E1CFD2D05FFD35DDF3CDFFA6BB9EF8A626777CE6770B9EF6A8757995B3141E8950D3585E8D00136035262B342A013CC1E08A342746BCEA1940397B39D15727F8C404C8D30B2A01D4A36B9E6C154BF628D334D5F78A395464C5A5CECE04C883B0873CD262';
wwv_flow_imp.g_varchar2_table(29) := '39FDF923A970A290FE813C5CE3130050583B3001D6C68794F144CB73CEFF3ED7723CE3A337C3DD3CAD746F3213204FDF7B29338A96E2CE7FEFCE924252AFCADE3CED746BB2D7AD0D37DB6E9F328896E69CFF2AF225E51BC5AAEF66DBEB363B26409E1EF7';
wwv_flow_imp.g_varchar2_table(30) := '7BABEB0C905448EA57C89BA799AE4D7630019CD1272A01162D3E9F5F891624262765B57E2F77AF04C34060840C80D1D5EACDD4F8471FE96AC7EEE31F5D95BEF18D300985A1C004308486E8D2CC2CE16DD0BAC9DCD52BBAE8D8FD8CE2E3CDC545AD0D8E75';
wwv_flow_imp.g_varchar2_table(31) := 'D6018E31010C3AE1E2CC0C8DCFAF7CCF66EC8AB5579518145D52B54A0054843680C89039AC468009B01A13EDA8A97EFB573799B6F8AE1E3D5FAE7DF2C60D3AF6A52F6A01722E9B4274B97C040946C5D9AC90F26A3D0F1320AB8771B4C480D1D51B941F9A';
wwv_flow_imp.g_varchar2_table(32) := '4F5FB3EF1AE0C61BAFD1B5F74F6A01B25E9FB62F62131BBB2E73AF577C1F136733268184460A4C00090551F6B467634F2FF5DE763B35B7AF93560BE7CE4AB91821A9DCB052E562CA9C1F1996D99BD7ADA33EE13BDAA02B4102B4518FF39E8809901E0518';
wwv_flow_imp.g_varchar2_table(33) := '18EAB467535F1FF5EEDB47584A8FB6B7A7AD88A64F9E90B2D3849B8A6FD1B6759AEF6803DAA2FB8A36A2AD7ADCED7B268018011810181842D4FE3A376FA19E8F675E80DBA8FC1472E2C471CDC6891BD5B7487BE6A791680B9320778FB99E0098F3AB83BF';
wwv_flow_imp.g_varchar2_table(34) := '7BEB0075EDDEBD02ADB042802B478FAC48734C44DCB0F8E878EA47F538F43764FDA61824E812C4D6FD459BF99AC0E553A0EBF1F88AA5CE9EC16DD4B16B973E46E4DEEBF753A4B9598B2FCCCED242FA5D9F9AC2211BF8B490BEAE686A6E21F89CED5AE7EE';
wwv_flow_imp.g_varchar2_table(35) := 'DD0482EB7A5C1300033DEE847DB97DF096BB42A7D4879B449767338F0E776FDB4E9B6EBDD5D0BD968D9B64DAD43B6F4BD929C2E43B87A52B2D9B364A395B00C1BB0707A51A18A837FB64824B045712008F085C8C659EECDCD8DB4B1DB7DCB26697B72A4B';
wwv_flow_imp.g_varchar2_table(36) := '8A977EFA93356D2B9178FEA51FCB6ADB7AFAA49C4BE8B87527A9AB43170416C024976DADEB5C4980EBF1794AA4DF9913696AA2DEBDFB28DFBFFA6884C291A866362E9642130E7A2E08D39FA9F45D6A4CD5FC0D21CDCFB536581D6A8CA6DA032CD42F60AE';
wwv_flow_imp.g_varchar2_table(37) := '95AFD6D25C4900F5465777FAA312663A76BDF26AC4B1570E9AC952169BF1D75F93F5B45B787B5DD750E6AC87EB0159888B04D711001F8ED0BFF6180C0629B2D178BE9C3D0E5A9469D0D9175F20122B2FD936E58EE32B32E70EBC28AB55A76A5269203475';
wwv_flow_imp.g_varchar2_table(38) := '745030FD1609603297C87C07C1204BCDA91D4480F2603BA57CEEA85D39A29BA93D106EA0A8586181EDCCC4044DBFF506C48A86E943AF137C8113D1D636F28782104D87F6CE2E693BB9B02065B708AE2380FEB13B74706B47A6F3113713366CD922CDCE3E';
wwv_flow_imp.g_varchar2_table(39) := 'F70329574A38FBBD6765D51DCA3ABF54E6119A3B32DF2F50B1C993AD66925D4700F57581B8B0B5DA932D628E5D579FBAC8BCF6FE495A3877CE6A11B6D9C73F3C4DD7D3CFFF602A13EDB24EE860FA42184E255CF81E15D711005F7C416723E4BA5904FD5A';
wwv_flow_imp.g_varchar2_table(40) := 'C1E3F550E760E63B5E97FEE77B6B9997346DF4F9E764F99D626D1FBE498549C1E3F3494B5C07C8884B04D71100EFE32FB66FDBFAFAC9170868C59C15F70416AF667E86A829CBB0591C1DA5B3AFBEA2D514A8ABA3D6DE7E4DB6BAF1FA3243C08D6F92CBB4';
wwv_flow_imp.g_varchar2_table(41) := 'DE2A722EB6F705FCA43F57B3BCB444679E7ABC38340AC87DFAB17F274A4F593AB66E25AFDF5740299C850950E0185837304881BA3A2DF7C5B70ED1DCC9939A5C8ECDECB1A3744504D4151067A2F55B072072280001264001A0218BAF2E407DCA4DB4538F';
wwv_flow_imp.g_varchar2_table(42) := '7F9DCA725F6099E8D49399334EFFAE5DE2E8EF874B1C0A4080095000687A96D6FE7E795F00B7E8D69000000687494441548F474CBE5AFA6784260F1EA089F3A995A7487333B5F4F6E9EEF0BE000498000580A666E9DBB347468F3FF1182D4DE7FF16B0CC';
wwv_flow_imp.g_varchar2_table(43) := '6051484E4ED2F1A7BE2173F5EFC9FC68472A59B0840013C0125CAB8D432D2D84A74991321F9BA6D3FFFA28C4928453FFF435421D287C535F1F855A9A215675A8B4F34C001B7AA0AE3EF3F8C1A5C33FA71B2F1FB0A1D495454CFCE80579E18B94405D3D76';
wwv_flow_imp.g_varchar2_table(44) := '1C8A448009500480CB4BCB74FEF061BA70FA8315A51C7DECEB94B8766D85AE98C8E2952B74F489C75614813A51377C5891C0114B0830012CC195314E2E2CD2E99FBD4A57959F47EAAF234FCCCFD3F1BFFB5B5AB6E1E1B2E5F83C1D136525138B5AE57A1D';
wwv_flow_imp.g_varchar2_table(45) := '88A06EF8005F10E7601D01268075CC28313B47270EBE4C93D7332FA16AABAFA7EDCD4D14F0A620C5AAD0F0BF3C5A40E94A16B1E479FAD1AFD28D8B173425CA461DA84B53880D7C802FF04944F9CF2202A9DEB298C9CDE6B3E313744CCCF1E766621286CE';
wwv_flow_imp.g_varchar2_table(46) := '8606EA0A3710DEC7DFD718268FF88FC4F3AFBF46D7F67F176241E1EA77BF4D177F7E48E645D9A80375A14E3D01BE683EDDB8A1AB786F12810A12C0A4870E329BBC344AEFE1D99FF4D4C6EBF1507FA491DA83990BD206BF9F3A949F241E7BE6699A29E055';
wwv_flow_imp.g_varchar2_table(47) := '2AB1B70FD37BDF7A46B61E65A26C5D813A51377C806E51F874FC2707696A7414510E261160029804EAEAA9F7E983B7DEA4E5F4F337988E0C4423140D04569580C1D924EE146B09C2FE8D47FE92C67FF8BF949C9AD2546B6DB0D63FF6FC73F4E6571E9166';
wwv_flow_imp.g_varchar2_table(48) := '286B5D3028E3BA80BAB7462272DA05DF4E1D7A93AE7E704A37E17D1E0498007900C22ACB99B70ED179E5599F90CF4718FC41B137CADE1D0E535DFA7A0036EF3EFE1F74F0739FA1030F7D5A0BC79FF92FA8B50059D71FFCFCC374E489FFD4F4D8A08C1E51';
wwv_flow_imp.g_varchar2_table(49) := '16E45C21E44FF9029FF4F4F3274E68AB53F05DD7F13E3702DEDC6AD60281A498567CF0EA4FE9FAA54B886A413BEA8A233FCE009AC26083D59AADC2AE414C890C4CF2AAC3222FCAD0A7394619E00BEC22CAD9082B44F03D2956AB8CF2B19EF8E5B8468360';
wwv_flow_imp.g_varchar2_table(50) := '2116A3132FBF4C53E363D204D31075DE2D130C040C4C9C29307F0771103730956AD8C0167930A81197896B0820C966713DB24EB91E81EF5821425BD6C8EAEA243E03E4E8FE99B1717A4F2C73CECDCE68A91EB1AAD32D567930283585C58D4E9C21B14CFA';
wwv_flow_imp.g_varchar2_table(51) := 'B1D616FA98081B941FAF43D6F5B001C990C762359A7987589182AF5A446CB04284B6CC8AD52B11E5BF2C0498005980E037B6DA4ACF62EAC6138EACFD9130B58A75FE2C53C746E1EB66713680EF707251B4E5F82B07696C6404510E0A025E4576AD383F75';
wwv_flow_imp.g_varchar2_table(52) := '93C6C5E038F6A3FFA333478F4A1C70013A28E6F1EADC5A263A5C80CF987EA10DBAAB23478FD0F1175FA4F13367086DD6F56EDEBB9A0087F63F4B08475EFA310D8BC13137939AF26040E00274A0294AF56BACF4C0CEC901AB5468837A213E1B9BA6E123EF';
wwv_flow_imp.g_varchar2_table(53) := '12DA8CB62338B90DA5F6CD7504D0A70546C0E288D92BEEE6E20214775D8DEC8AD57BC575855E862AEB3ABBF66803CE04B87EC9D7F67CE976F9E4A472BC4E72A61CBEB4D6D5ADAAA6411CE5B17AD2D7D8483BC4856A730E9B55998A5444C58D32ACF02040';
wwv_flow_imp.g_varchar2_table(54) := '2EB2B8BCD97151BD4D9CD1B0C7F40844CFCE940B9B6C9B62E34ECBEF3A02748AD51C7DC545DF639A80D513DC712D5707617A82151F04C8E5A817831E67025C2083E87AFBF53DB029871F4EAAC375047012F8EC4BE511600254BE0FD8830A22C004A820F8';
wwv_flow_imp.g_varchar2_table(55) := '5C75E511600254BE0FD8830A2250460254B0955C352360800013C0001856BB030126803BFA995B69800013C0001856BB030126803BFA995B69800013C000185BD55C986311600238B66BD8B17220C0042807CA5C876311600238B66BD8B17220C0042807';
wwv_flow_imp.g_varchar2_table(56) := 'CA5C876311600238B66B6AC331A7B78209E0F41E62FF4A8A0013A0A4F072E14E478009E0F41E62FF4A8A0013A0A4F072E14E478009E0F41E62FF4A8A4009095052BFB97046C016049800B6C0C885542B024C806AED39F6DB16049800B6C0C885542B024C';
wwv_flow_imp.g_varchar2_table(57) := '806AED39F6DB16049800B6C098550847AB06012640D574153B5A0A049800A54095CBAC1A04980055D355EC68291060029402552EB36A106002544D575587A3D5E62513A0DA7A8CFDB515012680AD707261D5860013A0DA7A8CFDB515012680AD707261D5';
wwv_flow_imp.g_varchar2_table(58) := '860013A0DA7A8CFDB515011B0960AB5F5C182350160498006581992B712A024C00A7F60CFB55160498006581992B712A024C00A7F60CFB551604980076C0CC65542D024C80AAED3A76DC0E04980076A0C865542D024C80AAED3A76DC0E04980076A0C865';
wwv_flow_imp.g_varchar2_table(59) := '542D024C80AAED3A67385EED5EFC3F000000FFFF6084F42C00000006494441540300FC7D5439A729292A0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(11064948622846280801)
,p_file_name=>'icons/app-icon-192.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_256_rounded_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D49484452000001000000010008060000005C72A86600001000494441547801EC7D7B741CD599E777BB5BDD7A5B6FC9965FF293870D3686181B0864E69CD999D91C02589A249649C8FC333BCBE64C4E2633CCB0094B48369B';
wwv_flow_imp.g_varchar2_table(2) := 'B361669233994C9693591EB60C44924376920D04020E0E21C4360F631B30C60F616C3D6C4BB6DE5277DFF9BE92EA76496A49DD52F5ADAAAE4FAADBF7D67D7EDFEFABFBABFBA8AE0E00FF31028C806F116002F0ADE959714600800980AF0246C0C7083001';
wwv_flow_imp.g_varchar2_table(3) := 'F8D8F8ACBABF1120ED99000805768C804F116002F0A9E1596D46801060022014D831023E458009C0A78667B5FD8D80A93D13808904FB8C800F116002F0A1D1596546C0448009C044827D46C087083001F8D0E8ACB2BF11B06ACF04604583C38C80CF1060';
wwv_flow_imp.g_varchar2_table(4) := '02F099C1595D46C08A001380150D0E33023E438009C067066775FD8DC064ED99002623C2E78C808F106002F091B15955466032024C009311E17346C047083001F8C8D8ACAABF1148A63D13403254388E11F009024C003E3134ABC9082443800920192A1C';
wwv_flow_imp.g_varchar2_table(5) := 'C708F8040126009F189AD5F43702D369CF04301D321CCF08F8000126804946965FFC9348F73D779474DED35073E10B9F59D27377435DE7F66DABCF35365CD5F1D96DD774EDB8EBBAAEED0D9BD8B91003B40DD9886C453623DB910DC9966453B2ED2473FB';
wwv_flow_imp.g_varchar2_table(6) := 'FED49704D0F1E94FAFECD85E7F5747E3B6AF7734D63F83EE0D741FA1939D170B86464643DD72549E8B8E44DB86E3F28414E25800E4110888B7E23270302EE401762EC4006D4336225B91CDC8766443B225D9946C4B364647B6269B3F635C03742D6CBF6B';
wwv_flow_imp.g_varchar2_table(7) := '851FD9C01704D0B9BD6143C78EFAAF753436FCBAA3B1BE0F42B1E320A015403C00009F42B701DD22747CF80301B235D91C6D8FD7005D0B22F0015D1BED3BEAF7B66FAFFF6AC78E3BAFCD162866D2232B09E0484343B873FBB63FEDD8B1ED07ED8DDBDAA4';
wwv_flow_imp.g_varchar2_table(8) := '906F80848700E4C7118C02747C3002C9102810126E1502BE0132F82612C209BC8EBEDBDE58FF87744D252BE0F5B8AC2280CE1D0DABD058DFAA081BC3F69F83147F29402CF1BA91587EC710A8C3A9C45F098017E89AEADC5EFF3FE91A734C9A0C34EC7902';
wwv_flow_imp.g_varchar2_table(9) := 'E86C6828EC6CDCF6E738C4DF27A57C1F8DF5F788532D3A3E18013B11A89502EEA76BACA3B1FEE5CEED0DF7D0B56767034ED4E56902E8686CB85386E5EF24887F0309373B0120B7E94B046EC169E5A3F1B0DCDBB17DDB7F723302B3C9E6490238B7A3FE36';
wwv_flow_imp.g_varchar2_table(10) := 'ECFCAFE29C7E0F2A78353A3E1801ED08E068731308F12C5D8B744D6A17C086063D450034E4EADC51FF6440C24BD8F96FB4417FAE8211B0010179235D931D8DF53BE91AB5A1426D55788600708EBF1587FB6F49099FD1860E37C408A487C00E1989BF490F';
wwv_flow_imp.g_varchar2_table(11) := '89A557CCB9DC9E2000ECFC9F03E3AE0FBE7C58C3B9CB835B4E1B012956C685FCAD71CDA65DD8DE02A9D4E66A029000A213B75EB0F33F0E0061747C30025E40204CD76C6763FD37DC2EAC6B09801EBC40005B68EBC5ED20B27C8C403204F006F6D58EEDF5';
wwv_flow_imp.g_varchar2_table(12) := '8FD3B59C2CDD0D71AE240079DB6DA1CAB06C4580EE42C70723E05D04047CAE222C9BE99A76A312AE2480CEDA8A27903D3FE946C0582646600E08DC8ED7F4A3732837E722A916741D01E0E2C9B751F8CFA2E38311C82604768C5FDBAED2C95504D0DE58FF';
wwv_flow_imp.g_varchar2_table(13) := '255C3CB9CF5508B1308C805D0848B8CFB8C6EDAACF867A5C43001D8D77DD2400FEC1069DB80A46C0B508E035FE70E7671B5CF3D8BA2B08C058251582B6FA5C218F6BAF1E162C1B1008CA807CD4B8E633A44D3AD5BAA2C35544E44320C5CA7404E7BC8C80';
wwv_flow_imp.g_varchar2_table(14) := '871158655CF32E50C0710268BFFBCE7520E12B2EC082456004F42180D77C7B63C37A7D0D266FC9710210F1E03751B4203A3E18013F211014201D7F52D05102C06D91AD68F14FA1E38311F023029FB27B41305D101D25001CFA7F275D81393F23904D08C4';
wwv_flow_imp.g_varchar2_table(15) := '839246C08EA9E4180174ECD876076A4D2300F4F86004FC898090706BE78E863F764A7BC7084082F892534A73BB8C809B108883FC3BA7E4718400CE6EBF6B19321FBDA2DB29BDB95D46C03508505F68BFBBA16EBE02CDA5BC2304100C04BE80C20A747C30';
wwv_flow_imp.g_varchar2_table(16) := '028C008010527E1E1CF8D34E001200773FE01EE03F468011482020E17346DF48C468096927808EC6BB36A366CBD0F1C10830020904EAC6FB46224643483B010811A0D57F0DAA71138C80B710C0BE31E7DD80B96A1A986BC139979342BB927396950B3202';
wwv_flow_imp.g_varchar2_table(17) := '3A1190A0BD6F682580AECF7C661180BC4627A6DC1623E021043E76B1A161814E79B512800CC4FE0895E3D57F04810F46200902622447FE4992F88C45E9250021F9D77C32664AAE381B1010026E8334FFE6935D2B01A0A01BD0F1C1083002D323A0B58F68';
wwv_flow_imp.g_varchar2_table(18) := '2300F9E083D416CFFFA7373CA7300284C0FAF1BE42E18C3BEA94196F841AE83A76843A7F1E85D931028CC0B408E45F78EFED35D3A6DA9CA08D00A488F3FCDF66E37175D98940548894A701F345401B0100E8530AF88F11F030022200594900CB81FF1801';
wwv_flow_imp.g_varchar2_table(19) := '46607604245C317B267B72681C01408D3D22732D8C40B62320B4DD2C3512806402C8F6EB96F5B30981D4FA8A1D8D69218007C7B600CBED1098EB60047C804099AEAD402D04706FDBEB0568B4103A3E18014660760472CE1D3C983B7BB6F9E7D04200A178';
wwv_flow_imp.g_varchar2_table(20) := '80DFFB3F7F5B710D3E4220AF3C18D6A1AE1602188E092DCAE8008CDB60047420305B9FB14B062D04109482470076598CEBF10502BAFA8C16021889C678FEEF8BCB9695B40B015D7D460B0104804700765D185C8F3F10D0D567023AE00C44223C05D00134';
wwv_flow_imp.g_varchar2_table(21) := 'B7913508CCD467EC54520B0104E3C08B80765ACDA6BA625202399BAAE36A6C44202041CB4D530B018CD8080C57650F023D232370B4E792E1286C4FAD5C8B5D088CCA91EC2100BB40E17AEC41803A7C5BDF00C47104408EC2974646EDA99C6BF114025A46';
wwv_flow_imp.g_varchar2_table(22) := '009E4224CB85A5CE7FBAAF1F24FE9BAA5298E228CD8C63DF9D08D82D151380DD88BAB8BEEEE111A08E6E8A98575000E4E8DC2401CA43E7ECFC810013803FEC0C178787A1ADBF5F699B975F00577DFC36C39924408994A71B8982C2ECB21F012680ECB731';
wwv_flow_imp.g_varchar2_table(23) := '5CC0CEFF61FF80D234AFA010AEBAF53608E5E51A8E8820BFB048A5B721515CC4322A8203598B001340D69A764CB1CBA3A370C6D2F90B8A8AE1AADBC63AFF580E3048E0CA5B6F052B097C8865A8AC99877DE711C88404814C54CA75BA0381C1686CC29C9F';
wwv_flow_imp.g_varchar2_table(24) := '3A3F75F450243245C0502402945658BC40A5D17AC1502CA6CE39907D083001649F4D0D8D46E37138D1DB676CF551445E7E3E5CF1F18F43303CFD3359A14804D6DE720BE4E68E7D159DB608A90EAA8BEA60977D083001649F4D8D4E4F1D372AE38676C150';
wwv_flow_imp.g_varchar2_table(25) := '08AEB8E9160845A6DEF98D0C968F50240257DC7C0B50198AA6CE7FD2422414C72E7B106002C81E5B1A9A48FC3C85FBFC6AE82E045CB9652B848B0A3125B523525C0C6B37DF08806501FF06711A40D3010CF2E11002996A96092053C83A54EFB98101E8C5';
wwv_flow_imp.g_varchar2_table(26) := '853FB3F9D51BAF8382CA4AF33465BFA8BA1A565D93783D3D2D089E1B184CB93C67F406024C00DEB0534A5252C7EF1A1A5679172D5F0E65E854449A81F2952BA066E93255AA736808FA46A3EA9C03DE4720E07D15580342202A25D033FD1426475B7AB5D7';
wwv_flow_imp.g_varchar2_table(27) := '24EEE0143717B764C346F5B420956FEBEFE76F10121059E29800B2C4906D38EF8F8E2FFA054400D66EDD0A81D0FCBF504675ACB911EBC23A092A5A14B43E574071EC328B40266B6702C824BA9AEAA627FD68F86F36B762C3060817A6BEE867969BCECF5D';
wwv_flow_imp.g_varchar2_table(28) := '500C2BAEB95625D39786C8A9080E7816012600CF9A6E4CF011DCEF3F6B599C2BAF5908E575756389367ED27A40F9C245AA461A05D068404570C09308300178D26C09A1697B8E1ED8A198604E0ED45D7F3D0533E2965FB709A80DAA9CDE2444D30E0AB3F3';
wwv_flow_imp.g_varchar2_table(29) := '2E024C00DEB51DD0307C209A5895AF5BB77EC627FDE6AB6A281286BAABD6A96AFAB06DDA1E54111CB01D814C57C80490698433543F3DF063DD972F2A29C9C8D07FB2F8652B5680F5FB02561926E7E573F723C004E07E1B2595F002EEF7D3FCDF4C5C715D';
wwv_flow_imp.g_varchar2_table(30) := 'E686FE661BE4D3C3812B702A406172F4C46137BF3F80A0F0A46302F0A0D968CEDF3138A424A7077E724B16A8F34C07F2CA4A273C20D43E386879C158A65BE7FAED448009C04E3435D5454FFB997BFED4646F770F1CDBB74FABEBBF7C899A361C8D446844';
wwv_flow_imp.g_varchar2_table(31) := '629CF0876D08E8A888094007CA36B6119512E8915C6B95BD977AA0BBAB53ABEBEDE9B18A003422A191C984483E713D024C00AE37D14401BB70E8EFC68E169571E3D56313A5E533B723C004E0760B4D92EFA265C16DF1F51F83F58D773BEA165F7F8392F0';
wwv_flow_imp.g_varchar2_table(32) := '3C2E4CAA130E78020126004F98694C485A6DA73BAD7186CBF1ABFFCBBD50BDEDCF1C75ABFFE25E30DF1B406B01FC5C00D8F2A7AB1226005D48DBD0CEF9A1C4CAFFD2CD3742B0ACCC865AE75745B0BC1C96DCF03155C9791E05282CBC106002F082955046';
wwv_flow_imp.g_varchar2_table(33) := '7AE26F20967841E7E23FFD24C6BAE3B0CA425F4AA291803B246329664380096036845C926EBDB32E58B808F2AFBEC625920114ACDF004555554A9EF396918A8AE4802B11600270A559260A455FBCE91E49FCC6F2CADBEF0010E09E3F9465D5ED772A79AC';
wwv_flow_imp.g_varchar2_table(34) := '0B952A92032923A0332313804EB4E7D8160DABCDA239B9B9507AEB1F801D7FA31F9D017276D455FA893F846078EC75E244585699EDA89FEBC80C024C0099C1D5D65A2F8F8CAAFA966CDE022277F6D77BAB029302179FFB051CFCD27F835FDD753BFCFA8B';
wwv_flow_imp.g_varchar2_table(35) := '7F69380A53DCC55F3E3B2977EAA781BC3C5C0C4C6C093201A48E9D933999009C443FC5B6AD5B6BE59BE6F6A51F393C0C1FFCD3C3F0FAFFF90174B79D06FA3560B3790A53DCEB3FFC17238FB44C37CC3CA9F81516D92E8F24BEA69C4A59CEE30C024C00CE';
wwv_flow_imp.g_varchar2_table(36) := 'E09E72ABFDD1E8849770165DBB31E5B2D68C871EB81F4EEEFBB5352A6998F250DEA489B344166DB84EE5188EC7807703141C290774676402D08D789AED5987FF95ABD742A0A828CD1A00DA7FFC1474BD7F4C95AB5A7B256CFA6C236CF9F2570C47618A33';
wwv_flow_imp.g_varchar2_table(37) := '33741D7B0F3A5A7E6C9EA6EC07E99D042B56AAFC56D95524075C85001380ABCC315518EB5CBAFA86C41C7B6ACEE431C3A74EC291A777ABC4655BB6C2AAFFFC4988E056A2C0AD047214A6384A33331E79B2094670AA609EA7EAD7581E0DB64E5D522DCFF9';
wwv_flow_imp.g_varchar2_table(38) := 'F422C004A017EFB45A8B4A09F4B35C66A152CB10DB8C9BCD3FF78B9F81C47A285FC99265B0080980C2C91CA52D58B2D4488ACB38B43FFBFF8D703A1FA51B37A9EC56F252911C7015024C00AE32C744610671FE6FC6082120B26295799AB27FE9D4299577';
wwv_flow_imp.g_varchar2_table(39) := 'E1FAAB8D7BBE8A9814A0D1C0A2F58977FEF59C4E949D9475DAD3C8CA55208450E9F4C62075C2811911702231E044A3DC666A08583B4FD9B2E50001915A414BAE9EB63675965B5EA1C2D305AC797A4E9F9E2EDBB4F122148292C54B54BA550715C901D720';
wwv_flow_imp.g_varchar2_table(40) := 'C004E01A534C15C4DA798A8900A666993526DFD2E9E3E35381990A59B3E49796CE9475DAB492E589DF25188C26BEBF00FCE73A0498005C67928440D6CE53B4745922218D50D9CAC4AA7CEFC9D987F4974E9E50B597AE5AADC2E9040A2DB25A492C9D3A38';
wwv_flow_imp.g_varchar2_table(41) := 'AF1E049800F4E03CA756866271552E7F7C714E45A41828AA5BA172B61DD80FD1C1E97FE23B3A38006DFB0FA8FCC5962D3D159942207FE9D84222656502201466774EE56002700AF959DAA58E2381DEFE3F96317749625E3D1693DA67F9AD9F80707E8191';
wwv_flow_imp.g_varchar2_table(42) := '393A3C04EF3FD30AA3494860746000DE7B660FC446C6DE3910292C82F2DBFEC02897EE47EE2800D2A80000100049444154E20401D0C340A94C3DD26D83F3DB830013803D38DA5E0B751C6BA5A1AA1AEB69CAE120CEE337DCFB4595BFFBDC39D8FFAFDF87';
wwv_flow_imp.g_varchar2_table(43) := 'D3CF3F075D6FBD61B893BF7C0EF6FFF05FE012A6991937FED597E7F4D011950F959793A7DC645D5402071C478009C071132417C07AD70C457201D2DF0000F3AF78CB4D70E5A7125FD7A5F88FDE3E04EFFFEA05C39D3B7C88A294BBAAFED3506879AE5F25';
wwv_flow_imp.g_varchar2_table(44) := 'A41810E1F0849CF4EDC009117CE21A0498005C638A8982580920770E8FFF4EAC0DA0F6F37F0E5B1FFA1614CCF01AB1828A0A23CFA2ED3B26174FFBBCA02C310A88C6135399B42BF24101275564027012FD19DAB6F69970C1D81C7E86EC2925E5AF5B0F9B';
wwv_flow_imp.g_varchar2_table(45) := 'BFF703D8FCB77F0FEBB7DF0DCB6FBE05EA708D607DE3DDB0F9BEFB8D34CA935265B3640AE7E7AB1C563253911C7005024C00AE30C35421ACC3E67051F1D40C738C09209914DDB815AAEBFF0C567DF96F6125CEF5E9CDC2459BB7007DA77F8ED54E299653';
wwv_flow_imp.g_varchar2_table(46) := '9C90D9AACB948C1CE128024C008EC23F7DE3D6BB66A4A870FA8C2E4D89142464660270A991502C260004C18D879500720A139DC98DB22693C92A3313403284C6E29CFE640270DA0229B53F8F2D8094EAB73F53201854959ADF4654111C700D024C00AE31';
wwv_flow_imp.g_varchar2_table(47) := 'C54441844874FAE8D0F44FEF4D2CE59E337AB0C8944688842E661CFBEE408009C01D76982285B5CB8CF60F4C49777BC4E840BF1231605546C572C00D083001B8C10A4964085AEE9AA3831E24000B69597549A2AA6FA3DCA03813801BAC90448690E5B619';
wwv_flow_imp.g_varchar2_table(48) := '4BF2EC7E9222AE8AA22F169902E504F83233B1709BCF96719B45C6E509593ACD8865383D9EEC7A6F6420316AE111807BCDC504E052DB842C5380FEF3175C2AE53462C5E330D8D3A31243822F330586CB026C199719C414A7CBF233DBF1780CA25D5D6692';
wwv_flow_imp.g_varchar2_table(49) := 'EBFD68672790CCA6A09DFC63A12614CA774B8009C02D96189783BE3673AAAF0F7A26FD3ACF48C7B9F11CEEF786DBCF4E109274219D48B709097CE238024C008E9B60A2006D7DFD70C9F25B8066EAD0D9899DCA8C9F8FDFFFE61B406E3E75242B9B4C56D2';
wwv_flow_imp.g_varchar2_table(50) := '89744B969FE39C438009C039ECA7B47C1A3B3FDD2DCD846028640661F09CBD0470F9957DF0EA430F18AEF7D5DFAA76EC080C5864B5EA40BA918E76B4C175D8830013803D38CEBB161A225307312BAA5EBC04EAD6AD374FA1FB83E32A6C47E0D23BEFA86A';
wwv_flow_imp.g_varchar2_table(51) := '7A8E1E56613B025659EBD65F03A48B592FE9E8771230B17083CF04E0B015685E7CB2B76FC2B0BFAAB61696DDF03128B0BCD2BBF3DD7741DAF88A6DEBFB06ADAF029F2F1C12A72FD6DF212C2C2F3774A9AAAD5555130990CEA4BB8AE480230830013802FB';
wwv_flow_imp.g_varchar2_table(52) := '58A3D4014E61E7B7FE865E556D2D2CBF6133D02E606E71318472728CCCF1E8280C9FFCC008BBF963E8C47190B1B1DF0208A2EC11D48174219DCA6B162AD14967D29D3050911CD08E00138076C8C71AA40B9F3A007584B11800EA20D45184F914A00028A9';
wwv_flow_imp.g_varchar2_table(53) := 'A83493A1F7DDC4B05D45BA2C6095B1B4B24A49473AADBC718BA1A31949BA1306848519C7BE5E049800F4E2AD5A3B8D5B7DD401CC888AEA1A58851D843A8A19477E5145057986EB7EE788E1DBFD813C635B95DD4713322EB0C84E0D906EA46339EA4AE7E4';
wwv_flow_imp.g_varchar2_table(54) := '0803C282C27E706ED39109C0018B9C1D189830E72FABAA863AECFCC97EFBAFD0F272CDAEA3991901D876078E4BE8B02C2816E0FC7F0ABC38BA5981BA9654264636B4457876C07B5F799EA29B07239800341BEDE2F030589FF2A3BB240D8D03C1E4A6C82F';
wwv_flow_imp.g_varchar2_table(55) := '2F831C9C4B939883977B60D8E6DD00AAD7AE11C0D0F163607E07201CC985BCD2E4BF2D18405D576FB90948776A9F5CD7D010740F8F50909D4604925F751A05F05353A3F1389CE94FDCE9F20B0A61F5D69B21104ABC3D27191E95969F053B8FFBF7C9F2CC';
wwv_flow_imp.g_varchar2_table(56) := '27CEAE118055B6CA597EC988745E7DE356C8430C4CD9CFE0C8883032CFD9CF3C024C0099C758B5D03E3808E6F61BAD90AFBDE92608CED2F9A97059ED62F20CD7F6F25EC04A8CB05D1FB68C0090454EBDF49212C92AB38A9C14088673E00A0383B1079EE8';
wwv_flow_imp.g_varchar2_table(57) := '3D881D83633F4D36296B569CBA510926004D5619C6ADB18B9621EEB2B5574038C5977D165456402437CF90B4FFE245187CE7A811B6EB03FBEEBCAB1AC4B9FF50DF65A39E70240FF271EA629CCCF241182C452CCC6C841161659EB39F59049800328BAFAA';
wwv_flow_imp.g_varchar2_table(58) := 'FD02CEFDCD93DCBC3CA858B5CA3C4DC9AF5A92180574FD765F4A657466EAB24C4D6A962D4DABE98A95AB8048830AD108E9828528298E5DE6106002C81CB6136AEE1B8DAAF39ABA3A1081F4A02F5DBC44953FB5F74590B868A6221C0E902CA7686A322E87';
wwv_flow_imp.g_varchar2_table(59) := '55D6F1A8193D5A0F5858B75CE5E91F1D55610E641681F4AEC2CCCA92B5B547A584419C02980A16E1B69F194ED5CFC315F5A29212233BADB45F7CF10523EC868F0BBF7A5EADFE172E5800B9250BD216CB8AC90062956DBF259036209A0A300168007A309A';
wwv_flow_imp.g_varchar2_table(60) := 'B8FB53737925A5E4A5ED6AD7AC55658EFFF42700B8EFAE221C0AC8581C0C59C6DB5F7CC595E3A1F4BCDC9212B0FE0DDAF8BD076BBD1C9E880013C0443C327266BD9B85C311A027E2E6D250F1A25AC81DFFD1CDDEAE4EE8FDFDAB73A9C6D632BDAFFD16FA';
wwv_flow_imp.g_varchar2_table(61) := 'CE8FBDAD28AFA00016A08C7369807643AC5F1DB6623697FAB84C6A083001A486D3BC72D1F6965941242FD70CA6ED13712C5EBD46953BB1A74585E71310F3286C9561318D50E651596E5EBE92C48A998AE480ED083001D80EE9D40AADDB6C813417FF26D7';
wwv_flow_imp.g_varchar2_table(62) := '56BA6C39E484C34674D7F1F76D79A38F553EA3E2143FFA0EEC87F327C6BEA198130E03C99662D1A4D9429617A0D06E40D24C1E8C74B3C84C006EB64E12D968C5BCD6B28578F4478FE05A403C49CECC46499CA31FF9D10F5523B5ABD7CE796AA32AE18076';
wwv_flow_imp.g_varchar2_table(63) := '049800B4433EFF062B56AD51A3804B67CF4037AEC2CFBFD6F46AB8F8FCB3D0DBD969140A4772A172E50A23CC1FDE4220E02D71595A428016CC96AF5B4741C31DDEF938C40713DF31302233F811EFEF87234D4FA816EA50968065F8AE1238E07A0498005C';
wwv_flow_imp.g_varchar2_table(64) := '6FA2E402962EAB83FCC2222371B8AF17CEEC7ADC08EBF8687BE2D1C4BE7F7131942C5BA6A3594FB6E176A19900DC6EA169E413B8DA5EB771A34A3DF68B9FC3A0E5651C2AC1E6C0C0DB87E0F8F3CFA95AEBAEDBA4C21CF01E024C00DEB39992B8B0B212CA';
wwv_flow_imp.g_varchar2_table(65) := '172E52E76F7EF7E18C4E05E238F47FE31F1F56ED55D6D6427E59993AE780F7106002D06033BC5967AC95CAA54B55DDFDE7CF43DBA33F52E7A9065295EFD4BF3D028397BA55B5E596EF27A8480E780A0126000DE69AEB3EFB6CA2F59E6B8763BFFFFD846C';
wwv_flow_imp.g_varchar2_table(66) := 'C75FF825F41F7A7342DC6C27A9C8D777F0009CD8FBE284AADE3FB01F488609917CA210F0428009C00B564A2263C7B16370F4D557202EA73E03F0C63F7C0762172E242935B7A8685727BC81D38BC9A563B198214317CA32398DCFBD8100138037EC949032';
wwv_flow_imp.g_varchar2_table(67) := '2EE1F4810370EAF0DB2A2E27108055C545403E450EF55E8643DF7A08E4A41F18A5B4749D1C1A86B7BEF97518C6F93F95A536AC6D51DC0994A5EDF583806C44A7EC3C84001380878C151B1985F75ED907ED6DA795D4B9C120ACC6CE5F80FBF0CB0A0B54FC';
wwv_flow_imp.g_varchar2_table(68) := '859327E083EF7F579DCF2980738363FFF41DE8FEB04D15A736A82D6A93DA3613CE9D3A65C816B3BCF7C04C63DFBD08300168B04DAA8B6C3389121D1884232FBD083D5D63DFBCA3BC45393913EEFCD431AB2D5F363AF59B7DD099C21786A693AFBDF569F8';
wwv_flow_imp.g_varchar2_table(69) := '70FF6BD494E16AF2F280DAA01373244032D0393992ED9DBD2F01C94AE77E765ED19D09C003961AB870110EBDF8020CF6F72969CB226158515408417A2040C5025027B576CA43BB1E879E5FBF64C9912C88B7FA49D1DDD8DEE1DDBB542CD56925174AA0B6';
wwv_flow_imp.g_varchar2_table(70) := '49069285CEC9F5D3F403CB0E7427760B289E9D3B11600270A75D9454973EFA080EBFBC17462DF3F98578275E529018EEABCCE3011AA64702C1F1338003DFFB4738F4D5BF83B3D8A13B5A7F0CE4BA8FBDA7D22F6298E2C89DDDBD130EDD7F1F1CFCFEF754';
wwv_flow_imp.g_varchar2_table(71) := '3AD54575AA88490192856432A349D6C3381220D9CD38F6DD890013803BED6248D5F1EE3BF0EE6BBF0329137768EA88559661BE9171D207DD99971715404824CCDB79F4081C6D791ADE6EDA6938FA2AB1598CC266FCD1961F43E7BB89B70E531D755817D5';
wwv_flow_imp.g_varchar2_table(72) := '69E64FE6934C249B99463293EC9DEF2588C64C63DF3D0824AE10F7C894759224BA6F6AAA495CE93FF1FBD7E0D4D14447A40E48ABEF25E1704A95D002DD9A0545908F8B8329154892291F1718A98E08FA4992A744916C2423C96A269E3C72D8D8B5209DCC';
wwv_flow_imp.g_varchar2_table(73) := 'B86CF7BDA41F1380066B4DB7C896ACE9180EF5DFDBF732749D39A392C3B8CD47ABEEE6029C4A9825400B75546E79612154E5E642312E1A16222190A334B33885298E1CE5A1BC5466F58262B5B568E69DCD2719A94D92D9CC4BBB16C750A718EE629871EC';
wwv_flow_imp.g_varchar2_table(74) := 'BB030126000D7648750430D2D707475E7C112E5D38AFA4CAC3BB2F75C454EFC2AAA025B0209C030BF3F3A00E170D57E2962139EAE866160A531C39CA4379A98C999EAE4FB2D248806437CBF6A04EB48BC13B042622EEF0990034D8219511C0E573ED7018';
wwv_flow_imp.g_varchar2_table(75) := 'B7F90607FA9544D431A9238526ADF4AB0C360552912FDDA6685441B2D3EE81599676316837A3B7A3C38C62DF610498001C34407478180671BBECD4FEFDF0CEABAFC0A8E507312A2211E38E1DC870E7CFA4FA24FB0A1C7594A32E663BB44370F495DF00E9';
wwv_flow_imp.g_varchar2_table(76) := '4CBA1306669AB42C769A715EF3BD262F1380068B59A70097B0C3BFB6A715C81DFCF9CFE010DEF53B2C4FDA91388B70B85E5B9078432EC565D259E5CB443B8B5117EB3621B5413A93EE84016141EE720F3F3B40D8E8744C001AD0B6AE8ACFD41CCD9969D8';
wwv_flow_imp.g_varchar2_table(77) := '5C890B7633E5B3232D6019F707348C32689B9074A3DD8954E4D721532A72647B1E26000D16A695F1994880B6DB6AF3F3610DAEBA535E0D22E18E40623B713E0B7EE9C84ABAAD451D17E10887749EAE2C3D7B50883B16D3A573BC7D083001D887E5B435D1';
wwv_flow_imp.g_varchar2_table(78) := '82D855250B60655191727437A4B86BCB4A8156F92B7223D396CF4442614E08AE2E2D8175E8A86366A28DE9EAA4110EE94CBA13068485159BAB4B1740A6173EA7936D3EF15E2CAB85007204C4BC088E9D32D390963A9DE9A8D31131D8D946BA7551279B69';
wwv_flow_imp.g_varchar2_table(79) := '64926E7D73C94F181016262EE4CFA59E6C2B130C844774E8A48500E24C003A6CC96D641102F1E1612D374D3D04A049992CB23FABE27304E220B388003429E3F36B86D5771001BB9B0E878251BBEB4C569F9611802E659229C8718C80171188892C1A0184';
wwv_flow_imp.g_varchar2_table(80) := '42717DBF5BE5456BB3CC8CC024042241993D8B8025FD390393F4E3534680119801015D7D46CB144034378F8080E119F4E52446C0B308D82E38F615A3CFD85EF1D40AB51080D1AC8476C3E70F4680119819018D7D451F010013C0CC56E75446600C0129E0';
wwv_flow_imp.g_varchar2_table(81) := '1468FA6302D0043437C308A48C8094DA46CBFA0840C0BB2903C01919018F209009318510D9370290717813F88F116004664540675FD136020849C90430ABE939032300A0B3AF0474015EBE76FD316C6BEA4FD962241F8C0023A0101818EF2B2A2293016D';
wwv_flow_imp.g_varchar2_table(82) := '04201E7C903AFFFB995486EB6604742290A1B6DE1EEF2B19AA7E62B5DA08809A9520791A4040B06304A647406B1FD14A0002602FF01F23C008CC8080DE9BA456020881FC196A2ED1F1C10830025311908158CEFF9B1A9DB918AD0450DEB4E70C803804FC';
wwv_flow_imp.g_varchar2_table(83) := 'C708781C81CC882F0E553EF5D4D9CCD49DBC56AD04608820E4B386CF1F8C002330110107FA867602C0AD0026800AE9BF1A000005BB494441548966E73346C04040CAF8334640E3877602A8C92F7B05F53B8D8E0F4680114820D056FDD1C50389533D21ED';
wwv_flow_imp.g_varchar2_table(84) := '04201E796414043C06FCC7087814818C882DE051B177AF96F7005AE5D74E00D4782C1E7F147DDE0D4010F860041081684C88FF8BBEF6C3110258B47B0F4E01C42FB56BCB0D3202EE44E0E78B7636B739219A2304408AC685FC36F9EC1801BF231017F05D';
wwv_flow_imp.g_varchar2_table(85) := '70E8CF310258B8AB652F80780EF88F11F01002F68B2A9E1BEB0BF6D79C4A8D8E1180219C88DE67F8FCC108F814015C08FB1B2755779400AA77FDE42D54FEA7E8F86004FC88C04F6B9A9ADF7652714709801417427C05FD3E747C30027E42A01FA2C1BF76';
wwv_flow_imp.g_varchar2_table(86) := '5A61C709A06A57F3711C067DCD6920B87D46603604EC4D975FA97EFAE90FECAD33FDDA1C270012B97A44FC3308F80D85D93102D98F8078A5BAA9F5876ED0D31504209A9B6302C41710109E0A20087C64350238F40F7CDE2D1ABA8200080C9A0A8090F760';
wwv_flow_imp.g_varchar2_table(87) := '388E8E0F46201B11C06B5BDCED86A1BF09AE6B088004AADED5DA8A2381FF4E61768C809B10B0431609F0D7D54DCD3FB1A32EBBEA7015019052554DCDDF9612E8BB0274CA8E11C80A048494DFAB696A71EC89BFE940741D0190A0D585657F01129EA7303B';
wwv_flow_imp.g_varchar2_table(88) := '46200B10F849E59AF55F76A31EAE2400FACA70AC70F80E046C0F3A3E18012F23F0D358C1F00E9DAFFA4E072C57120029B0E8917F1FA86A6AA91700DFA473768C805308CCB55D9CF3FF2FBC86EFA46B79AE7564BA9C6B098014C7CE2F11C0AF8100DA3689';
wwv_flow_imp.g_varchar2_table(89) := '511C3B46C003088C80841D38E7BF9FAE6137CBEB6A023081ABDED5F2840CC89BF0FC3D747C30026E46E0ED005EABD5BB5B9ADC2CA4299B27088084ADD9D9FADA404EE1061C0D7C1DCF47D1F1C108B8098151BCEB7FA3AAA06C53E5CE56EDEFF69B2B109E';
wwv_flow_imp.g_varchar2_table(90) := '210052B0EEB1C7867034F06020185C2784F8778A63C70864128114EAC6A93EB4E0F57815DEF51FA005EC14CAB8268BA708C044ADF289A78F55ED6ABE1D207E3380A0B70C03FF3102BA11C0F9FD5E11939BAA9B5A1AF07A3CAEBB7D3BDAF32401988A5737';
wwv_flow_imp.g_varchar2_table(91) := 'ED79A5BAA9F96609F12D0072274E0F86CD34F619818C20206018AF339CDFC76FAE6A6AF944D553AD6F64A41D4D957A9A004C8C6A9AF6FCAEBAA9F573B158CE629C87FD0D08E9F8D72C4DD9D8CF1A044EA026F7C5F01AC369E88E6ABCF9E0B9E78FAC2000';
wwv_flow_imp.g_varchar2_table(92) := 'D30A8B9E7CF23CCEC31EAEDED5BA0AA4FC638CFF8104F921FA7C30026923605C3B42FE2B08F147D54D2D2BD1FD6FBAC6D2AEC8C505B28A00AC3857EF6E7D0E0D766F4D53EB5210B10D52C2D700C4CB00D08F8E0F46201902786DE03522E00121C546BA76';
wwv_flow_imp.g_varchar2_table(93) := 'F066F25FAB773567ED63E9594B0056EBD2BB076B76B77C13D70B6E45522804195F8953856DB86EF010E6A37712BE89BED65F65C5F6F8700E01B235D91C6D2F1F32AE856870155D1BC635B2ABE51B55BB9B29DD390935B5EC0B02988C65F5EE3D27AA77B7';
wwv_flow_imp.g_varchar2_table(94) := 'ECA96E6AFD1FD54D2D77A0DB88AE169DA82AEBCF0DE7444B458E58180A87964602628590724D1CC4D51097D706447C53408AEBD9B91003B40DD9886C453623DB910DC9966453B22DD9181DD99A6C8EB6C76B80AE0517BC9E6BF275AAE3DC97043013B0E2';
wwv_flow_imp.g_varchar2_table(95) := '9F7F315CFAD8333D558F35B7973FFAD487253B9B4F56ED6E7D7F6153F3D1EA275B0F55EEDAF37AE5EEE683EC5C8801DA866C44B6AA429B91EDC886644BB229D97626DB5BD3FC126602F08BA5594F462009024C004940E12846C02F083001F8C5D2AC2723';
wwv_flow_imp.g_varchar2_table(96) := '900401268024A07094BF11F093F64C007EB236EBCA084C4280096012207CCA08F8090126003F599B7565042621C0043009103EF537027ED39E09C06F16677D19010B024C00163038C808F80D012600BF599CF565042C08300158C0E0A0BF11F0A3F64C00';
wwv_flow_imp.g_varchar2_table(97) := '7EB43AEBCC088C23C004300E047B8C801F116002F0A3D5596746601C0126807120D8F337027ED59E09C0AF9667BD19014480090041E08311F02B024C007EB53CEBCD0820024C0008021FFE46C0CFDA3301F8D9FAACBBEF116002F0FD25C000F819012600';
wwv_flow_imp.g_varchar2_table(98) := '3F5B9F75F73D024C00BEBF04FC0D80DFB5FF0F000000FFFFE9F311C000000006494441540300186DF1C4F26E9A380000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(11064948951265280803)
,p_file_name=>'icons/app-icon-256-rounded.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_32_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000020000000200806000000737A7AF40000022E494441547801EC544D6FD340107D896D62C7A9435A058534AD38503E94961E41A5E25770E39F202490B87043E2372010870A41254E80385002DCC80984684E';
wwv_flow_imp.g_varchar2_table(2) := 'A4B59D10D206C9F147CDEEA64E54556D765D55952AAFFC763CB32F332F638FD3E69DDBE149228D135E8980A40349078ED4018B8C300531B1AFD802DAA464F9FA12A66F2CA11586C48B77C512D0F37C9C9D5F84ACA9905415858545FCF37DC459C202E87F';
wwv_flow_imp.g_varchar2_table(3) := 'B58200BDB60DF3C777865EBB05CB0FE2D487B0802DD7C3B57B0F70F1E1A33D58B87B1FDB9E272C4258806B4C40BB721561BF8FF5278F19E83D8D397AEEF805E873975911FF4F1BD9734506BFD301D229E87397D899C826DC0165AAC8F22BE7CBD02AB3C8';
wwv_flow_imp.g_varchar2_table(4) := 'CE5C80522A0D629353CC8A6CC202765C67983FBF7C0BC6CDE5A11FC4980421019DBE8BBF8DC6A860B78B80200A741BEBA09CC8E7B1DC02E8EC67ABF3905D7798D76DFE86BBD11CF83B2164C7815EAD827207C1F13BB7807E6112F94A05B94201DBB54FFB';
wwv_flow_imp.g_varchar2_table(5) := '326F7D5E43AE588451998163E4F79D1F14E016204D0C46CC284FE3E7F3A708C9D7304A1A92AEFC7AF10C067931694CC91BD470815B406A375D8A8E5B2603F3D5CA6E04D87CB9025DD540CF583015B19977E8C62D806609C9736ED6BF41B32DD8ABAF617E';
wwv_flow_imp.g_varchar2_table(6) := '7807F3FD5BB4DEAC423537B151AF8372289717DC02BA968DC6DA47E45A363459424991802F35E06B8DDCCB2C96B54DC6A15C702E6E01B3818732C199F4E827BA2C8322AA959124C6A1DC2836CE8EB28D631ED3792220E9C0E9EFC0B8E1F90F0000FFFF8F';
wwv_flow_imp.g_varchar2_table(7) := 'E3A64D0000000649444154030098AD0830F136D6B20000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(11064948043207280796)
,p_file_name=>'icons/app-icon-32.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/shared_components/files/icons_app_icon_512_png
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '89504E470D0A1A0A0000000D4948445200000200000002000806000000F478D4FA00001000494441547801ECBD07941C497ADFF995E9AEEEAAF68D06DA000D8FC178B7E397E4925CED2DC9D351E67847191E4FC793481DDFE93DE951F7C4D349F4273A91';
wwv_flow_imp.g_varchar2_table(2) := '4F8F144552ABF59ECB5D2EB94B2EB966762CC6ECEC3898816B0003EF4D7757972FC5D740030DA03232ABBA4C9A5FCF545756C41711DFF78B42E73F232223E3A7FFD1FF5CE50503BE037C07F80EF01DE03B10ADEF405CF881000420000108402062044410';
wwv_flow_imp.g_varchar2_table(3) := '0091EB7202860004200001082000F80E400002108000042247400366044029F082000420000108448C000220621D4EB8108000042010750257E347005CE5C06F08400002108040A408200022D5DD040B01084000025127B0143F02608904EF1080000420';
wwv_flow_imp.g_varchar2_table(4) := '00810811400044A8B309150210800004A24EE046FC08801B2C38820004200001084486000220325D4DA01080000420107502CBE347002CA7C131042000010840202204100011E968C2840004200081A813B8397E04C0CD3CF80401084000021088040104';
wwv_flow_imp.g_varchar2_table(5) := '4024BA9920210001084020EA046E8D1F01702B113E430002108000042240000110814E26440840000210883A81DBE34700DCCE841408400002108040E809200042DFC5040801084000025127502B7E04402D2AA441000210800004424E000110F20E263C';
wwv_flow_imp.g_varchar2_table(6) := '0840000210883A81DAF123006A732115021080000420106A02088050772FC1410002108040D40938C58F007022433A04200001084020C404100021EE5C42830004200081A813708E1F01E0CC861C084000021080406809200042DBB50406010840000251';
wwv_flow_imp.g_varchar2_table(7) := '27608B1F0160A3431E04200001084020A404100021ED58C2820004200081A813B0C78F00B0F32117021080000420104A02088050762B41410002108040D409B8C58F007023443E042000010840208404100021EC5442820004200081A813708F1F01E0CE';
wwv_flow_imp.g_varchar2_table(8) := '080B08400002108040E808200042D7A5040401084000025127E0257E0480174AD8400002108000044246000110B20E251C0840000210883A016FF12300BC71C20A021080000420102A020880507527C1400002108040D409788D1F01E095147610800004';
wwv_flow_imp.g_varchar2_table(9) := '2000811011400084A83309050210800004A24EC07BFC0800EFACB0840004200001088486000220345D49201080000420107502F5C48F00A88716B6108000042000819010400084A42309030210800004A24EA0BEF81100F5F1C21A021080000420100A02';
wwv_flow_imp.g_varchar2_table(10) := '088050742341400002108040D409D41B3F02A05E62D8430002108000044240000110824E24040840000210883A81FAE34700D4CF8C1210800004200081C013400004BE0B09000210800004A24EA091F811008D50A30C04200001084020E004100001EF40';
wwv_flow_imp.g_varchar2_table(11) := 'DC870004200081A813682C7E044063DC28050108400002100834010440A0BB0FE7210001084020EA041A8D1F01D02839CA41000210800004024C000110E0CEC3750840000210883A81C6E3470034CE8E9210800004200081C012400004B6EB701C021080';
wwv_flow_imp.g_varchar2_table(12) := '0004A24E6025F1230056428FB2108000042000818012400004B4E3701B0210800004A24E6065F1230056C68FD2108000042000814012400004B2DB701A0210800004A24E60A5F12300564A90F2108000042000810012400004B0D370190210800004A24E';
wwv_flow_imp.g_varchar2_table(13) := '60E5F1230056CE901A2000010840000281238000085C97E1300420000108449D4033E2470034832275400002108000040246000110B00EC35D0840000210883A81E6C48F00680E476A81000420000108048A00022050DD85B31080000420107502CD8A1F';
wwv_flow_imp.g_varchar2_table(14) := '01D02C92D4030108400002100810010440803A0B57210001084020EA049A173F02A0792CA9090210800004201018020880C074158E420002108040D40934337E044033695217042000010840202004100001E928DC840004200081A813686EFC0880E6F2';
wwv_flow_imp.g_varchar2_table(15) := 'A436084000021080402008200002D14D380901084000025127D0ECF81100CD264A7D108000042000810010400004A09370110210800004A24EA0F9F123009ACF941A21000108400002BE278000F07D17E1200420000108449D402BE24700B4822A754200';
wwv_flow_imp.g_varchar2_table(16) := '02108000047C4E0001E0F30EC23D0840000210883A81D6C48F00680D576A85000420000108F89A0002C0D7DD83731080000420107502AD8A1F01D02AB2D40B010840000210F0310104808F3B07D7200001084020EA045A173F02A0756CA9190210800004';
wwv_flow_imp.g_varchar2_table(17) := '20E05B020800DF760D8E410002108040D409B4327E04402BE95237042000010840C0A70410003EED18DC820004200081A813686DFC0880D6F2A576084000021080802F0920007CD92D380501084000025127D0EAF81100AD264CFD108000042000011F12';
wwv_flow_imp.g_varchar2_table(18) := '4000F8B05370090210800004A24EA0F5F123005ACF981620000108400002BE238000F05D97E0100420000108449D403BE24700B483326D400002108000047C460001E0B30EC11D0840000210883A81F6C48F00680F675A81000420000108F88A0002C057';
wwv_flow_imp.g_varchar2_table(19) := 'DD81331080000420107502ED8A1F01D02ED2B403010840000210F0110104808F3A0357200001084020EA04DA173F02A07DAC6909021080000420E01B020800DF74058E400002108040D409B4337E04403B69D316042000010840C0270410003EE908DC80';
wwv_flow_imp.g_varchar2_table(20) := '0004200081A813686FFC0880F6F2A635084000021080802F0820007CD10D380101084000025127D0EEF81100ED264E7B108000042000011F104000F8A01370010210800004A24EA0FDF12300DACF9C16210001084000021D278000E87817E00004200001';
wwv_flow_imp.g_varchar2_table(21) := '08449D4027E2470074823A6D420002108000043A4C0001D0E10EA0790840000210883A81CEC48F00E80C775A8500042000010874940002A0A3F8691C0210800004A24EA053F123003A459E76210001084000021D248000E8207C9A860004200081A813E8';
wwv_flow_imp.g_varchar2_table(22) := '5CFC0880CEB1A76508400002108040C70820003A869E86210001084020EA043A193F02A093F4691B021080000420D0210208800E81A7590840000210883A81CEC68F00E82C7F5A8700042000010874840002A023D8691402FE2050F5871B7801814812E8';
wwv_flow_imp.g_varchar2_table(23) := '74D008804EF700ED43A0CD042AD5AA9C5EC8C9C12BB372C0BCCEE67252AC54DAEC05CD4100029D268000E8740FD03E04DA4860A15496BD97AFC8A98505992B95246B5E27B20B8B4240F3DAE80A4D4120E2043A1F3E02A0F37D800710680B814B85821C9E';
wwv_flow_imp.g_varchar2_table(24) := '9B93428DAB7D4D9B999D13B5698B3334020108749C0002A0E35D800310683D81D962518ECD676B9EFC975A2F552BA2A301970BC5A524DE2100811611F043B508003FF4023E40A085042EE4F3E6CA7F5ECA66EEDFAD195D0B70646E5E2EE60B6EA6E44300';
wwv_flow_imp.g_varchar2_table(25) := '0201278000087807E23E046C04CEE5F28B57F5BAF0CF66B73CAF2A553996CDCA9985DCF2648E210081A611F0474508007FF4035E40A0A904F4F63E5DDD7FDC9CC8BD5CF9DFDAB80A86930B0B8B770BDC9AC7670840201C041000E1E847A280C04D044E9A';
wwv_flow_imp.g_varchar2_table(26) := '13BFCEE7DF94D8C007BD5BE0F87CB68192148100049C08F8251D01E0979EC00F083481805EB9EB89FFAC19FA6F42758B559CCBE71717102E7EE0170420101A020880D07425814040E49499B73F9BF336779FEC4D4B7722E109DB79230254587832C60802';
wwv_flow_imp.g_varchar2_table(27) := '10B010F04F1602C03F7D812710689880CEF9EB6D7E5E4FFE23ABC664FBF77E9FDCF53DDF27A313939EDAD5BA11019E506104814010400004A29B701202CE0474D8FF547641F42ADDD9EA46CE9039F96F7CF431C964D2921A1996E9071E9491B1D5370C2C';
wwv_flow_imp.g_varchar2_table(28) := '472A024E9AB62C266441000216027ECA4200F8A937F005027512D02B7FBD2A3FE371D87F787C5CB63EF55E49F6A4AEB7D4DDDB239B9F7C4A46C627AEA7D90EB42D5D1C68B3210F0210F03F010480FFFB080F215093805EF91F9B9FF77CE5AF43FD9B1E7D';
wwv_flow_imp.g_varchar2_table(29) := '5CE289DBFFD96BDAC6871E92B175EB6AB6756BA23E4CE8A869FBD6743E4300023602FECABBFD2F81BFFCC31B0840A00601BDF2D7057F173CEED8A7277F1DF64F269D17FD257B7A64FABE0764D5E4548D166F4FD2B675F4E1F61C522000812010400004A1';
wwv_flow_imp.g_varchar2_table(30) := '97F01102B710D079789D8FBF25B9E6C7B1B56B65E3638F49A2C695FFAD0592A96ED9F8E8A332E65104A80F3A1A706B3D7C8600046E27E0B7140480DF7A047F20E042E0423E2FBAC5AF8BD962F6AAA9B5B2FEE1472411F7FE4F3D6E6CA7CD74C09AF5EB17';
wwv_flow_imp.g_varchar2_table(31) := 'EB70FBA56B02BCFAE35617F9108040FB0878FFABD03E9F68090210702070F5A97E0BA2FBF53B985C4FD6A1FC4D8F3C2A5EAEFCAF17BA7690ECEE9675F7DE2F2393EED301BA1641A702E68AA56BA5798300046E27E0BF140480FFFA048F205093C0956251';
wwv_flow_imp.g_varchar2_table(32) := '8ECE673D9DFC27366C900D66283F168FD5ACCB4B62A2BB4BB63CFA98AC99761F095041A24F11440478218B0D04FC410001E08F7EC00B085809E4CB65396E4EFEFAB85EABA1C91C9B9C94A9071E94447CE5FFBC5540ACBBFF0159B37E83A9D9FE7FA95A91';
wwv_flow_imp.g_varchar2_table(33) := '93D9ACA8AF764B7221103D027E8C78E57F21FC18153E41204404F4A43F333B27854AC535AAE1D5AB65E3A38F37E5E4BFD458A22B29EBEFBD57863C6C169435424547021A7902E1527BBC430002ED218000680F675A81404304F444FAEEDCBCA7937FFFC0';
wwv_flow_imp.g_varchar2_table(34) := 'A06C7CE431D1ABF6861AB3148A7577CB26331DD09FC958ACAE662D1811A0DB12EBDA80AB29FC8640D409F8337E04803FFB05AF20B0484087FDE74AEE8BEB12A9946C7CEC71E94A752F966BC52FAD7BC3C38F484F3AED5AFDA542C1F39D0AAE9561000108';
wwv_flow_imp.g_varchar2_table(35) := 'B4840002A02558A914022B27A0B7D65D342752B79AE25D29B9E33D8F486F7F9F9BE98AF3D3AB4665F37DF74B229170ADEBE4C282E82D8BAE86184020E404FC1A5EDCAF8EE11704A24CE072A1285EF6DB8FC562B2E5C107A47FCD9AB6E1EA9B9C948D0F3C';
wwv_flow_imp.g_varchar2_table(36) := '2871D3B65BA3C7E61764A1547633231F0210E80001044007A0D324046C0474D1DFC9EC82E8FCBFCD4EF3369913F1F0DAB57AD8D6D7E8FAF532BDFD4ED736AB529563F3F3A231B91A6300815012F06F500800FFF60D9E4590809EF40FCFCD4BBEE27ED53C';
wwv_flow_imp.g_varchar2_table(37) := 'B565ABACDAB0B1639456DF79A74C6EDCE4DABEDE19706C3E6BA480AB29061080401B092000DA089BA6206023A00FF8D17DF5B31E16FDE9BDFE93F7DC2BD2F83E3FB2D21F6D7AEDFD0F78DA2D5037313AB3905B6993948740E008F8D96104809F7B07DF22';
wwv_flow_imp.g_varchar2_table(38) := '45E07C2E2FFA701DB7A00756AD92F566E83F1ED753B09B756BF3F59643DD6E787074D4B5215DD3A042C0D510030840A02D0410006DC14C2310B013C895CB9E16FD653219D9F2F07B24D1D363AFB08DB989445CB63CF2A8A407075D5B3D31BF201AABAB21';
wwv_flow_imp.g_varchar2_table(39) := '06100805017F078100F077FFE05D0408E802B9A366DE5FE7FF6DE1762592B2E9B127A4CB88009B5D27F292E9B4E882C4AE54CADABCAE6D383E9FB5DA90090108B4870002A03D9C6905028E04746E5C17CA391A68462C66AEFC1F96F490FB55B69A77E295';
wwv_flow_imp.g_varchar2_table(40) := '31D3001B1F7A8F6BD3BAB191AE757035C400020127E077F711007EEF21FC0B3501DD28E78287CD7E26EFD82EFD53EDBFDDAF5EF8436BD6C8C446F73B135400E86E81F5D68F3D0420D03C020880E6B1A42608D445401FEE73329B13B73DF3FBCDDCFAD4B6';
wwv_flow_imp.g_varchar2_table(41) := '6D620601EAAABF13C6BA2870EADEFB24D33F606D5EF707386562D7E90FAB219910082C01FF3B8E00F07F1FE1610809E87CBFCEFB97AAF627FC25BABA4457D9C793C9C05048185F373DFC1E491ADF6D4E2FAE07C8B21EC0C6883C08B4920002A09574A91B';
wwv_flow_imp.g_varchar2_table(42) := '020E0474DE5FE7C21DB2AF269B4BFECD77DD253D03F6ABE9ABC6FEFA9D1E19960DF73DE0EA90AFED800000100049444154946E79CC54802B260C024820082E230082D04BF8182A02B3C5A29CCDE55D635AB361830C6FDEE26AE7578391E969593D39E9EA';
wwv_flow_imp.g_varchar2_table(43) := 'DE716E0D74658401045A410001D00AAAD4090107023AE77D743E2B3A07EE60B298DCDFD7276BEFB96FF138A8BFCC00864C3FF41EC90CDAEF5CD069109D0E096A9CF80D81DB090423251E0C37F11202E120703697737D308ECEF7AF7BF81133871E9C797F';
wwv_flow_imp.g_varchar2_table(44) := 'A7DE497477C9F43DF74AB2BBDBC964315D6F833CE7615464D1985F108040530820009A82914A20E04E40E7BBCFE50AAE86D3DBEE90FED11157BBA0180CAC5923531E9E1C7822BBC0A38383D2A9F8692510944C0440507A0A3F034D406FF53B694E706E43';
wwv_flow_imp.g_varchar2_table(45) := 'FFAB26A764F5D66D818EB596F3639BB7C8F09AF15A59D7D3948D3E2F40EF90B89EC8010420D03202088096A1A562085C25A04FF9D393BFDEF67635A5F6EF9E9E1E597BF7DD124B84EF9F652226B2F1A187A5A7CF7E47833E2C48A7496A13221502412010';
wwv_flow_imp.g_varchar2_table(46) := '1C1FC3F7972638ECF13422042E170A722EEFB2EA3F16938D0F3E2CA9FEFED052E9EAED918D77DD29B144C21AE39985BCE4CB65AB0D991080C0CA09200056CE901A20E0484057FD9F5DC839E62F654CACDF20FD13E34B1F43FBDE6FA63826D6AEB3C6A753';
wwv_flow_imp.g_varchar2_table(47) := '01C717A74BAC666442C0970482E414022048BD85AF8123A0C3D9BAC2DDE6786F5F9F4C6DDF2E319B5148F274ABE0F1ED774AD2651440F74A982B164312356140C09F041000FEEC17BC0A01819C19C6F6B4EA7FEB3649A4D32188D85B085D99B4ACBFFB1E';
wwv_flow_imp.g_varchar2_table(48) := '57635D3751AAEA0A0A57530C20E01302C172030110ACFEC2DB8010D055FFBAA25D87B36D2E8FAD5E2D83EBD7DB4C4299B76AF31619195D658D6DC108A8933C2BC0CA884C08AC8400026025F4280B010702BA9AFD72C13E841D8F271677FB8BC523F8CFD0';
wwv_flow_imp.g_varchar2_table(49) := 'CC77ACBDD34C0574753910BC9A7C215F606F80AB28F81D0002417331827F7982D645F81B34027AF5EF69E1DFF43AE91EB26F931BB4D8EBF1B7D78C7E4C6EDAE45A44D751285357430C200081BA082000EAC2853104DC099C5EC889DBC2BFFE4C9F4C6CBF';
wwv_flow_imp.g_varchar2_table(50) := '53A2FEB37AEB1D924AA5AC182E160AA2232A56233221D07102C173000110BC3EC3631F1328542AEEF7FC1BFFD7DD7B6FA416FE99906BFEAFCF0AD870F7BD35F396279ECC2E08A300CB89700C8195134000AC9C213540609180AE573F97CBB99EA8C6D68C';
wwv_flow_imp.g_varchar2_table(51) := '4BDF78F8EFF95F84E2E1D7E0F4B4AC59655F10A8C2EA2C0F0BF24013934E110862BB088020F61A3EFB92C07CB124E7F3F687FDC424267AF51FC9857F0EBDA67B034CDC75B724BBEC0B02CF7810570E4D900C0108D4208000A8018524083442E0F482FB30';
wwv_flow_imp.g_varchar2_table(52) := 'F5D4A64DD23560DF0FBF91B6835EA6DB8C00ACDBB2D51A864E01A808B01A9109818E100866A3088060F61B5EFB8CC07CA924F325FBFEF599C12119D9BACD679EFBC79DC1E9F5924A67AC0E715BA0150F9910A88B0002A02E5C1843A0368113D90571DBF4';
wwv_flow_imp.g_varchar2_table(53) := 'A77F7C8D247A7AA55CA9F2BA8541C57C8EA75232B276AD482C264E3FFA6C858B0597072B3915261D022D2210D46A110041ED39FCF60D814B858264CD08809B43A7F6EE95B7BEF265D9F5377F2DBBBE6E5EFACE4B94C7DB86C39B5FFD0B39B96FAF88CBF6';
wwv_flow_imp.g_varchar2_table(54) := 'BF3A0AA042C08D37F91080809D0002C0CE875C085809E8BCF4F93A56A797CB6559C8CECBC2BC79E93BAF451E79C341D958615FCB2C1B81A07B2DE85D17D792788340070904B769044070FB0ECF7D4040B7FB759BFBF7819BA173414701F2464C852E3002';
wwv_flow_imp.g_varchar2_table(55) := '82401B092000DA089BA6C2474057A5BBCDFD872FEACE47A4CCCFD531F2D2798FF120AC04821C170220C8BD87EF1D25A057FF39AE423BD607BAF662AE58EA58FB340C81A013400004BD07F1BF2304741E5AAFFE3BD2388D2E12D03E389FE78E804518FCEA';
wwv_flow_imp.g_varchar2_table(56) := '108160378B000876FFE17D87085C29143DADFCEF907B9169561F12C41D0191E96E026D320104409381525DF809E8EAF373B99C6BA0BD998C0CAC5EC36B050C7AFAFAAD9CF52E0C5D1068352213022D2210F46A110041EF41FC6F3B81B9625172958AB5DD';
wwv_flow_imp.g_varchar2_table(57) := '2DFFC30FC9531FFB8C3CFA871FE2B502064F7DE863B2E1031FB4B2BE60A601F46141562332210081DB0820006E43420204EC04CEE5F2D627FE25CD95FFF8F77C9F483C66AF885C5702B1EE2E59F7C11F916ECB16C17AF2BFE8F21026D786308040DD0482';
wwv_flow_imp.g_varchar2_table(58) := '5F000110FC3E24823612D07BCF75DED9D6E4EA2D5B25B5659BCD84BC3A08744F4ECA9AFBEEB396B8604601743AC06A4426042070130104C04D38F800013B01B7F9E67897B962FDC10F885EB9DA6B22D72B815877B74C7DFFFBADE68BA30005FBA398AD15';
wwv_flow_imp.g_varchar2_table(59) := '9009813A0984C11C0110865E2486B610D07BFEDD044066F51AC9DC736F5BFC895223E9ED77CAF0FA8DD690756A4617685A8DC8840004AE1340005C47C10104EC04668B4529552D8BFF623159FF7DDF2FF1A1217B45E4D64D209EC9C8F4F77CAFB59C0AB4';
wwv_flow_imp.g_varchar2_table(60) := '050F0F65B2564226043C1108871102201CFD48146D20A03BFFD99AE91B5D25238F3C663321AF5102F1B88CBCEF07A477C02EAEDCFAA8D1E62907813012400084B15789A9E904164A655970D9F677E2BEFBA57BFDFAA6B74D855709C4070665F231BBC0D2';
wwv_flow_imp.g_varchar2_table(61) := '511A5D0F70B504BF21D01A0261A9351E9640880302AD24A05BCEDA5699C7924959FDDEEF69A50B91AF3B964CC8F8FB3F60E5902B57649EE7035819910981250208802512BC43C081806E35AB0F9E71C85E4C1EE3D6BF450EADFE955ABB4E26B6DFE9D84C';
wwv_flow_imp.g_varchar2_table(62) := '55AAE2D6578E85C980802702E131420084A72F89A44504E64B25D107CFD8AA9FFEC1BF25F1BE3E9B09794D2010EFE995753FF2B7AD35CD99FE52D16635221302101004005F0208B810705B5836B4765AFAEFB56F54E3D204D95E09C444FAEE7B407A8686';
wwv_flow_imp.g_varchar2_table(63) := 'C4E947A76A180570A243FA4A0984A93C02204CBD492C4D27A057FFFAB2553CF9F8E39258BDC666425E1309C4337DB2C98CB8D8AABC982FB88EDAD8CA9307812810400044A19789B1610273C592D886937B874764F4D1C71BAE9F820D1088C764F5FB3F20';
wwv_flow_imp.g_varchar2_table(64) := '5D5DDD8E85F58E8D42D9B2678363493220602310AE3C0440B8FA93689A4CE08ACBF6B213F73F20A92D5B9BDC2AD5B911488EAD9689871EB69AB93DB3C15A984C084480000220029D4C888D11D02BFF0597ABC8558F3CDA58E59D2E65E2AA9A61F26AA128';
wwv_flow_imp.g_varchar2_table(65) := 'E2F268E34EBB5AB3FD785C265CA601744F00B7C59B35EB2611020E04C2968C00085B8F124FD308E809446F2B73AA3033B54ED21B373965FB26BD72E992E4DF7E4BCE7CE2A332F3EBBF26EFFCCA2FC8DBBFF06FE5BBBFF86FE5B57FFFF38BC77B7FED97E4';
wwv_flow_imp.g_varchar2_table(66) := 'D06FFDBA9CFBC2E724F7D61B52B978D137FE3B3992DE768774F5F438654BDE889C6CA9E4984F0604A24E000110F56F00F1D724A02BC9752159CDCC6B89239B374B727CE2DA279FBD55AA523C7E4C4E7EF6D3B2F3D77F55769813FF5B5FFA539979E52539';
wwv_flow_imp.g_varchar2_table(67) := 'F6FA77E5F4EE9D7271EF3B7269DF5E39BD6BA71C7DED3B7270C70BF2C6A73F292FFCD2BF979DBFF16B72EA4F3F2FC563477D16D80D77E2E98C8C3FE83C0D50AA564445DC8D121C41602504C257160110BE3E25A226102855AB9275D9FA77F4AEBB9BD052';
wwv_flow_imp.g_varchar2_table(68) := 'F3AB289D3E2527BFF05979F9DFFDBCECFAFC67E48C39C99716B29E1BAA9AD8B5CCCE4F7D425EFDD55F5A1402E573673D976F97A1EE0C38F6E043D6E6668B8C00580191196902088048773FC13B11D02B471D0570CA4F2693D2EFB7C57F662E7FD65CDDBF';
wwv_flow_imp.g_varchar2_table(69) := 'F22BBF28BBCC957FCE0CFD3BF9EF353D7BE6B42C0A815FFE05B9F4DC335E8BB5CD6E71FF8558CCB13D9D06E0D9008E78C8A88340184DE3610C8A9820B052027AFB9FAD8EB17BEE95AEB1D53693B6E655733939F9E77F26AF98B9FCEC89E34D6F7BCE4C05';
wwv_flow_imp.g_varchar2_table(70) := 'BCFE07BF27A7BEFC45A9FA685E3D393A267D6B9CA761AA52651AA0E9DF062A0C0B010440587A92389A466071F57FA96CAD6FF49EFB24DEDF6FB5695766657E5E663EF571D9F5F18F48D58C02B4AADD723E2F3B3FF61139F4D1FF262A385AD54E3DF5C612';
wwv_flow_imp.g_varchar2_table(71) := '09997AEABDD6222AE66CA339D6C26442609140387F2100C2D9AF44B502027AC228562BD61A067C32FF5F3527E5C39FFBB41CFAEA5F58FD6D66E6CC5F7E450E7FFA13CDACB2F1BACCE8FFE8C3EF9158CCF94F994EE7A8A86BBC114A42209C049CFFD58433';
wwv_flow_imp.g_varchar2_table(72) := '5EA282802B01DD40C676C538BC69B3748F8EBAD6D372834A55CE7CEB1B32F3953F6F7953B736306304C7E92F7FE9D6E48E7CEE59BF41D27D19C7B6CBD5AAE863821D0DC880800B81B0662300C2DAB3C4D53081ACCB1CF7AA6DDB24B9AAF3F3FFF37B76C9';
wwv_flow_imp.g_varchar2_table(73) := 'CE8F7CC8739CE9B131D9F8DEEF91077EFC1FC8A3FFFC67E5897FF5738B2F3DD634CDEB35365E2AD43B05767FF65332F7C677BD98B7D4269EEA91B17BEFB7B6315F2A5AF3C984401409C4A318343143C089800E1517CD95B553BEA60FDF79B788197A960E';
wwv_flow_imp.g_varchar2_table(74) := 'FE942F5C909D1FFE90A705797DE6A47EF78FFE5DB9FF277E52261E7D5CD2936B25D99B3621C4165F7AAC699AF780B1B9FB47FF8E64568DB946A76B02767FFCA352C97ABFC5D0B5D2460CE23159F5E863D6925997351DD6C264469C4078C3470084B76F89';
wwv_flow_imp.g_varchar2_table(75) := 'AC01027AA2D095E34E457B4646A577D316A7ECB6A59F7FE525993D3CE3DADEE4FD0FC8BDE6A43EB879CBE2C9DEAD804A82C1CD5BE5BEFFED2745CBBAD95F397C48CE7DF3EB6E662DCFEFBBE73ED105814E0DE9AD8079977D1D9CCA920E81B012400084B5';
wwv_flow_imp.g_varchar2_table(76) := '6789AB21027345FB50F1C8962D66F8DFFDEAB8A1C63D162A9D3D230774DEDFCC6DDB8A6C7AE229D9F0837FCBD389FFD67A540868D94D4F3C796BD66D9FF77EF98B52EEF0D6C1C9E111199E5E7F9B6F4B092533AAE3F658E7255BDE21B09C40988F110061';
wwv_flow_imp.g_varchar2_table(77) := 'EE5D62AB8B805E25BA9D2446CDF07F2CD55D57BDCD36BEF8FA7725EB72AFFFBA071F94710F276F37DFC68D8858F7C08356B3BC998E38FBAD0E8F02C444262C0F66D2511D7605B4762399112480008860A713726D023A449CB7DC479F88C564C8E56458BB';
wwv_flow_imp.g_varchar2_table(78) := 'E6E6A55666E7E4C473CF5A2B1C5CBD5AD67DFFFBAD36F564AEFB81F74BBFCBA647275E7CB19E2A5B623BF2C863128F271CEBCE964A5275CC250302B508843B0D0110EEFE25BA3A08E8B6B1B6DBFF46B66C9564FF401D3536DFB478EA845C3E7ECC5AF1FA';
wwv_flow_imp.g_varchar2_table(79) := '27ED1BE3580B3B646E78EA29879CABC9978D5F4517BFAE5AB6EE77F7C64D92EA73DE9C4947784A1681D73ACFA81902FE248000F067BFE0550708E80880ADD9A1AD5B259EC9D84C5A9E377B60BF142E393FAA3763AED4FB366D6EBA1FFD9BB648DAD4ED54';
wwv_flow_imp.g_varchar2_table(80) := '71A550904BDF7DCD29BB2DE9B1585C06376EB4B655440058F990793381B07F420084BD8789CF33819CCB2AF1DE3513124BA53CD7D70AC32B3307ACD58EDF7187357F2599B6BAAB86DD9599832BA97EE5656322839BB78898A91A71F871EB638762244320';
wwv_flow_imp.g_varchar2_table(81) := '94041000A1EC5682AA97800EFD172BF619E2F4E464BDD536DDBE90CB5BEB1C5CB7CE9ABF92CCC1B5F6BAF5C9812BA9BF196533D3D3124F38AF03C895ED5B3C37C307EA080B81F0C78100087F1F13A107027A65A85BC6DA4CBB7DB0FB5F7161C1E6A2740F';
wwv_flow_imp.g_varchar2_table(82) := '0F5BF35792991AB1D79D9FBDB292EA9B5236B379AB24AC02A02C45A6019AC29A4A824F000110FC3E24822610C896CA621300C99E5E89F7F636A1A5C6ABA81A1FF32E0220DE936EBC0197926E75171672A23EBA54D3D2ECAED155928C398F00E4CD540502';
wwv_flow_imp.g_varchar2_table(83) := 'A0A55D109ACAA3100802200ABD4C8CAE04B28BB788394F018C6CDD26F19E1ED77A5A69108BC7CCF476CCDA44B5CE709E6600001000494441548537BAB9D55DA994C5B61B9FD5F12665C65329C9AC727E5093DE0990671AA049B4A926E804E2410F00FF21';
wwv_flow_imp.g_varchar2_table(84) := 'B052023AFF9F335786B67A86366E9258AAB30240E27149B988908ACB08812D46B7BCB24BDD3D7A8744CCAD9616E79BF6FBA7D65A1BC91BA16235201302120D04088068F433515A08E875BF5E195A4C24333169044067770054FFBA5CA621F2172FA8594B';
wwv_flow_imp.g_varchar2_table(85) := '5EB90BF6BA7B3ABC47C252D07D1BECB702E619015842C57BC409200022FE05207C111D01B0CDFFC76331E95DBBD617A8BA5C4600668FD937095A4910B3C78F5A8BF70CD917094A9B7ED27A2740B7B35873137B6D7293667C4C202AAE2100A2D2D3C4E948';
wwv_flow_imp.g_varchar2_table(86) := 'C0ED84604695A56B78C4B17C3B33FACC4884ADBDB3FBF6D9B25794776EDF5E6BF901974D78AC859B98D9B371B3C4CC74895395E58ADB6A06A792A443205C041000E1EA4FA2698080DBAAF0F4AAB18E2F005C0A6B60EB36EBC9EDCA99D3923DD4FC0D79E6';
wwv_flow_imp.g_varchar2_table(87) := '660EC8EC99B34B6EDCF61E3757DC43F7DB1F1A745BA1162524474725D19D72ACBD2255EB1D1F8E05C9880881E8848900884E5F13A903013701D06FE69463E604E750BCADC9DDEBA66574EB1DD636679E7FDE9A5F6FA65E2FCF3CFF9CB5D8E0F884746FD9';
wwv_flow_imp.g_varchar2_table(88) := '66B5695766ACAB4B322323E2F4A3533E3C13C0890EE95122800088526F136B4D02AE0260ED3A89F7F5D52CDBEEC4F8D0904C3CF6B8B5D92B67CFC8D1A7BF61B5A927F3E837BF2973E7CE391789C564E2F1274474AE44FCF1333039E5E8882EFACCB9DCF5';
wwv_flow_imp.g_varchar2_table(89) := 'E158988CD013885280088028F536B1D624E0B60620E39305804BCE8F3CFAB8F4581ECCA376475F7F5D4EED78510F57F43AF5E2F372ECCDD7AD75740F0ECA9A0FFE88D5A6DD99033A6AE3A048AA460114B813A0DD5D427B3E248000F061A7E052FB082C94';
wwv_flow_imp.g_varchar2_table(90) := 'CA52743919F44EAD6B9F431E5AEA9A9C942D1FFC6157CB991D2FC8E16F7EDDCC789B339EABF5CD065553EAD037BE2E332FEDB839E3D64FE6EA7FCBFB3F20093332716B56273F678C0048F6D45E07A0B1E95E00F553E96444B4DD1E02D16A050110ADFE26';
wwv_flow_imp.g_varchar2_table(91) := 'DA5B0894AA1529E925E12DE94B1F13F1B8245DF6C0970EFC8C7DEFFBA4DF4C4DB8357DE2CD3764E7273E26F3752C0CD4057F6F7FFCA372F2AD37DCAA17BD2B61E2EFFD98AB5DBB0D7AD6AF9764579763B37923FA742D80A30119108800010440043A9910';
wwv_flow_imp.g_varchar2_table(92) := '9D09E8FDFFC58AF3B560A6AF5FE289A473051DCA498C8ECA1D7FFB7F122F3FB367CFCA9B5FFAA2ECF9D427E4CCAB2FCBC28963525AC89A6BFCEAE24B8FB3C78F99BC9764CFA73F2E6FFDD997EC73FED71A8D77A7E4CE1FFB5F25E6B237C135F3B6BE2586';
wwv_flow_imp.g_varchar2_table(93) := '47AD02A064FA1C01D0D62E0944635173120110B51E27DE9B08E889404F8337252EFBD03B30206286B9C5873F83EF7BBFDCF977FE9E78FDB978FA941C78EE5979FDB39F9157FECB7F961DBFF3DB8B2F3D7EE3739F3179CFC9C553A73D55178BC5E48E0FFE';
wwv_flow_imp.g_varchar2_table(94) := '900C7EEFF77BB26FB7512C999084E5CE8D9219F969B74FB40701BF1188FBCD21FC81403B09B89D08BAD26973FEF7E73F93585752267FFC1FC9C60E2CC09B7AF47199FA897F22E2A395FF72CB4FB2CB7937403300B0B803E42D45F8186902D10BDE9F7FD9';
wwv_flow_imp.g_varchar2_table(95) := 'A2D70F44DC2102BA2B9CADE9AEC1419178CC66D2D13CDD9F60D3FFFE53B2FE7D3FD0163F62B1984C3EFC1EB9E35FFE9C48C2DF7F3E9296E726E8A88F8A80B640A31108F89480BFFF05FB141A6E858740C5CC82DBA2E9D6DBEDCC49CF66D3E9BC5877976C';
wwv_flow_imp.g_varchar2_table(96) := 'F9999FBD3A1F9F48B4CC9D8439A16E3773FE77FDFCBF13151E2D6BA84915ABBFB6AA5404D8F2C98B168128468B008862AF13F37502BA08F0FA871A073A8F1CEF4DD7C8F157929E90A7FEC13F96877EF65F48AAD90FE53102A877F5B83CF8D3FF974C9929';
wwv_flow_imp.g_varchar2_table(97) := '078907E3CF46573A23B61FB7BEB795250F026120108C7FC961204D0CBE24A08B006D8E25F524E2F3A1EEE5FE0F9BA980C77FF5D765EB0FFD8824BA7B96673574DCDD3F20DB7EF87F94C77FE3B765E87BDFD7501D9D2AD465462C6C6D23006C74A29617CD';
wwv_flow_imp.g_varchar2_table(98) := '781100D1EC77A2BE46C0ED56B064DAFF57FFD742B9FEA61B05ADFFA73F23EFFD8DDF926D1FF8A0A4078724614E86B184FBF480DA245229E99F98943B3EF8C3F2F82FFE8A4CFFD43F9384AE85B8DE42300EE296BB003402048052E0156502088028F73EB1';
wwv_flow_imp.g_varchar2_table(99) := '8BDB42B0440005C052B776ADDF20D33FF3B3F2E4873F214FFCF2FF2F77FFF83F94A9C79F90D5F7DC27C39BB648CFD898A427A76478CB565973DFFDB2F689A7E4EE7FF813F2D46FFEAE3CF69FFF48D6FDB37F2EDD1B372D5517B8F764C6650AC0ADF30317';
wwv_flow_imp.g_varchar2_table(100) := '310E374A20AAE5100051ED79E25E2460A6B717DF9D7EE995B3535E60D263223D9BB7C8F8DFFF5FE4CEFFE7FF95FB7EF9D7E4E1DFFE5D79EF1F7D589EFCFD3F94877FF377E4DE5FFC55D9FEAFFF8D8CFFDDBF2FDDEBD60526349BA3099DBEB118545C1680';
wwv_flow_imp.g_varchar2_table(101) := '5A8A9205815010400084A21B09A255046296ED645BD526F5368740C28CDED846011800680EE7E0D712DD081000D1EDFBC847EEBC01F00D34F100DC0170C35B8E9613D0937F2CE6FC27AE6A7906C4F27A388640580938FFEB086BC4C405816504DCCE01F1';
wwv_flow_imp.g_varchar2_table(102) := '9EDE65D61C068940F7F884D83671F2220083142FBE364620CAA5100051EE7D62772510EF49B9DA60E04F02B12EDD0A38E6E89CDB1D208E05C980404808200042D29184D10202B198C4BB110012D09F84DEFA68D9C699458001EDD8A6BA1DEDCA1000D1EE';
wwv_flow_imp.g_varchar2_table(103) := '7FA2B71070BE76B41422CB370462A91E11EB1A00E10702912680008874F713BC8D403CD9252C14B311F2775EBCBB5B12A60F9DBC640D801399E8A4473D520440D4BF01C4EF4C405708EACBD9821C1F13A8562BAEDE21025C1161106202088010772EA1B9';
wwv_flow_imp.g_varchar2_table(104) := '138859C6F92BE592C402F2E01BF748A367512D14A46AFAD016B9A5FB6DC5C80B0501824000F01D882C01B73FFE5573F5AFAFC8020A78E0955C4E54C43985E1D6FF4EE548874058082000C2D293C4D112027A15D9928AA9B4E504AA4533026019E38FA100';
wwv_flow_imp.g_varchar2_table(105) := '5ADE077E6E00DF4410007C0B224D20E6127D25B7E06241B65F09142F5C30AE392B8098C44C3EFF4320BA041000D1ED7B22F740A0B28000F080C99726A5CB97C4F6B847CB1601BE8C07A79A4980BA9400024029F08A2C01B76B40044070BF1AE5ECBC14E7';
wwv_flow_imp.g_varchar2_table(106) := '661D03883102E0C8868C6810400044A39F89D28980CB44709911002772BE4F2FCD67AD3EC6ACB964869900B15D258000B8CA81DF1125E0F60FA092CF45944CF0C32ECFCF073F082280400B09B8FDFD6B61D3540D81CE1388BB8C0020003ADF478D7A502E';
wwv_flow_imp.g_varchar2_table(107) := 'E4AD451371C600AC80429B49604B0410004B24788F2481848B0028B90C2347125A4082769BBE71EBFB8084899B1068980002A06174140C0301B79340296B9F470E0383B0C65074E93BB7BE0F2B97A8C745FC370820006EB0E0288204922E5BFD96E6E7A4';
wwv_flow_imp.g_varchar2_table(108) := '323B174132C10FD94DBC252C4F0A0C7EF44400017702080077465884984057DC3E0F5CB870DE44EFBC998CC9E47F9F12281AF166732DE9D2F7B6B2E40595007E2F278000584E83E3C81188BBAC01983B714CA48A0008DC17C37459C14500C4D9072070DD';
wwv_flow_imp.g_varchar2_table(109) := '8AC3CD25106F6E75D40681601148BA0C03E72E5D914AA914ACA0F0562AD979292D38DFC2193327FF780C50512340BC37134000DCCC834F1123A00BC1E296518062B128FA54B98861097CB8A5B367A45476166E7173F28F5BFA3DF0000800021E0820003C';
wwv_flow_imp.g_varchar2_table(110) := '40C224BC0466F5046F19E2CF57CA52387D2ABC00421A59FEDD235229971DA32B9B3EBF542838E693114602C4742B0104C0AD44F81C19025933B47F3E6FDF2C4661E4CF9CD6375E0122B070FC98945CFAF65C2E2F2A00031416AE42A0A90410004DC54965';
wwv_flow_imp.g_varchar2_table(111) := '4121A07FF80FCECE49A1527175396F8693AB2E2713D74A30682B81F9E3C7A562AEF26D8D6ADF1F999B97B9A2F35481AD3C79C12280B7B7134000DCCE84949013B85C28CAB1F9ACEB096209C39CB99AAC9A324B9F79F73F817923DABC78A953012A02AE98';
wwv_flow_imp.g_varchar2_table(112) := 'A9202FF6D840204C04100061EA4D627125A0C3FE7AF2D7AB3F57E36B0697F6ED132915AF7DE2CDEF04AA665467AE8E751BA56A6551103212E0F79E5D897F94AD450001508B0A69A124A057798766E745FFE0D713A06E28532D314C5C0FB34EDA566667A5';
wwv_flow_imp.g_varchar2_table(113) := '50677F158D68383437C79A804E761C6DB79D0002A0EDC869B01304F4EAEEB819F6AFF7E4AFBE96CCC9A45A0CE18AF14A55F46A59630CD3AB72F992942D770038C5AA6B0674744885A2930DE9C12480D7B50920006A732135440474D85FE779EB19F65F1E';
wwv_flow_imp.g_varchar2_table(114) := 'BE9E188A274E2C4F0AF4716ED74E99F90FBF2AAFFEF4FF21AFFCCC3F9583E638BF6F6FA0635AEE7CEED08C545D16002EB75F7EACDF91A373599937A26F793AC7100823010440187B9598AE13D0AB393DF93772E5BF5449D51C5C7D26803908F8FF0BBBDE';
wwv_flow_imp.g_varchar2_table(115) := '96977EE1FF9399575F96CBE7CFC9ECB93372C81CBFF22BBF20F977F6043CBAABEEE78EBE2BD5064600AE961629552B726896E980251EC17F2702270208002732A4079E805EF91F37C3FE7A55B79260F46272E1E44909C33A80635FF81329556EDF20273F';
wwv_flow_imp.g_varchar2_table(116) := '3F2FA7BEF137522DBBDF16B91296ED289B3B71DCC4717B8CF5B4AD7707301D500F316C8348000110C45EC36757023A843B63AEE2BC9CFC63F1B87427128E759A9972993F6EAE2A17161C6D029151A9C8C599038EAE5E3A7E4CCA8B4F3F74340944C6BC11';
wwv_flow_imp.g_varchar2_table(117) := '6B3647BBD2198999FF6C369AA7DF9D77E7E6990E5018017EE1BA33010480331B72024A4087FD8F9A795CBD8A730BA1B7272D1B1F7D5CA6B66C9598E5C14067DEDE2995800B806AA96C9D1B9F3D764C2AB9608B9C8A117D5933B5E1D4EFDAC713776C97ED';
wwv_flow_imp.g_varchar2_table(118) := 'F7DD27BD998C93D9F574FD0E1D9E9DE7EE80EB44380813010440987A93586469D85FF7F077C3D1D5DB2B9B1F7E48564D4CC8C8F4B4F4F4F739165928E4A578FCA8637E2032CCDCB6EDCA77F16E87804F01E4F6EE919C658FFF8CE9F391C94919D8B45936';
wwv_flow_imp.g_varchar2_table(119) := '3EF0A0A47A7A5CBB4ED7041C9F5F58FC6EB91A63E03302B863238000B0D1212F5004747BDF43E66A4D876EDD1C4FA55272E7634F4866CD1AD187C2253319490F0E3916D33B01F2478E38E693E10F02B36FBE2139CBAE7E99A1414976778BC463D26FFAFE';
wwv_flow_imp.g_varchar2_table(120) := '8E279F92AE2EF3D9C57D1594FADD5281E9624A3604024300011098AEC2511B013DF9EB559A5EADD9EC34AF379D96ADE60F7FEFC8B07EBCFA8AC7656064F4EAB1C3EFD98307A43237E7904BB21F085CDCB3D3BAC5F3C0D0B02462373CED1D1A926D8F3F2E';
wwv_flow_imp.g_varchar2_table(121) := 'FA9DB8915AFB48BF5BEF9AA925DD53A2B605A97E23803F760208003B1F72034040AFCAF40FB35EA5B9B9AB0BC0B63EFA986486979DFCAF15BA49105C4B5BFE76EEEDB7A49A9D5F9EC4B18F08541716E4F2A953568FF4847FAB41DFD8986C7AE861E94EF5';
wwv_flow_imp.g_varchar2_table(122) := 'DE9A75DB67FD8E1D9D9F9785D2CAEE32B8AD621220D0010208800E40A7C9E611D0057F5EEFF3EF31F3BFDB1F33577B2323351D48F5F549775757CD3C4D5C3027FFD2B9737AC8CB87048A33072597737EBC73777FBFE8AB96EB7DAB57CBF6279F149D1AAA';
wwv_flow_imp.g_varchar2_table(123) := '95BF3C4DA798F40E13BDD364793AC77E23803F6E04E26E06E443C0AF04F40FF089F905D13FC86E3EA67AD3B2E5C9F74A7A78C8D13491484AFFC080637EA15C91ECA119C77C323A48A02A92DDBD534A15E77D0CFAFA07249E725EF4D76BBE1B5B9F784AD2';
wwv_flow_imp.g_varchar2_table(124) := '7DFDAE81E87480EE13C074802B2A0C7C4C20EE63DF700D028E0474D8FFD0EC9CE890ACA3D1B58C5426237AE59F19743EB9AB69221E0E8311D70000100049444154933ECB3A00FDA33F6BAE32AB0B3935E7E52702D5AA5CDAF5B6E89E0D4E6EF599919F58';
wwv_flow_imp.g_varchar2_table(125) := '32E194BD989E191996CD0F9BE980B4FB2D82B9725974F449DF851FDF11C02177020800774658F88C800EFBEB9CBFDEA3EDE69ADEEBBDF5B127A4C7FC6177B3D5FC7E331F1C8B3BFFB338FFF69B52999B55535E3E22502DE4E5E2A1438E1EC56331C91801';
wwv_flow_imp.g_varchar2_table(126) := 'E068B02C233D3A2A773EF9A4F4A452CB526B1FAA28D4E90046026AF321D5DF049CFFD2F9DB6FBC8B2801BDF23F3E9FF574E5AF0BFEB698617FBDF5CB2BAE1E330290B0DC16367BE182542E5EF05A1D766D22503C755266B359C7D6BACDF44EBAAFCF31FF';
wwv_flow_imp.g_varchar2_table(127) := 'D68C1E3315B4D94C07F4F6BB4F0714CDB4834E07E894D4ADF5F0B9530468D70B010480174AD8F882809EFC0F79BCCFBFD7CCF7DEF5C49392B66CEE532BA8447797E8A841AD3C4D2B56AA523816F00D81349030BDAA220BBB764AC10CC93B85953227F264';
wwv_flow_imp.g_varchar2_table(128) := '77B75376CDF43E336AB4E5A187A527E32E1C742AEA909992623AA0264A127D4A0001E0D38EC1AD9B09E4CD1F77BDF2D721D79B736EFF94E9EF972D8F3E263D83F639FFDB4B5E4DE91B1ABA7A50E3B7CE31CF1D74DE4FBF4611925A4DA05A912B3BDFB4B6';
wwv_flow_imp.g_varchar2_table(129) := '3260A6762456FF9F3B9D0ED8F298F92EF5BADF22A8535247E7E645BFAB5667C86C39011AF046A0FE7F11DEEAC50A024D23602EF0E4A819F6CF1A11E056692A9D91AD66D83FDDE0C95FEBD73D026212D3C39AAF4B3307A4CCED8035D97422B15A28C8C57D';
wwv_flow_imp.g_varchar2_table(130) := 'FB1C9B8EC562D267E6F52D5DEA585633324343B2C58C26F50EB80B4AFD8E9E5C58B06E46A475F282801F08C4FDE0043E40C089809EFC8FCDCF7B7A225BA67F50B63FF994A43269A7EA3CA5A7CD08427732E1687BFEE04129993967470332DA4AA078F890';
wwv_flow_imp.g_varchar2_table(131) := 'CC5DB9E2D866A2AB4B7A46ECBB3C3A16BE9691312260EB830F4BEF80BB08B85C288AAE09D0EFEEB5E2BCB595008D79258000F04A0ABB8E10386DAEA62EE40BAE6DA7CD9CFFA6471F959E01F7455B6E95E99C6F66B8F666415A56D722CCBDF5861EF2EA34';
wwv_flow_imp.g_varchar2_table(132) := '017396BDB4E305C9559CEFFFD7070025EA9CFFAF1556EFE8886C7EF811E9ED75179817CDA8C479CBA644B5EA270D02ED268000683771DAF34CE092F9237ADAC33DF7A94CBFDCF17DEF93F40A86FD973B1533278BBED155CB936E3BBEB06BA7942F7037C0';
wwv_flow_imp.g_varchar2_table(133) := '6D60DA9CA0B7FF9D7AE905EB90FBD0D86A49C49AE358667848B63DA5A34CEE0B034F641744BFC3CD69995ABC12C0CE3B010480775658B691802EA4D2797FB7267BCD9CFF1D4F3E29DDDDCE5BF8BAD5715BBE39590C4E4EDE96BC3CE1DCC103523E717C79';
wwv_flow_imp.g_varchar2_table(134) := '12C71D20A0DBFF5E3CEF2CC4E2C92E191E1F6FAA673D0303B2ED3DEF71BD3B40178C9E3422A068199D68AA635406813A092000EA048679EB0998515D396B864FF511BCB6D6E2C9A46CB8FF7EE9ADF3563F5B9D4B79FA47BECF72FB973E7276F6CDD797CC';
wwv_flow_imp.g_varchar2_table(135) := '79EF04814A55E65E7A516C27D8BEA141E95EE1FC7FADD0F4EE80F5E6BB178FDBFF84EA36D53A12A0DFE95AF590D66C02D4570F01FBB7B79E9AB085409308CC168BA273A86ED56D7EE82119989870336B283F1E8FC9AAB56B1DCBEA2D5FE7779B6980F3E7';
wwv_flow_imp.g_varchar2_table(136) := '1D6DC8682D816AB120A75E7DC5DAC8C89A71895916745A0BBB640E9991858D0F3CE462258BD300BA6EC4D5100308B4990002A0CDC069CE9DC069336CEA76F5BF76FB9D3232B5CEBDB215580CAF5D27F144D2B186330767A4C43480239F566714660EC8A5';
wwv_flow_imp.g_varchar2_table(137) := 'B3671C9B49C6E232604ED28E064DC8185DBF5EC6376F71ADE96C2E675DA7E05A01069E0860541F0104407DBCB06E31015D34A5F752DB9A191D9F9089EDDBA5D1FBBAC5E34FF7E080A4FBFA1CAD7385BC64990670E4D3D20C33AF7EE5A51D62FBAE0C8E0C';
wwv_flow_imp.g_varchar2_table(138) := '4B4F7F7F4BDD88C544D6DD7D8F0C4FD8D78CE8AD81FADD6EA933540E813A092000EA048679EB08E8B0BA2E9AB2B590ECCDC8F4BDF789DBDCABAD8E7AF246A6A6ACE617DED923E57367AD3664369F40B55090B3DF7DCD5AF1F0F4B4D81EEC642D5C4766DC';
wwv_flow_imp.g_varchar2_table(139) := '4C314C3FF0802492496BA9530B8C025801AD38930AEA258000A89718F62D2370219F175D34656B606AF366E96EC1A23FA7360757AF96EEEE9453B69C3B7C488A4779368023A016652CAEFEB76CC694487649FFB8FDAABC99AEF5F4F6CADAADDBAC55EA62';
wwv_flow_imp.g_varchar2_table(140) := '452F7B5A582B2113024D24800068224CAA6A9C803E44E56C2E6FADA02793915566CED56AD4E4CC9EA12119D06D64A5F6CFFCC2825CF9CECBB533496D0D0133FC7FF9D597246FDE9D1A1830FDD6D5DBE394DD92F4B1AD5BA52B656FF34C2E67BD6BA1258E';
wwv_flow_imp.g_varchar2_table(141) := '45A452C2AC9F0002A07E66946801818BF982EB1FC6E9BBEF9564AABB05AD3B57A9530DC3E36B1C0D74B1E2A5991936057224D4FC8CAA19293AFDEA2BD64575A31313AD5E22725B60093305B076FB1DB7A52F4F601460390D8E3B4D0001D0E91EA0FD4502';
wwv_flow_imp.g_varchar2_table(142) := '578AC5C577A75F0343C332E0321FEF5476A5E97DABC745623171FA397FECA894CC5480533EE9CD2550387450CE9D3CE55869773ADDF2D5FF4E8DAF5A3B2D832EFB0ECCB97CD79DEA26DD4680BC460820001AA14699A612D0AB229D0270AA34168BC9A419';
wwv_flow_imp.g_varchar2_table(143) := '5E4D389F839D8A3625BDCB9C508656AD72AC2B3B9F958B2F3C2B5276DE8FDEB1703B33E28976B6D692B6AAA5925C7AEE5929559D590FAE1A93AE16AFFE770A2E6E46A8C6376E72CA5E4C2F56AAAE6B5D160DF9058116134000B41830D5BB13C896CA56A3';
wwv_flow_imp.g_varchar2_table(144) := 'D4C0A0F4AF5E63B56965A6D11F3236BDDEB109DDF2F5C4CE9D523A7AC4D1C617199693A62FFCF3E044E5C27939FAED6F592D87D698111BAB456B33FBCCF4432A95726CA468FA61BE5872CC27A37E0294688C0002A0316E946A1201DD2275BE641FFE1F1E';
wwv_flow_imp.g_varchar2_table(145) := '1911BDB26A52930D5533303129DD96055E17CE9E91F9575E6AA8EEB615AA2AEDB6B5D692862E3FF78C5CCE3B3F1DB2A73B2519CBA2CD9638754BA589AE2E195DB3FA96D41B1F75DD88EE767923852308748640BC33CDD22A04AE1228552AE27635D46F19';
wwv_flow_imp.g_varchar2_table(146) := '7EBF5A4BEB7F27BBBB6460D5A8B5A1934600542E5FB1DA90D93881CAFCBC1C330240475C9C6A199E3242ADB7D729BB2DE93A6234A4B720EA81438BF3662A23F872CC21B8B627D360A304E28D16A41C049A4140EFFB5FB0CC9D772712D23B34DC8CA6565C';
wwv_flow_imp.g_varchar2_table(147) := 'C7E83AFBC632678F1D93F91DCFAFB81D2AA84D20F7DAAB72E1E8B1DA99D75247A737D8D66B5EB36AFD5BEFD89824CD77D7A9255D07A01B5F39E5930E8176104000B483326D3812289A1100DB155D6678C40CBDA71CCBB733A36FD5980C8E3A2F06CC170A';
wwv_flow_imp.g_varchar2_table(148) := '72FAC5E7A45AB04F69B4D3E7B0B45599CFCAE96F7DDDBAF82F63A68AD2A323BE0839994A498F651B69FDCE172DC2D7174104C409DC6C9C0002A07176946C028152C53E10DA6F86FFE349FB16AB4D70C353153A0D30E6B2C2FBD4CC8C14DE7AC3537D1879';
wwv_flow_imp.g_varchar2_table(149) := '2790DFBD538EEEDCE95820168BC9C4868D1273B4687F46BAAFDFDAA8ED4E066B413221D0240208802681A49AC60858FF089A3FEAA9C1419178ACB1CA5B504A9F2E97EC71DEED2D97CDCAF9A7BF2162D7352DF02CBC55567339B9F8FC33D65BE7FA474665';
wwv_flow_imp.g_varchar2_table(150) := '646D6B9F0E592FE1545F9FB5085300563C1E33315B090104C04AE85176C504CA9611003DED27BBBA57DC46332B48261332B5D5BEDBDB89DDBBA5F0CEEE66361BE9BA8A470ECB911D2F5A198CAD3773FFA66FAC466DCE4CB88C5C2100DADC2134771B0104';
wwv_flow_imp.g_varchar2_table(151) := 'C06D484868278192EDD634330210EFEA6AA73B9EDA5AB56183A4D31947DB4B972FC92573C5EA6840465D042EBFBC4316CACE7B45F466323238DED97BFF6B05A4B703D64A5F4A2BB006600945C3EF145C190104C0CAF8517A8504F49E685B156E5751B6B2';
wwv_flow_imp.g_varchar2_table(152) := 'ADCA4B762565749D7DB8F9CCEBAF4BE9B87DC57AABFC0B53BDA513C7E5D84B2F5AF7FD1FDFB459BA7AFCB1507439FB64B77DF4AA5475DECD70793D1C43A055041000AD224BBD9E08588741CD0880DB5594A7465A60346AE69B758B60A7AACF9F392DF33B';
wwv_flow_imp.g_varchar2_table(153) := '5E70CA26DD238185EFBC22E74F39EFFB9F305344A31B367AACADBD6649337A95EAE9756CB468A6BF8A1544802320D70C0C564A0001B05282946F9880AE93D3975305715DD31D8F3B6577343D353820131B9CF77CD73FECC79F7F5674015B471D0D70E365';
wwv_flow_imp.g_varchar2_table(154) := '23A24E3CF7AC3582B1B56B25614664AC461DCA8C2592D26D1999D0D12FAB00EE90DF341B1D02F1E8844AA47E2350B5CDFF1B676309F3F534A300E6D097FF8F6DDC20B1982E55ACEDDE9963C764EEAFBE5A3B93545702F32FED901333071DEDBA53BDB2C6';
wwv_flow_imp.g_varchar2_table(155) := '0CFF3B1A7438434700E28984A3172A00F4E56840869500992B27105F7915D40081681248A65232B66EDA31F89219DE3DFAADAF4BD93284ED5838E219BA7EE2F0D7BF26B62BE491C909E93123317E45A5B78B56C55920EA2E9855BF3A8F5F912080008844';
wwv_flow_imp.g_varchar2_table(156) := '371364AB08ACD6C7145BA6294E9D382117BEC62840BDFC2F3FF3B49C33EC6CE546CDF0BF2DBFD37931F3BD88C59C0540C59CFD5D06C13A1D828FDBC7B566104000348322754496407A705086469C1F12A443BC87BFFDB4940E1D8A2CA37A032F1ED82F87';
wwv_flow_imp.g_varchar2_table(157) := '9EFEA675E5FFD8D454C79FFA576F5CD843C06F0410007EEB11FC091401BDBE1BDFBCC5EAF3952B57E4EC57BE6CB521F32A816AA12017CCD0FFA5F3E7AF2638FC5EB379ABE815B64336C921274078CD218000680E476A893081CC9A3532343EE148A02A55';
wwv_flow_imp.g_varchar2_table(158) := '39F4FCB352D8BDCBD1868CAB04F2EFEC9199679FB9FAC1E1F7A01971C98C3A8FBA381423190210B8850002E016207C8440BD0462C984ACDBBC5924A6E30152F3275B2CCAA92F7EBE661E89570954B35939FD575F91F97CFE6A428DDFBAB27EEAEEBB459C';
wwv_flow_imp.g_varchar2_table(159) := '510B3F6127407CCD228000681649EA893481F4D86A5963B92340E11C7BEB2D5978E5653DE4558340EEAD37E4DDEF7CA746CE8DA4F1E9F5D23736762381230840A06102088086D1511002CB08C4633279D75D92B26CFF9A2D95E4D89F9A51005DFEBDAC28';
wwv_flow_imp.g_varchar2_table(160) := '872295CB97E5DD3FFD13C9974B8E38BA7A7A646CE3462EFE1D09452383289B4720DEBCAAA80902D126D09D4ECBDA2DF60581470FEC97F96F7D3DDAA06A449F7DED55393E335323E746D2BAED774AF7C0C08D048E20008115114000AC081F8521703381E1';
wwv_flow_imp.g_varchar2_table(161) := '4D9B2533307873E2B24F956A5566BEF079A92EE496A546FB50B7FC7DF7CFFE542A9687E30C0C0D99AB7FE7AD97A34D304AD1136B330920009A4993BA224F2061A600A6EFB9C70C533BAF523B7DE6B4CCFED55F449ED51200DDF4E7B465D39F783C21EBEE';
wwv_flow_imp.g_varchar2_table(162) := '62E1DF122FDE21D02C0208806691A41E085C2330B0665CD6AC9FBEF6A9F6DBBE2F7D41CAA74ED6CE8C50AA6EFAB3FFAB5F9172C5F9A9786B262725333E1E212A84EA4480F4E6124000349727B54140CCE5BFAC31F3D5C9B8F33FAF4BF35939FC07BF2F66';
wwv_flow_imp.g_varchar2_table(163) := 'DC5BA2FA53310C8E7EFC23327BE5B223824457B78CDF79972275B421030210688C80F35FA8C6EAA31404206008F4643232B569B33972FEFFF0CEB7233D1570E92FFF420EEFDAE50CC8E4ACDB7E8774F7F79923FE8700049A4D0001D06CA2D407816B0456';
wwv_flow_imp.g_varchar2_table(164) := '6FDD26997EE7058155A9CADECF7C4A8A478E5C2B119DB7C29EDD72E0AB7F6106409C87FEFBD26959B57EA3F0030108B4860002A0355CA9150212EFED91A96D5BCDF0B5F382C04BD9AC1CFFF01F4BB5508C0CB16A2E27873EFE61B96219FA97584CA6EEBE';
wwv_flow_imp.g_varchar2_table(165) := '4712DD5D91E142A07602E4369F0002A0F94CA91102D7090C4D4EC9EA8989EB9F6B1D1C32530197237457C0852F7D418EEEDB570BC5F5B4F1C94919989ADD7C147B0000100049444154BAFE99030840A0F9041000CD674A8D10B84E20D695943E9715ECE5';
wwv_flow_imp.g_varchar2_table(166) := '6A55DEFAE4C7A5B0DF7E52BC5E69800FF246EC1CF8DA5F8A98986D61F4AF5A2571CB224A5B59F2C24880985A4120DE8A4AA9130210584620915CF6A1F661A15C96C31FFB6FA20FC4A96D11FC54DDFC68E6231F92D9D959D760CA31FE34B942C200022B24';
wwv_flow_imp.g_varchar2_table(167) := 'C0BFB21502A438049C08E896FF4777EF9683AFBDEA647253FAB13D7BE4C2DFFC95B93ABE2939341FCE7EFED372F2C8614FF11C7AF30D39B66B975415A2A71218859900B1B5860002A0355CA935E204CAE58A1C79FDBB7262EF3BE6845EF544A36286C5DF';
wwv_flow_imp.g_varchar2_table(168) := 'F9F427A5B0CF94F154223846F9DDBB64EF5F7F4D2A960D7F964753352C8EEFDB2B47DE7E4BCA115A20B99C01C7106835010440AB09537FE408948A25D9FFD20E3973F890E793FF12A48552490E7DEAE352999D5B4A0AFCBB0EFDEFFD83DF937C6EA1BE58';
wwv_flow_imp.g_varchar2_table(169) := '8C08387DF080ECFFCEAB52CC17EA2B8B758808104AAB0820005A45967A234960FEE225D9F5EDA7E5F2E9530DC77F74E7DB72F6AB5F1609C3F0B789E1C4273F2A674E1C6F98C7E55327E59DE79F95ECE52B0DD741410840E076020880DB999002818608CC';
wwv_flow_imp.g_varchar2_table(170) := '5DB820FB5E7E4972B32B3F51EDFE93CFC9EC8BCF35E4879F0A5DF9C6D764FFD7FF7AC52E652F5F96BD3B5E902B67CEACB82E2A081601BC6D1D010440EBD8527384089C3B7A4C763FF7AC14B2F34D895A6F0D7CF3BFFE91E476BDDD94FA3A51497EDF3E79';
wwv_flow_imp.g_varchar2_table(171) := 'EB631F919299D66846FB856CD688801D72EEF8896654471D10883C010440E4BF0200580901334D2DA7DFD92333AFBD2AD572D95355A3A9948CF7F6CAA0CB2E773A92B0F7437F2C45CBA3723D35D801A3F2A54BB2FB777E43720BF679FF642CBEC862B8BB';
wwv_flow_imp.g_varchar2_table(172) := 'DB939795724966CC28CBC977F64AD94C2F782A84518009E07A2B0920005A4997BA434DA0522CC9BB6FBD2947F6EC91AA87D5ED3189C9EA9E1E599B49CB1ADD26389D163D01DA209D3D72588E7DE69352F170EFBCAD9E76E655177272E0777F53CEBB0CD7';
wwv_flow_imp.g_varchar2_table(173) := '77C5E3B279A06F91C512132F7EEA3314DEDDBD538EEF7CBB69A30B5EDAC5060261238000085B8F124F5B08E4F524F7DA77E4D4C103A2B7ACB9351A8FC564BA2F2D13E9DEEBA67A029CCAF48AE65D4FAC7130F3C2F372E6CB5F926A9386D26B34D1BCA472';
wwv_flow_imp.g_varchar2_table(174) := '454E7EFA6372F46DF7A98B2923807A1289C5B695818E8AACEFCBB8F2582C607E9D3CB05F0EBEFAAA148D10331FF93F840408A9B5041000ADE54BED2124B0303727075E7C5E2E7A5CD9DE6DAE74379813DB508D616E4D5B65A6046C98F48A77D717BF2073';
wwv_flow_imp.g_varchar2_table(175) := '2FBE6033EB7C5E55E4D233DF923D7FF997AEBE8C9991905A5320CAA31E1170E9E409D9FBFC73A28B045D1BC5000210B8890002E0261C7C80809DC09573E764D7B7BF2D73972FDB0DAFE5EA15EEA6FE3EE9EF727EAADDB81915B0E56B552A02DEFAF01F4B';
wwv_flow_imp.g_varchar2_table(176) := 'CE0C7BEB673FBE72EFEC9637FFEB1F9A1111E747FCAADF6973D5BF7C2444D396BF060CAB6D03FD928A5F1D1D589E57EB78FEE205D9FBCACB32EB32E550AB2C697E26806FAD268000683561EA0F0D81B3C7F56AF3792917F29E62D293FA163D9199139EAD';
wwv_flow_imp.g_varchar2_table(177) := '40CC64AECBA45D4F780B57AEC8AE3FFE2F523A76CC94F0D7FFE58B17E5CDFFF89B52CCDBD9E89A872913ABC66C8B206598E9FA805AA304B5CA156667E59D975F920B015C30592B1ED220D00E0208807650A68D4013D095FE27F6EE9599575E924AC5DB4A';
wwv_flow_imp.g_varchar2_table(178) := '7F3D716D3457FE0933F7EF25785D0F309EEE719DFFBE78ECA8CC7CF2A352F1D1A638956C56F6FFEE6FC9EC85F3AEA1AEEE4D493AE9FE7024AD4899ACCB64C4F31D02C5A2EC3722E0ECFEFD5A9C57C009E07EEB09C45BDF042D4020B804CAC5D2E27EF447';
wwv_flow_imp.g_varchar2_table(179) := '77ED1433B6ED299089DE5ED9D0D7276E57B9B756A6F3DF6BCCDCF8ADE9B77E7ED70C779FFCD29F48B550E7F6B81EC5C8ADEDD93EAB0F273EFB2939E6616A426F7FD4B97F5B7DB7E6258CCFD37D199934D324312F448D5A9B31BE1C79E375297BB833E3D6';
wwv_flow_imp.g_varchar2_table(180) := 'F6F80C812811400044A9B789B52E024573823DF8FA6B72FA80B72B4A1DDED6DBD956F7F6D4D5CE72E3553D29EB7A8125DB77FEFCCB72EA8B4604E4724B49EEEFB1B8545DACCCF9D6C5E24676756141CE181FF67EF52B37121D8E32E6AA5F87FE1DB25D93';
wwv_flow_imp.g_varchar2_table(181) := '55384CF7A55D6F9B5CACC8888053333372E8B5D7A46004DC621ABF02460077DB410001D00ECAB4113802B9B939D9F3EC3372D1E37CBB9EFCD79913945EE5AE2458BD1D6EDA5CF1EAF0B7AD1E5D14B8EBF39F9599DFFF4F523A7942C4CBA638E6EC5E2AD9';
wwv_flow_imp.g_varchar2_table(182) := 'A7306266EEDDD6EE629EB9B2D639FF83BFF7BBF2B6F1A15AB52FFAD3C57CEB3CCCFB2FD66DF9A523247A8780D66731BB9E75FEE8BBB2FFD967253F377F3D8D030840E0060104C00D161C416091C0E5D3A7E59D175F105D74B798E0F24BAF6EB70EF68BAE';
wwv_flow_imp.g_varchar2_table(183) := '5E7731F5949D3427EA6933F7AD62C0ADC0A1179F971DFFE6E7E4F8E73E259776189F0F1F92D2E5CB52BC78F1FAAB74EDB86AEACD599EC8A7EB1B0A462094E7E7AF975DAAA770F68C640F1E908B2F3C27473EFE1179E15FFDDF72F8A51D6EEE9941FBD8E2';
wwv_flow_imp.g_varchar2_table(184) := 'C647BAA8CFD5D883415F5752B619D65ED711CC5DBE287B8CCF57CEBBAF4FF0D03C266D224033ED218000680F675A0900011D1EBF78E2841C7CED3BE6AA71CE93C7BA404DAF4AF55E7F4F053C1AE9896ECACC7B7B31CFCFCECA9E3FF99C7CE7B77EDD9C98';
wwv_flow_imp.g_varchar2_table(185) := 'FF857CFB9FFC6379E6FFFCC9EBAF6F5F3BFED68FFDA89902D0286BD75A2916658739B13FFD133F7EBDEC523DCFFEF44FC98BFFFA5FCA6BFFF13765FF9FFF99148CC8100F3FE3663A4463F160EAD9448591DE5AA90B2DBD14CA1B41B3DF08BA0B274E9AF8';
wwv_flow_imp.g_varchar2_table(186) := 'BD94C00602D120800088463F13A50B013D2D9EDEB74FF699ABDAA2C779751DEE5FE761B8DEA569C7EC9154CAF57901E2F463E6C117172D2E7F77B2AD95BEBC9C1ED7B27149D321FB95AC87B055AF8B0375A1A5DB264A4B75948CB8D9FFF20E39BD7F3F22';
wwv_flow_imp.g_varchar2_table(187) := '60098A6FDF71AC5D041000ED224D3BBE255032F3E7BA60ECC84EF7ED6B35889819D8D6AB7E5DF017D38416BED69AA900AF57BA2D74A3EEAA750F045DB95F77C13A0BE8C2C2F1DE5E6FA58C9079D7F4F1C137DE10AF0F6EF256315610082601044030FB0D';
wwv_flow_imp.g_varchar2_table(188) := 'AF9B44A0502CCBE1575E167DE88E972A75F879BA2F2D7A75EBC57EA536BA1E60329DF67467C04ADB6A56799D9FD7457F6E0B199BD59E3E58495F5EEAAB1A11707EE6A01C78FD752917EABC8DD24B03D8AC980015B48F40BC7D4DD11204FC4560616E4EDE';
wwv_flow_imp.g_varchar2_table(189) := '79E66939EF714F7F1D76D6B9E7769DFC9768E9FA027D9640104602744D84326AD7C97F89918E02E8AE8BCA6A29CDF67EE1DD23B2FBF9E7A5B0B06033230F02A12680000875F7129C13812B67CFCA3B2FBE280B57BCEFE9BFB9BF5F74C5BF539DAD4C5F1C';
wwv_flow_imp.g_varchar2_table(190) := '7930D3013AACAE42A4956D3552B7DE06A91B20ADCDA4A553FE69DFE8EE8B3AFDE02586ECA58BB2FBE9A7257BFE8217736CDA428046DA490001D04EDAB4E50B02174E9E92FDAFBC2285B9594FFEE8ED7D7A75D99B4C78B26F95918A00DD104717BFE90375';
wwv_flow_imp.g_varchar2_table(191) := '5AD54EBDF5EA8957D744E8823FF5B1DEF2CDB4D7872FE9F483571190CF2DC8EE1D3BE4D2A953CD7483BA2010080208804074134E368BC0A98307E4C04B2F4A29EF6D07BDD53D3DA227B74E5DD5D68A5B6FABDB3A38207798979EEC7425BC9E84F52A3C26';
wwv_flow_imp.g_varchar2_table(192) := 'B15A459A92163375EBD0BE9E5CB54D6D7BBBF141C591FAD494469A5089FAA82301DA775EAA2B1772B2F7C517E4F4CCCCE28D135ECA60D31A02D4DA5E020880F6F2A6B50E11A894CA72F48D37E4DDB7DE327FE4F5A63FBB237A25ABF3CAE3E95ED707F4D8';
wwv_flow_imp.g_varchar2_table(193) := '6B6A5DAE5EEDEAAD8213C6471529FAF43C7DE9C94F4709965E3A75A1697ADBA29EC46D1EE9895D8585CEE32F95D7772DAF69FAD213BFB6A96D376B831F9B4F8DE4C54C21ED3B9D928819E1623EBAFE7FF88DD7E5F8EE9D522A955C6D31804018082000C2';
wwv_flow_imp.g_varchar2_table(194) := 'D08BC4602550CAE765FF77BF2327660E7A3AF9EBD5FEDA745A746579CC5AB33F3255ACE855AF0A021D09D0290B5D30B8F4D2AB734DD3785209E77FF25A8F0EE36B3D7A95BF545EDFB5BCD6A379DA96DAFA237A672FB4EF54F4E85D1B5EFD3DBE77AF1C36';
wwv_flow_imp.g_varchar2_table(195) := '22B154283A574C4E8B08506DBB0938FF3568B727B407811610C866B3B2EFC51D72C9E39EFEBACFBC5E310FA7BA5BE04D67ABD493A0BE6C5E94ABEEA323B6F27ECCD3BB36B6F4F78BD73B04CE1F3E247B77BC28B9056FD3447E8C199F20E0850002C00B25';
wwv_flow_imp.g_varchar2_table(196) := '6C0247404F63B3E7CEC9BEA7BF25B317BDED03DF974CCAA6813EE9F462BF56C1D62B627DD9EAAF84500068BCDAA73A7DD1EBE56147A6C0DC79F3DD79FE39D1E742988FFCDF060234D17E020880F633A7C5161328572A72EAC86179C75CC5E5CDF0BF97E6';
wwv_flow_imp.g_varchar2_table(197) := '74887BF380F7AB442F7562E32F022973F2D73E4E1BA1E7C5B385D92BB2EFD557E5E4FEFD5229DB9F78E8A53E6C20E037020800BFF508FEDC2060AE46E36E97AC37ACA56C2EFB2F5FBC287B9E7B4EDE7DED35D187DB2CCB763CD45BEB74919BA30119A121';
wwv_flow_imp.g_varchar2_table(198) := 'A0EB3BB4AF55F07909AA52C8CBBB6FBF25FA74C8CB172E2E7EC7BC94531B1D4DD19D07F598971B01F23B410001D009EAB4E98940B55C96AA8715DC95AAC8DCA54B72E8D557E41D33E43F6F866F3D35608C74631D7D9943FE8F0801DD5E594580DEE5118F';
wwv_flow_imp.g_varchar2_table(199) := '795398B367CFC8DEE79F9523AF7F57E6AFCC9AEFA53B2C7D0051B5CC1D05EEA4B0E814010440A7C8D3AE2B818A39B3CF9E3A29A5D95929CFCE49C5BCEB2B7FF1925C3E73464E1D3A248776EE94DDE6C4BFE7C517E4FCB1A3AE752E19E84A763D09E8D5FF';
wwv_flow_imp.g_varchar2_table(200) := '521AEFD122A07745E8ED933A2AE025F26AA924670F1F32A301CFCBAE1D3BE4D0AEDD72C64C355D3E755A8A468056E6E6AF7E47E7B3522E1465CE7C1F73E6D84BDD51B721FECE10400074863BAD7A205035D75907CD1CEC9E67BE2D7B9F795ADE31EFBBBF';
wwv_flow_imp.g_varchar2_table(201) := 'FDB4EC36C7FB5E787EF16AECCCBEBD326FFED05672DE576CEB2E7AFA87DFEB30B0075731092801FD0EA810F4BA3850C32C65B3327FF2849CD9BB47F42992FB76BC203BF57BF9ED6F2D7E47DF79FA9BB2E7AFFFCA08849D522CF2C02165C6CB9F041000FE';
wwv_flow_imp.g_varchar2_table(202) := 'EC17BCBA46A052AD48B65090D96BAFF962510A958A54AA66DCFF9A4D3D6FBA006C437F5FC7F6F4AFC7576CDB4340F74E5041A8C2B09116F5BBA8DFC9F96BDF51FDAEEAF754D31BA92F7A6588B8530410009D224FBB6D25A073BD3AE7BBD99CFC75F8BFAD';
wwv_flow_imp.g_varchar2_table(203) := '8DD398EF092CDD21A0DB07EB77C5F70EE320049A400001D0048854D11881582C26D2E0957C3D2DEAEE751BFBFA1677F68BF21FF758CCF0B6808B4B6CF13F8B49A8B3F4BBA15B1CEB56C7BA2154AB83D5B507F158AB5BF17FFD78D83902F1CE354DCB1068';
wwv_flow_imp.g_varchar2_table(204) := '2D8198399DE915DDD6817ED16D6C5BDB9AFF6B8FB9B8D865CE4609F372310B7DF6E2CE8183FD32D69332DF20376A8DE34825E2928CF32758F8E91801BE7D1D434FC3FAA7359568FE237675885F87FBEF1E1E14BDA28BBB5CF946A9279271A55E3BE2DE64';
wwv_flow_imp.g_varchar2_table(205) := '42BA38212DC2D15B0527D369B9736840F40149FAA4C5C58C26FE4AA90088FC77B38940A9AA6E020880BA9151A0990406BBBB9BF2B4BD98B956D3A17EBDAD6F69B85F87589BE96B18EAD2ABDB5A71C4CD896855AAC750AC951BDD3415445399B46CE8CFC8';
wwv_flow_imp.g_varchar2_table(206) := '682AB52890F4BBD60C22C3DDA9A67CF79BE10B754493403C9A6113B55F08E893E6A6331919364240E75DF58FABDB2B614E56DDE64A55F7EED7AB339DB3BDC30CD9EA636C75DF74B0CB0000088749444154531FBD92F54B7C7EF3430580AE781F49754B3A';
wwv_flow_imp.g_varchar2_table(207) := '991465AE692A9A7ACD0880DFFCF58B3F7AA7803E5AF8CEA141D1EF9A1EAB20D074FD2EAA8072FBDEAACD75DEFD7D4C4B89885FFA37AA7E2000A2DAF33E8A7B5104F46564BB196EBD6F6448DC5EF70C0F99A1D941D17DDDF5EA6C2495925422E1A388FCED';
wwv_flow_imp.g_varchar2_table(208) := '8A9EF0D719D1A56B2394B90A02D64878EBB39831D3EF9A9EFC55046C19E85FFC2EDE6BBE936EDF5BB559E2ADFB0F98AAF81F021D258000E8287E1A87000420105502C4DD690208804EF700ED430002108000043A400001D001E8340901084020EA0488BF';
wwv_flow_imp.g_varchar2_table(209) := 'F30410009DEF033C80000420000108B49D0002A0EDC8691002108040D40910BF1F082000FCD00BF80001084000021068330104409B81D31C04200081A813207E7F104000F8A31FF002021080000420D056020880B6E2A63108400002512740FC7E218000';
wwv_flow_imp.g_varchar2_table(210) := 'F04B4FE007042000010840A08D0410006D844D5310800004A24E80F8FD430001E09FBEC01308400002108040DB082000DA869A8620000108449D00F1FB890002C04FBD812F1080000420008136114000B40934CD40000210883A01E2F717010480BFFA03';
wwv_flow_imp.g_varchar2_table(211) := '6F200001084000026D218000680B661A81000420107502C4EF37020800BFF508FE40000210800004DA400001D006C8340101084020EA0488DF7F041000FEEB133C82000420000108B49C0002A0E588690002108040D40910BF1F092000FCD82BF8040108';
wwv_flow_imp.g_varchar2_table(212) := '4000021068310104408B01533D04200081A813207E7F124000F8B35FF00A021080000420D05202088096E2A57208400002512740FC7E258000F06BCFE017042000010840A0850410002D844BD510800004A24E80F8FD4B0001E0DFBEC133084000021080';
wwv_flow_imp.g_varchar2_table(213) := '40CB0820005A86968A21000108449D00F1FB990002C0CFBD836F1080000420008116114000B4082CD542000210883A01E2F737010480BFFB07EF200001084000022D2180006809562A85000420107502C4EF77020800BFF710FE410002108000045A4000';
wwv_flow_imp.g_varchar2_table(214) := '01D002A8540901084020EA0488DFFF041000FEEF233C84000420000108349D0002A0E948A91002108040D409107F1008200082D04BF80801084000021068320104409381521D04200081A81320FE6010400004A39FF012021080000420D054020880A6E2';
wwv_flow_imp.g_varchar2_table(215) := 'A43208400002512740FC41218000084A4FE127042000010840A0890410004D84495510800004A24E80F883430001109CBEC25308400002108040D30820009A86928A20000108449D00F1078900022048BD85AF1080000420008126114000340924D54000';
wwv_flow_imp.g_varchar2_table(216) := '0210883A01E20F16010440B0FA0B6F210001084000024D218000680A462A81000420107502C41F34020880A0F518FE420002108000049A400001D00488540101084020EA04883F78041000C1EB333C86000420000108AC98000260C508A90002108040D4';
wwv_flow_imp.g_varchar2_table(217) := '09107F1009200082D86BF80C01084000021058210104C00A01521C02108040D409107F3009200082D96F780D01084000021058110104C08AF0511802108040D409107F5009200082DA73F80D01084000021058010104C00AE0511402108040D409107F70';
wwv_flow_imp.g_varchar2_table(218) := '09200082DB77780E01084000021068980002A061741484000420107502C41F6402088020F71EBE430002108000041A24800068101CC520000108449D00F1079B000220D8FD87F710800004200081860820001AC2462108400002512740FC41278000087A';
wwv_flow_imp.g_varchar2_table(219) := '0FE23F042000010840A00102088006A0510402108040D409107FF009200082DF874400010840000210A89B0002A06E641480000420107502C41F0602088030F4223140000210800004EA248000A81318E610800004A24E80F8C3410001108E7E240A0840';
wwv_flow_imp.g_varchar2_table(220) := '00021080405D04100075E1C21802108040D409107F58082000C2D293C401010840000210A8830002A00E589842000210883A01E20F0F01044078FA9248200001084000029E0920003CA3C21002108040D409107F98082000C2D49BC402010840000210F0';
wwv_flow_imp.g_varchar2_table(221) := '480001E011146610800004A24E80F8C345000110AEFE241A08400002108080270208004F983082000420107502C41F36020880B0F528F1400002108000043C1040007880840904200081A81320FEF011400084AF4F8908021080000420E04A0001E08A08';
wwv_flow_imp.g_varchar2_table(222) := '0308400002512740FC612480000863AF1213042000010840C0850002C00510D910800004A24E80F8C349000110CE7E252A08400002108080950002C08A874C08400002512740FC61258000086BCF1217042000010840C04200016081431604200081A813';
wwv_flow_imp.g_varchar2_table(223) := '20FEF012400084B76F890C021080000420E0480001E088860C08400002512740FC612680000873EF121B042000010840C0810002C0010CC910800004A24E80F8C34D000110EEFE253A084000021080404D0208809A584884000420107502C41F76020880';
wwv_flow_imp.g_varchar2_table(224) := 'B0F730F1410002108000046A104000D480421204200081A81320FEF013400084BF8F8910021080000420701B0104C06D484880000420107502C41F0502088028F43231420002108000046E218000B805081F21000108449D00F147830002201AFD4C9410';
wwv_flow_imp.g_varchar2_table(225) := '8000042000819B0820006EC2C10708400002512740FC51218000884A4F132704200001084060190104C032181C42000210883A01E28F0E01044074FA9A4821000108400002D7092000AEA3E00002108040D409107F94082000A2D4DBC40A010840000210';
wwv_flow_imp.g_varchar2_table(226) := 'B8460001700D046F10800004A24E80F8A345000110ADFE265A084000021080C0220104C022067E41000210883A01E28F1A010440D47A9C7821000108400002860002C040E07F08400002512740FCD1238000885E9F13310420000108404010007C092000';
wwv_flow_imp.g_varchar2_table(227) := '0108449E0000A248000110C55E27660840000210883C010440E4BF0200800004A24E80F8A349000110CD7E276A08400002108838010440C4BF00840F0108449D00F14795000220AA3D4FDC1080000420106902088048773FC1430002512740FCD1258000';
wwv_flow_imp.g_varchar2_table(228) := '886EDF133904200001084498000220C29D4FE8108040D409107F94092000A2DCFBC40E010840000291258000886CD713380420107502C41F6D02FF1D0000FFFFAB32227C0000000649444154030043C50BA5EDEF46BA0000000049454E44AE426082';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(11064949206983280803)
,p_file_name=>'icons/app-icon-512.png'
,p_mime_type=>'image/png'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/shared_components/security/authorizations/administration_rights
begin
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(11064950573712280804)
,p_name=>'Administration Rights'
,p_static_id=>'administration-rights'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'plsql_function_body', 'return true;')).to_clob
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_version_scn=>'SH256:K94FzTYWdjDQ6WIg6w48Or20nhyD_tWnqCuRh9rK4CU'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/shared_components/navigation/navigation_bar
begin
null;
end;
/
prompt --application/shared_components/logic/application_settings
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/standard
begin
null;
end;
/
prompt --application/shared_components/navigation/tabs/parent
begin
null;
end;
/
prompt --application/shared_components/user_interface/lovs/boolean
begin
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(11064959033259280816)
,p_lov_name=>'BOOLEAN'
,p_static_id=>'boolean'
,p_lov_query=>'.'||wwv_flow_imp.id(11064959033259280816)||'.'
,p_location=>'STATIC'
,p_version_scn=>'SH256:CnCBOq-zabcz-aPWKwU8C5KDeZy6YuyjvpJoTrTywfI'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(11064959702419280817)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'No'
,p_lov_return_value=>'FALSE'
,p_static_id=>'false'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(11064959335557280817)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Yes'
,p_lov_return_value=>'TRUE'
,p_static_id=>'true'
);
end;
/
prompt --application/pages/page_groups
begin
wwv_flow_imp_page.create_page_group(
 p_id=>wwv_flow_imp.id(11064950897353280805)
,p_group_name=>'Administration'
,p_static_id=>'administration'
);
end;
/
prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(11064945664471280786)
,p_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11064945892961280786)
,p_short_name=>'Home'
,p_static_id=>'home'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_page_id=>1
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/shared_components/navigation/breadcrumbentry
begin
null;
end;
/
prompt --application/shared_components/user_interface/themes
begin
wwv_flow_imp_shared.create_theme(
 p_id=>wwv_flow_imp.id(11064946566168280787)
,p_theme_id=>42
,p_static_id=>'universal-theme'
,p_theme_name=>'Universal Theme'
,p_theme_internal_name=>'UNIVERSAL_THEME'
,p_version_identifier=>'26.1'
,p_navigation_type=>'L'
,p_nav_bar_type=>'LIST'
,p_is_locked=>false
,p_current_theme_style_id=>2243014446517417
,p_default_page_template=>4073832297226169690
,p_default_dialog_template=>2101883943284197310
,p_error_template=>2102634289808461002
,p_printer_friendly_template=>4073832297226169690
,p_login_template=>2102634289808461002
,p_default_button_template=>4073839297780169708
,p_default_region_template=>4073835273271169698
,p_default_chart_template=>4073835273271169698
,p_default_form_template=>4073835273271169698
,p_default_reportr_template=>4073835273271169698
,p_default_wizard_template=>4073835273271169698
,p_default_menur_template=>2532939663579242476
,p_default_listr_template=>4073835273271169698
,p_default_irr_template=>2102002977963900996
,p_default_report_template=>2540130677583398057
,p_default_label_template=>1610598304472262251
,p_default_menu_template=>4073839682315169711
,p_default_list_template=>4073837480889169704
,p_default_top_nav_list_temp=>2528231041045349458
,p_default_side_nav_list_temp=>2469215554099805162
,p_default_nav_list_position=>'SIDE'
,p_default_dialogbtnr_template=>2127905476394690047
,p_default_dialogr_template=>4502917002193490937
,p_default_option_label=>1610598304472262251
,p_default_required_label=>1610598484065263269
,p_default_navbar_list_template=>2849019392706229583
,p_file_prefix=>nvl(wwv_flow_application_install.get_static_theme_file_prefix(42),'#APEX_FILES#themes/theme_42/26.1/')
,p_files_version=>64
,p_icon_library=>'FONTAPEX'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APEX_FILES#libraries/apex/#MIN_DIRECTORY#widget.stickyWidget#MIN#.js?v=#APEX_VERSION#',
'#THEME_FILES#js/theme42#MIN#.js?v=#APEX_VERSION#'))
,p_css_file_urls=>'#THEME_FILES#css/Core#MIN#.css?v=#APEX_VERSION#'
,p_reference_id=>wwv_imp_util.get_subscription_id(4073840274158169736,2000,'universal-theme',8842.261)
,p_version_scn=>'SH256:RQZ7_KKNFF7leXIrwskeQw4WaazlZwly2sNGWk8hwQo'
,p_version_scn_master=>'SH256:WOPVC8vP1TPWUxczh2dJ4mCZcNGSTzA1cn8DjR2oQjY'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/shared_components/user_interface/theme_style
begin
null;
end;
/
prompt --application/shared_components/user_interface/theme_files
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_opt_groups
begin
null;
end;
/
prompt --application/shared_components/user_interface/template_options
begin
null;
end;
/
prompt --application/shared_components/globalization/language
begin
null;
end;
/
prompt --application/shared_components/globalization/translations
begin
null;
end;
/
prompt --application/shared_components/logic/build_options
begin
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11064944932632280784)
,p_build_option_name=>'Commented Out'
,p_static_id=>'commented-out'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>'SH256:1lQI3DW9n-0ZEGoDXUirkaB0JWCIATVWpJZCTCkODmI'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/shared_components/globalization/messages
begin
null;
end;
/
prompt --application/shared_components/globalization/dyntranslations
begin
null;
end;
/
prompt --application/shared_components/security/authentications/oracle_apex_accounts
begin
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(11064945228399280785)
,p_name=>'Oracle APEX Accounts'
,p_static_id=>'oracle-apex-accounts'
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>'SH256:MwlwV9vQNyvTGV3nRFfTrp5n7mJ1Ugme2lUrlsOYuxw'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/user_interfaces/combined_files
begin
null;
end;
/
prompt --application/pages/page_00000
begin
wwv_flow_imp_page.create_page(
 p_id=>0
,p_name=>'Global Page'
,p_reload_on_submit=>null
,p_warn_on_unsaved_changes=>null
,p_autocomplete_on_off=>'OFF'
,p_protection_level=>'D'
,p_page_component_map=>'14'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_last_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_imp_page.create_page(
 p_id=>1
,p_name=>'Home'
,p_alias=>'HOME'
,p_step_title=>'Sample Pivot Table'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'13'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_last_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11064958453781280814)
,p_plug_name=>'Sample Pivot Table'
,p_static_id=>'sample-pivot-table'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>2675494171183407654
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_plug_query_num_rows=>15
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/pages/page_00002
begin
wwv_flow_imp_page.create_page(
 p_id=>2
,p_name=>'Sales Analysis'
,p_alias=>'SALES-ANALYSIS'
,p_step_title=>'Sales Analysis'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'window.pivotPage = (function() {',
'',
'    function hexToRgba(hex, alpha) {',
'        hex = hex.replace(''#'', '''');',
'',
'        const r = parseInt(hex.substring(0, 2), 16);',
'        const g = parseInt(hex.substring(2, 4), 16);',
'        const b = parseInt(hex.substring(4, 6), 16);',
'',
'        return `rgba(${r},${g},${b},${alpha})`;',
'    }',
'',
'    let onInitChart = function(data, title) {',
'        let truncMonth = apex.item(''P2_CH_SEL_DATE'').getValue();',
'        let highlightItem = truncMonth ? data.series[0].items.find(item=>item.x == truncMonth) : null;',
'        if (highlightItem)',
'        {',
'            data.series[0].items.forEach(item=>{',
'                if (item.x == truncMonth)',
'                {',
'                    if (item.value > 0)',
'                    {',
'                        item.label = apex.locale.formatNumber(item.value, ''999G999G999G999G990D00'');',
'                        item.labelPosition = ''outsideBarEdge'';   ',
'                    }                 ',
'                }',
'                else',
'                {',
'                    item.color = item.color ? hexToRgba(item.color, 0.6) : "rgba(36, 93, 99, 0.6)";',
'                }',
'            });',
'        }',
'        data.title = {',
'            text: title, ',
'            halign: ''center''',
'        };',
'        data.subtitle = {',
'            text: $v(''P2_CH_HEADING'')',
'        }; ',
'    }',
'',
'    let onSelectCell = function(eventData) {',
'        let exclude = [''PERIOD.Month'', ''PERIOD.Day''];',
'        apex.item(''P2_CH_HEADING'').setValue(eventData.util.getChartHeading(exclude));',
'        apex.item(''P2_CH_SEL_DATE'').setValue(eventData.util.getTruncDate(''PERIOD'', ''month''));',
'        apex.region(''ch_sales_revenue'').refresh();',
'        apex.region(''ch_sales_profit'').refresh();',
'        apex.region(''ch_sales_transaction_count'').refresh();',
'    }',
'',
'    return {',
'        onInitChart: onInitChart,',
'        onSelectCell: onSelectCell        ',
'    }    ',
'})();'))
,p_javascript_code_onload=>'$(''.t-Header-controls'').hide();'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Remove focus outline on APEX tabs */',
'.t-TabsRegion {',
'     --ut-focus-outline-color: transparent;',
'}'))
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'18'
,p_created_on=>wwv_flow_imp.dz('20260620165256Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260624210739Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_last_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11221877272447110030)
,p_plug_name=>'Chart Tabs'
,p_static_id=>'chart-tabs'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>3224648155363603145
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260621153807Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153807Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(579629213501582145)
,p_plug_name=>'Multi-Dimensional Sales Analysis'
,p_static_id=>'dimensional-sales-analysis'
,p_region_name=>'pt_sales_global'
,p_parent_plug_id=>wwv_flow_imp.id(579629427358582147)
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:i-h640:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_function_body_language=>'PLSQL'
,p_plug_source=>'return lib4x_pivot_table.p2_get_pivot_query_a;'
,p_plug_source_type=>'PLUGIN_LIB4X.AXT.WDR.PIVOTTABLE'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options)',
'{',
'    options.metadata = {    ',
'        ''SEGMENT'': {',
'            type: ''string'',',
'            caption: ''Segment''',
'        },',
'        ''COUNTRY'': {',
'            type: ''string'',',
'            caption: ''Country''',
'        },',
'        ''REGION'': {',
'            type: ''string'',',
'            caption: ''Region''',
'        },',
'        ''CATEGORY'': {',
'            type: ''string'',',
'            caption: ''Product Category''',
'        },            ',
'        ''CHANNEL'': {',
'            type: ''string'',',
'            caption: ''Channel''',
'        },',
'        ''SALES_REP'': {',
'            type: ''string'',',
'            caption: ''Sales Rep''',
'        },    ',
'        ''SALES_LEVEL'': {',
'            type: ''string'',',
'            caption: ''Sales Level''',
'        },           ',
'        ''YEAR'': {',
'            type: ''number'',',
'            caption: ''Year''',
'        },',
'        ''QUARTER'': {',
'            type: ''string'',',
'            caption: ''Quarter''',
'        },',
'        ''REVENUE'': {',
'            type: ''number'',',
'            caption: ''Revenue''',
'        },',
'        ''PROFIT'': {',
'            type: ''number'',',
'            caption: ''Profit''',
'        },',
'        ''TRANSACTION_COUNT'': {',
'            type: ''number'',',
'            caption: ''Transactions''',
'        }    ',
'    };	 ',
'',
'    options.primaryReport = {',
'        slice: {',
'            expands: {',
'                "rows": [',
'                    {',
'                        "tuple": [',
'                            "REGION.Asia-Pacific"',
'                        ]',
'                    }',
'                ],',
'                "columns": [',
'                    {',
'                        "tuple": [',
'                            "SEGMENT.Enterprise"',
'                        ]',
'                    }',
'                ]',
'            }',
'        }',
'    };',
'',
'    options.alternativeReports = [',
'        {',
'            "slice": {',
'                "rows": [',
'                    {',
'                    "uniqueName": "COUNTRY"',
'                    }',
'                ],',
'                "columns": [',
'                    {',
'                    "uniqueName": "Measures"',
'                    },',
'                    {',
'                    "uniqueName": "CHANNEL"',
'                    }',
'                ],',
'                "measures": [',
'                    {',
'                    "uniqueName": "REVENUE",',
'                    "aggregation": "sum"',
'                    }',
'                ]',
'            },',
'            "options": {',
'                "grid": {',
'                    "title": "Revenue by Country / Channel"',
'                }',
'            }',
'        }',
'    ];',
'',
'    options.normalizeFilters = true;',
'    ',
'    return options;    ',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attr_aggregation', 'sum',
  'attr_decimal_places', '0',
  'attr_default_columns', 'SEGMENT, YEAR, QUARTER',
  'attr_default_measures', 'REVENUE',
  'attr_default_rows', 'REGION, CATEGORY',
  'attr_drill_through_dialog', 'dt_dialog',
  'attr_filters_page_item', 'P2_PT_FILTERS')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260620171100Z')
,p_updated_on=>wwv_flow_imp.dz('20260624210739Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11221874970019110007)
,p_plug_name=>'DT Dialog'
,p_static_id=>'dt-dialog'
,p_title=>'Details'
,p_region_name=>'dt_dialog'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2674150083631647148
,p_plug_display_sequence=>40
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621223450Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11221875081490110008)
,p_plug_name=>'DT Header'
,p_static_id=>'dt-header'
,p_region_name=>'dt_hdr'
,p_parent_plug_id=>wwv_flow_imp.id(11221874970019110007)
,p_region_css_classes=>'pt-dt-header'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153028Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11221874428713110002)
,p_plug_name=>'Product Detail Analysis'
,p_static_id=>'product-detail-analysis'
,p_region_name=>'pt_sales_products'
,p_parent_plug_id=>wwv_flow_imp.id(579629427358582147)
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:i-h640:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_function_body_language=>'PLSQL'
,p_plug_source=>'return lib4x_pivot_table.p2_get_pivot_query_b;'
,p_plug_source_type=>'PLUGIN_LIB4X.AXT.WDR.PIVOTTABLE'
,p_plugin_init_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options)',
'{',
'    options.metadata = {    ',
'        /*''SEGMENT'': {',
'            type: ''string'',',
'            caption: ''Segment''',
'        },',
'        ''COUNTRY'': {',
'            type: ''string'',',
'            caption: ''Country''',
'        },',
'        ''REGION'': {',
'            type: ''string'',',
'            caption: ''Region''',
'        },',
'        ''CATEGORY'': {',
'            type: ''string'',',
'            caption: ''Product Category''',
'        },   */     ',
'        ''CATEGORY'': {',
'            type: ''level'',',
'            hierarchy: "Product by Category",',
'            level: ''Category'',',
'            caption: ''Category''',
'        },',
'        ''SUBCATEGORY'': {',
'            type: ''level'',',
'            hierarchy: "Product by Category",',
'            parent: ''Category'',',
'            level: ''Subcategory'',',
'            caption: ''Subcategory''',
'        },',
'        ''PRODUCT'': {',
'            type: ''level'',',
'            hierarchy: "Product by Category",',
'            parent: ''Subcategory'',',
'            level: ''Product'',            ',
'            caption: ''Product''',
'        },    ',
'        /*''CHANNEL'': {',
'            type: ''string'',',
'            caption: ''Channel''',
'        },',
'        ''SALES_REP'': {',
'            type: ''string'',',
'            caption: ''Sales Rep''',
'        },    ',
'        ''SALES_LEVEL'': {',
'            type: ''string'',',
'            caption: ''Sales Level''',
'        }, */          ',
'        ''PERIOD'': {',
'            type: ''date'',',
'			caption: ''Period''',
'        },              ',
'        ''REVENUE'': {',
'            type: ''number'',',
'            caption: ''Revenue''',
'        },',
'        ''PROFIT'': {',
'            type: ''number'',',
'            caption: ''Profit''',
'        },',
'        ''TRANSACTION_COUNT'': {',
'            type: ''number'',',
'            caption: ''Transactions''',
'        }    ',
'    }; ',
'',
'    options.primaryReport = {',
'        slice: {',
'            drills: {',
'                "rows": [',
'                    {',
'                        "tuple": [',
'                            "Category.Hardware"',
'                        ]',
'                    }',
'                ]',
'            }',
'        }',
'    };    ',
'',
'    options.normalizeFilters = true;',
'    ',
'    return options;    ',
'}'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attr_aggregation', 'sum',
  'attr_decimal_places', '0',
  'attr_default_columns', 'PERIOD.Year, PERIOD.Month',
  'attr_default_measures', 'REVENUE',
  'attr_default_rows', 'Product by Category',
  'attr_drill_through_dialog', 'dt_dialog',
  'attr_filters_page_item', 'P2_PT_FILTERS',
  'attr_height', '91%')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260621134120Z')
,p_updated_on=>wwv_flow_imp.dz('20260624210739Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(579629427358582147)
,p_plug_name=>'PT Tabs'
,p_static_id=>'pt-tabs'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>3224648155363603145
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260621102206Z')
,p_updated_on=>wwv_flow_imp.dz('20260621102206Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11221875144038110009)
,p_plug_name=>'Sales Analysis Drill-Through'
,p_static_id=>'sales-analysis-drill-through'
,p_region_name=>'ir_drill_through'
,p_parent_plug_id=>wwv_flow_imp.id(11221874970019110007)
,p_region_css_classes=>'pt-dt-report'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--hideHeader js-addHiddenHeadingRoleDesc:margin-bottom-none'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'FUNC_BODY_RETURNING_SQL'
,p_function_body_language=>'PLSQL'
,p_plug_source=>'return lib4x_pivot_table.p2_get_report_query(''P2_PT_FILTERS'');'
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P2_PT_FILTERS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621173912Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'nobody'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(11221875236939110010)
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>11221875236939110010
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621173912Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'nobody'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221875966317110017)
,p_db_column_name=>'CATEGORY'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153028Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221876104606110019)
,p_db_column_name=>'CHANNEL'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Channel'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153028Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221875669375110014)
,p_db_column_name=>'COUNTRY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Country'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153028Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221875426542110012)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153028Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221876909601110027)
,p_db_column_name=>'DISCOUNT_AMOUNT'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Discount Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621173736Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221876543651110023)
,p_db_column_name=>'ORDER'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Order'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153028Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221876448062110022)
,p_db_column_name=>'ORDER_DATE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Order Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153028Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221876673823110024)
,p_db_column_name=>'ORDER_LINE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Order Line'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153028Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221875873132110016)
,p_db_column_name=>'PRODUCT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Product'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153028Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221877175971110029)
,p_db_column_name=>'PROFIT_AMOUNT'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Profit Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621173736Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221876730811110025)
,p_db_column_name=>'QUANTITY'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153028Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221875744078110015)
,p_db_column_name=>'REGION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Region'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153028Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221877071759110028)
,p_db_column_name=>'SALES_AMOUNT'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Sales Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621173736Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221875359280110011)
,p_db_column_name=>'SALES_ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Sales Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621173357Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221876386336110021)
,p_db_column_name=>'SALES_LEVEL'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Sales Level'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153028Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221876247182110020)
,p_db_column_name=>'SALES_REP'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Sales Rep'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153028Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221875547020110013)
,p_db_column_name=>'SEGMENT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Segment'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153028Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221876061925110018)
,p_db_column_name=>'SUBCATEGORY'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Subcategory'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153028Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11221876850348110026)
,p_db_column_name=>'UNIT_PRICE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Unit Price'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_created_on=>wwv_flow_imp.dz('20260621153028Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153028Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(11240435576606141019)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'ORDER:ORDER_LINE:CUSTOMER:COUNTRY:SALES_REP:ORDER_DATE:PRODUCT:QUANTITY:UNIT_PRICE:DISCOUNT_AMOUNT:SALES_AMOUNT:PROFIT_AMOUNT'
,p_sum_columns_on_break=>'SALES_AMOUNT:PROFIT_AMOUNT'
,p_created_on=>wwv_flow_imp.dz('20260621153101Z')
,p_updated_on=>wwv_flow_imp.dz('20260621173912Z')
,p_created_by=>'nobody'
,p_updated_by=>'nobody'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11221878010968110038)
,p_plug_name=>'Sales Profit'
,p_static_id=>'sales-profit'
,p_region_name=>'ch_sales_profit'
,p_parent_plug_id=>wwv_flow_imp.id(11221877272447110030)
,p_region_css_classes=>'pt-chart'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_created_on=>wwv_flow_imp.dz('20260621154547Z')
,p_updated_on=>wwv_flow_imp.dz('20260621161728Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(11221878187893110039)
,p_region_id=>wwv_flow_imp.id(11221878010968110038)
,p_chart_type=>'bar'
,p_height=>'300'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_time_axis_type=>'mixedFrequency'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'',
'    options.selectionMode = ''none'';',
'',
'    // callback function which gets called when data is retrieved',
'    options.dataFilter = function(data) {',
'        pivotPage.onInitChart(data, ''Profit'');         ',
'        return data;        ',
'    };',
'   ',
'    return options;',
'}'))
,p_created_on=>wwv_flow_imp.dz('20260621154547Z')
,p_updated_on=>wwv_flow_imp.dz('20260621161728Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(11221878249751110040)
,p_chart_id=>wwv_flow_imp.id(11221878187893110039)
,p_static_id=>'profit'
,p_seq=>10
,p_name=>'Profit'
,p_data_source_type=>'FUNC_BODY_RETURNING_SQL'
,p_function_body_language=>'PLSQL'
,p_data_source=>'return lib4x_pivot_table.p2_get_chart_query(''P2_PT_FILTERS'');'
,p_ajax_items_to_submit=>'P2_PT_FILTERS'
,p_items_value_column_name=>'PROFIT'
,p_items_label_column_name=>'PERIOD'
,p_color=>'#5fa2ba'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_created_on=>wwv_flow_imp.dz('20260621154547Z')
,p_updated_on=>wwv_flow_imp.dz('20260621161728Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(11221878385259110041)
,p_chart_id=>wwv_flow_imp.id(11221878187893110039)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_created_on=>wwv_flow_imp.dz('20260621154547Z')
,p_updated_on=>wwv_flow_imp.dz('20260621154547Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(11221878446596110042)
,p_chart_id=>wwv_flow_imp.id(11221878187893110039)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_created_on=>wwv_flow_imp.dz('20260621154547Z')
,p_updated_on=>wwv_flow_imp.dz('20260621154547Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11221877515543110033)
,p_plug_name=>'Sales Revenue'
,p_static_id=>'sales-revenue'
,p_region_name=>'ch_sales_revenue'
,p_parent_plug_id=>wwv_flow_imp.id(11221877272447110030)
,p_region_css_classes=>'pt-chart'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_created_on=>wwv_flow_imp.dz('20260621154327Z')
,p_updated_on=>wwv_flow_imp.dz('20260621154327Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(11221877616966110034)
,p_region_id=>wwv_flow_imp.id(11221877515543110033)
,p_chart_type=>'bar'
,p_height=>'300'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_time_axis_type=>'mixedFrequency'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'',
'    options.selectionMode = ''none'';',
'',
'    // callback function which gets called when data is retrieved',
'    options.dataFilter = function(data) {',
'        pivotPage.onInitChart(data, ''Revenue'');       ',
'        return data;        ',
'    };',
'   ',
'    return options;',
'}'))
,p_created_on=>wwv_flow_imp.dz('20260621154327Z')
,p_updated_on=>wwv_flow_imp.dz('20260621154327Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(11221877767963110035)
,p_chart_id=>wwv_flow_imp.id(11221877616966110034)
,p_static_id=>'revenue'
,p_seq=>10
,p_name=>'Revenue'
,p_data_source_type=>'FUNC_BODY_RETURNING_SQL'
,p_function_body_language=>'PLSQL'
,p_data_source=>'return lib4x_pivot_table.p2_get_chart_query(''P2_PT_FILTERS'');'
,p_ajax_items_to_submit=>'P2_PT_FILTERS'
,p_items_value_column_name=>'REVENUE'
,p_items_label_column_name=>'PERIOD'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_created_on=>wwv_flow_imp.dz('20260621154327Z')
,p_updated_on=>wwv_flow_imp.dz('20260621154327Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(11221877808782110036)
,p_chart_id=>wwv_flow_imp.id(11221877616966110034)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_created_on=>wwv_flow_imp.dz('20260621154327Z')
,p_updated_on=>wwv_flow_imp.dz('20260621154327Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(11221877998863110037)
,p_chart_id=>wwv_flow_imp.id(11221877616966110034)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_created_on=>wwv_flow_imp.dz('20260621154327Z')
,p_updated_on=>wwv_flow_imp.dz('20260621154327Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11221878593726110043)
,p_plug_name=>'Sales Transaction Count'
,p_static_id=>'sales-transaction-count'
,p_region_name=>'ch_sales_transaction_count'
,p_parent_plug_id=>wwv_flow_imp.id(11221877272447110030)
,p_region_css_classes=>'pt-chart'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_created_on=>wwv_flow_imp.dz('20260621154735Z')
,p_updated_on=>wwv_flow_imp.dz('20260621161822Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(11221878630056110044)
,p_region_id=>wwv_flow_imp.id(11221878593726110043)
,p_chart_type=>'bar'
,p_height=>'300'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_time_axis_type=>'mixedFrequency'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'',
'    options.selectionMode = ''none'';',
'',
'    // callback function which gets called when data is retrieved',
'    options.dataFilter = function(data) {',
'        pivotPage.onInitChart(data, ''Transaction Count'');       ',
'        return data;        ',
'    };',
'   ',
'    return options;',
'}'))
,p_created_on=>wwv_flow_imp.dz('20260621154735Z')
,p_updated_on=>wwv_flow_imp.dz('20260621161822Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(11221878721277110045)
,p_chart_id=>wwv_flow_imp.id(11221878630056110044)
,p_static_id=>'transaction-count'
,p_seq=>10
,p_name=>'Transaction Count'
,p_data_source_type=>'FUNC_BODY_RETURNING_SQL'
,p_function_body_language=>'PLSQL'
,p_data_source=>'return lib4x_pivot_table.p2_get_chart_query(''P2_PT_FILTERS'');'
,p_ajax_items_to_submit=>'P2_PT_FILTERS'
,p_items_value_column_name=>'TRANSACTION_COUNT'
,p_items_label_column_name=>'PERIOD'
,p_color=>'#789262'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_created_on=>wwv_flow_imp.dz('20260621154735Z')
,p_updated_on=>wwv_flow_imp.dz('20260621161822Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(11221878820055110046)
,p_chart_id=>wwv_flow_imp.id(11221878630056110044)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_created_on=>wwv_flow_imp.dz('20260621154735Z')
,p_updated_on=>wwv_flow_imp.dz('20260621154735Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(11221878949589110047)
,p_chart_id=>wwv_flow_imp.id(11221878630056110044)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'auto'
,p_tick_label_rendered=>'on'
,p_created_on=>wwv_flow_imp.dz('20260621154735Z')
,p_updated_on=>wwv_flow_imp.dz('20260621154735Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11221877329747110031)
,p_name=>'P2_CH_HEADING'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11221877272447110030)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260621153807Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153807Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11221877424551110032)
,p_name=>'P2_CH_SEL_DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11221877272447110030)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260621153807Z')
,p_updated_on=>wwv_flow_imp.dz('20260621153807Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(579629374602582146)
,p_name=>'P2_PT_FILTERS'
,p_item_sequence=>10
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260621101902Z')
,p_updated_on=>wwv_flow_imp.dz('20260621101902Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579629750601582150)
,p_name=>'on cell click DSA'
,p_static_id=>'on-cell-click-dsa'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(579629213501582145)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'PLUGIN_LIB4X.AXT.WDR.PIVOTTABLE|REGION TYPE|lib4xcellclick'
,p_created_on=>wwv_flow_imp.dz('20260621133746Z')
,p_updated_on=>wwv_flow_imp.dz('20260621152006Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11221874360015110001)
,p_event_id=>wwv_flow_imp.id(579629750601582150)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'pivotPage.onSelectCell(this.data);')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260621133746Z')
,p_updated_on=>wwv_flow_imp.dz('20260621133746Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11221874779594110005)
,p_name=>'on cell click PDA'
,p_static_id=>'on-cell-click-pda'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(11221874428713110002)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'PLUGIN_LIB4X.AXT.WDR.PIVOTTABLE|REGION TYPE|lib4xcellclick'
,p_created_on=>wwv_flow_imp.dz('20260621152006Z')
,p_updated_on=>wwv_flow_imp.dz('20260621152006Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11221874854227110006)
,p_event_id=>wwv_flow_imp.id(11221874779594110005)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'pivotPage.onSelectCell(this.data);')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260621152006Z')
,p_updated_on=>wwv_flow_imp.dz('20260621152006Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(579629594283582148)
,p_name=>'on cell double click DSA'
,p_static_id=>'on-cell-double-click-dsa'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(579629213501582145)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'PLUGIN_LIB4X.AXT.WDR.PIVOTTABLE|REGION TYPE|lib4xcelldblclick'
,p_created_on=>wwv_flow_imp.dz('20260621133746Z')
,p_updated_on=>wwv_flow_imp.dz('20260621133746Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(579629652232582149)
,p_event_id=>wwv_flow_imp.id(579629594283582148)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'pivotPage.onSelectCell(this.data);')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260621133746Z')
,p_updated_on=>wwv_flow_imp.dz('20260621133746Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11221874543765110003)
,p_name=>'on cell double click PDA'
,p_static_id=>'on-cell-double-click-pda'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(11221874428713110002)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'PLUGIN_LIB4X.AXT.WDR.PIVOTTABLE|REGION TYPE|lib4xcelldblclick'
,p_created_on=>wwv_flow_imp.dz('20260621152006Z')
,p_updated_on=>wwv_flow_imp.dz('20260621152006Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11221874676515110004)
,p_event_id=>wwv_flow_imp.id(11221874543765110003)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'pivotPage.onSelectCell(this.data);')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260621152006Z')
,p_updated_on=>wwv_flow_imp.dz('20260621152006Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/pages/page_09999
begin
wwv_flow_imp_page.create_page(
 p_id=>9999
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'Sample Pivot Table - Log In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2102634289808461002
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'12'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_last_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11064951445537280806)
,p_plug_name=>'Sample Pivot Table'
,p_static_id=>'sample-pivot-table'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2675634334296186762
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_region_image=>'#APP_FILES#icons/app-icon-512.png'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(11064953066214280809)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(11064951445537280806)
,p_button_name=>'LOGIN'
,p_static_id=>'login'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4073839297780169708
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'NEXT'
,p_grid_new_row=>'Y'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11064952378491280808)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(11064951445537280806)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="current-password"'
,p_label_alignment=>'RIGHT'
,p_field_template=>2042262243893469891
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11064952722877280809)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(11064951445537280806)
,p_prompt=>'Remember username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_label_alignment=>'RIGHT'
,p_display_when=>'apex_authentication.persistent_cookies_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>2042262243893469891
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11064951911211280807)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11064951445537280806)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="username"'
,p_label_alignment=>'RIGHT'
,p_field_template=>2042262243893469891
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11064957192240280812)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_static_id=>'clear-page-s-cache'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>11064957192240280812
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11064956774496280812)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_static_id=>'get-username-cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>11064956774496280812
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11064953498001280809)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Login'
,p_static_id=>'login'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'APEX_AUTHENTICATION',
  'package_method', 'LOGIN',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>11064953498001280809
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(11064954403770280810)
,p_page_process_id=>wwv_flow_imp.id(11064953498001280809)
,p_page_id=>9999
,p_name=>'p_password'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_PASSWORD'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(11064954963232280810)
,p_page_process_id=>wwv_flow_imp.id(11064953498001280809)
,p_page_id=>9999
,p_name=>'p_set_persistent_auth'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>true
,p_display_sequence=>3
,p_value_type=>'API_DEFAULT'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(11064953965242280810)
,p_page_process_id=>wwv_flow_imp.id(11064953498001280809)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'ITEM'
,p_value=>'P9999_USERNAME'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(11064955373254280811)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Set Username Cookie'
,p_static_id=>'set-username-cookie'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'APEX_AUTHENTICATION',
  'package_method', 'SEND_LOGIN_USERNAME_COOKIE',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>11064955373254280811
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(11064956324295280811)
,p_page_process_id=>wwv_flow_imp.id(11064955373254280811)
,p_page_id=>9999
,p_name=>'p_consent'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_REMEMBER'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(11064955858973280811)
,p_page_process_id=>wwv_flow_imp.id(11064955373254280811)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'lower( :P9999_USERNAME )'
,p_created_on=>wwv_flow_imp.dz('20260620145419Z')
,p_updated_on=>wwv_flow_imp.dz('20260620145419Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/deployment/definition
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(11299599185136184136)
,p_deinstall_script_clob=>wwv_flow_imp.varchar2_to_clob(wwv_flow_imp.g_varchar2_table)
,p_required_free_kb=>100
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE TABLE:CREATE TRIGGER:CREATE VIEW'
,p_created_on=>wwv_flow_imp.dz('20260621211132Z')
,p_last_updated_on=>wwv_flow_imp.dz('20260621211600Z')
,p_created_by=>'KRL.EKEMA@GMAIL.COM'
,p_last_updated_by=>'KRL.EKEMA@GMAIL.COM'
);
end;
/
prompt --application/deployment/checks
begin
null;
end;
/
prompt --application/deployment/buildoptions
begin
null;
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
