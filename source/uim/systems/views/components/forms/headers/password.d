module uim.systems.views.components.forms.headers.password;

@safe:
import uim.systems;

class DCTLPasswordFormHeader : DFormHeader {
  this() { super(); }
  this(DForm myForm) { this().form(myForm); }
}
auto CTLPasswordFormHeader() { return new DCTLPasswordFormHeader(); }
auto CTLPasswordFormHeader(DForm myForm) { return new DCTLPasswordFormHeader(myForm); }

version(uim_systems) {
  unittest {
    assert(CTLPasswordFormHeader);
}}