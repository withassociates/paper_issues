window.PaperIssues = {};

PaperIssues.Relocator = function() {
  $(document).on('submit', '[data-role="relocator"]', function() {
    $('.relocator-overlay').css({ visibility: 'visible' });
    window.location = $(this).find('input').val();
  });
}

$(function() {
  PaperIssues.relocator = new PaperIssues.Relocator();
});
