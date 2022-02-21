module uim.systems.data;

@safe:
import uim.systems;

class DCTLAppData : DSRVApi {
  this() {
    super();
    // this.sessionRequired(true).siteRequired(false);
  }

  override Json toJson(STRINGAA reqParameters) {
    auto result = super.toJson(reqParameters);
    if (result["error"].get!int > 0) return result;
    
    return result;
    }
  }