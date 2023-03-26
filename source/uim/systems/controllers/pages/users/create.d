module uim.systems.controllers.pages.users.create;

@safe:
import uim.systems;

class DSystemUserCreatePageController : DSystemCreatePageController {
  mixin(APPPageControllerThis!("SystemUserCreatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .collectionName("system_users")
      .rootPath("/system/users");

    auto myView = APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
    if (auto myHeader = cast(DPageHeader)myView.header) {
      myHeader
        .rootPath(this.rootPath)
        .title(titleCreate("User erstellen"))
        .breadcrumbs(
          BS5Breadcrumb(
            BS5BreadcrumbList
            .link(["href":"/"], "UIM")
            .link(["href":"/system"], "System")
            .link(["href":this.rootPath], "Anwender")
            .item(["active", "fw-bold"], "Erstellen")
          ));
    }

    if (auto myForm = cast(DForm)myView.form) {
      myForm
        .rootPath(this.rootPath)
        .method("post")
        .action(this.rootPath~"/actions/create")
        .content(
          SystemUserFormContent(
            myForm
        ));
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .rootPath(this.rootPath)
            .mainTitle("Neuer Anwender")
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
mixin(APPPageControllerCalls!("SystemUserCreatePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new SystemUserCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemUserCreatePageController); 
}}