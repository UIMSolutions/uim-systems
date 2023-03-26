module uim.systems.views.components.forms.headers.password;

@safe:
import uim.systems;

class DSystemPasswordFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemPasswordFormHeader"));
}
mixin(ViewComponentCalls!("SystemPasswordFormHeader"));

version(uim_systems) {
  unittest {
    assert(SystemPasswordFormHeader);
}}