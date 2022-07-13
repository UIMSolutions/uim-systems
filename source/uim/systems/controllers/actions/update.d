module uim.systems.controllers.actions.update;

@safe:
import uim.systems;

class DSystemUpdateAction : DAPPActionController {
  mixin(APPControllerThis!("SystemUpdateAction"));

  override void initialize() {
    super.initialize;

    this
    .checks([
      APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, // AppSession related checks
      APPCheckDatabaseHasSystems]); // Database related checks
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DSystemUpdateAction~":DSystemUpdateAction("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }     
  
    if (auto entityId = options.get("entity_id", null)) {
      auto entity = collection.findOne(UUID(entityId));
      
      entity.fromRequest(options);
      foreach(name, value; entity.values.items) { // Workaround :-O
        if (auto booleanValue = cast(DBooleanValue)value) {
          if ("entity_"~name !in options) booleanValue(false);  
        }
      }

      if (auto site = appSession.site) {
        database[site, collectionName].updateOne(entity);
        
        options["redirect"] = rootPath~"/view?id="~entityId;
      }
    }
    else {
      this.error("Entity Id not found");
    }
	}
}
mixin(APPControllerCalls!("SystemUpdateAction"));

version(test_uim_System) {
  unittest {
    // TODO
  }
}