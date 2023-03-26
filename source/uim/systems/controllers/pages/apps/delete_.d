module uim.systems.controllers.pages.apps.delete_;

@safe:
import uim.systems;

class DSystemAppDeletePageController : DSystemDeletePageController {
  mixin(APPPageControllerThis!("SystemAppDeletePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .collectionName("system_apps")
      .rootPath("/system/apps");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);

    if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "system")
        .link(["href":this.rootPath], "Apps")
        .item(["active", "fw-bold"], "Löschen")
      );

      myHeader
        .breadcrumbs(bc)
        .title(titleDelete("App löschen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/delete")
        .content(
          SystemAppFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Apps")
          .subTitle("App löschen");
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
mixin(APPPageControllerCalls!("SystemAppDeletePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemAppDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemAppDeletePageController); 
}}