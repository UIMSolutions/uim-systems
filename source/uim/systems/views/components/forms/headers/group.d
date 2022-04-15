module uim.systems.views.components.forms.headers.group;

@safe:
import uim.systems;

class DSystemGroupFormHeader : DFormHeader {
  mixin(FormComponentThis!("SystemGroupFormHeader", true));
}
mixin(FormComponentCalls!("SystemGroupFormHeader", true));

unittest {
  assert(SystemGroupFormHeader);
}