module uim.systems.scripts.systems.accounts.create;

@safe:
import uim.systems;
import uim.systems.scripts.systems.accounts;

auto createEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsCreateEntity();
}

unittest {
  version(uim_systems) {
    auto f = File("../../PUBLIC/js/apps"~myUrl~"/create.js", "w"); // open for writing
    f.write(createEntity);
    }}
