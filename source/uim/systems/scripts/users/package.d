module uim.systems.scripts.systems.users;

@safe:
import uim.systems;

auto myApi = "/api/v1/systems/users";
auto myUrl = "/systems/users";

public:
auto entity() {  
  return "class CTLUser extends APPEntity {
  constructor(data) {
    super(data);
  }
}";
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/user.js", "w"); // open for writing
  f.write(entity);
}
