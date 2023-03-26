module uim.systems.controllers.pages.apps.read;

@safe:
import uim.systems;

class DSystemAppReadPageController : DSystemReadPageController {
  mixin(APPPageControllerThis!("SystemAppReadPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize;

    this
      .collectionName("system_apps")
      .rootPath("/system/apps");

    auto myView = APPEntityReadView(this)
      .rootPath(this.rootPath);

    if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .link(["href":this.rootPath], "Apps")
        .item(["active", "fw-bold"], "Anzeigen")
      );

      myHeader
        .breadcrumbs(bc)
        .title(titleCreate("App anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/read")
        .content(
          SystemAppFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Apps")
          .subTitle("App anzeigen");      
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
mixin(APPPageControllerCalls!("SystemAppReadPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemAppReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemAppReadPageController); 
}}