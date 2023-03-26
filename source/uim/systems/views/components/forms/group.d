module uim.systems.views.components.forms.group;

@safe:
import uim.systems;

class DCTLGroupForm : DForm {
  mixin(ViewComponentThis!("CTLGroupForm"));

  override void initialize(Json configSettings = Json(null)) {
    this
    .content(SystemGroupFormContent);
  }
}
mixin(ViewComponentCalls!("CTLGroupForm"));

version(uim_systems) {
  unittest {
    // TODO
}}