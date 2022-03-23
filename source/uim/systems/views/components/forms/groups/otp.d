module uim.systems.views.components.forms.groups.otp;

@safe:
import uim.systems;

class DCTLOtpFormGroup : DAPPSwitchFormGroup {
  mixin(ViewComponentThis!("CTLOtpFormGroup", true));

  override void initialize() {
    super.initialize;

    this
    .id("entity_otp")
    .name("entity_otp")
    .label("Einmaliges Passwort")
    .fieldName("otp")
    .fieldValue("false");
  }
}
mixin(ViewComponentCalls!("CTLOtpFormGroup", true));
