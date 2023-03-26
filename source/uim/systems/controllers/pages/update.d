module uim.systems.controllers.pages.update;

@safe:
import uim.systems;

class DSystemUpdatePageController : DSystemEntityPageController {
  mixin(APPPageControllerThis!("SystemUpdatePageController"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DSystemUpdatePageController~":DSystemUpdatePageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    if (entityId && entityId.isUUID) {  
      if (auto dbEntity = database[appSession.site, this.collectionName].findOne(UUID(entityId))) {
        debug writeln("Found entity");

        if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
          debug writeln("Setting entityView");
          entityView
            .entity(dbEntity)
            .crudMode(CRUDModes.Update)
            .rootPath(this.rootPath);
          }
        }
      }
    }
}
mixin(APPPageControllerCalls!("SystemUpdatePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemUpdatePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemUpdatePageController); 
}}

auto mdlUpdatePageController(string classesName, string rootController, string addInitialize = "", string addBeforeResponse = "") {
  return `
    class D`~classesName~`UpdatePageController : D`~rootController~`PageController {
      `~appPageControllerThis(classesName~`UpdatePageController`, true)~`

    override void initialize(Json configSettings = Json(null)) {
      super.initialize;

      this
        .view(
          `~classesName~`UpdateView(this));

      `~addInitialize~`
      }
    }`~
    appPageControllerCalls(classesName~`UpdatePageController`, true);
}

template SystemUpdatePageController(string classesName, string rootController, string addInitialize = "", string addBeforeResponse = "") {
  const char[] SystemUpdatePageController = mdlUpdatePageController(classesName, rootController, addInitialize, addBeforeResponse);
}

/*
  this(string jsPath, string myPath, string myEntities, string myEntity, string myCollectionName) { super(); 
    this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!System > "~myEntities~" > Bearbeiten")
    .checks([APPCheckAppSessionExists, APPCheckAppSessionHasSession, APPCheckAppSessionHasSite])
    // .securityController(APPSecurityController(this))
    .pageHeader(
      APPEditPageHeader
      .rootPath(pgPath).mainTitle(myEntities).subTitle("Bearbeiten "~myEntity)
      .breadcrumbs(BS5BreadcrumbList(["breadcrumb-arrows"])
        .link(["href":"/"], "UIM!System")
        .link(["href":pgPath], myEntities)
        .item(["active"], ["aria-current":"page"], H5A(["href":"#"], "Bearbeiten")))
    );

    this.scripts.addLinks(
      "/js/apps/"~jsPath~"/entity.js",
      "/js/apps/"~jsPath~"/edit.js");

    this.scripts.addContents(editorSummary~editorText);
  }
  unittest {
    version(test_uim_mdl) {
      /// TODO
    }}

  override void jsCode(STRINGAA reqParameters) {
    super.jsCode(reqParameters);

    // TODO  setThemes('`~sessionId~`', '');

    if (viewMode == ViewModes.JS) 
      addToPageScript(reqParameters,     
      `window.addEventListener('load', (event) => {
        document.getElementById("entityForm").addEventListener("submit", event => {
          event.preventDefault();
          editorSummary.save();
          editorText.save();
          editEntity();
        })
      });`);
      else 
        addToPageScript(reqParameters,     
      `window.addEventListener('load', (event) => {
        document.getElementById("entityForm").addEventListener("submit", event => {
          editorSummary.save();
          editorText.save();
        })
      });`); 
 
  }
  unittest {
    version(test_uim_mdl) {
      /// TODO
    }}
}
*/