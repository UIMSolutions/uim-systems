module uim.systems.controllers.pages.users.index;

@safe:
import uim.systems;

class DSystemUserIndexPageController : DSystemEntitiesPageController {
  mixin(PageControllerThis!("SystemUserIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/system/users")
      .collectionName("system_users");

    if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .item(["active", "fw-bold"], "Anwender")
      );

      myHeader
        .rootPath("/system/users")
        .breadcrumbs(bc)
        .title(titleView("Übersicht UsAnwenderers"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/system/users")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Anwender")
            .subTitle("Anwender anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("SystemUserIndexPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemUserIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemUserIndexPageController); 
}}