module uim.systems.views.components.forms.right;

@safe:
import uim.systems;

class DCTLRightForm : DAPPEntityForm {
  this() { super();
    this
    .body_(CTLRightFormBody);
  }
    this(string rootPath, CRUDModes crudMode = CRUDModes.Read) { 
          this().rootPath(rootPath).crudMode(crudMode);
    this
    .body_(CTLRightFormBody);
  }
  this(DAPPView myView) { this().view(myView); }
  this(DOOPEntity myEntity) { this().entity(myEntity); }
  this(DAPPView myView, DOOPEntity myEntity) { this(myView).entity(myEntity); }
}
auto CTLRightForm() { return new DCTLRightForm; }
auto CTLRightForm(string rootPath, CRUDModes crudMode = CRUDModes.Read) { return new DCTLRightForm(rootPath, crudMode); }
auto CTLRightForm(DAPPView myView) { return new DCTLRightForm(myView); }
auto CTLRightForm(DOOPEntity myEntity) { return new DCTLRightForm(myEntity); }
auto CTLRightForm(DAPPView myView, DOOPEntity myEntity) { return new DCTLRightForm(myView, myEntity); }
