module uim.systems.controllers.actions.create;

@safe:
import uim.systems;

class DSystemCreateAction : DAPPActionController {
  mixin(APPControllerThis!("SystemCreateAction"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .checks([
      APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, // AppSession related checks
      APPCheckDatabaseHasSystems]); // Database related checks
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DSystemCreateAction~":DSystemCreateAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    if (this.collection) {
      if (auto entity = collection.createFromTemplate) {             
        collection
          .insertOne(
              entity
                .fromRequest(options));

        options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
      }
    }
	}
}
mixin(APPControllerCalls!("SystemCreateAction"));
