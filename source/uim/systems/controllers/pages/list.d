module uim.systems.controllers.pages.list;

@safe:
import uim.systems;

class DSystemListPageController : DAPPListPage {
  mixin(PageControllerThis!("SystemListPageController"));
  
  this(string jsPath, string myPath, string myEntities, string myEntity, string myCollectionName) { 
    super(); 

    /* this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!System > "~myEntities)
    .checks([CheckAppSessionExists, CheckAppSessionHasSession, CheckAppSessionHasSite, CheckDatabaseExists])
    .pageHeader(
      PageHeader
      .rootPath(pgPath).preTitle(myEntities).title("Übersicht "~myEntities).actions(["refresh", "create"])
      .breadcrumbs(
        BS5BreadcrumbList(["breadcrumb-arrows"])
        .link(["href":"/"], "UIM!System")
        .item(["active"], ["aria-current":"page"], H5A(["href":"#"], myEntities)))
    )
    .collectionName(myCollectionName)
    .form(APPEntitiesListForm.rootPath(pgPath)); */

    this.scripts.addLinks(
      "/js/apps/"~jsPath~"/entity.js",
      "/js/apps/"~jsPath~"/list.js");

  }
  unittest {
    version(test_uim_mdl) {
      /// TODO
    }}

  override void jsCode(STRINGAA reqParameters) {
    super.jsCode(reqParameters);
    if (viewMode == ViewModes.JS) 
      addToPageScript(reqParameters, 
      `window.addEventListener("load", event => `~
        jsBlock("listEntities('"~"(session ? session.id.toString : \"\")"~"');")
      ~`)`);
  }
  unittest {
    version(test_uim_mdl) {
      /// TODO
    }}

  override void beforeResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DSystemListPageController~":DSystemListPageController::beforeResponse");
    super.beforeResponse(options);   
    if ("redirect" in options) return; 

    auto appSession = getAppSession(options);

    auto session  = appSession.session;
    auto site     = appSession.site;
      
    // debug writeln(moduleName!DAPPCreatePageController~":DAPPCreatePageController::beforeResponse - Looking for entities in ", site.name, ":", collectionName);
    auto entities = database[appSession.site, collectionName].findMany;

    auto poolId = uniform(1, 1_000_000_000);
    entitiesPool[poolId] = entities;
    options["poolId"] = to!string(poolId);
  }
  unittest {
    version(test_uim_mdl) {
      /// TODO
    }}
}
mixin(PageControllerCalls!("SystemListPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemListPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemListPageController); 
}}