module uim.systems.views.components.forms.headers.group;

@safe:
import uim.systems;

class DSystemGroupFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemGroupFormHeader"));
}
mixin(ViewComponentCalls!("SystemGroupFormHeader"));

unittest {
  assert(SystemGroupFormHeader);
}