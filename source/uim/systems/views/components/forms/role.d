module uim.systems.views.components.forms.role;

@safe:
import uim.systems;

class DCTLRoleForm : DForm {
  mixin(ViewComponentThis!("CTLRoleForm", true));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .content(SystemRoleFormContent);
  }
}
mixin(ViewComponentCalls!("CTLRoleForm", true));

version(uim_systems) {
  unittest {
    // TODO
}}