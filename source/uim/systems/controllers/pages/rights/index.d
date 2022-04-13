module uim.systems.controllers.pages.rechte.index;

@safe:
import uim.systems;

class DSystemRightIndexPageController : DSystemEntitiesPageController {
  mixin(APPPageControllerThis!("SystemRightIndexPageController"));

  override void initialize() {
    super.initialize;

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/system/right")
      .collectionName("system_rechte");

    if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .item(["active", "fw-bold"], "Rechte")
      );

      myHeader
        .rootPath("/system/rechte")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Rechte"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
       .rootPath("/system/rechte")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Rechte")
            .subTitle("Rechte anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("SystemRightIndexPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemRightIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemRightIndexPageController); 
}}