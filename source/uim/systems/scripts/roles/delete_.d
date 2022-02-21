module uim.systems.scripts.systems.roles.delete_;

@safe:
import uim.systems;
import uim.systems.scripts.systems.roles;

auto deleteEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsDeleteEntity();
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/delete.js", "w"); // open for writing
  f.write(deleteEntity);
}
