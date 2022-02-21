module uim.systems.views.components.forms.bodies.app;

@safe:
import uim.systems;

class DCTLAppFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("CTLAppFormBody", true));

  override void initialize() {
    super.initialize;

    this
    .crudMode(CRUDModes.Create)
    .fields([/* "active",  */"name", "display", /* "valid", "otp", "password",  */"description"])
    .formGroupHandler(SYSFormGroupHandler);   
  }
} 
mixin(APPFormComponentCalls!("CTLAppFormBody", true));

unittest {
  assert(CTLAppFormBody);
}
