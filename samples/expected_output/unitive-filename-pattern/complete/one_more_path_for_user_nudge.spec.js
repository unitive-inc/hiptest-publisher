describe('One more path for user nudge', function () {
  beforeEach(function () {
    this.actionwords = Object.create(require('../actionwords.js').Actionwords);
  });

  it('Add applicant button', function () {
    // Tags: done
    // Given I am user
    this.actionwords.iAmUser();
    // Given I have saved at least one interview question to one interviewer on 'build interview' page or at least one resume reviewed
    this.actionwords.iHaveSavedAtLeastOneInterviewQuestionToOneInterviewerOnBuildInterviewPageOrAtLeastOneResumeReviewed();
    // And Job has 0 applicants approved for interview
    this.actionwords.jobHas0ApplicantsApprovedForInterview();
    // When I click "back to job dashboard"
    this.actionwords.iClickButton("back to job dashboard");
    // And "add applicants" button is blue and not wiggle
    this.actionwords.p1ButtonIsBlueAndNotWiggle("add applicants");
  });

  it('It\'s time for me to add applicant\'s resumes', function () {
    // Tags: done
    // Given I am user
    this.actionwords.iAmUser();
    // When I'm on the "JOB DASHBOARD" page
    this.actionwords.imOnTheP1Page("JOB DASHBOARD");
    // And Job is created
    this.actionwords.jobIsCreated();
    // And 0 resumes added
    this.actionwords.0ResumesAdded();
    // And 0 applicants approved for interview
    this.actionwords.0ApplicantsApprovedForInterview();
    // And there are no question-interviewers saved
    this.actionwords.thereAreNoQuestioninterviewersSaved();
    // Then "add resume" should be primary button and wiggle
    this.actionwords.p1ShouldBePrimaryButtonAndWiggle("add resume");
  });

  it('It\'s time for me to review resumes', function () {
    // Tags: done
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

  it('Schedule wiggle', function () {
    // Tags: done
    // Given I am user
    this.actionwords.iAmUser();
    // Given I have added any applicants 
    this.actionwords.iHaveAddedAnyApplicants();
    // And at least one interview question is saved (regardless of whether i've added or reviewed resumes)
    this.actionwords.atLeastOneInterviewQuestionIsSavedRegardlessOfWhetherIveAddedOrReviewedResumes();
    // When I click "back to job dashboard"
    this.actionwords.iClickButton("back to job dashboard");
    // And there is not already a scheduled interview 
    this.actionwords.thereIsNotAlreadyAScheduledInterview();
    // Then "Schedule" button is blue and NOT wiggle
    this.actionwords.p1ButtonIsBlueAndNOTWiggle("Schedule");
  });
});
