module uim.systems.controllers.pages.passwords.create;

@safe:
import uim.systems;

class DSystemPasswordCreatePageController : DSystemCreatePageController {
  mixin(PageControllerThis!("SystemPasswordCreatePageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .collectionName("system_passwords")
      .rootPath("/system/passwords");

    auto myView = APPEntityCreateView(this)
      .rootPath(this.rootPath);
    
/*     if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .link(["href":this.rootPath], "Passwörter")
        .item(["active", "fw-bold"], "Erstellen")
      );

      myHeader
        .rootPath(this.rootPath)
        .title(titleCreate("Passwort erstellen"))
        .breadcrumbs(bc);
    } */

    if (auto myForm = cast(DForm)myView.form) {
      /* myForm
        .rootPath(this.rootPath)
        .method("post")
        .action(this.rootPath~"/actions/create")
        .content(
          SystemPasswordFormContent(myForm)); */
    
      if (auto myFormHeader = cast(DFormHeader)myForm.header) {
          myFormHeader
            .rootPath(this.rootPath)
            .mainTitle("Neues Passwort")
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
mixin(PageControllerCalls!("SystemPasswordCreatePageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new SystemPasswordCreatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemPasswordCreatePageController); 
}}