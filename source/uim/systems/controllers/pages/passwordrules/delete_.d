module uim.systems.controllers.pages.passwordrules.delete_;

@safe:
import uim.systems;

class DSystemPasswordRuleDeletePageController : DSystemDeletePageController {
  mixin(PageControllerThis!("SystemPasswordRuleDeletePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .collectionName("system_passwordrules")
      .rootPath("/system/passwordrules");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);

    if (auto myHeader = cast(DPageHeader)myView.header) {
      myHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
              .link(["href":"/"], "UIM")
              .link(["href":"/system"], "system")
              .link(["href":this.rootPath], "Passwortregeln")
              .item(["active", "fw-bold"], "Löschen")
        ))
        .title(titleDelete("Passwortregel löschen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/delete")
        .content(
          SystemPasswordRuleFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Passwortregel")
          .subTitle("Passwortregel löschen");
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
mixin(PageControllerCalls!("SystemPasswordRuleDeletePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemPasswordRuleDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemPasswordRuleDeletePageController); 
}}