module uim.systems.views.components.forms.headers.app;

@safe:
import uim.systems;

class DCTLAppFormHeader : DFormHeader {
  this() { super(); }
  this(DForm myForm) { this().form(myForm); }
}
auto CTLAppFormHeader() { return new DCTLAppFormHeader(); }
auto CTLAppFormHeader(DForm myForm) { return new DCTLAppFormHeader(myForm); }

unittest {
  assert(CTLAppFormHeader);
}