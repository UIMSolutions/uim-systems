module uim.systems.controllers.pages.passwordrules.index;

@safe:
import uim.systems;

class DSystemPasswordRuleIndexPageController : DSystemEntitiesPageController {
  mixin(PageControllerThis!("SystemPasswordRuleIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/system/passwordrules")
      .collectionName("system_passwordrules");

   /*  if (auto myHeader = cast(DPageHeader)myView.header) {
      myHeader
        .rootPath("/system/passwordrules")
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
              .link(["href":"/"], "UIM")
              .link(["href":"/system"], "System")
              .item(["active", "fw-bold"], "Passwortregeln")
        ))
        .title(titleView("Übersicht Passwortregeln"))
        .actions([["refresh", "list", "create"]]);
    } */

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/system/passwordrules")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Passwortregeln")
            .subTitle("Passwortregeln anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(PageControllerCalls!("SystemPasswordRuleIndexPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemPasswordRuleIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemPasswordRuleIndexPageController); 
}}