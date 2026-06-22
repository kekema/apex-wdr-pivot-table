# apex-wdr-pivot-table
[WebDataRocks](https://www.webdatarocks.com/) wrapper plugin and sample app, enabling Pivot Tables for multi-dimensional data analysis. Has support for APEX data source integration, primary/alternative/private reports, save/load of private reports (local storage), Drill-Through using Interactive Report (inline dialog) and connecting Charts.

<img width="1299" height="763" alt="image" src="https://github.com/user-attachments/assets/0d44304a-20f4-41dc-9e20-bf35222bd947" />

Oracle APEX is not having a native Pivot Table component but only a very limited Pivot View in Interactive Reports. [FR-2532](https://apexapps.oracle.com/pls/apex/apex_pm/r/ideas/details?idea=FR-2532) discusses the use case for a native component. As it stands now (June 2026), Oracle is not having any plans for a dedicated component, leaving it to the option of integrating third-party widgets:

<img alt="image" src="https://github.com/user-attachments/assets/442fe3e0-c405-4d94-a996-072e0765dac0" height="70%" width="70%" />

There are several vendors in this space, like [DevExpress](https://js.devexpress.com/jQuery/pivotgrid/), [Syncfusion](https://www.syncfusion.com/javascript-ui-controls/js-pivot-table), [Telerik](https://demos.telerik.com/kendo-ui/pivotgrid/index), [Infragistics](https://www.infragistics.com/products/ignite-ui-jquery/grids-and-lists/olap-pivot-grid), [Flexmonster](https://www.flexmonster.com/demos/js/pivot-table/), etc. In the Open Source domain, there is the [pivottable.js](https://pivottable.js.org/) component.

Aim of this Github project is to set up a Proof of Concept as to integrate a third-party Pivot Table component into APEX. Using pivottable.js was one option, the other option I found was Flexmonster offering a free lightweight version of it's Pivot Table component called [WebDataRocks](https://www.webdatarocks.com/) (also see the [Github repository](https://github.com/WebDataRocks/web-pivot-table)). For the purpose, I decided to start with this one as it is probably the best refection of the effort and setup needed to integrate a third-party Pivot Table component. 

Importantly, WebDataRocks is not open source. It comes as a free, ready-to-use component and it has it's dedicated [license](https://www.webdatarocks.com/license-agreement/). It requires the WebDataRocks logo/link to be visible (as you can see in the screenshot). It has a data size limitation of 1MB when loading data into a WDR widget instance. When handling this limitation efficiently, for many use cases 1MB should be sufficient though and even makes this component interesting to use in real applications.

### Usage
The integration comes as an APEX Region Plugin. First APEX integration point is the data source.

<img width="580" height="530" alt="image" src="https://github.com/user-attachments/assets/1bfed721-66d2-408b-b284-f9677eb3a612" />

One way to use a Pivot Table is to load all data up to the detail level and let the Pivot Table component do the aggregation, and use the PT build-in Drill-Through feature to see the detail lines. The sample application takes a different approach in which data is pre-aggregated on the server. The WDR build-in Drill-Through feature is disabled. Instead, it makes use of an Interactive Report for the Drill-Through, reading the detail lines only at the moment of Drill-Through for the particular cell context (cell double click event).

The sample app reads the data from a Star Schema where a view is defined on top of the fact- and dimension tables:

```
    SELECT  category,
            country,
            region,		 
            "SEGMENT",
            channel,
            sales_rep,
            sales_level,
            TO_CHAR(order_date, 'YYYY') as year,
            'Q' || TO_CHAR(order_date, 'Q') as quarter,
            SUM(sales_amount) as revenue,
            SUM(profit_amount) as profit,
            COUNT(sales_id) as transaction_count
    FROM lib4x_sales_v
    GROUP BY
            category,
            country,
            region,		 
            "SEGMENT",
            channel,  
            sales_rep,
            sales_level,            
            TO_CHAR(order_date, 'YYYY'),
            'Q' || TO_CHAR(order_date, 'Q')
```

From this, you can configure the rows/columns/measures:

<img width="584" height="338" alt="image" src="https://github.com/user-attachments/assets/9fe4e0a3-1b46-4e22-8eb1-b107b5cbe86e" />

for the default primary report. 

The Initialization JavaScript functtion enables you for some further configurations like the captions to use and alternative reports:

```
function(options)
{
    options.metadata = {    
        'SEGMENT': {
            type: 'string',
            caption: 'Segment'
        },
        'COUNTRY': {
            type: 'string',
            caption: 'Country'
        },
        'REGION': {
            type: 'string',
            caption: 'Region'
        },
        'CATEGORY': {
            type: 'string',
            caption: 'Product Category'
        },            
        'CHANNEL': {
            type: 'string',
            caption: 'Channel'
        },
        'SALES_REP': {
            type: 'string',
            caption: 'Sales Rep'
        },    
        'SALES_LEVEL': {
            type: 'string',
            caption: 'Sales Level'
        },           
        'YEAR': {
            type: 'number',
            caption: 'Year'
        },
        'QUARTER': {
            type: 'string',
            caption: 'Quarter'
        },
        'REVENUE': {
            type: 'number',
            caption: 'Revenue'
        },
        'PROFIT': {
            type: 'number',
            caption: 'Profit'
        },
        'TRANSACTION_COUNT': {
            type: 'number',
            caption: 'Transactions'
        }    
    };	 

    options.primaryReport = {
        slice: {
            expands: {
                "rows": [
                    {
                        "tuple": [
                            "REGION.Asia-Pacific"
                        ]
                    }
                ],
                "columns": [
                    {
                        "tuple": [
                            "SEGMENT.Enterprise"
                        ]
                    }
                ]
            }
        }
    };

    options.alternativeReports = [
        {
            "slice": {
                "rows": [
                    {
                    "uniqueName": "COUNTRY"
                    }
                ],
                "columns": [
                    {
                    "uniqueName": "Measures"
                    },
                    {
                    "uniqueName": "CHANNEL"
                    }
                ],
                "measures": [
                    {
                    "uniqueName": "REVENUE",
                    "aggregation": "sum"
                    }
                ]
            },
            "options": {
                "grid": {
                    "title": "Revenue by Country / Channel"
                }
            }
        }
    ];

    options.normalizeFilters = true;
    
    return options;    
}
```

These configurations are WDR configs mostly, like the [metadata object](https://www.webdatarocks.com/doc/js/metadata-object-for-json/) and the [report object.](https://www.webdatarocks.com/api/report-object/)

The reports reflect in the Load option from toolbar:

<img width="353" height="201" alt="image" src="https://github.com/user-attachments/assets/0972a4ba-d43c-4082-be0b-b5b87cc201a3" />

So the default reports (primary report and 0, 1 or more alternative reports) can be configured beforehand. The user can compose and save additional private reports (report configs stored in Browser Local Storage).

For Drill-Through, you can set up an Inline Dialog with an Interactive Report in such a way it will be recognized by the plugin. 

<img width="324" height="245" alt="image" src="https://github.com/user-attachments/assets/d35ed85c-10d3-4b7f-92b6-3d523b5b43eb" />

Assign a DOM ID to the Inline Dialog and refer to it from the PT Region Attributes:

<img width="207" height="72" alt="image" src="https://github.com/user-attachments/assets/5c4b7b96-7aa6-4d13-bfe7-07c6ec6bb40d" />

<img width="246" height="43" alt="image" src="https://github.com/user-attachments/assets/bd3b21fb-2b31-4a32-874b-8a6ef0de8fa8" />


As a Sub Region, create a Static Content region which will be populated by the plugin with a header (giving cell context details). Assign the 'pt-dt-header' class:

<img width="571" height="182" alt="image" src="https://github.com/user-attachments/assets/94b8eae3-83cb-4fed-9869-00c0e0327ba9" />

Add an Interactive Report with the 'pt-dt-report' class. 

<img width="571" height="235" alt="image" src="https://github.com/user-attachments/assets/8e38c8aa-11f7-4395-b59d-6da8850584df" />

Upon 'cell double click', the plugin will open the Inline Dialog and refresh the Interactive Report. It will populate a configured page item (here 'P2_PT_FILTERS') with details on the cell context (as a JSON), so you can know how to filter the data. The sample app has the LIB4X_PIVOT_TABLE package with a full example and supporting functions. 

<img width="1895" height="970" alt="image" src="https://github.com/user-attachments/assets/533aea04-f83d-444b-903d-88647ff418f9" />

As you can see it has the header populated with the cell context details:

<img width="713" height="42" alt="image" src="https://github.com/user-attachments/assets/2969b2ad-1bfe-4cce-b6c2-508fee3a38f5" />

and a nice check is to compare the measure with the report aggregation:

<img width="408" height="186" alt="image" src="https://github.com/user-attachments/assets/313f9338-59a1-4be8-af91-7cdf06b2756a" />

The same cell context (as populated in 'P2_PT_FILTERS') can be used to filter data for connected Charts:

<img width="1889" height="592" alt="image" src="https://github.com/user-attachments/assets/07ce4a9e-d128-435f-b52e-0df16ae46ac0" />

<img width="571" height="143" alt="image" src="https://github.com/user-attachments/assets/c041d127-4583-428f-9a61-b01f364e328c" />

So a supporting PL/SQL package is used to dynamically compose the queries based on the cell context filters, eg for Interactive Report:

```
  function p2_get_report_query(p_filters_page_item in varchar2) return varchar2
  is
    result_query varchar2(4000);  
  begin
    result_query := q'~
        select *
          from LIB4X_SALES_V
          where (1=1)
        ~' || get_condition(p_filters_page_item);
   
    return result_query;
  end p2_get_report_query;
```





