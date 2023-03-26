module uim.systems.controllers.pages.roles.index;

@safe:
import uim.systems;

class DSystemRoleIndexPageController : DSystemEntitiesPageController {
  mixin(PageControllerThis!("SystemRoleIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/system/roles")
      .collectionName("system_roles");

    if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .item(["active", "fw-bold"], "Rollen")
      );

      myHeader
        .rootPath("/system/roles")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Rollen"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/system/roles")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Rollen")
            .subTitle("Rollen anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("SystemRoleIndexPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemRoleIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemRoleIndexPageController); 
}}