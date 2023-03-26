module uim.systems.controllers.pages.apps.create;

@safe:
import uim.systems;

class DSystemAppCreatePageController : DSystemCreatePageController {
  mixin(APPPageControllerThis!("SystemAppCreatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .collectionName("system_apps")
      .rootPath("/system/apps");

    auto myView = APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto myHeader = cast(DPageHeader)myView.header) {
      myHeader
        .rootPath(this.rootPath)
        .title(titleCreate("App erstellen"))
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
              .link(["href":"/"], "UIM")
              .link(["href":"/system"], "System")
              .link(["href":this.rootPath], "Apps")
              .item(["active", "fw-bold"], "Erstellen")
          ));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .rootPath(this.rootPath)
        .method("post")
        .action(this.rootPath~"/actions/create")
        .content(
          SystemAppFormContent(
            myForm
        ));
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .rootPath(this.rootPath)
            .mainTitle("Neuer App")
            .subTitle("Bitte Werte eingeben")
            .actions([["cancel", "save"]]);
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
mixin(APPPageControllerCalls!("SystemAppCreatePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new SystemAppCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemAppCreatePageController); 
}}