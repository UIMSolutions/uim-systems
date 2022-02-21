module uim.systems.views.components.forms.headers.group;

@safe:
import uim.systems;

class DCTLGroupFormHeader : DAPPEntityFormHeader {
  this() { super(); }
  this(DAPPForm myForm) { this().form(myForm); }
}
auto CTLGroupFormHeader() { return new DCTLGroupFormHeader(); }
auto CTLGroupFormHeader(DAPPForm myForm) { return new DCTLGroupFormHeader(myForm); }

unittest {
  assert(CTLGroupFormHeader);
}