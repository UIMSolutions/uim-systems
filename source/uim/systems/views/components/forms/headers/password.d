module uim.systems.views.components.forms.headers.password;

@safe:
import uim.systems;

class DCTLPasswordFormHeader : DAPPEntityFormHeader {
  this() { super(); }
  this(DAPPForm myForm) { this().form(myForm); }
}
auto CTLPasswordFormHeader() { return new DCTLPasswordFormHeader(); }
auto CTLPasswordFormHeader(DAPPForm myForm) { return new DCTLPasswordFormHeader(myForm); }

version(uim_systems) {
  unittest {
    assert(CTLPasswordFormHeader);
}}