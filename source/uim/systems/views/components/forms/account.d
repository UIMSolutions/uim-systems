module uim.systems.views.components.forms.account;

@safe:
import uim.systems;

class DCTLAccountForm : DAPPEntityForm {
  mixin(APPFormThis!("CTLAccountForm", true));

  override void initialize() {
    super.initialize;

    this
    .body_(CTLAccountFormBody);
  }
}
mixin(APPFormCalls!("CTLAccountForm", true));

