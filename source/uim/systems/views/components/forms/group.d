module uim.systems.views.components.forms.group;

@safe:
import uim.systems;

class DCTLGroupForm : DAPPEntityForm {
  mixin(APPFormThis!("CTLGroupForm", true));

  override void initialize() {
    this
    .body_(CTLGroupFormBody);
  }
}
mixin(APPFormCalls!("CTLGroupForm", true));

version(uim_systems) {
  unittest {
    // TODO
}}