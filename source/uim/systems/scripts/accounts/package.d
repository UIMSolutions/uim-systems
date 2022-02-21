module uim.systems.scripts.systems.accounts;

@safe:
import uim.systems;

auto myApi = "/api/v1/systems/accounts";
auto myUrl = "/systems/accounts";

public:
auto entity() {  
  return "class CTLAccount extends APPEntity {
  constructor(data) {
    super(data);
  }
}";
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/account.js", "w"); // open for writing
  f.write(entity);
}
