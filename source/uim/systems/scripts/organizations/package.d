module uim.systems.scripts.systems.organizations;

@safe:
import uim.systems;

auto myApi = "/api/v1/systems/organizations";
auto myUrl = "/systems/organizations";

public:
auto entity() {  
  return "class CTLOrganization extends APPEntity {
  constructor(data) {
    super(data);
  }
}";
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/organization.js", "w"); // open for writing
  f.write(entity);
}
