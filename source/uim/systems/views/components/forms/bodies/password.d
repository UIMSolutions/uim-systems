module uim.systems.views.components.forms.bodies.password;

@safe:
import uim.systems;

class DSystemPasswordFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("SystemPasswordFormContent"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .crudMode(CRUDModes.Create)
    .fields([/* "active",  */"name", "display", /* "valid", "otp", "password",  */"description"])
    .inputHandler(SYSFormInputHandler);   
  }
  
/*   override DH5Obj[] formGroup(string field, bool readonly, STRINGAA options = null) {
    if (entity) switch(field) {
      case "active": return SystemActiveFormGroup(this.form).entity(this.entity).toH5(options);  
      case "valid": return SystemValidDatesFormGroup(this.form).entity(this.entity).toH5(options);
      case "validFrom": return SystemValidFromFormGroup(this.form).entity(this.entity).toH5(options);
      case "validUntil": return SystemValidUntilFormGroup(this.form).entity(this.entity).toH5(options);
      case "otp": return SystemOtpFormGroup(this.form).entity(this.entity).toH5(options);
      case "password": return SystemPasswordFormGroup(this.form).entity(this.entity).toH5(options);
      default: return super.formGroup(field, readonly, options); 
    }
    return null;
  } */
}
mixin(ViewComponentCalls!("SystemPasswordFormContent"));

unittest {
  assert(SystemPasswordFormContent);
}
