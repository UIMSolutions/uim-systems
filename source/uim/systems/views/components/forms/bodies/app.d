module uim.systems.views.components.forms.bodies.app;

@safe:
import uim.systems;

class DCTLAppFormContent : DFormContent {
  mixin(ViewComponentThis!("CTLAppFormContent", true));

  override void initialize() {
    super.initialize;

    this
    .crudMode(CRUDModes.Create)
    .fields([/* "active",  */"name", "display", /* "valid", "otp", "password",  */"description"])
    .formGroupHandler(SYSFormGroupHandler);   
  }
} 
mixin(ViewComponentCalls!("CTLAppFormContent", true));

unittest {
  assert(CTLAppFormContent);
}
