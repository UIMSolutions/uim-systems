module uim.systems.controllers.pages.roles.update;

@safe:
import uim.systems;

class DSystemRoleUpdatePageController : DSystemUpdatePageController {
  mixin(PageControllerThis!("SystemRoleUpdatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .collectionName("system_roles")
      .rootPath("/system/roles");

    auto myView = APPEntityUpdateView(this)
      .rootPath(this.rootPath);

    if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .link(["href":this.rootPath], "Roles")
        .item(["active", "fw-bold"], "Anzeigen")
      );

      myHeader
        .breadcrumbs(bc)
        .title(titleCreate("Role anzeigen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
         .method("post").action(this.rootPath~"/actions/update")
        .content(
          SystemRoleFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Roles")
          .subTitle("Role anzeigen");
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
mixin(APPPageControllerCalls!("SystemRoleUpdatePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemRoleUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemRoleUpdatePageController); 
}}