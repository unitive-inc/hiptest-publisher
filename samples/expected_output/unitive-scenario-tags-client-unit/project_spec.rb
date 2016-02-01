# encoding: UTF-8
require 'spec_helper'
require_relative 'actionwords'

describe 'Unitive Sandbox' do
  include Actionwords

  it "It should show a job description popup" do
    # Tags: client-unit
    # Given the setup for RequisitionCopyCtrl
    the_setup_for_requisition_copy_ctrl
    # Then it should show a job description popup
    it_should_show_a_job_description_popup
  end

  it "It should request to copy the given req and navigate to the requisition edit page" do
    # Tags: client-unit
    # Given the setup for RequisitionCopyCtrl
    the_setup_for_requisition_copy_ctrl
    # Then it should request to copy the given req and navigate to the requisition edit page
    it_should_request_to_copy_the_given_req_and_navigate_to_the_requisition_edit_page
  end

  it "It should show an error if it fails" do
    # Tags: client-unit
    # Given the setup for RequisitionCopyCtrl
    the_setup_for_requisition_copy_ctrl
    # Then it should show an error if it fails
    it_should_show_an_error_if_it_fails
  end
end
