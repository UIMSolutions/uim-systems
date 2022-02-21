module uim.systems.views.components.forms.user;

@safe:
import uim.systems;

class DCTLUserForm : DAPPEntityForm {
  mixin(APPFormThis!("CTLUserForm", true));

  override void initialize() { 
    super.initialize; 
    
    this
    .body_(CTLUserFormBody);
  }
}
mixin(APPFormCalls!("CTLUserForm", true));

version(uim_systems) {
  unittest {
    // TODO
}}