module uim.systems.views.components.forms.right;

@safe:
import uim.systems;

class DCTLRightForm : DForm {
  this() { super();
    this
    .content(SystemRightFormContent);
  }
    this(string rootPath, CRUDModes crudMode = CRUDModes.Read) { 
          this().rootPath(rootPath).crudMode(crudMode);
    this
    .content(SystemRightFormContent);
  }
  this(DView myView) { this().view(myView); }
  this(DEntity myEntity) { this().entity(myEntity); }
  this(DView myView, DEntity myEntity) { this(myView).entity(myEntity); }
}
auto CTLRightForm() { return new DCTLRightForm; }
auto CTLRightForm(string rootPath, CRUDModes crudMode = CRUDModes.Read) { return new DCTLRightForm(rootPath, crudMode); }
auto CTLRightForm(DView myView) { return new DCTLRightForm(myView); }
auto CTLRightForm(DEntity myEntity) { return new DCTLRightForm(myEntity); }
auto CTLRightForm(DView myView, DEntity myEntity) { return new DCTLRightForm(myView, myEntity); }
