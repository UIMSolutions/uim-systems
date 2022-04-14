module uim.systems.views.components.forms.bodies.organization;

@safe:
import uim.systems;

class DSystemOrganizationFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("SystemOrganizationFormContent", true));

  override void initialize() {
    super.initialize;

    this
    .crudMode(CRUDModes.Create)
    .fields([/* "active",  */"name", "display", /* "valid", "otp", "password",  */"description"])
    .formGroupHandler(SYSFormGroupHandler);   
  }
  
/*   override DH5Obj[] formGroup(string field, bool readonly, STRINGAA options = null) {
    switch(field) {
      case "active": return SystemActiveFormGroup(this.form).entity(this.entity).toH5(options);      
      case "valid": return SystemValidDatesFormGroup(this.form).entity(this.entity).toH5(options);
      case "validFrom": return SystemValidFromFormGroup(this.form).entity(this.entity).toH5(options);
      case "validUntil": return SystemValidUntilFormGroup(this.form).entity(this.entity).toH5(options);
      case "otp": return SystemOtpFormGroup(this.form).entity(this.entity).toH5(options);
      default: return super.formGroup(field, readonly, options); 
    }
  } */
}
mixin(ViewComponentCalls!("SystemOrganizationFormContent", true));

unittest {
  assert(SystemOrganizationFormContent);
}
