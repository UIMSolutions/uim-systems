module uim.systems.controllers.actions;

@safe:
import uim.systems;

public import uim.systems.controllers.actions.create;
public import uim.systems.controllers.actions.delete_;
public import uim.systems.controllers.actions.update;

mixin(EntityActions!("SystemAccount", "/system/accounts", "system_accounts", "System"));
mixin(EntityActions!("SystemApp", "/system/apps", "system_apps", "System"));
mixin(EntityActions!("SystemGroup", "/system/groups", "system_groups", "System"));
mixin(EntityActions!("SystemLogin", "/system/logins", "system_logins", "System"));
mixin(EntityActions!("SystemOrganization", "/system/organizations", "system_organizations", "System"));
mixin(EntityActions!("SystemPassword", "/system/passwords", "system_passwords", "System"));
mixin(EntityActions!("SystemPasswordRule", "/system/passwordrules", "system_passwordrules", "System"));
mixin(EntityActions!("SystemRequest", "/system/requests", "system_requests", "System"));
mixin(EntityActions!("SystemRight", "/system/rights", "system_rights", "System"));
mixin(EntityActions!("SystemRole", "/system/roles", "system_roles", "System"));
mixin(EntityActions!("SystemSession", "/system/sessions", "system_sessions", "System"));
mixin(EntityActions!("SystemSite", "/system/sites", "system_sites", "System"));
mixin(EntityActions!("SystemTenant", "/system/tenants", "system_tenants", "System"));
mixin(EntityActions!("SystemUser", "/system/users", "system_users", "System"));
