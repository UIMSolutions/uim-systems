module uim.systems.scripts.systems.passwordrules;

@safe:
import uim.systems;

auto myApi = "/api/v1/systems/passwordrules";
auto myUrl = "/systems/passwordrules";

public:
auto entity() {  
  return "class CTLPasswordRules  extends APPEntity {
  constructor(data) {
    super(data);
  }
}";
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/passwordrules.js", "w"); // open for writing
  f.write(entity);
}
