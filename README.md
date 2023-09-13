[![REUSE status](https://api.reuse.software/badge/github.com/SAP-samples/abap-platform-refscen-flight)](https://api.reuse.software/info/github.com/SAP-samples/abap-platform-refscen-flight)

# ABAP Flight Reference Scenario for RAP on ABAP Platform Cloud
The ABAP RESTful Application Programming Model (RAP) defines the architecture for efficient end-to-end development of intrinsically SAP HANA-optimized Fiori apps. It supports the development of all types of Fiori applications as well as Web APIs. It is based on technologies and frameworks such as Core Data Services (CDS) for defining semantically rich data models and a service model infrastructure for creating OData services with bindings to an OData protocol and ABAP-based application services for custom logic and SAPUI5-based user interfaces.

The ABAP Flight Reference Scenario provides sample data and services as well as legacy business logic to get familiar with RAP. You can check out the end-to-end scenarios or build your own app based on the sample data.

For more information, see Downloading the ABAP Flight Reference Scenario ([SAP BTP](https://help.sap.com/docs/BTP/923180ddb98240829d935862025004d6/def316685ad14033b051fc4b88db07c8.html) / [SAP S/4HANA Cloud](https://help.sap.com/docs/SAP_S4HANA_CLOUD/6aa39f1ac05441e5a23f484f31e477e7/def316685ad14033b051fc4b88db07c8.html)).

**Note:**  
The branches of this repository were renamed recently. If you have already linked an ABAP Package to a branch with an outdated name, unlink the repository first and then pull the link to the branch with the new name, as described in step 3 of the <em>Download</em> section. 

## Prerequisites
Make sure to fulfill the following requirements:
* You have access to an ABAP Environment instance on SAP BTP or S/4HANA Cloud, public edition (see [SAP BTP-ABAP Environment](https://help.sap.com/docs/BTP/65de2977205c403bbc107264b8eccf4b/11d62652aa2b4600a0fa136de0789648.html) or [SAP S/4HANA Cloud-Developer Extensibility](https://help.sap.com/docs/SAP_S4HANA_CLOUD/6aa39f1ac05441e5a23f484f31e477e7/e1059ff581854a699f15734049f14293.html)).
* You have downloaded and installed ABAP Development Tools (ADT). Make sure to use the most recent version as indicated on the [installation page](https://tools.hana.ondemand.com/#abap). 
* You have created an ABAP Cloud Project in ADT that allows you to access your ABAP Environment instance (see Creating an ABAP Cloud Project ([SAP BTP](https://help.sap.com/docs/BTP/5371047f1273405bb46725a417f95433/99cc54393e4c4e77a5b7f05567d4d14c.html) / [SAP S/4HANA Cloud](https://help.sap.com/docs/SAP_S4HANA_CLOUD/25cf71e63940453397a32dc2b7676947/99cc54393e4c4e77a5b7f05567d4d14c.html))). Your log-on language is English.
* You have installed the [abapGit](https://github.com/abapGit/eclipse.abapgit.org) plug-in for ADT from the update site `http://eclipse.abapgit.org/updatesite/`.

## Download
Use the abapGit plug-in to import the <em>ABAP Flight Reference Scenario</em> by executing the following steps:
1. In your ABAP cloud project, create the ABAP package `ZDMOFLIGHT` (using the superpackage `ZDMOSAP`) as the target package for the demo content to be downloaded (leave the suggested values unchanged when following the steps in the package creation wizard).
2. To add the <em>abapGit Repositories</em> view to the <em>ABAP</em> perspective, click `Window` > `Show View` > `Other...` from the menu bar and choose `abapGit Repositories`.
3. In the <em>abapGit Repositories</em> view, click the `+` icon to clone an abapGit repository.
4. Enter the following URL of this repository: `https://github.com/SAP-samples/abap-platform-refscen-flight.git` and choose <em>Next</em>.
5. Select the branch <em>ABAP-platform-cloud</em> and enter the newly created package `ZDMOFLIGHT` as the target package and choose <em>Next</em>.
6. Create a new transport request that you only use for this demo content installation (recommendation) and choose <em>Finish</em> to link the Git repository to your ABAP cloud project. The repository appears in the abapGit Repositories View with status <em>Linked</em>.
7. Right-click on the new ABAP repository and choose `pull` to start the cloning of the repository contents. Note that this procedure may take a few minutes. 
8. Once the cloning has finished, the status is set to `Pulled Successfully`. (Refresh the `abapGit Repositories` view to see the progress of the import). Then refresh your project tree. 

As a result of the installation procedure above, the ABAP system creates an inactive version of all artifacts from the demo content and adds the following sub packages to the target package: 
* `ZDMOFLIGHT_LEGACY`
* `ZDMOFLIGHT_REUSE` The reuse package contains a package for the supplement business object `ZDMOFLIGHT_REUSE_SUPPLEMENT`, which is reused in the other development scenarios. The reuse package also contains the package `ZDMOFLIGHT_REUSE_CARRIER`, which contains a mulit-inline-edit scenario for maintaining carrier data (see Developing Transactional Apps with Multi-Inline-Edit Capabilities ([SAP BTP](https://help.sap.com/docs/BTP/923180ddb98240829d935862025004d6/f713ec52bcb8405ca9262918cffa5d25.html) / [SAP S/4HANA Cloud](https://help.sap.com/docs/SAP_S4HANA_CLOUD/e5522a8a7b174979913c99268bc03f1a/f713ec52bcb8405ca9262918cffa5d25.html))).
Lastly, the reuse package contains the package `ZDMOFLIGHT_REUSE_AGENCY` which incorporates a business object for administering agency master data, including the possibility of maintaining Large Objects. The business object is extensibility-enabled as described in the RAP extensibility guide (see Extend ([SAP BTP](https://help.sap.com/docs/BTP/923180ddb98240829d935862025004d6/492d88ed89f640e5b18dd1c57f6817b1.html) / [SAP S/4HANA Cloud](https://help.sap.com/docs/SAP_S4HANA_CLOUD/e5522a8a7b174979913c99268bc03f1a/492d88ed89f640e5b18dd1c57f6817b1.html))). This extensibility guide also contains examples on how to develop extensions for the business object. These code examples are contained in sub packages of the `ZDMOFLIGHT_REUSE_AGENCY` package.
* `ZDMOFLIGHT_READONLY` - represents a read-only list reporting app (see Developing Read-Only List Reporting Apps ([SAP BTP](https://help.sap.com/docs/BTP/923180ddb98240829d935862025004d6/504035c0850f44f787f5b81e35791d10.html) / [SAP S/4HANA Cloud](https://help.sap.com/docs/SAP_S4HANA_CLOUD/e5522a8a7b174979913c99268bc03f1a/504035c0850f44f787f5b81e35791d10.html))).
* `ZDMOFLIGHT_MANAGED` - represents the transactional app with implementation type <em>managed</em> (see Developing Managed Transactional Apps ([SAP BTP](https://help.sap.com/docs/BTP/923180ddb98240829d935862025004d6/b5bba99612cf4637a8b72a3fc82c22d9.html) / [SAP S/4HANA Cloud](https://help.sap.com/docs/SAP_S4HANA_CLOUD/e5522a8a7b174979913c99268bc03f1a/b5bba99612cf4637a8b72a3fc82c22d9.html))).
* `ZDMOFLIGHT_UNMANAGED` - represents the transactional app with implementation type <em>unmanaged</em> (see Developing Unmanaged Transactional Apps ([SAP BTP](https://help.sap.com/docs/BTP/923180ddb98240829d935862025004d6/f6cb3e3402694f5585068e5e5161a7c1.html) / [SAP S/4HANA Cloud](https://help.sap.com/docs/SAP_S4HANA_CLOUD/e5522a8a7b174979913c99268bc03f1a/f6cb3e3402694f5585068e5e5161a7c1.html))).
* `ZDMOFLIGHT_DRAFT` - represents the transactional app with <em>draft</em> (see Developing Transactional Apps with Draft Capabilities ([SAP BTP](https://help.sap.com/docs/BTP/923180ddb98240829d935862025004d6/71ba2bec1d0d4f22bc344bba6b569f2e.html) / [SAP S/4HANA Cloud](https://help.sap.com/docs/SAP_S4HANA_CLOUD/e5522a8a7b174979913c99268bc03f1a/71ba2bec1d0d4f22bc344bba6b569f2e.html))).

NOTE: The service bindings of the develop scenarios are imported with the warning: `To enable activation of local service endpoint, generate service artifacts`. 

## Configuration
To activate all development objects from the `ZDMOFLIGHT` package: 
1. Click the mass-activation icon (<em>Activate Inactive ABAP Development Objects</em>) in the toolbar.  
2. In the dialog that appears, select all development objects in the transport request (that you created for the demo content installation) and choose `Activate`. (The activation may take a few minutes.) 
3. Service definitions need a provider contract before they can be released for the release contract <em>Extend (C0)</em>. The service definition ZDMOUI_AGENCY from the package ZDMOFLIGHT_REUSE_AGENCY is shipped without this release contract for maintenance reasons and does not contain a provider contract. If you want to release the service definition ZDMOUI_AGENCY for the release contract <em>Extend (C0)</em>, you need to define a suitable provider contract first. You can also directly copy the source code from [service_definition_agency](service_definition_agency). Activate the service definition after.

To generate service artifacts for the service bindings:
1. In each service binding, choose the button `Publish` or choose `Publish local service endpoint` in the top right corner of the editor.

To fill the demo database tables for develop scenarios with sample business data: 
1. Expand the package structure in the Project Explorer `ZDMOFLIGHT_LEGACY` > `Source Code Library` > `Classes`.
2. Select the data generator class `ZDMOCL_FLIGHT_DATA_GENERATOR` and press `F9` (Run as Console Application). 

NOTE: The namespace ZDMO is reserved for the demo content. Apart from the downloaded demo content, do not use the namespace ZDMO and do not create any development objects in the downloaded packages. You can access the development objects in ZDMO from your own namespace.

## How to obtain support
This project is provided "as-is": there is no guarantee that raised issues will be answered or addressed in future releases.

## License
Copyright (c) 2018-2023 SAP SE or an SAP affiliate company. All rights reserved.
This project is licensed under the SAP Sample Code License except as noted otherwise in the [LICENSE](LICENSES/Apache-2.0.txt) file.

