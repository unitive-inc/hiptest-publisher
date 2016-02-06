# encoding: UTF-8
require 'spec_helper'
require_relative 'actionwords'

describe 'Unitive' do
  include Actionwords

  it "Non-SAML Login (uid:e2924d54-415d-49c7-acc4-40af60f714f7)" do
    # Given the tenant not configured for SAML
    the_tenant_not_configured_for_saml
    # And existing user "john@domain.com"
    existing_user_p1("john@domain.com")
    # When "john@domain.com" logs in
    p1_logs_in("john@domain.com")
    # Then page "result.html" is presented.
    page_p1_is_presented("result.html")
  end

  it "Non-SAML Session (uid:3e279623-4078-4368-9070-cb9bd4f5cf40)" do
    # Given the tenant not configured for SAML
    the_tenant_not_configured_for_saml
    # And existing user "john@domain.com"
    existing_user_p1("john@domain.com")
    # And "john@domain.com" logs in
    p1_logs_in("john@domain.com")
    # When "john@domain.com" accesses "page.html"
    p1_accesses_p2("john@domain.com", "page.html")
    # Then "page.html" is returned.
    p1_is_returned("page.html")
  end

  it "Configure tenant for SAML (uid:eeaba7be-6369-4e27-b5e7-a204bb25bcc9)" do
    # Given the tenant not configured for SAML
    the_tenant_not_configured_for_saml
    # And admin user "angela@u.w"
    admin_user_p1("angela@u.w")
    # And "angela@u.w" logs in
    p1_logs_in("angela@u.w")
    # When SAML IDP information is submitted to "saml.html"
    saml_idp_information_is_submitted_to_p1("saml.html")
    # Then result code "200" is returned
    result_code_p1_is_returned("200")
  end

  it "Non-SAML One-Time User Login (uid:887812cb-5d30-4907-895c-edda5d9e3420)" do
    # Given the tenant not configured for SAML
    the_tenant_not_configured_for_saml
    # And a one-time user credential
    a_onetime_user_credential
    # When the one-time user logs in
    the_onetime_user_logs_in
    # Then the one-time user page is presented.
    the_onetime_user_page_is_presented
  end

  it "SAML Super user login (uid:4f943a0d-d5be-49a6-81f2-ab825f39ff8c)" do
    # Given the tenant configured for SAML
    the_tenant_configured_for_saml
    # And existing super user "angela@u.w"
    existing_super_user_p1("angela@u.w")
    # When "angela@u.w" logs in
    p1_logs_in("angela@u.w")
    # Then "angela@u.w" is logged in
    p1_is_logged_in("angela@u.w")
  end

  it "SAML Session Detection (uid:a9eaa91b-4515-4f40-add5-db81e5983e1a)" do
    # Given the tenant configured for SAML
    the_tenant_configured_for_saml
    # And existing user "john@domain.com"
    existing_user_p1("john@domain.com")
    # And "john@domain.com" logs in with SAML
    p1_logs_in_with_saml("john@domain.com")
    # When "john@domain.com" access "page.html"
    p1_access_p2("john@domain.com", "page.html")
    # Then "page.html" is returned.
    p1_is_returned("page.html")
  end

  it "SAML Login Redirect (uid:dbba3e1c-997f-4a44-b540-f7fb4952229f)" do
    # Given the tenant configured for SAML
    the_tenant_configured_for_saml
    # And existing user "john@domain.com"
    existing_user_p1("john@domain.com")
    # And "john@domain.com" is not logged in
    p1_is_not_logged_in("john@domain.com")
    # When "john@domain.com" accesses page.html
    p1_accesses_pagehtml("john@domain.com")
    # Then a redirect to the SAML IDP URL returned
    a_redirect_to_the_saml_idp_url_returned
  end

  it "SAML Login Acceptance for Existing User (uid:838fa6bc-747f-4134-b7b1-24d560af7b8b)" do
    # Given the tenant configured for SAML
    the_tenant_configured_for_saml
    # And existing user "john@domain.com"
    existing_user_p1("john@domain.com")
    # When a SAML POST response for "john@domain.com" is sent to "saml.html"
    a_saml_post_response_for_p1_is_sent_to_p2("john@domain.com", "saml.html")
    # Then "john@domain.com" is logged in
    p1_is_logged_in("john@domain.com")
  end

  it "SAML Login Acceptance for New User (uid:06979cba-51f7-4ad5-9219-af42f73e841e)" do
    # Given the tenant configured for SAML
    the_tenant_configured_for_saml
    # And user "john@domain.com" with no account
    user_p1_with_no_account("john@domain.com")
    # When a SAML POST response for "john@domain.com" is sent to "saml.html"
    a_saml_post_response_for_p1_is_sent_to_p2("john@domain.com", "saml.html")
    # Then user account "john@domain.com" is created
    user_account_p1_is_created("john@domain.com")
    # And "john@domain.com" is logged in
    p1_is_logged_in("john@domain.com")
  end

  it "SAML Non-Super user login (uid:52eaab71-4c8a-4027-af9d-8958e034e486)" do
    # Given the tenant configured for SAML
    the_tenant_configured_for_saml
    # And existing user "john@domain.com"
    existing_user_p1("john@domain.com")
    # And "john@domain.com" is not a super user
    p1_is_not_a_super_user("john@domain.com")
    # When "john@domain.com" logs in
    p1_logs_in("john@domain.com")
    # Then "p1" is not logged in
    p1_is_not_logged_in("p1")
    # And result code "401" is returned
    result_code_p1_is_returned("401")
  end
end
