describe('Pointing', function () {
  beforeEach(function () {
    this.actionwords = Object.create(require('./actionwords.js').Actionwords);
  });

  it('Competency Focus Reminder', function () {
    // *note: bringing back this feature from the prototype based on researchers' suggestion to disrupt interviewers' tendency to focus on culture fit and like-ability with a reminder to fact-find just on the competencies they were assigned*
    // 
    // https://unitive.slack.com/files/sam/F0JV7R6AD/interview_reminder_modal.png
    // Given I am an interviewer
    this.actionwords.iAmAnInterviewer();
    // And I am on the prep page
    this.actionwords.iAmOnThePrepPage();
    // When I click "Start interview"
    this.actionwords.iClickButton("Start interview");
    // Then a modal appears
    this.actionwords.aModalAppears();
    // And it says "Focus on assessing the candidate's:"
    this.actionwords.itSaysMessage("Focus on assessing the candidate's:");
    // And the ... lists the competencies that interviewer was assigned in order of importance
    this.actionwords.theListsTheCompetenciesThatInterviewerWasAssignedInOrderOfImportance();
    // And interviewer clicks "okay" to close the pop up
    this.actionwords.interviewerClicksButtonToCloseThePopUp("okay");
  });
});
