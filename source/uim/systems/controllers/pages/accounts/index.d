module uim.systems.controllers.pages.accounts.index;

@safe:
import uim.systems;

class DSystemAccountIndexPageController : DSystemEntitiesPageController {
  mixin(APPPageControllerThis!("SystemAccountIndexPageController"));

  override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/system/accounts")
      .collectionName("system_accounts");

    if (auto myHeader = cast(DPageHeader)myView.header) {
      myHeader
        .rootPath("/system/accounts")
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
              .link(["href":"/"], "UIM")
              .link(["href":"/system"], "System")
              .item(["active", "fw-bold"], "Accounts")
        ))
        .title(titleView("Übersicht Accounts"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/system/accounts")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Accounts")
            .subTitle("Accounts anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("SystemAccountIndexPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemAccountIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemAccountIndexPageController); 
}}