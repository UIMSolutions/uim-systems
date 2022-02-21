module uim.systems.scripts.systems.apps.edit;

@safe:
import uim.systems;
import uim.systems.scripts.systems.apps;

public:
auto editEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~      
    jsEditEntity();

}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/edit.js", "w"); // open for writing
  f.write(editEntity);
}
