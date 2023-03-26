module uim.systems.views.components.forms.headers.passwordrule;

@safe:
import uim.systems;

class DSystemPasswordRuleFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemPasswordRuleFormHeader", true));
}
mixin(ViewComponentCalls!("SystemPasswordRuleFormHeader", true));

unittest {
  assert(SystemPasswordRuleFormHeader);
}