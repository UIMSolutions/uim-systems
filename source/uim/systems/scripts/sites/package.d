module uim.systems.scripts.systems.sites;

@safe:
import uim.systems;

auto myApi = "/api/v1/systems/sites";
auto myUrl = "/systems/sites";

public:
auto entity() {  
  return "class CTLSite extends APPEntity {
  constructor(data) {
    super(data);
  }
}";
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/site.js", "w"); // open for writing
  f.write(entity);
}
