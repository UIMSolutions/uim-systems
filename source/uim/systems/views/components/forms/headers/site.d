module uim.systems.views.components.forms.headers.site;

@safe:
import uim.systems;

class DSystemSiteFormHeader : DFormHeader {
  mixin(ViewComponentThis!("SystemSiteFormHeader", true));
}
mixin(FormComponentCalls!("SystemSiteFormHeader", true));

unittest {
  assert(SystemSiteFormHeader);
}