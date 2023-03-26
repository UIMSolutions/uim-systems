module uim.systems.controllers.actions.update;

@safe:
import uim.systems;

class DSystemUpdateAction : DActionController {
  mixin(ControllerThis!("SystemUpdateAction"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .checks([
      AppSessionHasSessionCheck, AppSessionHasSiteCheck, // AppSession related checks
      DatabaseHasSystemsCheck]); // Database related checks
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DSystemUpdateAction~":DSystemUpdateAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }     
  
    if (auto entityId = options.get("entity_id", null)) {
      auto entity = collection.findOne(UUID(entityId));
      
      entity.fromRequest(options);
      /* foreach(name, value; entity.values.items) { // Workaround :-O
        if (auto booleanValue = cast(DBooleanValue)value) {
          if ("entity_"~name !in options) booleanValue(false);  
        }
      } */

      /* if (auto site = appSession.site) {
        database[site, collectionName].updateOne(entity);
        
        options["redirect"] = rootPath~"/view?id="~entityId;
      } */
    }
    else {
      this.error("Entity Id not found");
    }
	}
}
mixin(ControllerCalls!("SystemUpdateAction"));

version(test_uim_System) {
  unittest {
    // TODO
  }
}