module uim.systems.views.components.forms.headers.right;

@safe:
import uim.systems;

class DCTLRightFormHeader : DAPPEntityFormHeader {
  this() { super(); }
  this(DAPPForm myForm) { this().form(myForm); }
}
auto CTLRightFormHeader() { return new DCTLRightFormHeader(); }
auto CTLRightFormHeader(DAPPForm myForm) { return new DCTLRightFormHeader(myForm); }

unittest {
  assert(CTLRightFormHeader);
}