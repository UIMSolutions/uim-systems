module uim.systems.scripts.passwordrules.create;

@safe:
import uim.systems;
import uim.systems.scripts.systems.passwordrules;



auto createEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsCreateEntity();
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/create.js", "w"); // open for writing
  f.write(createEntity);
}
