module uim.systems.views.components.forms.headers.role;

@safe:
import uim.systems;

class DCTLRoleFormHeader : DFormHeader {
  this() { super(); }
  this(DForm myForm) { this().form(myForm); }
}
auto CTLRoleFormHeader() { return new DCTLRoleFormHeader(); }
auto CTLRoleFormHeader(DForm myForm) { return new DCTLRoleFormHeader(myForm); }

version(uim_systems) {
  unittest {
    assert(CTLRoleFormHeader);
}}