module uim.systems.views.components.forms.site;

@safe:
import uim.systems;

class DCTLSiteForm : DForm {
  mixin(ViewComponentThis!("CTLSiteForm", true));

  override void initialize() { 
    super.initialize; 

    this
    .content(CTLSiteFormContent);
  }
}
mixin(ViewComponentCalls!("CTLSiteForm", true));

version(uim_systems) {
  unittest {
    // TODO
}}