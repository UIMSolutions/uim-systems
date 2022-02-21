module uim.systems.views.components.forms.role;

@safe:
import uim.systems;

class DCTLRoleForm : DAPPEntityForm {
  mixin(APPFormThis!("CTLRoleForm", true));

  override void initialize() {
    super.initialize;

    this
    .body_(CTLRoleFormBody);
  }
}
mixin(APPFormCalls!("CTLRoleForm", true));

version(uim_systems) {
  unittest {
    // TODO
}}