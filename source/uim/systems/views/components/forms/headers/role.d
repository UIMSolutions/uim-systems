module uim.systems.views.components.forms.headers.role;

@safe:
import uim.systems;

class DSystemRoleFormHeader : DFormHeader {
  mixin(FormComponentThis!("SystemRightFormHeader", true));
}
mixin(FormComponentCalls!("SystemRightFormHeader", true));

version(uim_systems) {
  unittest {
    assert(SystemRoleFormHeader);
}}