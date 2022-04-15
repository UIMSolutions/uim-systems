module uim.systems.views.components.forms.group;

@safe:
import uim.systems;

class DCTLGroupForm : DForm {
  mixin(ViewComponentThis!("CTLGroupForm", true));

  override void initialize() {
    this
    .content(SystemGroupFormContent);
  }
}
mixin(ViewComponentCalls!("CTLGroupForm", true));

version(uim_systems) {
  unittest {
    // TODO
}}