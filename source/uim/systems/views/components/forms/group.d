module uim.systems.views.components.forms.group;

@safe:
import uim.systems;

class DCTLGroupForm : DForm {
  mixin(ViewComponentThis!("CTLGroupForm", true));

  override void initialize() {
    this
    .content(CTLGroupFormContent);
  }
}
mixin(ViewComponentCalls!("CTLGroupForm", true));

version(uim_systems) {
  unittest {
    // TODO
}}