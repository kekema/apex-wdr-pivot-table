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
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.0'
,p_default_workspace_id=>17062793957969100
,p_default_application_id=>138
,p_default_id_offset=>17513279999319301
,p_default_owner=>'CMF'
);
end;
/
 
prompt APPLICATION 138 - PKX
--
-- Application Export:
--   Application:     138
--   Name:            PKX
--   Date and Time:   23:06 Wednesday June 24, 2026
--   Exported By:     KAREL
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 10323656751446775
--   Manifest End
--   Version:         24.2.0
--   Instance ID:     800104173856312
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/region_type/lib4x_axt_wdr_pivottable
begin
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(10323656751446775)
,p_plugin_type=>'REGION TYPE'
,p_name=>'LIB4X.AXT.WDR.PIVOTTABLE'
,p_display_name=>'LIB4X - WDR Pivot Table'
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
,p_substitute_attributes=>true
,p_version_scn=>487018205
,p_subscribe_plugin_settings=>true
,p_help_text=>'Region wrapping WebDataRocks Pivot Grid component. Supports Drill-Through using Interactive Report.'
,p_version_identifier=>'1.0.0'
,p_about_url=>'https://github.com/kekema/apex-wdr-pivot-table'
,p_files_version=>19
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(10498677956637390)
,p_plugin_id=>wwv_flow_imp.id(10323656751446775)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_static_id=>'attr_default_rows'
,p_prompt=>'Default Rows'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_help_text=>'List of comma-separated field or hierarchy names. Case sensitive.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(10499592743639148)
,p_plugin_id=>wwv_flow_imp.id(10323656751446775)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_static_id=>'attr_default_columns'
,p_prompt=>'Default Columns'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_help_text=>'List of comma-separated field or hierarchy names. Case sensitive.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(10510838241743904)
,p_plugin_id=>wwv_flow_imp.id(10323656751446775)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_static_id=>'attr_default_measures'
,p_prompt=>'Default Measures'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_help_text=>'List of comma-separated fields. Case sensitive.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(10501327671655506)
,p_plugin_id=>wwv_flow_imp.id(10323656751446775)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_static_id=>'attr_aggregation'
,p_prompt=>'Aggregation'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(10510838241743904)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(10502269536672178)
,p_plugin_attribute_id=>wwv_flow_imp.id(10501327671655506)
,p_display_sequence=>10
,p_display_value=>'Sum'
,p_return_value=>'sum'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(10502622774673895)
,p_plugin_attribute_id=>wwv_flow_imp.id(10501327671655506)
,p_display_sequence=>20
,p_display_value=>'Count'
,p_return_value=>'count'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(10503029302675657)
,p_plugin_attribute_id=>wwv_flow_imp.id(10501327671655506)
,p_display_sequence=>30
,p_display_value=>'Distinct Count'
,p_return_value=>'distinctcount'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(10503416622677062)
,p_plugin_attribute_id=>wwv_flow_imp.id(10501327671655506)
,p_display_sequence=>40
,p_display_value=>'Average'
,p_return_value=>'average'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(10503877748687817)
,p_plugin_attribute_id=>wwv_flow_imp.id(10501327671655506)
,p_display_sequence=>50
,p_display_value=>'Median'
,p_return_value=>'median'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(10504229847689717)
,p_plugin_attribute_id=>wwv_flow_imp.id(10501327671655506)
,p_display_sequence=>60
,p_display_value=>'Product'
,p_return_value=>'product'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(10504647633690321)
,p_plugin_attribute_id=>wwv_flow_imp.id(10501327671655506)
,p_display_sequence=>70
,p_display_value=>'Min'
,p_return_value=>'min'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(10505072084690850)
,p_plugin_attribute_id=>wwv_flow_imp.id(10501327671655506)
,p_display_sequence=>80
,p_display_value=>'Max'
,p_return_value=>'max'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(10505440936696776)
,p_plugin_attribute_id=>wwv_flow_imp.id(10501327671655506)
,p_display_sequence=>90
,p_display_value=>'% of Grand Total'
,p_return_value=>'percent'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(10505853595698803)
,p_plugin_attribute_id=>wwv_flow_imp.id(10501327671655506)
,p_display_sequence=>100
,p_display_value=>'% of Column'
,p_return_value=>'percentofcolumn'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(10506218944700035)
,p_plugin_attribute_id=>wwv_flow_imp.id(10501327671655506)
,p_display_sequence=>110
,p_display_value=>'% of Row'
,p_return_value=>'percentofrow'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(10506645548701318)
,p_plugin_attribute_id=>wwv_flow_imp.id(10501327671655506)
,p_display_sequence=>120
,p_display_value=>'Index'
,p_return_value=>'index'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(10507013219703085)
,p_plugin_attribute_id=>wwv_flow_imp.id(10501327671655506)
,p_display_sequence=>130
,p_display_value=>'Difference'
,p_return_value=>'difference'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(10507403432706210)
,p_plugin_attribute_id=>wwv_flow_imp.id(10501327671655506)
,p_display_sequence=>140
,p_display_value=>'% Difference'
,p_return_value=>'%difference'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(10507830451712829)
,p_plugin_attribute_id=>wwv_flow_imp.id(10501327671655506)
,p_display_sequence=>150
,p_display_value=>'Population StDev'
,p_return_value=>'stdevp'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(10508260839718881)
,p_plugin_attribute_id=>wwv_flow_imp.id(10501327671655506)
,p_display_sequence=>160
,p_display_value=>'Sample StDev'
,p_return_value=>'stdevs'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(11415606754405117)
,p_plugin_id=>wwv_flow_imp.id(10323656751446775)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_static_id=>'attr_height'
,p_prompt=>'Height'
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
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(57907490887434957)
,p_plugin_id=>wwv_flow_imp.id(10323656751446775)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_static_id=>'attr_drill_through_dialog'
,p_prompt=>'Drill-Through Inline Dialog'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_help_text=>'ID of an Inline Dialog which is supporting Drill-Trough functionality. For APEX 26.1 and higher, give the HTML DOM ID. For earlier versions, give the Static ID.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(59243764834723848)
,p_plugin_id=>wwv_flow_imp.id(10323656751446775)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_static_id=>'attr_filters_page_item'
,p_prompt=>'Filters Page Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_help_text=>'Specify a hidden Page Item. The item will be set by the plugin with a Filters JSON as per the selected cell upon click/double click. These filters can be used in server-side queries to build where conditions as to query data associated with the selec'
||'ted cell. Under the (region) Source section (of your Drill-Through report or your Chart), include this item in ''Page Items to Submit''. The Session State Storage can be ''Per Request (Memory Only).'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(60389479034893529)
,p_plugin_id=>wwv_flow_imp.id(10323656751446775)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>45
,p_static_id=>'attr_decimal_places'
,p_prompt=>'Decimal Places'
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_show_in_wizard=>false
,p_max_length=>1
,p_is_translatable=>false
,p_help_text=>'Number of decimals to appear after decimal separator in the fractional part of numbers. When left empty, 2 will be taken.'
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(10389435422601260)
,p_plugin_id=>wwv_flow_imp.id(10323656751446775)
,p_name=>'INIT_JAVASCRIPT_CODE'
,p_is_required=>false
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(10324095765454953)
,p_plugin_id=>wwv_flow_imp.id(10323656751446775)
,p_name=>'SOURCE_LOCATION'
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(11468386095592465)
,p_plugin_id=>wwv_flow_imp.id(10323656751446775)
,p_name=>'lib4xcellclick'
,p_display_name=>'Cell Click'
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(57334479728875968)
,p_plugin_id=>wwv_flow_imp.id(10323656751446775)
,p_name=>'lib4xcelldblclick'
,p_display_name=>'Cell Double Click'
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
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(60328123931913754)
,p_plugin_id=>wwv_flow_imp.id(10323656751446775)
,p_file_name=>'js/lib4x-wdrpivottable.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
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
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(60331202048930779)
,p_plugin_id=>wwv_flow_imp.id(10323656751446775)
,p_file_name=>'css/lib4x-wdrpivottable.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
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
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(60779957187805942)
,p_plugin_id=>wwv_flow_imp.id(10323656751446775)
,p_file_name=>'js/lib4x-wdrpivottable.min.js'
,p_mime_type=>'text/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
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
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(60782308346808379)
,p_plugin_id=>wwv_flow_imp.id(10323656751446775)
,p_file_name=>'css/lib4x-wdrpivottable.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
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
