module uim.systems.views.components.forms.headers.account;

@safe:
import uim.systems;

class DSystemAccountFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemAccountFormHeader"));
}
mixin(ViewComponentCalls!("SystemAccountFormHeader"));

version(uim_systems) {
  unittest {
    assert(SystemAccountFormHeader);
}}
