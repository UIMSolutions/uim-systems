module uim.systems.scripts.systems.groups;

@safe:
import uim.systems;

auto myApi = "/api/v1/systems/groups";
auto myUrl = "/systems/groups";

public:
auto entity() {  
  return "class CTLGroup  extends APPEntity {
  constructor(data) {
    super(data);
  }
}";
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/group.js", "w"); // open for writing
  f.write(entity);
}
