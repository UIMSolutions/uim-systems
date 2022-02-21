module uim.systems.scripts.systems.passwords;

@safe:
import uim.systems;

auto myApi = "/api/v1/systems/passwords";
auto myUrl = "/systems/passwords";

public:
auto entity() {  
  return "class CTLPassword extends APPEntity {
  constructor(data) {
    super(data);
  }
}";
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/password.js", "w"); // open for writing
  f.write(entity);
}
