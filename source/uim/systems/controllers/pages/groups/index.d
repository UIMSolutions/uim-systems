module uim.systems.controllers.pages.groups.index;

@safe:
import uim.systems;

class DSystemGroupIndexPageController : DSystemEntitiesPageController {
  mixin(APPPageControllerThis!("SystemGroupIndexPageController"));

  override void initialize(Json configSettings = Json(null)) {
    super.initialize(configSettings);

    auto myView = APPEntitiesListView(this);
 
    this
      .view(myView)
      .rootPath("/system/groups")
      .collectionName("system_groups");

    if (auto myHeader = cast(DPageHeader)myView.header) {
      auto bc = BS5Breadcrumb(
        BS5BreadcrumbList
        .link(["href":"/"], "UIM")
        .link(["href":"/system"], "System")
        .item(["active", "fw-bold"], "Gruppen")
      );

      myHeader
        .rootPath("/system/groups")
        .breadcrumbs(bc)
        .title(titleView("Übersicht Groups"))
        .actions([["refresh", "list", "create"]]);
    }

    if (auto frm = cast(DForm)myView.form) {
      frm
       .rootPath("/system/groups")
       .content(
          EntitiesFormContent(frm))
        .header(
          FormHeader(frm)
            .mainTitle("Groups")
            .subTitle("Groups anzeigen")
            .actions([["print", "export"]]));
    } 
  }
}
mixin(APPPageControllerCalls!("SystemGroupIndexPageController"));

version(test_uim_systems) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemGroupIndexPageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemGroupIndexPageController); 
}}