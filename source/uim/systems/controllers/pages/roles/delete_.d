module uim.systems.controllers.pages.roles.delete_;

@safe:
import uim.systems;

class DSystemRoleDeletePageController : DSystemDeletePageController {
  mixin(PageControllerThis!("SystemRoleDeletePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .collectionName("system_roles")
      .rootPath("/system/roles");

    auto myView = APPEntityDeleteView(this)
      .rootPath(this.rootPath);

    if (auto myHeader = cast(DPageHeader)myView.header) {
      myHeader
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
              .link(["href":"/"], "UIM")
              .link(["href":"/system"], "System")
              .link(["href":this.rootPath], "Rollen")
              .item(["active", "fw-bold"], "Löschen")
        ))
        .title(titleDelete("Rolle löschen"));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .method("post").action(this.rootPath~"/actions/delete")
        .content(
          SystemRoleFormContent(myForm)); 
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) { 
        myFormHeader
          .mainTitle("Rollen")
          .subTitle("Rolle löschen");
      }

      this
        .scripts
          .addContents(
            editorSummary~editorText~
            "editorSummary.disabled();"~
            "editorText.disabled();"
          );
    }

    this
      .view(myView);
  }
}
mixin(APPPageControllerCalls!("SystemRoleDeletePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemRoleDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemRoleDeletePageController); 
}}