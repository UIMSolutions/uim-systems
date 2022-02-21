module uim.systems.views.components.forms.headers.organization;

@safe:
import uim.systems;

class DCTLOrganizationFormHeader : DAPPEntityFormHeader {
  this() { super(); }
  this(DAPPForm myForm) { this().form(myForm); }
}
auto CTLOrganizationFormHeader() { return new DCTLOrganizationFormHeader(); }
auto CTLOrganizationFormHeader(DAPPForm myForm) { return new DCTLOrganizationFormHeader(myForm); }

unittest {
  assert(CTLOrganizationFormHeader);
}