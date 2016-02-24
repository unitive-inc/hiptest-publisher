describe('Resume upload', function () {
  beforeEach(function () {
    this.actionwords = Object.create(require('../actionwords.js').Actionwords);
  });

  it('Form to upload resume for sovren-parsing', function () {
    // When I click "Add resume"
    this.actionwords.iClickButton("Add resume");
    // Then I arrive to "Add resume" page
    this.actionwords.iArriveToPagePage("Add resume");
    // And I see the field "Resume file (PDF only)" with button "Choose PDF"
    this.actionwords.iSeeTheFieldFieldWithButtonButton("Resume file (PDF only)", "Choose PDF");
  });

  it('Save uploaded resume', function () {
    // Here is some additional information.
    // When I click "select" on the resume pdf file
    this.actionwords.iClickButtonOnTheResumePdfFile("select");
    // Then the window closes
    this.actionwords.theWindowCloses();
    // And a progress bar loads to 100%
    this.actionwords.aProgressBarLoadsTo100();
    // Then I get a "save success" message
    this.actionwords.iGetAMessageMessage("save success");
  });

  it('Test for JIRA integration', function () {
    // This is for JIRA PT-8.
    // Tags: JIRA:PT-8
  });
});
