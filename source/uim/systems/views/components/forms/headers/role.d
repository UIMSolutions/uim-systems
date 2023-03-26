module uim.systems.views.components.forms.headers.role;

@safe:
import uim.systems;

class DSystemRoleFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemRightFormHeader", true));
}
mixin(ViewComponentCalls!("SystemRightFormHeader", true));

version(uim_systems) {
  unittest {
    assert(SystemRoleFormHeader);
}}