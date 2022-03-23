module uim.systems.views.components.forms.organization;

@safe:
import uim.systems;

class DCTLOrganizationForm : DForm {
  mixin(ViewComponentThis!("CTLOrganizationForm", true));

  override void initialize() {
    super.initialize;

    this
    .content(CTLOrganizationFormContent);
  }
}
mixin(ViewComponentCalls!("CTLOrganizationForm", true));

