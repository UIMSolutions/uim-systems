module uim.systems.views.components.forms.bodies.account;

@safe:
import uim.systems;

class DSystemAccountFormContent : DEntityFormContent {
  mixin(FormComponentThis!("SystemAccountFormContent", true));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize;

    this
      .crudMode(CRUDModes.Create)
      .fields(["active", "name", "display", "valid", "otp", "password", "description"])
      .inputHandler(SYSFormInputHandler);   
  }

/*   override DH5Obj[] formGroup(string field, bool readonly, STRINGAA options = null) {
    debug writeln("DSystemAccountFormContent:formGroup(field, readonly, options)");
    if (auto result = super.formGroup(field, readonly, options)) return result;

    if (entity) switch(field) {
      case "active": return SystemActiveFormGroup(this.form, this.entity).toH5(options);
      case "valid": return SystemValidDatesFormGroup(this.form, this.entity).toH5(options);
      case "validFrom": return SystemValidFromFormGroup(this.form, this.entity).toH5(options);
      case "validUntil": return SystemValidUntilFormGroup(this.form, this.entity).toH5(options);
      case "otp": return SystemOtpFormGroup(this.form, this.entity).toH5(options);
      case "password": return SystemPasswordFormGroup(this.form, this.entity).toH5(options);
      default: return super.formGroup(field, readonly, options); 
    }
    return null;
  } */
}
mixin(FormComponentCalls!("SystemAccountFormContent", true));

unittest {
  assert(SystemAccountFormContent);
}
