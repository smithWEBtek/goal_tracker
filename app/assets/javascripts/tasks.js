function Task(task) {
  this.id = task.id;
}

Task.addSubmitListener = function() {
  $(document).on("submit", "#new_task", function(e) {
    e.preventDefault();
    $.post(this.action, $(this).serialize(), Task.handleSubmit, "json");
  });
}

$(function() {
  Task.addSubmitListener();
})
