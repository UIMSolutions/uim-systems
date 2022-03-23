module uim.systems.views.components.forms.headers.group;

@safe:
import uim.systems;

class DCTLGroupFormHeader : DFormHeader {
  this() { super(); }
  this(DForm myForm) { this().form(myForm); }
}
auto CTLGroupFormHeader() { return new DCTLGroupFormHeader(); }
auto CTLGroupFormHeader(DForm myForm) { return new DCTLGroupFormHeader(myForm); }

unittest {
  assert(CTLGroupFormHeader);
}