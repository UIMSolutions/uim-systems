module uim.systems.controllers.pages.sessions.index;

@safe:
import uim.systems;

class DSystemSessionIndexPageController : DSystemEntitiesPageController {
  mixin(PageControllerThis!("SystemSessionIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/system/sessions")
      .collectionName("system_sessions");

/*     if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .item(["active", "fw-bold"], "Sessions")
      );

      myHeader
        .rootPath("/system/sessions")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Sessions"))
        .actions([["refresh", "list", "create"]]);
    } */

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/system/sessions");
/*        .content(
          EntitiesFormContent(frm)) 
        .header(
          FormHeader(frm)
            .mainTitle("Sessions")
            .subTitle("Sessions anzeigen")
            .actions([["print", "export"]])); */
    } 
  }
}
mixin(PageControllerCalls!("SystemSessionIndexPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemSessionIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemSessionIndexPageController); 
}}