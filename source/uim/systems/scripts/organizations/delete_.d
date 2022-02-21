module uim.systems.scripts.systems.organizations.delete_;

@safe:
import uim.systems;
import uim.systems.scripts.systems.organizations;

auto deleteEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsDeleteEntity();
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/delete.js", "w"); // open for writing
  f.write(deleteEntity);
}
