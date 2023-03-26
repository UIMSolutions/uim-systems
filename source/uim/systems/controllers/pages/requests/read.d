module uim.systems.controllers.pages.requests.read;

@safe:
import uim.systems;

class DSystemRequestReadPageController : DSystemReadPageController {
  mixin(PageControllerThis!("SystemRequestReadPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .collectionName("system_requests")
      .rootPath("/system/requests");

    auto myView = APPEntityReadView(this)
      .rootPath(this.rootPath);

/*     if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .link(["href":this.rootPath], "Requests")
        .item(["active", "fw-bold"], "Anzeigen")
      );

      myHeader
        .breadcrumbs(bc)
        .title(titleCreate("Request anzeigen"));
    } */

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/read");
/*         .content(
          SystemRequestFormContent(myForm));  */
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Requests")
          .subTitle("Request anzeigen");      
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
mixin(PageControllerCalls!("SystemRequestReadPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemRequestReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemRequestReadPageController); 
}}