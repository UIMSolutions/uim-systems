module uim.systems.views.components.forms.headers.right;

@safe:
import uim.systems;

class DCTLRightFormHeader : DFormHeader {
  this() { super(); }
  this(DForm myForm) { this().form(myForm); }
}
auto CTLRightFormHeader() { return new DCTLRightFormHeader(); }
auto CTLRightFormHeader(DForm myForm) { return new DCTLRightFormHeader(myForm); }

unittest {
  assert(CTLRightFormHeader);
}