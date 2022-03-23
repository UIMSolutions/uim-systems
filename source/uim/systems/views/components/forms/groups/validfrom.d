module uim.systems.views.components.forms.groups.validfrom;

@safe:
import uim.systems;

class DCTLValidFromFormGroup : DAPPDateFormGroup {
  mixin(ViewComponentThis!("CTLValidFromFormGroup", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_validFrom")
    .name("entity_validFrom")
    .label("Gültig ab")
    .fieldName("validFrom");
  }
}
mixin(ViewComponentCalls!("CTLValidFromFormGroup", true));
