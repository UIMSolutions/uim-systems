module uim.systems.views.components.forms.password;

@safe:
import uim.systems;

class DCTLPasswordForm : DAPPEntityForm {
  mixin(APPFormThis!("CTLPasswordForm", true));

  override void initialize() {
    super.initialize;

    this
    .body_(CTLPasswordFormBody);
  }
}
mixin(APPFormCalls!("CTLPasswordForm", true));

