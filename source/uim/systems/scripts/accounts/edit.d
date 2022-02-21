module uim.systems.scripts.systems.accounts.edit;

@safe:
import uim.systems;
import uim.systems.scripts.systems.accounts;

public:
auto editEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~      
    jsEditEntity();
}

unittest {
  version(uim_systems) {
    auto f = File("../../PUBLIC/js/apps"~myUrl~"/edit.js", "w"); // open for writing
    f.write(editEntity);
    }}
