module uim.systems.controllers.pages.delete_;

@safe:
import uim.systems;

class DSystemDeletePageController : DSystemEntityPageController {
  mixin(APPPageControllerThis!("SystemDeletePageController"));

  override void beforeResponse(STRINGAA options = null) {
    debugMethodCall(moduleName!DSystemDeletePageController~":DSystemDeletePageController("~this.name~")::beforeResponse");
    super.beforeResponse(options);
    if (hasError || "redirect" in options) { return; }

    if (entityId && entityId.isUUID) {  
      auto dbEntity = collection.findOne(UUID(entityId));      
      if (auto entityView = cast(DAPPEntityCRUDView)this.view) {
        entityView
          .entity(dbEntity)
          .crudMode(CRUDModes.Delete)
          .rootPath(this.rootPath)
          .readonly(true);
      }
    }
  }
}
mixin(APPPageControllerCalls!("SystemDeletePageController"));

version(test_uim_modeller) {
  unittest {
    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(new DSystemDeletePageController); 

    writeln("--- Tests in ", __MODULE__, "/", __LINE__);
		testPageController(SystemDeletePageController); 
}}

auto mdlDeletePageController(string classesName, string rootController, string addInitialize = "", string addBeforeResponse = "") {
  return `
    class D`~classesName~`DeletePageController : D`~rootController~`PageController {
      `~appPageControllerThis(classesName~`DeletePageController`, true)~`

    override void initialize(Json configSettings = Json(null)) {
      super.initialize(configSettings);

      this
        .view(
          `~classesName~`DeleteView(this));

      `~addInitialize~`
      }
    }`~
    appPageControllerCalls(classesName~`DeletePageController`, true);
}

template SystemDeletePageController(string classesName, string rootController, string addInitialize = "", string addBeforeResponse = "") {
  const char[] SystemDeletePageController = mdlDeletePageController(classesName, rootController, addInitialize, addBeforeResponse);
}


/*
  this(string jsPath, string myPath, string myEntities, string myEntity, string myCollectionName) { super(); 
    this
    .jsPath(jsPath).pgPath(myPath).entitiesName(myEntities).entityName(myEntity).collectionName(myCollectionName)
    .title("UIM!System > "~myEntities~" > Löschen")
    .checks([APPCheckAppSessionExists, APPCheckAppSessionHasSession, APPCheckAppSessionHasSite])
    .pageHeader(
      APPDeletePageHeader
      .rootPath(pgPath).mainTitle(myEntities).subTitle("Löschen "~myEntity)
      .bdeletecrumbs(BS5BdeletecrumbList(["bdeletecrumb-arrows"])
        .link(["href":"/"], "UIM!System")
        .link(["href":pgPath], myEntities)
        .item(["active"], ["aria-current":"page"], H5A(["href":"#"], "Löschen"))));

    this.scripts.addLinks(        
      "/js/apps/"~jsPath~"/entity.js",
      "/js/apps/"~jsPath~"/delete.js");

    this.scripts.addContents(editorSummary~editorText);
  }
  unittest {
    version(test_uim_mdl) {
      /// TODO
    }}*/
