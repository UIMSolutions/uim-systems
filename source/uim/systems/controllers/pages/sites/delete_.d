module uim.systems.controllers.pages.users.delete_;

@safe:
import uim.systems;

class DSystemSiteDeletePageController : DSystemDeletePageController {
  mixin(APPPageControllerThis!("SystemSiteDeletePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("system_users")
      .rootPath("/system/users");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);

    if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "system")
        .link(["href":this.rootPath], "Anwender")
        .item(["active", "fw-bold"], "Löschen")
      );

      myHeader
        .breadcrumbs(bc)
        .title(titleDelete("Anwender löschen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/delete")
        .content(
          SystemSiteFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Anwender")
          .subTitle("Anwender löschen");
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
mixin(APPPageControllerCalls!("SystemSiteDeletePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemSiteDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemSiteDeletePageController); 
}}