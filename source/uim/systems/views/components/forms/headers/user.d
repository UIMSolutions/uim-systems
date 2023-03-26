module uim.systems.views.components.forms.headers.user;

@safe:
import uim.systems;

class DSystemUserFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemUserFormHeader", true));
}
mixin(ViewComponentCalls!("SystemUserFormHeader", true));

version(uim_systems) {
  unittest {
    assert(SystemUserFormHeader);
}}