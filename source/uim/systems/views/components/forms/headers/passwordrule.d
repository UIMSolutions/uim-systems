module uim.systems.views.components.forms.headers.passwordrule;

@safe:
import uim.systems;

class DCTLPasswordRuleFormHeader : DAPPEntityFormHeader {
  this() { super(); }
  this(DAPPForm myForm) { this().form(myForm); }
}
auto CTLPasswordRuleFormHeader() { return new DCTLPasswordRuleFormHeader(); }
auto CTLPasswordRuleFormHeader(DAPPForm myForm) { return new DCTLPasswordRuleFormHeader(myForm); }

unittest {
  assert(CTLPasswordRuleFormHeader);
}