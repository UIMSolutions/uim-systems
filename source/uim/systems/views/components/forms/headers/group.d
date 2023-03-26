module uim.systems.views.components.forms.headers.group;

@safe:
import uim.systems;

class DSystemGroupFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemGroupFormHeader", true));
}
mixin(ViewComponentCalls!("SystemGroupFormHeader", true));

unittest {
  assert(SystemGroupFormHeader);
}