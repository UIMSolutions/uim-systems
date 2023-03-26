module uim.systems.views.components.forms.headers.organization;

@safe:
import uim.systems;

class DSystemOrganizationFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemOrganizationFormHeader"));
}
mixin(ViewComponentCalls!("SystemOrganizationFormHeader"));

unittest {
  assert(SystemOrganizationFormHeader);
}