module uim.systems.views.components.forms.headers.site;

@safe:
import uim.systems;

class DSystemSiteFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemSiteFormHeader", true));
}
mixin(ViewComponentCalls!("SystemSiteFormHeader", true));

unittest {
  assert(SystemSiteFormHeader);
}