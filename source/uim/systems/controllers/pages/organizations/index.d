module uim.systems.controllers.pages.organizations.index;

@safe:
import uim.systems;

class DSystemOrganizationIndexPageController : DSystemEntitiesPageController {
  mixin(PageControllerThis!("SystemOrganizationIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/system/organizations")
      .collectionName("system_organizations");

    /* if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .item(["active", "fw-bold"], "Organizations")
      );

      myHeader
        .rootPath("/system/organizations")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Organizations"))
        .actions([["refresh", "list", "create"]]);
    } */

/*     if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/system/organizations")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Organizations")
            .subTitle("Organizations anzeigen")
            .actions([["print", "export"]]));
    }  */
  }
}
mixin(PageControllerCalls!("SystemOrganizationIndexPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemOrganizationIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemOrganizationIndexPageController); 
}}