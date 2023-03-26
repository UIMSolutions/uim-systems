module uim.systems.controllers.pages.sites.index;

@safe:
import uim.systems;

class DSystemSiteIndexPageController : DSystemEntitiesPageController {
  mixin(APPPageControllerThis!("SystemSiteIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/system/sites")
      .collectionName("system_sites");

    if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .item(["active", "fw-bold"], "Sites")
      );

      myHeader
        .rootPath("/system/sites")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Sites"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/system/sites")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Sites")
            .subTitle("Sites anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("SystemSiteIndexPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemSiteIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemSiteIndexPageController); 
}}