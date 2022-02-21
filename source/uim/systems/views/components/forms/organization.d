module uim.systems.views.components.forms.organization;

@safe:
import uim.systems;

class DCTLOrganizationForm : DAPPEntityForm {
  mixin(APPFormThis!("CTLOrganizationForm", true));

  override void initialize() {
    super.initialize;

    this
    .body_(CTLOrganizationFormBody);
  }
}
mixin(APPFormCalls!("CTLOrganizationForm", true));

