module uim.systems.scripts.systems.rights;

@safe:
import uim.systems;

auto myApi = "/api/v1/systems/rights";
auto myUrl = "/systems/rights";

public:
auto entity() {  
  return "class CTLRight extends APPEntity {
  constructor(data) {
    super(data);
  }
}";
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/right.js", "w"); // open for writing
  f.write(entity);
}
