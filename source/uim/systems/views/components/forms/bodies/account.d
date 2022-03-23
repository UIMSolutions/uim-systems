module uim.systems.views.components.forms.bodies.account;

@safe:
import uim.systems;

class DCTLAccountFormContent : DEntityFormContent {
  mixin(ViewComponentThis!("CTLAccountFormContent", true));

  override void initialize() {
    super.initialize;

    this
      .crudMode(CRUDModes.Create)
      .fields(["active", "name", "display", "valid", "otp", "password", "description"])
      .formGroupHandler(SYSFormGroupHandler);   
  }

/*   override DH5Obj[] formGroup(string field, bool readonly, STRINGAA options = null) {
    debug writeln("DCTLAccountFormContent:formGroup(field, readonly, options)");
    if (auto result = super.formGroup(field, readonly, options)) return result;

    if (entity) switch(field) {
      case "active": return CTLActiveFormGroup(this.form, this.entity).toH5(options);
      case "valid": return CTLValidDatesFormGroup(this.form, this.entity).toH5(options);
      case "validFrom": return CTLValidFromFormGroup(this.form, this.entity).toH5(options);
      case "validUntil": return CTLValidUntilFormGroup(this.form, this.entity).toH5(options);
      case "otp": return CTLOtpFormGroup(this.form, this.entity).toH5(options);
      case "password": return CTLPasswordFormGroup(this.form, this.entity).toH5(options);
      default: return super.formGroup(field, readonly, options); 
    }
    return null;
  } */
}
mixin(ViewComponentCalls!("CTLAccountFormContent", true));

unittest {
  assert(CTLAccountFormContent);
}
