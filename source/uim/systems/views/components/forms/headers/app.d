module uim.systems.views.components.forms.headers.app;

@safe:
import uim.systems;

class DSystemAppFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemAppFormHeader"));
}
mixin(ViewComponentCalls!("SystemAppFormHeader"));

unittest {
  assert(SystemAppFormHeader);
}