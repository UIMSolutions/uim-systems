module uim.systems.controllers.pages.logins.delete_;

@safe:
import uim.systems;

class DSystemLoginDeletePageController : DSystemDeletePageController {
  mixin(PageControllerThis!("SystemLoginDeletePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .collectionName("system_logins")
      .rootPath("/system/logins");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);

    if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "system")
        .link(["href":this.rootPath], "Logins")
        .item(["active", "fw-bold"], "Löschen")
      );

      myHeader
        .breadcrumbs(bc)
        .title(titleDelete("Login löschen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .action(this.rootPath~"/actions/delete")
        .method("post")
        .content(
          SystemLoginFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Logins")
          .subTitle("Login löschen");
      }

      this
        .scripts
          .addContents(
            editorSummary~editorText~
            "editorSummary.disabled();"~
            "editorText.disabled();"
          );
    }

    this
      .view(myView);
  }
}
mixin(APPPageControllerCalls!("SystemLoginDeletePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemLoginDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemLoginDeletePageController); 
}}