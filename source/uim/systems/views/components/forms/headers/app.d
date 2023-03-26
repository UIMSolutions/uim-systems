module uim.systems.views.components.forms.headers.app;

@safe:
import uim.systems;

class DSystemAppFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemAppFormHeader", true));
}
mixin(ViewComponentCalls!("SystemAppFormHeader", true));

unittest {
  assert(SystemAppFormHeader);
}