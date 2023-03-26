module uim.systems.controllers.pages.read;

@safe:
import uim.systems;

class DSystemReadPageController : DSystemEntityPageController {
  mixin(PageControllerThis!("SystemReadPageController"));
  
  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DSystemReadPageController~":DSystemReadPageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    auto appSession = getAppSession(options);
    if (entityId && entityId.isUUID) {  
      if (auto dbEntity = database[appSession.site, collectionName].findOne(UUID(entityId))) {
        
        debug writeln("Found Entity -> ", dbEntity.id);        
        if (auto entityView = cast(DEntityCRUDView)this.view) {

          debug writeln("Setting entityView");
          entityView
            .entity(dbEntity)
            .crudMode(CRUDModes.Read)
            .rootPath(this.rootPath)
            .readonly(true);
        }
      }
    }
  }
}
mixin(PageControllerCalls!("SystemReadPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemReadPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemReadPageController); 
}}


auto mdlReadPageController(string classesName, string rootController, string addInitialize = "", string addBeforeResponse = "") {
  return `
    class D`~classesName~`ReadPageController : D`~rootController~`PageController {
      `~appPageControllerThis(classesName~`ReadPageController`, true)~`

    override void initialize(Json configSettings = Json(null)) {
      super.initialize(configSettings);

      this
        .view(
          `~classesName~`ReadView(this));

      `~addInitialize~`
      }
    }`~
    appPageControllerCalls(classesName~`ReadPageController`, true);
}


template SystemReadPageController(string classesName, string rootController, string addInitialize = "", string addBeforeResponse = "") {
  const char[] SystemReadPageController = mdlReadPageController(classesName, rootController, addInitialize, addBeforeResponse);
}

/*
  this(string jsPath, string myPath, string myEntities, string myEntity, string myCollectionName) { super(); 
    this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!System > "~myEntities~" > Anzeigen")
    .checks([CheckAppSessionExists, AppSessionHasSessionCheck, AppSessionHasSiteCheck])
    // .securityController(APPSecurityController(this))      
    .pageHeader(
      ViewPageHeader
      .rootPath(pgPath).mainTitle(myEntities).subTitle("Anzeigen "~myEntity)
      .breadcrumbs(BS5BreadcrumbList(["breadcrumb-arrows"])
        .link(["href":"/"], "UIM!System")
        .link(["href":pgPath], myEntities)
        .item(["active"], ["aria-current":"page"], H5A(["href":"#"], "Anzeigen")))
    );

    this
      .scripts
        .addLinks(        
          "/js/apps/"~jsPath~"/entity.js",
          "/js/apps/"~jsPath~"/view.js");

    this
      .scripts
        .addContents(editorSummary~editorText);

  }
  
  override void jsCode(STRINGAA reqParameters) {
    super.jsCode(reqParameters);
    if (viewMode == ViewModes.JS) 
      addToPageScript(reqParameters, 
    `
window.addEventListener('load', (event) => {
      setThemes('`~"(session ? session.id.toString : \"\")"~`', '');
      editorSummary.disabled(true);
      editorText.disabled(true);
      document.getElementById("entityForm").addEventListener("submit", event => {
        event.preventDefault();
        viewEntity();
      })
    });`);
else addToPageScript(reqParameters, 
`window.addEventListener('load', (event) => {
  editorSummary.disabled(true);
  editorText.disabled(true);
  setThemes('`~"(session ? session.id.toString : \"\")"~`', '`~"entity.theme.toString"~`');
});`); 

  }

  override void beforeResponse(STRINGAA reqParameters) {
    // debugMethodCall(moduleName!DSystemReadPageController~":DSystemReadPageController:beforeResponse(req, res)");
    super.beforeResponse(reqParameters);       
    if ("redirect" in reqParameters) return; 

    auto appSession = getAppSession(reqParameters);
  
    auto selector = reqParameters.toEntitySelect;
    // debug writeln(moduleName!DSystemReadPageController~":DSystemReadPageController::beforeResponse - Reading entity for selector ", selector);
    auto entity = database[appSession.site, collectionName].findOne(selector);
  }
*/