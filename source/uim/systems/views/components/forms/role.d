module uim.systems.views.components.forms.role;

@safe:
import uim.systems;

class DCTLRoleForm : DForm {
  mixin(ViewComponentThis!("CTLRoleForm", true));

  override void initialize() {
    super.initialize;

    this
    .content(CTLRoleFormContent);
  }
}
mixin(ViewComponentCalls!("CTLRoleForm", true));

version(uim_systems) {
  unittest {
    // TODO
}}