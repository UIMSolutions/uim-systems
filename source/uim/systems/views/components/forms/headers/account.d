module uim.systems.views.components.forms.headers.account;

@safe:
import uim.systems;

class DCTLAccountFormHeader : DAPPEntityFormHeader {
  mixin(APPFormComponentThis!("CTLAccountFormHeader", true));
}
mixin(APPFormComponentCalls!("CTLAccountFormHeader", true));

version(uim_systems) {
  unittest {
    assert(CTLAccountFormHeader);
}}
