module uim.systems.views.components.forms.headers.user;

@safe:
import uim.systems;

class DCTLUserFormHeader : DFormHeader {
  this() { super(); }
  this(DForm myForm) { this().form(myForm); }
}
auto CTLUserFormHeader() { return new DCTLUserFormHeader(); }
auto CTLUserFormHeader(DForm myForm) { return new DCTLUserFormHeader(myForm); }

version(uim_systems) {
  unittest {
    assert(CTLUserFormHeader);
}}