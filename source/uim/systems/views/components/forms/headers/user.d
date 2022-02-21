module uim.systems.views.components.forms.headers.user;

@safe:
import uim.systems;

class DCTLUserFormHeader : DAPPEntityFormHeader {
  this() { super(); }
  this(DAPPForm myForm) { this().form(myForm); }
}
auto CTLUserFormHeader() { return new DCTLUserFormHeader(); }
auto CTLUserFormHeader(DAPPForm myForm) { return new DCTLUserFormHeader(myForm); }

version(uim_systems) {
  unittest {
    assert(CTLUserFormHeader);
}}