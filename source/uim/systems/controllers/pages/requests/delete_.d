module uim.systems.controllers.pages.requests.delete_;

@safe:
import uim.systems;

class DSystemRequestDeletePageController : DSystemDeletePageController {
  mixin(APPPageControllerThis!("SystemRequestDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("system_requests")
      .rootPath("/system/requests");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);

    if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
          .link(["href":"/"], "UIM")
          .link(["href":"/system"], "system")
          .link(["href":this.rootPath], "Requests")
          .item(["active", "fw-bold"], "Löschen")
      );

      myHeader
        .breadcrumbs(bc)
        .title(titleDelete("Request löschen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/delete")
        .content(
          SystemRequestFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Requests")
          .subTitle("Request löschen");
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
mixin(APPPageControllerCalls!("SystemRequestDeletePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemRequestDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemRequestDeletePageController); 
}}