module uim.systems.views.components.forms.bodies.right;

@safe:
import uim.systems;

class DCTLRightFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("CTLRightFormBody", true));

  override void initialize() {
    super.initialize;

    this
    .crudMode(CRUDModes.Create)
    .fields([/* "active",  */"name", "display", /* "valid", "otp", "password",  */"description"])
    .formGroupHandler(SYSFormGroupHandler);   
  }
  
/*   override DH5Obj[] formGroup(string field, bool readonly, STRINGAA options = null) {
    
    if (entity) switch(field) {
      /* case "active": return CTLActiveFormGroup(this.form).entity(this.entity).toH5(options);      
      case "valid": return CTLValidDatesFormGroup(this.form).entity(this.entity).toH5(options);
      case "validFrom": return CTLValidFromFormGroup(this.form).entity(this.entity).toH5(options);
      case "validUntil": return CTLValidUntilFormGroup(this.form).entity(this.entity).toH5(options);
      case "otp": return CTLOtpFormGroup(this.form).entity(this.entity).toH5(options);

      case "password": return CTLPasswordFormGroup(this.form).entity(this.entity).toH5(options);
         * /
      default: return super.formGroup(field, readonly, options); 
    }
    return null;
  } */
}
mixin(APPFormComponentCalls!("CTLRightFormBody", true));

unittest {
  assert(CTLRightFormBody);
}
