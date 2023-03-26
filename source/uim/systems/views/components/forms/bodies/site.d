module uim.systems.views.components.forms.bodies.site;

@safe:
import uim.systems;

class DSystemSiteFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("SystemSiteFormContent"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .crudMode(CRUDModes.Create)
    .fields([/* "active",  */"name", "display", /* "valid", "otp", "password",  */"description"])
    .inputHandler(SYSFormInputHandler);    
  }
  
/*   override DH5Obj[] formGroup(string field, bool readonly, STRINGAA options = null) {
    debug writeln("DSystemSiteFormContent:formGroup(field, readonly, options)");

    if (entity) switch(field) {
      /* case "active": return SystemActiveFormGroup(this.form).entity(this.entity).toH5(options);      case "valid":
      case "valid": return SystemValidDatesFormGroup(this.form).entity(this.entity).toH5(options);
      case "validFrom": return SystemValidFromFormGroup(this.form).entity(this.entity).toH5(options);
      case "validUntil": return SystemValidUntilFormGroup(this.form).entity(this.entity).toH5(options);
      case "otp": return SystemOtpFormGroup(this.form).entity(this.entity).toH5(options);

      case "password": return SystemPasswordFormGroup(this.form).entity(this.entity).toH5(options);
          * /
      default: return super.formGroup(field, readonly, options); 
    }
    return null;
  } */
}
mixin(ViewComponentCalls!("SystemSiteFormContent"));

unittest {
  assert(SystemSiteFormContent);
}
