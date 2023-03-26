module uim.systems.controllers.pages.entities;

@safe:
import uim.systems;

class DSystemEntitiesPageController : DAPPEntitiesPageController {
  mixin(PageControllerThis!("SystemEntitiesPageController"));

  mixin(OProperty!("string", "rootPath"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .addChecks([
      APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, // Check appSesssion
      APPCheckDatabaseHasSessions, APPCheckDatabaseHasSites // Check database
    ]);
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DSystemEntitiesPageController~":DSystemEntitiesPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }
    
    auto appSession = getAppSession(options);
    if (appSession) {
      if (!appSession.site) { 
        this.error("AppSession missing"); 
        return; }
    }
    else { debug writeln("AppSession missing"); return; }

    auto db = this.database;
    if (db) { debug writeln("Database found"); }
    else { 
      this.error("Database missing"); 
      return; }

    if (auto entitiesView = cast(DAPPEntitiesListView)this.view) {
      debug writeln("entitiesView found");

      auto dbEntities = db[appSession.site.name, this.collectionName].findMany();
      debug writeln("Found entities: ", dbEntities.length);

      if ("entityName" in options) {
        auto entityName = options["entityName"].toLower;
        dbEntities = dbEntities.filter!(entity => entity.name.indexOf(entityName) == 0).array;
      } 

      entitiesView
        .entities(dbEntities);
    }
    else { 
      this.error("entitiesView missing"); 
      return; }
  }
}
mixin(APPPageControllerCalls!("SystemEntitiesPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemEntitiesPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemEntitiesPageController); 
}}