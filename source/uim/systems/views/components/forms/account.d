module uim.systems.views.components.forms.account;

@safe:
import uim.systems;

class DCTLAccountForm : DForm {
  mixin(ViewComponentThis!("CTLAccountForm"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    this
      .content(SystemAccountFormContent);
  }
}
mixin(ViewComponentCalls!("CTLAccountForm"));

