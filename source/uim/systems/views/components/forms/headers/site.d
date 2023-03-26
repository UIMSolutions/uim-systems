module uim.systems.views.components.forms.headers.site;

@safe:
import uim.systems;

class DSystemSiteFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemSiteFormHeader"));
}
mixin(ViewComponentCalls!("SystemSiteFormHeader"));

unittest {
  assert(SystemSiteFormHeader);
}