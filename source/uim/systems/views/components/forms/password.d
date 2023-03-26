module uim.systems.views.components.forms.password;

@safe:
import uim.systems;

class DCTLPasswordForm : DForm {
  mixin(ViewComponentThis!("CTLPasswordForm", true));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize;

    this
    .content(SystemPasswordFormContent);
  }
}
mixin(ViewComponentCalls!("CTLPasswordForm", true));

