module uim.systems.controllers.pages.index;

@safe:
import uim.systems;

class DSystemIndexPageController : DSystemEntityPageController {
  mixin(PageControllerThis!("SystemIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .checks([AppSessionHasSessionCheck]);
  }

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DSystemIndexPageController~":DSystemIndexPageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    // AppSessionHasSiteCheckId(this).check(_request, _response, reqParameters);

    if (auto appSession = getAppSession(options)) {      
      debug writeln(appSession.debugInfo);
      auto session = appSession.session; 
      auto site    = appSession.site;

      debug writeln(this.name~"-site");
      if (site) { // selected site
        debug writeln("Has Site", site.id, "/", site.name);
        session["siteId"] = site.id.toString;
        this.view(
          /* SystemIndexWithSiteView(this)
          .site(site)
          .layout(this.layout) */);
      }
      else {
        debug writeln("No Site");

        auto dbSites = database ? database["systems", "system_sites"].findMany : null;
        debug writeln("Found sites = ", dbSites.length);

        this.view(
          /* SystemIndexNoSiteView(this)
          .sites(dbSites)
          .layout(this.layout) */);
      }
    }
    else {
      debug writeln("No AppSession");
    }
  }

  override void afterResponse(STRINGAA options = null) {
    // debugMethodCall(moduleName!DSystemIndexPageController~":DSystemIndexPageController::afterResponse");
    if (this.session) this.session.save;
  }

}
mixin(PageControllerCalls!("SystemIndexPageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemIndexPageController); 
}}