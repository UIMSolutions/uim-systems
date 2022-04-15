module uim.systems.controllers.pages.users.index;

@safe:
import uim.systems;

class DSystemTenantIndexPageController : DSystemEntitiesPageController {
  mixin(APPPageControllerThis!("SystemTenantIndexPageController"));

  override void initialize() {
    super.initialize;

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
mixin(APPPageControllerCalls!("SystemTenantIndexPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemTenantIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemTenantIndexPageController); 
}}