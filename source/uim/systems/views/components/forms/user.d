module uim.systems.views.components.forms.user;

@safe:
import uim.systems;

class DCTLUserForm : DForm {
  mixin(ViewComponentThis!("CTLUserForm"));

  override void initialize(Json configSettings = Json(null)) { 
    super.initialize(configSettings); 
    
    this
    .content(SystemUserFormContent);
  }
}
mixin(ViewComponentCalls!("CTLUserForm"));

version(uim_systems) { unittest {
  // TODO
}}