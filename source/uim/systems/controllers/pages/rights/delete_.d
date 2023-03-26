module uim.systems.controllers.pages.rights.delete_;

@safe:
import uim.systems;

class DSystemRightDeletePageController : DSystemDeletePageController {
  mixin(APPPageControllerThis!("SystemRightDeletePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize;

    this
      .collectionName("system_rights")
      .rootPath("/system/rights");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);

    if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "system")
        .link(["href":this.rootPath], "Rechte")
        .item(["active", "fw-bold"], "Löschen")
      );

      myHeader
        .breadcrumbs(bc)
        .title(titleDelete("Recht löschen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/delete")
        .content(
          SystemRightFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Rechte")
          .subTitle("Recht löschen");
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
mixin(APPPageControllerCalls!("SystemRightDeletePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemRightDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemRightDeletePageController); 
}}