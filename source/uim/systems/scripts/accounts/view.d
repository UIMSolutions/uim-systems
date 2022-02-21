module uim.systems.scripts.systems.accounts.view;

@safe:
import uim.systems;
import uim.systems.scripts.systems.accounts;

public:
auto viewEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsElementById(["entityForm", "entity_theme"])~
    jsViewEntity();
}

unittest {
  version(uim_systems) {
    auto f = File("../../PUBLIC/js/apps"~myUrl~"/view.js", "w"); // open for writing
    f.write(viewEntity);
    }}
