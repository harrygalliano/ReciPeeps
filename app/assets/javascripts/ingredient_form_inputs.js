var ingredient_input_builder = function(id) {
  form = [`<input type="text" name="ingredients_${id}[name]" id="ingredients_${id}_name" />`,
          `<input step="0.5" type="number" name="ingredients_${id}[value]" id="ingredients_${id}_value" />`,
          `<input type="text" name="ingredients_${id}[unit]" id="ingredients_${id}_unit" />`
        ].join('')
  return form
}

var counter = 1

$(".ingredients.new").ready(function() {
  counter = 1
  document.getElementById(`ingredient_${counter}`).innerHTML = ingredient_input_builder(counter)

  document.getElementById('add_ingredient_button').addEventListener("click", function(event){
    event.preventDefault()
    counter += 1
    document.getElementById(`ingredient_${counter}`).innerHTML = ingredient_input_builder(counter)
  });
});
