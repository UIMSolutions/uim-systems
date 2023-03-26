module uim.systems.controllers.actions.delete_;

@safe:
import uim.systems;

class DSystemDeleteAction : DActionController {
  mixin(ControllerThis!("SystemDeleteAction"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .checks([
      APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, // AppSession related checks
      APPCheckDatabaseHasSystems]); // Database related checks
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DSystemDeleteAction~":DSystemDeleteAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    if (auto entity = collection.createFromTemplate) {             
      database[appSession.site, collectionName]
        .removeOne(
          entity
            .fromRequest(options));

      options["redirect"] = rootPath;
    }
  }
}
mixin(ControllerCalls!("SystemDeleteAction"));

version(test_uim_System) {
  unittest {
    // TODO
  }
}