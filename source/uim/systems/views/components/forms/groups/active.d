module uim.systems.views.components.forms.groups.active;

@safe:
import uim.systems;

class DCTLActiveFormInput : DSwitchFormInput {
  mixin(ViewComponentThis!("CTLActiveFormInput", true));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize;

    this
    .id("entity_active")
    .name("entity_active")
    .label("Aktiv")
    .fieldName("active")
    .fieldValue("false");
  }
}
mixin(ViewComponentCalls!("CTLActiveFormInput", true));
