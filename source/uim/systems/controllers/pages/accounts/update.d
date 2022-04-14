module uim.systems.controllers.pages.accounts.update;

@safe:
import uim.systems;

class DSystemAccountUpdatePageController : DSystemUpdatePageController {
  mixin(APPPageControllerThis!("SystemAccountUpdatePageController"));

  override void initialize() {
    super.initialize;

    this
      .collectionName("system_accounts")
      .rootPath("/system/accounts");

    auto myView = APPEntityUpdateView(this)
      .rootPath(this.rootPath);

    if (auto myHeader = cast(DPageHeader)myView.header) {
      myHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/"], "UIM")
            .link(["href":"/system"], "System")
            .link(["href":this.rootPath], "Accounts")
            .item(["active", "fw-bold"], "Anzeigen")
        ))
        .title(titleCreate("Account anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/update")
        .content(
          SystemApiFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Accounts")
          .subTitle("Account anzeigen");
      }

      this
        .scripts
          .addContents(
            editorSummary~editorText,
            "window.addEventListener('load', (event) => {
              document.getElementById('"~myForm.id~"').addEventListener('submit', event => {
                editorSummary.save();
                editorText.save();
              })
            });"
          );      
    }

    this
      .view(myView);
  }
}
mixin(APPPageControllerCalls!("SystemAccountUpdatePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemAccountUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemAccountUpdatePageController); 
}}