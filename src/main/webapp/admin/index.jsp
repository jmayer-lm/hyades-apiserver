<%@page import="alpine.Config" %>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="e" uri="https://www.owasp.org/index.php/OWASP_Java_Encoder_Project" %>
<%!
    private static final boolean AUTHN_ENABLED = Config.getInstance().getPropertyAsBoolean(Config.AlpineKey.ENFORCE_AUTHENTICATION);
    private static final boolean AUTHZ_ENABLED = Config.getInstance().getPropertyAsBoolean(Config.AlpineKey.ENFORCE_AUTHORIZATION);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <jsp:include page="/WEB-INF/fragments/header.jsp"/>
    <title>Dependency-Track - Administration</title>
</head>
<body data-sidebar="admin">
<jsp:include page="/WEB-INF/fragments/navbar.jsp"/>
<div id="content-container" class="container-fluid require-access-management require-system-configuration">
    <div class="content-row main">
        <div class="col-sm-12 col-md-12">
            <h3 id="admin-title">Administration</h3>
        </div>
        <div class="col-xs-6 col-sm-4 col-md-2">
            <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                <div class="panel panel-default require-system-configuration">
                    <div class="panel-heading admin-accordion" role="tab" id="headingConfiguration">
                        <div class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseConfiguration" aria-expanded="true" aria-controls="collapseConfiguration">
                                Configuration
                            </a>
                        </div>
                    </div>
                    <div id="collapseConfiguration" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingConfiguration">
                        <div class="list-group">
                            <a data-toggle="tab" class="list-group-item" href="#generalConfigTab">General</a>
                            <a data-toggle="tab" class="list-group-item" href="#emailTab">Email</a>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default require-system-configuration">
                    <div class="panel-heading admin-accordion" role="tab" id="headingScanners">
                        <div class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseScanners" aria-expanded="false" aria-controls="collapseScanners">
                                Scanners
                            </a>
                        </div>
                    </div>
                    <div id="collapseScanners" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingScanners">
                        <div class="list-group">
                            <a data-toggle="tab" class="list-group-item" href="#scannerDependencyCheckTab">Dependency-Check</a>
                            <a data-toggle="tab" class="list-group-item" href="#scannerNpmAuditTab">NPM Audit</a>
                            <a data-toggle="tab" class="list-group-item" href="#scannerOssIndexTab">Sonatype OSS Index</a>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default require-system-configuration">
                    <div class="panel-heading admin-accordion" role="tab" id="headingRepositories">
                        <div class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseRepositories" aria-expanded="false" aria-controls="collapseRepositories">
                                Repositories
                            </a>
                        </div>
                    </div>
                    <div id="collapseRepositories" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingRepositories">
                        <div class="list-group">
                            <a data-toggle="tab" class="list-group-item" href="#repositoryNpmTab">NPM</a>
                            <a data-toggle="tab" class="list-group-item" href="#repositoryMavenTab">Maven</a>
                            <a data-toggle="tab" class="list-group-item" href="#repositoryGemTab">Gem</a>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default require-system-configuration">
                    <div class="panel-heading admin-accordion" role="tab" id="headingNotifications">
                        <div class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseNotifications" aria-expanded="false" aria-controls="collapseNotifications">
                                Notifications
                            </a>
                        </div>
                    </div>
                    <div id="collapseNotifications" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingNotifications">
                        <div class="list-group">
                            <a data-toggle="tab" class="list-group-item" href="#notificationAlertTab">Alerts</a>
                            <a data-toggle="tab" class="list-group-item" href="#notificationTemplateTab">Templates</a>
                        </div>
                    </div>
                </div>
                <% if(AUTHN_ENABLED) { %>
                <div class="panel panel-default require-access-management">
                    <div class="panel-heading admin-accordion" role="tab" id="headingAccessManagement">
                        <div class="panel-title">
                            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseAccessManagement" aria-expanded="false" aria-controls="collapseAccessManagement">
                                Access Management
                            </a>
                        </div>
                    </div>
                    <div id="collapseAccessManagement" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingAccessManagement">
                        <div class="list-group">
                            <a data-toggle="tab" class="list-group-item" href="#ldapUsersTab">LDAP Users</a>
                            <a data-toggle="tab" class="list-group-item" href="#managedUsersTab">Managed Users</a>
                            <a data-toggle="tab" class="list-group-item" href="#teamsTab">Teams</a>
                            <a data-toggle="tab" class="list-group-item" href="#permissionsTab">Permissions</a>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
        <div class="col-xs-6 col-sm-8 col-md-10">
            <div class="panel tight">
                <div class="panel-body tight">
                    <div class="tab-content admin-content">
                        <div class="tab-pane admin-form-content active" id="defaultTab">
                            <!-- We can't default to any specific tab due to not knowing their permissions in advance -->
                            <!-- Therefore, default to a blank content area and let the user decide where to go -->
                        </div>
                        <div class="tab-pane admin-form-content" id="generalConfigTab" data-admin-title="General">
                            <h3 class="admin-section-title">General Configuration</h3>
                            <p>This URL is used to construct links back to Dependency-Track from external systems. Email, ChatOps, and WebHook notifications all rely on linking back to Dependency-Track.</p>
                            <div class="form-group">
                                <label class="required" for="generalConfigBaseUrlInput">Dependency-Track Base URL</label>
                                <input type="text" name="Base URL" class="form-control required" id="generalConfigBaseUrlInput" data-group-name="general" data-property-name="base.url">
                            </div>
                            <button type="button" class="btn btn-primary btn-config-property" id="updateGeneralConfigButton" data-group-name="general">Update</button>
                        </div>
                        <div class="tab-pane admin-form-content" id="emailTab" data-admin-title="Email">
                            <h3 class="admin-section-title">Email Service Configuration</h3>
                            <div class="checkbox">
                                <label><input type="checkbox" id="emailEnableInput" data-group-name="email" data-property-name="smtp.enabled"> Enable email</label>
                            </div>
                            <div class="form-group">
                                <label class="required" for="emailFromInput">From email address</label>
                                <input type="text" class="form-control required" id="emailFromInput" data-group-name="email" data-property-name="smtp.from.address">
                            </div>
                            <div class="form-group">
                                <label class="required" for="emailSmtpServerInput">SMTP server</label>
                                <input type="text" class="form-control required" id="emailSmtpServerInput" data-group-name="email" data-property-name="smtp.server.hostname">
                            </div>
                            <div class="form-group">
                                <label class="required" for="emailSmtpServerPortInput">SMTP server port</label>
                                <input type="text" class="form-control required" id="emailSmtpServerPortInput" data-group-name="email" data-property-name="smtp.server.port">
                            </div>
                            <div class="form-group">
                                <label for="emailSmtpUsernameInput">SMTP username</label>
                                <input type="text" class="form-control" autocomplete="off" id="emailSmtpUsernameInput" data-group-name="email" data-property-name="smtp.username">
                            </div>
                            <div class="form-group">
                                <label for="emailSmtpPasswordInput">SMTP password</label>
                                <input type="password" class="form-control" autocomplete="off" id="emailSmtpPasswordInput" data-group-name="email" data-property-name="smtp.password">
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" id="emailSmtpSslTlsInput" data-group-name="email" data-property-name="smtp.ssltls"> Enable SSL/TLS encryption</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" id="emailSmtpTrustCertInput" data-group-name="email" data-property-name="smtp.trustcert"> Trust the certificate provided by the SMTP server</label>
                            </div>
                            <button type="button" class="btn btn-primary btn-config-property" id="updateEmailConfigButton" data-group-name="email">Update</button>
                        </div>
                        <div class="tab-pane" id="scannerDependencyCheckTab" data-admin-title="Dependency-Check">
                            <h3 class="admin-section-title">Dependency-Check Configuration</h3>
                            <div class="checkbox">
                                <input id="scannerDependencyCheckToggleButton" class="scannerToggleButton" type="checkbox" data-toggle="toggle" data-size="small" data-width="130" data-group-name="scanner" data-property-name="dependencycheck.enabled" data-on="<i class='fa fa-power-off'></i> Enabled" data-off="<i class='fa fa-power-off'></i> Disabled">
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <p>
                                        OWASP Dependency-Check is a utility designed to discover vulnerabilities in
                                        third-party components. Dependency-Check uses evidence-based analysis and
                                        performs fuzzy matching against the NVD to present results based on confidence.
                                        Dependency-Track has native integration with Dependency-Check and accepts
                                        results with medium confidence or higher while rejecting lower confidence results.
                                    </p>
                                    <p>
                                        Evidence-based analysis will lead to false positives, however, the technique can
                                        also be utilized to discover potential issues with an applications environment.
                                        For example, falsely identified vulnerabilities in a database driver may reveal
                                        the use of a vulnerable database server.
                                    </p>
                                    <p>
                                        Note: Due to the file-based approach that Dependency-Check natively uses,
                                        not all Dependency-Check analyzers are enabled. Most notably, NPM analysis
                                        is disabled. Organizations utilizing Node.js are encouraged to use the native
                                        NPM Audit analyzer in Dependency-Track.
                                    </p>
                                </div>
                                <div class="panel-footer">
                                    References:<br/>
                                    <a href="https://www.owasp.org/index.php/OWASP_Dependency_Check">OWASP Dependency-Check Project</a>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="scannerNpmAuditTab" data-admin-title="NPM Audit">
                            <h3 class="admin-section-title">NPM Audit Configuration</h3>
                            <div class="checkbox">
                                <input id="scannerNpmAuditToggleButton" class="scannerToggleButton" type="checkbox" data-toggle="toggle" data-size="small" data-width="130" data-group-name="scanner" data-property-name="npmaudit.enabled" data-on="<i class='fa fa-power-off'></i> Enabled" data-off="<i class='fa fa-power-off'></i> Disabled">
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <p>
                                        NPM Audit is a cloud service which identifies vulnerabilities in Node.js
                                        Modules. Dependency-Track integrates natively with the NPM Audit service to
                                        provide highly accurate results.
                                    </p>
                                    <p>
                                        Use of this analyzer requires a valid PackageURL for the components being analyzed.
                                    </p>
                                </div>
                                <div class="panel-footer">
                                    References:<br/>
                                    <a href="https://www.npmjs.com/">NPM, Inc.</a>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="scannerOssIndexTab" data-admin-title="OSS Index">
                            <h3 class="admin-section-title">Sonatype OSS Index Configuration</h3>
                            <div class="checkbox">
                                <input id="scannerOssIndexToggleButton" class="scannerToggleButton" type="checkbox" data-toggle="toggle" data-size="small" data-width="130" data-group-name="scanner" data-property-name="ossindex.enabled" data-on="<i class='fa fa-power-off'></i> Enabled" data-off="<i class='fa fa-power-off'></i> Disabled">
                            </div>
                            <div class="form-group admin-form-content">
                                <label class="required" for="scannerOssIndexApiUsernameInput">API Username</label>
                                <input type="text" class="form-control required" autocomplete="off" id="scannerOssIndexApiUsernameInput" data-group-name="scanner" data-property-name="ossindex.api.username">
                            </div>
                            <div class="form-group admin-form-content">
                                <label class="required" for="scannerOssIndexApiTokenInput">API Token</label>
                                <input type="password" class="form-control required" autocomplete="off" id="scannerOssIndexApiTokenInput" data-group-name="scanner" data-property-name="ossindex.api.token">
                            </div>
                            <div class="form-group admin-form-content">
                                <button type="button" class="btn btn-primary btn-config-property" id="updateOssIndexConfigButton" data-group-name="scanner">Update</button>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <p>
                                        OSS Index is a service provided by Sonatype which identifies vulnerabilities in
                                        third-party components. Dependency-Track integrates natively with the OSS Index
                                        service to provide highly accurate results.
                                    </p>
                                    <p>
                                        Use of this analyzer requires a valid PackageURL for the components being analyzed.
                                    </p>
                                </div>
                                <div class="panel-footer">
                                    References:<br/>
                                    <a href="https://ossindex.sonatype.org/">Sonatype OSS Index</a>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="repositoryNpmTab" data-admin-title="NPM Repositories">
                            <table id="repositoryNpmTable" class="table table-hover detail-table" data-toggle="table"
                                   data-url="<c:url value="/api/v1/repository/NPM?orderBy=resolutionOrder&sort=asc"/>"
                                   data-response-handler="formatRepositoryTable"
                                   data-query-params-type="pageSize" data-side-pagination="client" data-pagination="true"
                                   data-silent-sort="false" data-page-size="10" data-page-list="[10, 25, 50, 100]"
                                   data-detail-view="true" data-click-to-select="true" data-height="100%">
                                <thead>
                                <tr>
                                    <th data-align="left" data-field="identifier">Identifier</th>
                                    <th data-align="left" data-field="url">URL</th>
                                    <th data-align="center" data-field="enabledLabel" data-class="tight">Enabled</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="tab-pane" id="repositoryMavenTab" data-admin-title="Maven Repositories">
                            <table id="repositoryMavenTable" class="table table-hover detail-table" data-toggle="table"
                                   data-url="<c:url value="/api/v1/repository/MAVEN?orderBy=resolutionOrder&sort=asc"/>"
                                   data-response-handler="formatRepositoryTable"
                                   data-query-params-type="pageSize" data-side-pagination="client" data-pagination="true"
                                   data-silent-sort="false" data-page-size="10" data-page-list="[10, 25, 50, 100]"
                                   data-detail-view="true" data-click-to-select="true" data-height="100%">
                                <thead>
                                <tr>
                                    <th data-align="left" data-field="identifier">Identifier</th>
                                    <th data-align="left" data-field="url">URL</th>
                                    <th data-align="center" data-field="enabledLabel" data-class="tight">Enabled</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="tab-pane" id="repositoryGemTab" data-admin-title="Gem Repositories">
                            <table id="repositoryGemTable" class="table table-hover detail-table" data-toggle="table"
                                   data-url="<c:url value="/api/v1/repository/GEM?orderBy=resolutionOrder&sort=asc"/>"
                                   data-response-handler="formatRepositoryTable"
                                   data-query-params-type="pageSize" data-side-pagination="client" data-pagination="true"
                                   data-silent-sort="false" data-page-size="10" data-page-list="[10, 25, 50, 100]"
                                   data-detail-view="true" data-click-to-select="true" data-height="100%">
                                <thead>
                                <tr>
                                    <th data-align="left" data-field="identifier">Identifier</th>
                                    <th data-align="left" data-field="url">URL</th>
                                    <th data-align="center" data-field="enabledLabel" data-class="tight">Enabled</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="tab-pane" id="notificationAlertTab" data-admin-title="Alerts">
                            <table id="notificationAlertTable" class="table table-hover detail-table" data-toggle="table"
                                   data-url="<c:url value="/api/v1/notification/rule"/>"
                                   data-response-handler="formatRepositoryTable"
                                   data-query-params-type="pageSize" data-side-pagination="server" data-pagination="true"
                                   data-silent-sort="false" data-page-size="10" data-page-list="[10, 25, 50, 100]"
                                   data-detail-view="true" data-click-to-select="true" data-height="100%">
                                <thead>
                                <tr>
                                    <th data-align="left" data-field="name">Name</th>
                                    <th data-align="left" data-field="notificationPublisher.name">Publisher</th>
                                    <th data-align="left" data-field="notificationLevel">Notification Level</th>
                                    <th data-align="center" data-field="enabledLabel" data-class="tight">Enabled</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="tab-pane" id="notificationTemplateTab" data-admin-title="Templates">
                            <table id="notificationTemplateTable" class="table table-hover detail-table" data-toggle="table"
                                   data-url="<c:url value="/api/v1/notification/publisher"/>"
                                   data-response-handler="formatNotificationTemplateTable"
                                   data-detail-view="true" data-detail-formatter="notificationTemplateDetailFormatter"
                                   data-query-params-type="pageSize" data-side-pagination="client" data-pagination="true"
                                   data-silent-sort="false" data-page-size="10" data-page-list="[10, 25, 50, 100]"
                                   data-click-to-select="true" data-height="100%">
                                <thead>
                                <tr>
                                    <th data-align="left" data-field="name">Name</th>
                                    <th data-align="center" data-field="defaultPublisherLabel" data-class="tight">Default</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="tab-pane" id="teamsTab" data-admin-title="Teams">
                            <div id="teamsToolbar">
                                <div class="form-inline" role="form">
                                    <button id="createTeamButton" class="btn btn-default" data-toggle="modal" data-target="#modalCreateTeam"><span class="fa fa-plus"></span> Create Team</button>
                                </div>
                            </div>
                            <table id="teamsTable" class="table table-hover detail-table" data-toggle="table"
                                   data-response-handler="formatTeamTable"
                                   data-show-refresh="true" data-show-columns="true" data-search="true"
                                   data-detail-view="true" data-detail-formatter="teamDetailFormatter"
                                   data-toolbar="#teamsToolbar" data-click-to-select="true" data-height="100%">
                                <thead>
                                <tr>
                                    <th data-align="left" data-field="name">Team Name</th>
                                    <th data-align="left" data-field="apiKeysNum">API Keys</th>
                                    <th data-align="left" data-field="membersNum">Members</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="tab-pane" id="ldapUsersTab" data-admin-title="LDAP Users">
                            <div id="ldapUsersToolbar">
                                <div class="form-inline" role="form">
                                    <button id="createLdapUserButton" class="btn btn-default" data-toggle="modal" data-target="#modalCreateLdapUser"><span class="fa fa-plus"></span> Create User</button>
                                </div>
                            </div>
                            <table id="ldapUsersTable" class="table table-hover detail-table" data-toggle="table"
                                   data-response-handler="formatLdapUserTable"
                                   data-show-refresh="true" data-show-columns="true" data-search="true"
                                   data-detail-view="true" data-detail-formatter="ldapUserDetailFormatter"
                                   data-toolbar="#ldapUsersToolbar" data-click-to-select="true" data-height="100%">
                                <thead>
                                <tr>
                                    <th data-align="left" data-field="username">Username</th>
                                    <th data-align="left" data-field="dn">Distinguished Name</th>
                                    <th data-align="left" data-field="teamsNum">Teams</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="tab-pane" id="managedUsersTab" data-admin-title="Managed Users">
                            <div id="managedUsersToolbar">
                                <div class="form-inline" role="form">
                                    <button id="createManagedUserButton" class="btn btn-default" data-toggle="modal" data-target="#modalCreateManagedUser"><span class="fa fa-plus"></span> Create User</button>
                                </div>
                            </div>
                            <table id="managedUsersTable" class="table table-hover detail-table" data-toggle="table"
                                   data-response-handler="formatManagedUserTable"
                                   data-show-refresh="true" data-show-columns="true" data-search="true"
                                   data-detail-view="true" data-detail-formatter="managedUserDetailFormatter"
                                   data-toolbar="#managedUsersToolbar" data-click-to-select="true" data-height="100%">
                                <thead>
                                <tr>
                                    <th data-align="left" data-field="username">Username</th>
                                    <th data-align="left" data-field="fullname">Full Name</th>
                                    <th data-align="left" data-field="email">Email</th>
                                    <th data-align="left" data-field="teamsNum">Teams</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                        <div class="tab-pane" id="permissionsTab" data-admin-title="Permissions">
                            <table id="permissionListingTable" class="table table-hover" data-toggle="table"
                                   data-height="100%">
                                <thead>
                                <tr>
                                    <th data-align="left" data-field="name">Name</th>
                                    <th data-align="left" data-field="description">Description</th>
                                </tr>
                                </thead>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Modals specific to administration -->
    <div class="modal fade" id="modalCreateTeam" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title">Create Team</span>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="required" for="createTeamNameInput">Team Name</label>
                        <input type="text" name="teamname" required="required" class="form-control required" id="createTeamNameInput">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="createTeamCreateButton">Create</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalCreateLdapUser" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title">Create LDAP User</span>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <label class="required" for="createLdapUserNameInput">Username</label>
                        <input type="text" name="username" required="required" class="form-control required" id="createLdapUserNameInput">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="createLdapUserCreateButton">Create</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalCreateManagedUser" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title">Create Managed User</span>
                </div>
                <div class="panel-body">
                    <div class="col-md-12">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="required" for="createManagedUserNameInput">Username</label>
                                <input type="text" name="username" class="form-control required" id="createManagedUserNameInput">
                            </div>
                            <div class="form-group">
                                <label class="required" for="createManagedUserFullnameInput">Full Name</label>
                                <input type="text" name="fullname" class="form-control required" id="createManagedUserFullnameInput">
                            </div>
                            <div class="form-group">
                                <label class="required" for="createManagedUserEmailInput">Email</label>
                                <input type="email" name="email" class="form-control required" id="createManagedUserEmailInput">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="required" for="createManagedUserPasswordInput">Password</label>
                                <input type="password" name="password" class="form-control required" id="createManagedUserPasswordInput">
                            </div>
                            <div class="form-group">
                                <label class="required" for="createManagedUserConfirmInput">Confirm Password</label>
                                <input type="password" name="confirmPassword" class="form-control required" id="createManagedUserConfirmInput">
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="forcePasswordChange" id="createManagedUserForcePasswordChangeInput"> User must change password at next login</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="nonExpiryPassword" id="createManagedUserNonExpiryPasswordInput"> Password never expires</label>
                            </div>
                            <div class="checkbox">
                                <label><input type="checkbox" name="suspended" id="createManagedUserSuspendedInput"> Suspended</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="createManagedUserCreateButton">Create</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalAssignTeamToUser" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title">Assign Team Membership</span>
                </div>
                <div class="modal-body">
                    <table id="teamsMembershipTable" class="table table-hover" data-toggle="table"
                           data-click-to-select="true" data-height="100%">
                        <thead>
                        <tr>
                            <th data-align="middle" data-field="selected" data-checkbox="true"></th>
                            <th data-align="left" data-field="name">Team Name</th>
                        </tr>
                        </thead>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="assignTeamToUser" data-username="">Update</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="modalAssignPermission" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-md" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="modal-title">Assign Permission</span>
                </div>
                <div class="modal-body">
                    <table id="permissionsTable" class="table table-hover" data-toggle="table"
                           data-click-to-select="true" data-height="100%">
                        <thead>
                        <tr>
                            <th data-align="middle" data-field="selected" data-checkbox="true"></th>
                            <th data-align="left" data-field="name">Name</th>
                        </tr>
                        </thead>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary" data-dismiss="modal" id="assignPermission" data-username="" data-team="">Update</button>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="/WEB-INF/fragments/common-modals.jsp"/>
<jsp:include page="/WEB-INF/fragments/footer.jsp"/>
<script type="text/javascript" src="<c:url value="/admin/functions.js"/>"></script>
</body>
</html>