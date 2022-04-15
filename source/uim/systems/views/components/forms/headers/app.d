module uim.systems.views.components.forms.headers.app;

@safe:
import uim.systems;

class DSystemAppFormHeader : DFormHeader {
  mixin(FormComponentThis!("SystemAppFormHeader", true));
}
mixin(FormComponentCalls!("SystemAppFormHeader", true));

unittest {
  assert(SystemAppFormHeader);
}