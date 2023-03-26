module uim.systems.views.components.forms.headers.password;

@safe:
import uim.systems;

class DSystemPasswordFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemPasswordFormHeader", true));
}
mixin(FormComponentCalls!("SystemPasswordFormHeader", true));

version(uim_systems) {
  unittest {
    assert(SystemPasswordFormHeader);
}}