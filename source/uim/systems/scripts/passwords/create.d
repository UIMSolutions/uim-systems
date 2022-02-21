module uim.systems.scripts.systems.passwords.create;

@safe:
import uim.systems;
import uim.systems.scripts.systems.passwords;



auto createEntity() {  
  return 
    jsLet(["myApi": "'"~myApi~"'", "myUrl": "'"~myUrl~"'"])~
    jsCreateEntity();
}

unittest {
  auto f = File("../../PUBLIC/js/apps"~myUrl~"/create.js", "w"); // open for writing
  f.write(createEntity);
}
