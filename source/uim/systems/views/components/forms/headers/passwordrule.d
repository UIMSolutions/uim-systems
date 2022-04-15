module uim.systems.views.components.forms.headers.passwordrule;

@safe:
import uim.systems;

class DSystemPasswordRuleFormHeader : DFormHeader {
  mixin(FormComponentThis!("SystemPasswordRuleFormHeader", true));
}
mixin(FormComponentCalls!("SystemPasswordRuleFormHeader", true));

unittest {
  assert(SystemPasswordRuleFormHeader);
}