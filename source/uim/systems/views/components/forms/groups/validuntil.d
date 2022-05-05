module uim.systems.views.components.forms.groups.validuntil;

@safe:
import uim.systems;

class DCTLValidUntilFormInput : DDateFormInput {
  mixin(ViewComponentThis!("CTLValidUntilFormInput", true));

  override void initialize() {
    super.initialize;

    this
      .id("entity_validUntil")
      .name("entity_validUntil")
      .label("Gültig bis")
      .fieldName("validUntil");
  }
}
mixin(ViewComponentCalls!("CTLValidUntilFormInput", true));
