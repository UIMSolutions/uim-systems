module uim.systems.controllers.pages.sites.read;

@safe:
import uim.systems;

class DSystemSiteReadPageController : DSystemReadPageController {
  mixin(PageControllerThis!("SystemSiteReadPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .collectionName("system_sites")
      .rootPath("/system/sites");

    auto myView = APPEntityReadView(this)
      .rootPath(this.rootPath);

/*     if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .link(["href":this.rootPath], "Sites")
        .item(["active", "fw-bold"], "Anzeigen")
      );

      myHeader
        .breadcrumbs(bc)
        .title(titleCreate("Site anzeigen"));
    } */

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/read");
/*         .content(
          SystemSiteFormContent(myForm));  */
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Site")
          .subTitle("Site anzeigen");      
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
mixin(PageControllerCalls!("SystemSiteReadPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemSiteReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemSiteReadPageController); 
}}