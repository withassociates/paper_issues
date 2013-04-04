window.PaperIssues = {};

PaperIssues.Relocator = function() {
  $(document).on('submit', '[data-role="relocator"]', function() {
    window.location = $(this).find('input').val();
  });
}

$(function() {
  PaperIssues.relocator = new PaperIssues.Relocator();
});
