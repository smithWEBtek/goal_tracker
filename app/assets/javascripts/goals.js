$(function() {
  $(document).on("click", ".next", (e) => {
    e.preventDefault();
    const $target = $(e.currentTarget);

    $.getJSON("/goals/" + $target.data("id"), goals => {
      const currIndex = goals.findIndex(goal => { return goal.id === $target.data("id") })
      const nextIndex = (currIndex + 1) % goals.length;
      const nextGoal = goals[nextIndex];
      $("#show").empty().html(nextGoal["show"]);
      $target.data("id", nextGoal["id"]);
      history.pushState(null, null, "/goals/" + nextGoal["id"]);
    });
  });
});
