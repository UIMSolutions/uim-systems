module uim.systems.views.components.forms.groups.validuntil;

@safe:
import uim.systems;

class DCTLValidUntilFormGroup : DAPPDateFormGroup {
  mixin(ViewComponentThis!("CTLValidUntilFormGroup", true));

  override void initialize() {
    super.initialize;

    this
      .id("entity_validUntil")
      .name("entity_validUntil")
      .label("Gültig bis")
      .fieldName("validUntil");
  }
}
mixin(ViewComponentCalls!("CTLValidUntilFormGroup", true));
