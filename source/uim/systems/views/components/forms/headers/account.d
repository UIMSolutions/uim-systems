module uim.systems.views.components.forms.headers.account;

@safe:
import uim.systems;

class DSystemAccountFormHeader : DFormHeader {
  mixin(FormComponentThis!("SystemAccountFormHeader", true));
}
mixin(FormComponentCalls!("SystemAccountFormHeader", true));

version(uim_systems) {
  unittest {
    assert(SystemAccountFormHeader);
}}
