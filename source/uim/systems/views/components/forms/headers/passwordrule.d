module uim.systems.views.components.forms.headers.passwordrule;

@safe:
import uim.systems;

class DSystemPasswordRuleFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemPasswordRuleFormHeader"));
}
mixin(ViewComponentCalls!("SystemPasswordRuleFormHeader"));

unittest {
  assert(SystemPasswordRuleFormHeader);
}