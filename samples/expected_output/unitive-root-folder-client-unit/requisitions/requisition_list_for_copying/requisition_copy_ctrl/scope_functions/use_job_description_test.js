describe('useJobDescription()', function () {
  beforeEach(function () {
    this.actionwords = Object.create(require('../../../../../actionwords.js').Actionwords);
  });

  it('It should request to copy the given req and navigate to the requisition edit page', function () {
    // Tags: client-unit
    // Given the setup for RequisitionCopyCtrl
    this.actionwords.theSetupForRequisitionCopyCtrl();
    // Then it should request to copy the given req and navigate to the requisition edit page
    this.actionwords.itShouldRequestToCopyTheGivenReqAndNavigateToTheRequisitionEditPage();
  });

  it('It should show an error if it fails', function () {
    // Tags: client-unit
    // Given the setup for RequisitionCopyCtrl
    this.actionwords.theSetupForRequisitionCopyCtrl();
    // Then it should show an error if it fails
    this.actionwords.itShouldShowAnErrorIfItFails();
  });
});
