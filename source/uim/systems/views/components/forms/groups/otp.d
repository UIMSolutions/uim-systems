module uim.systems.views.components.forms.groups.otp;

@safe:
import uim.systems;

class DCTLOtpFormInput : DSwitchFormInput {
  mixin(ViewComponentThis!("CTLOtpFormInput", true));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize;

    this
    .id("entity_otp")
    .name("entity_otp")
    .label("Einmaliges Passwort")
    .fieldName("otp")
    .fieldValue("false");
  }
}
mixin(ViewComponentCalls!("CTLOtpFormInput", true));
