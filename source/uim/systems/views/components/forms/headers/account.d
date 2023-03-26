module uim.systems.views.components.forms.headers.account;

@safe:
import uim.systems;

class DSystemAccountFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemAccountFormHeader", true));
}
mixin(ViewComponentCalls!("SystemAccountFormHeader", true));

version(uim_systems) {
  unittest {
    assert(SystemAccountFormHeader);
}}
