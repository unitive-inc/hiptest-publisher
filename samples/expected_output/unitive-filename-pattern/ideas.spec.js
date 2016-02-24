describe('Ideas', function () {
  beforeEach(function () {
    this.actionwords = Object.create(require('./actionwords.js').Actionwords);
  });

  it('It\'s time for me to review resumes copy', function () {
    // Given I am user
    this.actionwords.iAmUser();
    // When I'm on the "Job Dashboard" page
    this.actionwords.imOnTheP1Page("Job Dashboard");
    // And job has 2 or more resumes added
    this.actionwords.jobHas2OrMoreResumesAdded();
    // And 0 reviewed
    this.actionwords.0Reviewed();
    // And 0 applicants approved for interview
    this.actionwords.0ApplicantsApprovedForInterview();
    // And there are no question-interviewers saved
    this.actionwords.thereAreNoQuestioninterviewersSaved();
    // Then "review resume" should be primary button and wiggle
    this.actionwords.p1ShouldBePrimaryButtonAndWiggle("review resume");
  });
});
