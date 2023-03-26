module uim.systems.views.components.forms.organization;

@safe:
import uim.systems;

class DCTLOrganizationForm : DForm {
  mixin(ViewComponentThis!("CTLOrganizationForm"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
    .content(SystemOrganizationFormContent);
  }
}
mixin(ViewComponentCalls!("CTLOrganizationForm"));

