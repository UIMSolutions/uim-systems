module uim.systems.scripts.systems.groups.edit;

@safe:
import uim.systems;
import uim.systems.scripts.systems.groups;

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
