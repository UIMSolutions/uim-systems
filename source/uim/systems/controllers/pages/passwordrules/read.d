module uim.systems.controllers.pages.passwordrules.read;

@safe:
import uim.systems;

class DSystemPasswordRuleReadPageController : DSystemReadPageController {
  mixin(APPPageControllerThis!("SystemPasswordRuleReadPageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("system_passwordrules")
      .rootPath("/system/passwordrules");

    auto myView = APPEntityReadView(this)
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
         .method("post").action(this.rootPath~"/actions/read")
        .content(
          SystemApiFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Passwortregeln")
          .subTitle("Passwortregel anzeigen");      
      }

      this
        .scripts
          .addContents(
            editorSummary~
            editorText~
            "editorSummary.disabled();"~
            "editorText.disabled();"
          );
    }

    this
      .view(myView);
  }
}
mixin(APPPageControllerCalls!("SystemPasswordRuleReadPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemPasswordRuleReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemPasswordRuleReadPageController); 
}}