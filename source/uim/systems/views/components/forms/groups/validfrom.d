module uim.systems.views.components.forms.groups.validfrom;

@safe:
import uim.systems;

class DCTLValidFromFormInput : DDateFormInput {
  mixin(ViewComponentThis!("CTLValidFromFormInput", true));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .id("entity_validFrom")
    .name("entity_validFrom")
    .label("Gültig ab")
    .fieldName("validFrom");
  }
}
mixin(ViewComponentCalls!("CTLValidFromFormInput", true));
