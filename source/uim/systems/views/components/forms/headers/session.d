module uim.systems.views.components.forms.headers.session;

@safe:
import uim.systems;

class DSystemSessionFormHeader : DFormHeader {
  mixin(FormComponentThis!("SystemSessionFormHeader", true));
}
mixin(FormComponentCalls!("SystemSessionFormHeader", true));

unittest {
  assert(SystemSessionFormHeader);
}