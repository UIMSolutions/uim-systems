module uim.systems.scripts.systems.organizations.edit;

@safe:
import uim.systems;
import uim.systems.scripts.systems.organizations;

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
