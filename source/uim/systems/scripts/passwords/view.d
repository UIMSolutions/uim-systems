module uim.systems.scripts.systems.passwords.view;

@safe:
import uim.systems;
import uim.systems.scripts.systems.passwords;

public:
auto viewEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsElementById(["entityForm", "entity_theme"])~
    jsViewEntity();
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/view.js", "w"); // open for writing
  f.write(viewEntity);
}
