module uim.systems.scripts.systems.apps;

@safe:
import uim.systems;

auto myApi = "/api/v1/systems/apps";
auto myUrl = "/systems/apps";

public:
auto entity() {  
  return "class CTLApp  extends APPEntity {
  constructor(data) {
    super(data);
  }
}";
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/app.js", "w"); // open for writing
  f.write(entity);
}
