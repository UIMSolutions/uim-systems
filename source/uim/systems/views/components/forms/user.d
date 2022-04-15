module uim.systems.views.components.forms.user;

@safe:
import uim.systems;

class DCTLUserForm : DForm {
  mixin(ViewComponentThis!("CTLUserForm", true));

  override void initialize() { 
    super.initialize; 
    
    this
    .content(SystemUserFormContent);
  }
}
mixin(ViewComponentCalls!("CTLUserForm", true));

version(uim_systems) {
  unittest {
    // TODO
}}