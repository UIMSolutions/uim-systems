module uim.systems.views.components.forms.groups.password;

@safe:
import uim.systems;

class DCTLPasswordFormInput : DFormInput {
  mixin(ViewComponentThis!("CTLPasswordFormInput"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .label("Passwort");
  }

  override DH5Obj h5Input(STRINGAA options = null) {
    super.h5Input(options);

    auto input = BS5Input("entity_password", ["autocomplete":"off", "type":"password", "name":"entity_password"]);
    if (readonly) input.attribute("readonly","readonly");
    if (this.crudMode != CRUDModes.Create) {
      input.value(entity["password"]);
    } 

    return input;
  }

  override DH5Obj h5FormGroup(STRINGAA options = null) {
    super.h5FormGroup(options); 
 
    return 
      BS5FormGroup(["row", "mb-1"],
          H5Label(["form-label col-2 col-form-label"], label),
          BS5Col(["col"], 
            BS5InputGroup(["input-group-flat"], 
              h5Input(options),
              H5Span(["input-group-text"], 
                H5A(["input-group-link"], tablerIcon("eye"))))));
  }

  override void beforeH5(STRINGAA options = null) { // hook
    super.beforeH5(options);
    if (hasError) { return; }
  }
  unittest {
    version(uim_apps) {
      // 
      }}
}
mixin(ViewComponentCalls!("CTLPasswordFormInput"));
