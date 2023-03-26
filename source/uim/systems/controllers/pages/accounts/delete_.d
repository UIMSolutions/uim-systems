module uim.systems.controllers.pages.accounts.delete_;

@safe:
import uim.systems;

class DSystemAccountDeletePageController : DSystemDeletePageController {
  mixin(APPPageControllerThis!("SystemAccountDeletePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize;

    this
      .collectionName("system_accounts")
      .rootPath("/system/accounts");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);

    if (auto myHeader = cast(DPageHeader)myView.header) {
      myHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
              .link(["href":"/"], "UIM")
              .link(["href":"/system"], "system")
              .link(["href":this.rootPath], "Accounts")
              .item(["active", "fw-bold"], "Löschen")
        ))
        .title(titleDelete("Account löschen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/delete")
        .content(
          SystemAccountFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Accounts")
          .subTitle("Account löschen");
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
mixin(APPPageControllerCalls!("SystemAccountDeletePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemAccountDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemAccountDeletePageController); 
}}