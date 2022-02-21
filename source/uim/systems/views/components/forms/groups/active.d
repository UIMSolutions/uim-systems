module uim.systems.views.components.forms.groups.active;

@safe:
import uim.systems;

class DCTLActiveFormGroup : DAPPSwitchFormGroup {
  mixin(APPFormComponentThis!("CTLActiveFormGroup", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_active")
    .name("entity_active")
    .label("Aktiv")
    .fieldName("active")
    .fieldValue("false");
  }
}
mixin(APPFormComponentCalls!("CTLActiveFormGroup", true));
