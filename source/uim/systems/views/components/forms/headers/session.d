module uim.systems.views.components.forms.headers.session;

@safe:
import uim.systems;

class DSystemSessionFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemSessionFormHeader"));
}
mixin(ViewComponentCalls!("SystemSessionFormHeader"));

unittest {
  assert(SystemSessionFormHeader);
}