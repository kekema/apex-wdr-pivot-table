# apex-wdr-pivot-table
[WebDataRocks](https://www.webdatarocks.com/) wrapper plugin, enabling Pivot Tables for multi-dimensional data analysis. Has support for APEX data source integration, primary/alternative/private reports, save/load of private reports (local storage), Drill-Through using Interactive Report (inline dialog) and connecting Charts.

<img width="1299" height="763" alt="image" src="https://github.com/user-attachments/assets/0d44304a-20f4-41dc-9e20-bf35222bd947" />

Oracle APEX is not having a native Pivot Table component but only a very limited Pivot View in Interactive Reports. [FR-2532](https://apexapps.oracle.com/pls/apex/apex_pm/r/ideas/details?idea=FR-2532) discusses the use case for a native component. As it stands now (June 2026), Oracle is not having any plans for a dedicated component, leaving it to the option of integrating third-party widgets:

<img alt="image" src="https://github.com/user-attachments/assets/442fe3e0-c405-4d94-a996-072e0765dac0" height="70%" width="70%" />

There are several vendors in this space, like [DevExpress](https://js.devexpress.com/jQuery/pivotgrid/), [Syncfusion](https://www.syncfusion.com/javascript-ui-controls/js-pivot-table), [Telerik](https://demos.telerik.com/kendo-ui/pivotgrid/index), [Infragistics](https://www.infragistics.com/products/ignite-ui-jquery/grids-and-lists/olap-pivot-grid), [Flexmonster](https://www.flexmonster.com/demos/js/pivot-table/), etc. In the Open Source domain, there is the [pivottable.js](https://pivottable.js.org/) component.

Aim of this Github project is to set up a Proof of Concept as to integrate a third-party Pivot Table component into APEX. Using pivottable.js was one option, the other option I found was Flexmonster offering a free lightweight version of it's Pivot Table component called [WebDataRocks](https://www.webdatarocks.com/) (also see the [Github repository](https://github.com/WebDataRocks/web-pivot-table)). For the purpose, I decided to start with this one as it is probably the best refection of the effort and setup needed to integrate a third-party Pivot Table component. 

Importantly, WebDataRocks is not open source. It comes as a free, ready-to-use component and it has it's dedicated [license](https://www.webdatarocks.com/license-agreement/). It requires the WebDataRocks logo/link to be visible (as you can see in the screenshot). It has a data size limitation of 1MB when loading data into a WDR widget instance. For many use cases this should be sufficient though and even makes this component interesting to use in real applications.



