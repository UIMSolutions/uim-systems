module uim.systems.controllers.pages.sessions.create;

@safe:
import uim.systems;

class DSystemSessionCreatePageController : DSystemCreatePageController {
  mixin(PageControllerThis!("SystemSessionCreatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .collectionName("system_sessions")
      .rootPath("/system/sessions");

    auto myView = APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .link(["href":this.rootPath], "Sessions")
        .item(["active", "fw-bold"], "Erstellen")
      );

      myHeader
        .rootPath(this.rootPath)
        .title(titleCreate("Session erstellen"))
        .breadcrumbs(bc);
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .rootPath(this.rootPath)
        .method("post")
        .action(this.rootPath~"/actions/create")
        .content(SystemSessionFormContent(myForm));
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .rootPath(this.rootPath)
            .mainTitle("Neue Session")
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
mixin(APPPageControllerCalls!("SystemSessionCreatePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new SystemSessionCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemSessionCreatePageController); 
}}