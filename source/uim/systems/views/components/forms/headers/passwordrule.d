module uim.systems.views.components.forms.headers.passwordrule;

@safe:
import uim.systems;

class DCTLPasswordRuleFormHeader : DFormHeader {
  this() { super(); }
  this(DForm myForm) { this().form(myForm); }
}
auto CTLPasswordRuleFormHeader() { return new DCTLPasswordRuleFormHeader(); }
auto CTLPasswordRuleFormHeader(DForm myForm) { return new DCTLPasswordRuleFormHeader(myForm); }

unittest {
  assert(CTLPasswordRuleFormHeader);
}