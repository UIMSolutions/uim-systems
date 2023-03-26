module uim.systems.views.components.forms.headers.right;

@safe:
import uim.systems;

class DSystemRightFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemRightFormHeader"));
}
mixin(ViewComponentCalls!("SystemRightFormHeader"));


unittest {
  assert(SystemRightFormHeader);
}