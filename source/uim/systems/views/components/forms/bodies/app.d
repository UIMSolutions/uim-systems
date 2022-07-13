module uim.systems.views.components.forms.bodies.app;

@safe:
import uim.systems;

class DSystemAppFormContent : DEntityFormContent {
  mixin(FormComponentThis!("SystemAppFormContent", true));

  override void initialize() {
    super.initialize;

    this
    .crudMode(CRUDModes.Create)
    .fields([/* "active",  */"name", "display", /* "valid", "otp", "password",  */"description"])
    .inputHandler(SYSFormInputHandler);   
  }
} 
mixin(FormComponentCalls!("SystemAppFormContent", true));

unittest {
  assert(SystemAppFormContent);
}
