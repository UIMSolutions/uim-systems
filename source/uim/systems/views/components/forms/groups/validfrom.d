module uim.systems.views.components.forms.groups.validfrom;

@safe:
import uim.systems;

class DCTLValidFromFormInput : DDateFormInput {
  mixin(ViewComponentThis!("CTLValidFromFormInput", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_validFrom")
    .name("entity_validFrom")
    .label("Gültig ab")
    .fieldName("validFrom");
  }
}
mixin(ViewComponentCalls!("CTLValidFromFormInput", true));
