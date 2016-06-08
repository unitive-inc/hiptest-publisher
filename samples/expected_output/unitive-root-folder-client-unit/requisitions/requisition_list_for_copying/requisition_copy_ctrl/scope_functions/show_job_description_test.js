describe('showJobDescription()', function () {
  beforeEach(function () {
    this.actionwords = Object.create(require('../../../../actionwords.js').Actionwords);
  });

  it('It should show a job description popup', function () {
    // Tags: client-unit
    // Given the setup for RequisitionCopyCtrl
    this.actionwords.theSetupForRequisitionCopyCtrl();
    // Then it should show a job description popup
    this.actionwords.itShouldShowAJobDescriptionPopup();
  });
});
