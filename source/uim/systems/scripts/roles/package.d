module uim.systems.scripts.systems.roles;

@safe:
import uim.systems;

auto myApi = "/api/v1/systems/roles";
auto myUrl = "/systems/roles";

public:
auto entity() {  
  return "class CTLRole extends APPEntity {
  constructor(data) {
    super(data);
  }
}";
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/role.js", "w"); // open for writing
  f.write(entity);
}
