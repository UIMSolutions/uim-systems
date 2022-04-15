module uim.systems.views.components.forms.headers.organization;

@safe:
import uim.systems;

class DSystemOrganizationFormHeader : DFormHeader {
  mixin(FormComponentThis!("SystemOrganizationFormHeader", true));
}
mixin(FormComponentCalls!("SystemOrganizationFormHeader", true));

unittest {
  assert(SystemOrganizationFormHeader);
}