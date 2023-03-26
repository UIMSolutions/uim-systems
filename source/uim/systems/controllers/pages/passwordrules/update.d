module uim.systems.controllers.pages.passwordrules.update;

@safe:
import uim.systems;

class DSystemPasswordRuleUpdatePageController : DSystemUpdatePageController {
  mixin(PageControllerThis!("SystemPasswordRuleUpdatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .collectionName("system_passwordrules")
      .rootPath("/system/passwordrules");

    auto myView = APPEntityUpdateView(this)
      .rootPath(this.rootPath);

    if (auto myHeader = cast(DPageHeader)myView.header) {
      myHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/"], "UIM")
            .link(["href":"/system"], "System")
            .link(["href":this.rootPath], "Passwortregeln")
            .item(["active", "fw-bold"], "Anzeigen")
        ))
        .title(titleCreate("Passwortregel anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/update")
        .content(
          SystemPasswordRuleFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Passwortregeln")
          .subTitle("Passwortregel anzeigen");
      }

      this
        .scripts
          .addContents(
            editorSummary~editorText,
            "window.addEventListener('load', (event) => {
              document.getElementById('"~myForm.id~"').addEventListener('submit', event => {
                editorSummary.save();
                editorText.save();
              })
            });"
          );      
    }

    this
      .view(myView);
  }
}
mixin(PageControllerCalls!("SystemPasswordRuleUpdatePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemPasswordRuleUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemPasswordRuleUpdatePageController); 
}}