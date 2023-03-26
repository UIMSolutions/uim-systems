module uim.systems.views.components.forms.headers.user;

@safe:
import uim.systems;

class DSystemUserFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemUserFormHeader"));
}
mixin(ViewComponentCalls!("SystemUserFormHeader"));

version(uim_systems) {
  unittest {
    assert(SystemUserFormHeader);
}}