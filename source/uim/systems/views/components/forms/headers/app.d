module uim.systems.views.components.forms.headers.app;

@safe:
import uim.systems;

class DCTLAppFormHeader : DAPPEntityFormHeader {
  this() { super(); }
  this(DAPPForm myForm) { this().form(myForm); }
}
auto CTLAppFormHeader() { return new DCTLAppFormHeader(); }
auto CTLAppFormHeader(DAPPForm myForm) { return new DCTLAppFormHeader(myForm); }

unittest {
  assert(CTLAppFormHeader);
}