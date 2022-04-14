module uim.systems.controllers.pages.requests.index;

@safe:
import uim.systems;

class DSystemRequestIndexPageController : DSystemEntitiesPageController {
  mixin(APPPageControllerThis!("SystemRequestIndexPageController"));

  override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/system/requests")
      .collectionName("system_requests");

    if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .item(["active", "fw-bold"], "Requests")
      );

      myHeader
        .rootPath("/system/requests")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Requests"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/system/requests")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Requests")
            .subTitle("Requests anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("SystemRequestIndexPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemRequestIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemRequestIndexPageController); 
}}