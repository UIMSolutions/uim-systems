module uim.systems.views.components.forms.account;

@safe:
import uim.systems;

class DCTLAccountForm : DForm {
  mixin(ViewComponentThis!("CTLAccountForm", true));

  override void initialize() {
    super.initialize;

    this
      .content(SystemAccountFormContent);
  }
}
mixin(ViewComponentCalls!("CTLAccountForm", true));

