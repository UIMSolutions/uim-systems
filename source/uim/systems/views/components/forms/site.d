module uim.systems.views.components.forms.site;

@safe:
import uim.systems;

class DCTLSiteForm : DAPPEntityForm {
  mixin(APPFormThis!("CTLSiteForm", true));

  override void initialize() { 
    super.initialize; 

    this
    .body_(CTLSiteFormBody);
  }
}
mixin(APPFormCalls!("CTLSiteForm", true));

version(uim_systems) {
  unittest {
    // TODO
}}