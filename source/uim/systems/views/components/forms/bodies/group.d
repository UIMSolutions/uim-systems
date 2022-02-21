module uim.systems.views.components.forms.bodies.group;

@safe:
import uim.systems;

class DCTLGroupFormBody : DAPPEntityFormBody {
  mixin(APPFormComponentThis!("CTLGroupFormBody", true));

  override void initialize() {
    super.initialize;

    this
    .crudMode(CRUDModes.Create)
    .fields([/* "active",  */"name", "display", /* "valid", "otp", "password",  */"description"])
    .formGroupHandler(SYSFormGroupHandler);   
  }
  
/*   override DH5Obj[] formGroup(string field, bool readonly, STRINGAA options = null) {
    debug writeln("DCTLGroupFormBody:formGroup(field, readonly, options)");
    if (auto result = super.formGroup(field, readonly, options)) return result;

    if (entity) switch(field) {
/*       case "active": return CTLActiveFormGroup(this.form).entity(this.entity).toH5(options);      case "valid":
      case "valid": return CTLValidDatesFormGroup(this.form).entity(this.entity).toH5(options);
      case "validFrom": return CTLValidFromFormGroup(this.form).entity(this.entity).toH5(options);
      case "validUntil": return CTLValidUntilFormGroup(this.form).entity(this.entity).toH5(options);
      case "otp": return CTLOtpFormGroup(this.form).entity(this.entity).toH5(options);

    
 * /      default: return super.formGroup(field, readonly, options); 
    }
    return null;
  } */
}
mixin(APPFormComponentCalls!("CTLGroupFormBody", true));

unittest {
  assert(CTLGroupFormBody);
}
