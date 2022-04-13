module uim.systems.controllers.actions.delete_;

@safe:
import uim.systems;

class DSystemDeleteAction : DAPPActionController {
  mixin(APPControllerThis!("SystemDeleteAction"));

  override void initialize() {
    super.initialize;

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
mixin(APPControllerCalls!("SystemDeleteAction"));

version(test_uim_System) {
  unittest {
    // TODO
  }
}