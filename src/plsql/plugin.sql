procedure render (
    p_plugin in            apex_plugin.t_plugin,
    p_region in            apex_plugin.t_region,
    p_param  in            apex_plugin.t_region_render_param,
    p_result in out nocopy apex_plugin.t_region_render_result )
is 
    l_region_id             varchar2(50); 
    l_internal_id           varchar2(50); 
    l_default_rows          varchar2(200);
    l_default_columns       varchar2(200);
    l_default_measures      varchar2(200);
    l_aggregation           varchar2(200);
    l_height                varchar2(20);
    l_dt_dialog_id          varchar2(50);
    l_filters_page_item     varchar2(50);
    l_decimal_places        PLS_INTEGER;
    l_context               apex_exec.t_context;
    l_columns               APEX_EXEC.T_COLUMNS;
    l_json                  CLOB;  
    l_apex_version          varchar2(50);  
    l_major_version         NUMBER := 0;
    l_minor_version         NUMBER := 0;    
    l_nonce_clause          VARCHAR2(100) := '';
begin
    if apex_application.g_debug then
        apex_plugin_util.debug_region(p_plugin => p_plugin, p_region => p_region);
    end if;
    l_region_id := apex_escape.html_attribute(p_region.static_id);
    l_internal_id := p_region.id;
    l_default_rows := p_region.attributes.get_varchar2('attr_default_rows');
    l_default_columns := p_region.attributes.get_varchar2('attr_default_columns');
    l_default_measures := p_region.attributes.get_varchar2('attr_default_measures');
    l_aggregation := p_region.attributes.get_varchar2('attr_aggregation');
    l_height := p_region.attributes.get_varchar2('attr_height');
    l_dt_dialog_id := p_region.attributes.get_varchar2('attr_drill_through_dialog');
    l_filters_page_item := p_region.attributes.get_varchar2('attr_filters_page_item');
    l_decimal_places := p_region.attributes.get_varchar2('attr_decimal_places');
    -- add a csp nonce to the script tag which got supported in APEX 24.2
    l_apex_version := '#APEX_VERSION#';
    if l_apex_version is not null then
        begin
            l_major_version := TO_NUMBER(REGEXP_SUBSTR(l_apex_version, '^\d+'));
            l_minor_version := TO_NUMBER(REGEXP_SUBSTR(l_apex_version, '\.(\d+)', 1, 1, NULL, 1));
            -- Check if APEX is 24.2 or later
            IF l_major_version > 24 OR (l_major_version = 24 AND l_minor_version >= 2) THEN
                l_nonce_clause := ' nonce="#APEX_CSP_NONCE_VALUE#"';
            END IF;
        exception
            when others then
                null;
        end;
    end if;
    -- add data resultset as JSON to the page
    if ((p_region.source is not null) and (instr(lower(p_region.source), 'json_arrayagg') > 0)) then
        -- JSON aggregate query
        l_context := apex_exec.open_query_context();
        if apex_exec.next_row(l_context) then
            l_json := apex_exec.get_clob(l_context, 1); -- Fetch JSON CLOB from first column
        end if;     
        apex_exec.close( l_context ); 
        if l_json is not null then
            htp.p('<script' || l_nonce_clause || '>');
            htp.p('var gPt' || l_internal_id || 'data = {"data":');
            apex_util.prn(p_clob => l_json, p_escape => false );
            htp.p('};');         
            htp.p('</script>');
        end if;       
    else
        -- regular query
        l_context := apex_exec.open_query_context();
        apex_json.initialize_clob_output;
        apex_json.write_context(p_context => l_context, p_write_null => true);
        htp.p('<script' || l_nonce_clause || '>');
        htp.p('var gPt' || l_internal_id || 'data = {"data":');
        apex_util.prn(p_clob => apex_json.get_clob_output( p_free => true), p_escape => false );
        htp.p('};');
        htp.p('</script>'); 
        apex_exec.close( l_context );       
    end if;

    htp.p('<div id="' || l_region_id || '_pt"></div>');
 
    -- When specifying the library declaratively, it fails to load the minified version. So using the API:
    apex_javascript.add_library(
        p_name      => 'lib4x-wdrpivottable',
        p_check_to_add_minified => true,
        --p_directory => '#WORKSPACE_FILES#javascript/',          
        p_directory => p_plugin.file_prefix || 'js/',
        p_version   => NULL
    );

    -- this one is not having the check minified parameter
    apex_css.add_file (
        p_name => 'lib4x-wdrpivottable'||case when v('DEBUG') = 'NO' then '.min' end,
        --p_directory => '#WORKSPACE_FILES#css/'
        p_directory => p_plugin.file_prefix || 'css/' 
    );

    -- add call to init in js
    apex_javascript.add_onload_code(
        p_code => apex_string.format(
            'lib4x.axt.wdr.pivotTable._init("%s", "%s", "%s", "%s", "%s", "%s", "%s",'
            , apex_plugin.get_ajax_identifier
            , l_region_id
            , l_internal_id
            , l_height
            , l_dt_dialog_id
            , l_filters_page_item
            , l_decimal_places
        ) || '{' || APEX_JAVASCRIPT.ADD_ATTRIBUTE('rows', l_default_rows) || 
                    APEX_JAVASCRIPT.ADD_ATTRIBUTE('columns', l_default_columns) || 
                    APEX_JAVASCRIPT.ADD_ATTRIBUTE('measures', l_default_measures) || 
                    APEX_JAVASCRIPT.ADD_ATTRIBUTE('aggregation', l_aggregation, true, false) || 
        '}, '
        || p_region.init_javascript_code || ');'
    );
end;

-- a future feature can be to save report configs remotely in SODA collection
/* procedure region_ajax (
    p_plugin in            apex_plugin.t_plugin,
    p_region in            apex_plugin.t_region,
    p_param  in            apex_plugin.t_region_ajax_param,
    p_result in out nocopy apex_plugin.t_region_ajax_result )
is
    --l_json_clob             clob;
    --l_json                  json_object_t;  
    c_use_clob              constant   VARCHAR2(1000) := 
                               '{"keyColumn":{"assignmentMethod": "CLIENT"},
                                "contentColumn":{"sqlType": "CLOB"}}';    
    l_collection            SODA_COLLECTION_T;
    l_document              SODA_DOCUMENT_T;
    l_status                NUMBER;
begin
    if apex_application.g_debug then
        apex_plugin_util.debug_region(p_plugin => p_plugin, p_region => p_region);
    end if;
    --l_json_clob := apex_application.g_clob_01;
    --l_json := json_object_t.parse(l_json_clob);
    l_collection := dbms_soda.open_collection('LIB4X_CONFIG_STORE');
    if l_collection is null then
        l_collection := dbms_soda.create_collection('LIB4X_CONFIG_STORE', c_use_clob);
    end if;
    l_document := soda_document_t(key => 'K007', c_content => apex_application.g_clob_01, media_type => 'application/json');
    l_status := l_collection.insert_one(l_document);
    apex_json.open_object;  
    apex_json.write('status', l_status);  
    apex_json.write('key', l_document.get_key);  
    apex_json.close_object;  
end; */
