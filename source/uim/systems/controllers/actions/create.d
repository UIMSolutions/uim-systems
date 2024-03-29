module uim.systems.controllers.actions.create;

@safe:
import uim.systems;

class DSystemCreateAction : DActionController {
  mixin(ControllerThis!("SystemCreateAction"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .checks([
      AppSessionHasSessionCheck, AppSessionHasSiteCheck, // AppSession related checks
      DatabaseHasSystemsCheck]); // Database related checks
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DSystemCreateAction~":DSystemCreateAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }    

    if (this.collection) {
      if (auto entity = collection.createFromTemplate) { 
        entity.fromRequest(options);            
        collection
          .insertOne(entity);

        options["redirect"] = this.rootPath ~ "/view?id="~entity.id.toString; 
      }
    }
	}
}
mixin(ControllerCalls!("SystemCreateAction"));
