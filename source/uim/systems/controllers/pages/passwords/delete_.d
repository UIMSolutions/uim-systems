module source.uim.systems.controllers.pages.passwords.delete_;

@safe:
import uim.systems;

class DSystemPasswordDeletePageController : DMDLDeletePageController {
  mixin(APPPageControllerThis!("SystemPasswordDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("system_passwords")
      .rootPath("/system/passwords");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);

    if (auto pgHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "systems")
        .link(["href":this.rootPath], "Passwörter")
        .item(["active", "fw-bold"], "Löschen")
      );

      pgHeader
        .breadcrumbs(bc)
        .title(titleDelete("Passwort löschen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/delete")
        .content(
          MDLApiFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Passwörter")
          .subTitle("Passwort löschen");
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
mixin(APPPageControllerCalls!("SystemPasswordDeletePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemPasswordDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemPasswordDeletePageController); 
}}