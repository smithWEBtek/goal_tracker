function Goal(goal) {
  this.id = goal.id;
  this.show = goal.show;
}

Goal.addClickListener = function() {
  $(document).on("click", ".next", function(e) {
    e.preventDefault();
    Goal.clickEvent(this);
  });
}

Goal.clickEvent = function(target) {
  $target = $(target);
  $.getJSON("/goals/" + $target.data("id"), goals => {
    const currIndex = goals.findIndex(goal => goal.id === $target.data("id"))
    const nextIndex = (currIndex + 1) % goals.length;
    const nextGoal = new Goal(goals[nextIndex]);
    nextGoal.display();
    $target.data("id", nextGoal.id);
    history.pushState(null, null, "/goals/" + nextGoal.id);
  });
}

Goal.prototype.display = function() {
  $("#show").empty().html(this.show);
}

$(function() {
  Goal.addClickListener();
})
