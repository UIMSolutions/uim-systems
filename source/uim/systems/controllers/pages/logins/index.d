module uim.systems.controllers.pages.logins.index;

@safe:
import uim.systems;

class DSystemLoginIndexPageController : DSystemEntitiesPageController {
  mixin(APPPageControllerThis!("SystemLoginIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/system/logins")
      .collectionName("system_logins");

    if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .item(["active", "fw-bold"], "Logins")
      );

      myHeader
        .rootPath("/system/logins")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Logins"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/system/logins")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Logins")
            .subTitle("Logins anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("SystemLoginIndexPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemLoginIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemLoginIndexPageController); 
}}