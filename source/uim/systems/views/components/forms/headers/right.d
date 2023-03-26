module uim.systems.views.components.forms.headers.right;

@safe:
import uim.systems;

class DSystemRightFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemRightFormHeader", true));
}
mixin(FormComponentCalls!("SystemRightFormHeader", true));


unittest {
  assert(SystemRightFormHeader);
}