module uim.systems.views.components.forms.app;

@safe:
import uim.systems;

class DCTLAppForm : DAPPEntityForm {
  mixin(APPFormThis!("CTLAppForm", true));

  override void initialize() {
    super.initialize;

    this.body_(CTLAppFormBody);
  }
}
mixin(APPFormCalls!("CTLAppForm", true));

version(uim_systems) {
  unittest {
    // TODO
}}