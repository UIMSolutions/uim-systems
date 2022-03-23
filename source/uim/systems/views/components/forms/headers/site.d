module uim.systems.views.components.forms.headers.site;

@safe:
import uim.systems;

class DCTLSiteFormHeader : DFormHeader {
  this() { super(); }
  this(DForm myForm) { this().form(myForm); }
}
auto CTLSiteFormHeader() { return new DCTLSiteFormHeader(); }
auto CTLSiteFormHeader(DForm myForm) { return new DCTLSiteFormHeader(myForm); }

unittest {
  assert(CTLSiteFormHeader);
}