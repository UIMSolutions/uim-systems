module uim.systems.views.components.forms.app;

@safe:
import uim.systems;

class DCTLAppForm : DForm {
  mixin(ViewComponentThis!("CTLAppForm", true));

  override void initialize() {
    super.initialize;

    this.content(SystemAppFormContent);
  }
}
mixin(ViewComponentCalls!("CTLAppForm", true));

version(uim_systems) {
  unittest {
    // TODO
}}