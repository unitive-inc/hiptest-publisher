describe('Requisition List for Copying', function () {
  beforeEach(function () {
    this.actionwords = Object.create(require('../../actionwords.js').Actionwords);
  });

  it('It should show the search bar', function () {
    // Tags: e2e
    // Given I'm on the Job Copy page
    this.actionwords.imOnTheJobCopyPage();
    // Then it should show the search bar
    this.actionwords.itShouldShowTheSearchBar();
  });

  it('It should show the list of available reqs and the extra data with it', function () {
    // Tags: e2e
    // Given I'm on the Job Copy page
    this.actionwords.imOnTheJobCopyPage();
    // Then it should show the list of available reqs and the extra data with it
    this.actionwords.itShouldShowTheListOfAvailableReqsAndTheExtraDataWithIt();
  });

  it('It should show a no-data message when there are no reqs available to the user', function () {
    // Tags: e2e
    // Given I'm on the Job Copy page
    this.actionwords.imOnTheJobCopyPage();
    // Then it should show a no-data message when there are no reqs available to the user
    this.actionwords.itShouldShowANodataMessageWhenThereAreNoReqsAvailableToTheUser();
  });

  it('It should show a no-data message when there are no reqs after searching/filtering', function () {
    // Tags: e2e
    // Given I'm on the Job Copy page
    this.actionwords.imOnTheJobCopyPage();
    // Then it should show a no-data message when there are no reqs after searching/filtering
    this.actionwords.itShouldShowANodataMessageWhenThereAreNoReqsAfterSearchingfiltering();
  });

  it('It should show the job description when clicking the "Preview" button', function () {
    // Tags: e2e
    // Given I'm on the Job Copy page
    this.actionwords.imOnTheJobCopyPage();
    // Then it should show the job description when clicking the "Preview" button
    this.actionwords.itShouldShowTheJobDescriptionWhenClickingTheP1Button("Preview");
  });

  it('It should create a copy of the req and job description when clicking the "Replicate" button', function () {
    // Tags: e2e
    // Given I'm on the Job Copy page
    this.actionwords.imOnTheJobCopyPage();
    // Then it should create a copy of the req and job description when clicking the "Replicate" button
    this.actionwords.itShouldCreateACopyOfTheReqAndJobDescriptionWhenClickingTheP1Button("Replicate");
  });

  it('It should show ten reqs and a show more link', function () {
    // Tags: e2e
    // Given I'm on the Job Copy page
    this.actionwords.imOnTheJobCopyPage();
    // Then it should show ten reqs and a show more link
    this.actionwords.itShouldShowTenReqsAndAShowMoreLink();
  });
});
