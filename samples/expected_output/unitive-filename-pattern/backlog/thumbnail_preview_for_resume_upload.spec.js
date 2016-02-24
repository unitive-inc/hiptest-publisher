describe('Thumbnail preview for resume upload', function () {
  beforeEach(function () {
    this.actionwords = Object.create(require('../actionwords.js').Actionwords);
  });

  it('Thumbnail preview of dragged/dropped resume', function () {
    // Given I am a job owner/editor, and I am going to use unitive resume reviewer
    this.actionwords.iAmAJobOwnereditorAndIAmGoingToUseUnitiveResumeReviewer();
    // When user drags and drops resume in field
    this.actionwords.userDragsAndDropsResumeInField();
    // Then a thumbnail preview shows of the resume in the field
    this.actionwords.aThumbnailPreviewShowsOfTheResumeInTheField();
  });
});
