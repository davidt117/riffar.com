# coding: utf-8
PROJECT_AUTHENTICATION_BACKENDS = (
    'app.siteauth.backends.UserAuthBackend',
    'app.siteadminauth.backends.AdminAuthBackend',
    'app.superadminauth.backends.SuperAdminAuthBackend',
    'app.cms.adm.auth.backends.AuthBackend',
)

PROJECT_TEMPLATE_CONTEXT_PROCESSORS = (
    'app.processors.context.template_variables',
    'app.processors.adm.context.template_variables'
)

PROJECT_MIDDLEWARE_CLASSES = (
    'app.pagemap.middleware.PageMiddleware',
)
