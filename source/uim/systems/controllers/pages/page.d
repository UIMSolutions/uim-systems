module uim.systems.controllers.pages.page;

@safe:
import uim.systems;

class DCTLAppPage : DAPPPageController {
  this() { super(); 
    this
    .collectionName(systems_TENANT)
    .checks([
      APPCheckAppSessionHasSession, APPCheckAppSessionHasSite, // AppSession related checks
      APPCheckDatabaseHasSessions // Database related checks
    ]); 
  }

  override void beforeResponse(STRINGAA options = null) {
    super.beforeResponse(options);
    if ("redirect" in options) return;

    if (!_request.session) { 
      debug writeln("No session available");
      _response.redirect("/login"); return; } 
    
    auto sessionId = readSessionId(_request, options);
    if (sessionId.length == 0) {
      _response.redirect("/login"); return;
    }
    options["sessionId"] = sessionId;

    auto dbSession = database[systems_TENANT, "sessions"].findOne(["id":sessionId]);
    if (!dbSession) {
      debug writeln("session not found");
      _response.redirect("/login"); return;
    }
    dbSession.lastAccessedOn = toTimestamp(now());
    dbSession["lastAccessedDate"] = now.toISOString;
    dbSession.save;

    string siteId = dbSession["siteId"] ? dbSession["siteId"] : options.get("siteId", "");
    if (!siteId.isUUID) {
      debug writeln("No siteId available");
      _response.redirect("/index");
      return;
    }
    options["siteId"] = siteId;

    auto dbSite = database[systems_TENANT, "sites"].findOne(["id":siteId]);
    if (!dbSite) {
      debug writeln("siteId not found");
      _response.redirect("/index");
      return;
    }
    dbSession["siteId"] = siteId;
    dbSession.save;
  }

/*     reqParameters["script"] = reqParameters.get("script", "")~
      setSessionStorage(["sessionId", "siteId"]); */
}