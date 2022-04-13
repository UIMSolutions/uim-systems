module source.uim.systems.controllers.pages.passwords copy.index;

@safe:
import uim.systems;

class DSystemPasswordIndexPageController : DMDLEntitiesPageController {
  mixin(APPPageControllerThis!("SystemPasswordIndexPageController"));

  override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/system/passwords")
      .collectionName("system_passwords");

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .item(["active", "fw-bold"], "Passwords")
      );

      pgHeader
        .rootPath("/system/passwords")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Passwords"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/system/passwords")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Passwords")
            .subTitle("Passwords anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("SystemPasswordIndexPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemPasswordIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemPasswordIndexPageController); 
}}