describe('Resume upload when Sovren fails', function () {
  beforeEach(function () {
    this.actionwords = Object.create(require('../actionwords.js').Actionwords);
  });

  it('Sovren fails', function () {
    // Given I am a user who is adding resumes
    this.actionwords.iAmAUserWhoIsAddingResumes();
    // When user drags and drops resume in field
    this.actionwords.userDragsAndDropsResumeInField();
    // And Sovren fails
    this.actionwords.sovrenFails();
    // Then user is notified that no data was detected in the PDF
    this.actionwords.userIsNotifiedThatNoDataWasDetectedInThePDF();
    // And is prompted for applicant first name, last name, email
    this.actionwords.isPromptedForApplicantFirstNameLastNameEmail();
    // And if they want to manually enter the rest of the info
    this.actionwords.ifTheyWantToManuallyEnterTheRestOfTheInfo();
  });

  it('User came back with no data', function () {
    // Given I am a user who is adding resumes
    this.actionwords.iAmAUserWhoIsAddingResumes();
    // When user drags and drops resume in field
    this.actionwords.userDragsAndDropsResumeInField();
    // And Sovren cannot parse the resume
    this.actionwords.sovrenCannotParseTheResume();
    // Then user is notified that no data was detected in the PDF
    this.actionwords.userIsNotifiedThatNoDataWasDetectedInThePDF();
    // And is prompted for applicant first name, last name, email
    this.actionwords.isPromptedForApplicantFirstNameLastNameEmail();
    // And if they want to manually enter the rest of the info
    this.actionwords.ifTheyWantToManuallyEnterTheRestOfTheInfo();
  });

  it('PNG creation fails', function () {
    // Given I am a user who is adding resumes
    this.actionwords.iAmAUserWhoIsAddingResumes();
    // When user drags and drops resume in field
    this.actionwords.userDragsAndDropsResumeInField();
    // And PNG creation fails
    this.actionwords.pNGCreationFails();
    // Then default icon of PDF displays
    this.actionwords.defaultIconOfPDFDisplays();
  });

  it('Resume\'s email already exists on that job', function () {
    // Given I am a user who is adding resumes
    this.actionwords.iAmAUserWhoIsAddingResumes();
    // When user clicks 'save' on parsed resume
    this.actionwords.userClicksSaveOnParsedResume();
    // And that email already has a resume in the system on that job
    this.actionwords.thatEmailAlreadyHasAResumeInTheSystemOnThatJob();
    // Then user is notified that this person already has a resume for this job - do you want to use that one? or the new one?
    this.actionwords.userIsNotifiedThatThisPersonAlreadyHasAResumeForThisJobDoYouWantToUseThatOneOrTheNewOne();
    // When I click 'yes, replace'
    this.actionwords.iClickYesReplace();
    // And the back end keeps the original
    this.actionwords.theBackEndKeepsTheOriginal();
  });
});
