module uim.systems.views.components.forms.headers.site;

@safe:
import uim.systems;

class DCTLSiteFormHeader : DAPPEntityFormHeader {
  this() { super(); }
  this(DAPPForm myForm) { this().form(myForm); }
}
auto CTLSiteFormHeader() { return new DCTLSiteFormHeader(); }
auto CTLSiteFormHeader(DAPPForm myForm) { return new DCTLSiteFormHeader(myForm); }

unittest {
  assert(CTLSiteFormHeader);
}