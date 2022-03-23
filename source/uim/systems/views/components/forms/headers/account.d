module uim.systems.views.components.forms.headers.account;

@safe:
import uim.systems;

class DCTLAccountFormHeader : DFormHeader {
  mixin(ViewComponentThis!("CTLAccountFormHeader", true));
}
mixin(ViewComponentCalls!("CTLAccountFormHeader", true));

version(uim_systems) {
  unittest {
    assert(CTLAccountFormHeader);
}}
