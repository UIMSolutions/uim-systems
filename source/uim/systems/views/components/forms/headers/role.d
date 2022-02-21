module uim.systems.views.components.forms.headers.role;

@safe:
import uim.systems;

class DCTLRoleFormHeader : DAPPEntityFormHeader {
  this() { super(); }
  this(DAPPForm myForm) { this().form(myForm); }
}
auto CTLRoleFormHeader() { return new DCTLRoleFormHeader(); }
auto CTLRoleFormHeader(DAPPForm myForm) { return new DCTLRoleFormHeader(myForm); }

version(uim_systems) {
  unittest {
    assert(CTLRoleFormHeader);
}}