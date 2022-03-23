module uim.systems.views.components.forms.headers.organization;

@safe:
import uim.systems;

class DCTLOrganizationFormHeader : DFormHeader {
  this() { super(); }
  this(DForm myForm) { this().form(myForm); }
}
auto CTLOrganizationFormHeader() { return new DCTLOrganizationFormHeader(); }
auto CTLOrganizationFormHeader(DForm myForm) { return new DCTLOrganizationFormHeader(myForm); }

unittest {
  assert(CTLOrganizationFormHeader);
}