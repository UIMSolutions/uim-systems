module uim.systems.views.components.forms.site;

@safe:
import uim.systems;

class DCTLSiteForm : DForm {
  mixin(ViewComponentThis!("CTLSiteForm"));

  override void initialize(Json configSettings = Json(null)) { 
    super.initialize(configSettings); 

    this
    .content(SystemSiteFormContent);
  }
}
mixin(ViewComponentCalls!("CTLSiteForm"));

version(uim_systems) {
  unittest {
    // TODO
}}