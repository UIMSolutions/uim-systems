module uim.systems.views.components.forms.passwordrule;

@safe:
import uim.systems;

class DCTLPasswordRuleForm : DAPPEntityForm {
  this() { super();
    this
    .body_(CTLPasswordRuleFormBody);
  }
  this(string rootPath, CRUDModes crudMode = CRUDModes.Read) { 
        this().rootPath(rootPath).crudMode(crudMode);
    this
    .body_(CTLPasswordRuleFormBody);
  }
  this(DAPPView myView) { this().view(myView); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPView myView, DOOPEntity myEntity) { this(myView).entity(myEntity); }
}
auto CTLPasswordRuleForm() { return new DCTLPasswordRuleForm; }
auto CTLPasswordRuleForm(CRUDModes crudMode, string rootPath) { return new DCTLPasswordRuleForm(rootPath, crudMode); }
auto CTLPasswordRuleForm(DAPPView myView) { return new DCTLPasswordRuleForm(myView); }
auto CTLPasswordRuleForm(DOOPEntity myEntity) { return new DCTLPasswordRuleForm(myEntity); }
auto CTLPasswordRuleForm(DAPPView myView, DOOPEntity myEntity) { return new DCTLPasswordRuleForm(myView, myEntity); }