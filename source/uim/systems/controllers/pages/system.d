module uim.systems.controllers.pages.system;

@safe:
import uim.systems;

class DSystemModellerPageController : DSystemEntityPageController {
  mixin(APPPageControllerThis!("SystemModellerPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DSystemModellerPageController~":DSystemModellerPageController::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }
    
  }

  override void afterResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DSystemModellerPageController~":DSystemModellerPageController::afterResponse");
    super.afterResponse(options);
  }
}
mixin(APPPageControllerCalls!("SystemModellerPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemModellerPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemModellerPageController); 
}}