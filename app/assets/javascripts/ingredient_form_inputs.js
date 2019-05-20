var counter = 1;

$(".ingredients.new").ready(function() {
  counter = 1;
  document.getElementById(
    `ingredient_${counter}`
  ).innerHTML = build_ingredients_input(counter);

  document
    .getElementById("add_ingredient_button")
    .addEventListener("click", function(event) {
      event.preventDefault();
      counter += 1;
      document.getElementById(
        `ingredient_${counter}`
      ).innerHTML = build_ingredients_input(counter);
    });

  document
    .getElementById("remove_ingredient_button")
    .addEventListener("click", function(event) {
      event.preventDefault();
      document.getElementById(`ingredient_${counter}`).innerHTML = "";
      counter -= 1;
    });
});
