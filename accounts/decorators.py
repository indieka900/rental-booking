from django.contrib.auth import REDIRECT_FIELD_NAME
from django.contrib.auth.decorators import user_passes_test


# def administrator_required(function=None,
#                            redirect_field_name=REDIRECT_FIELD_NAME,
#                            login_url="/medics-login/"):
#     actual_decorator = user_passes_test(
#         lambda u: u.is_active and u.role == "Administrator" or u.is_admin or u.is_staff,
#         login_url=login_url,
#         redirect_field_name=redirect_field_name
#     )

#     if function:
#         return actual_decorator(function)

#     return actual_decorator


def landlord_required(function=None,
                      redirect_field_name=REDIRECT_FIELD_NAME,
                      login_url="/"):
    actual_decorator = user_passes_test(
        lambda u: u.is_active and u.role == "Landlord",
        login_url=login_url,
        redirect_field_name=redirect_field_name
    )

    if function:
        return actual_decorator(function)

    return actual_decorator

def tenant_required(function=None,
                      redirect_field_name=REDIRECT_FIELD_NAME,
                      login_url="/"):
    actual_decorator = user_passes_test(
        lambda u: u.is_active and u.role == "Prospective tenant",
        login_url=login_url,
        redirect_field_name=redirect_field_name
    )

    if function:
        return actual_decorator(function)

    return actual_decorator