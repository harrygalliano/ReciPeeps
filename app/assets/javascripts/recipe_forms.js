

var input_builder = function() {
  return '<input type="text" name="ingredients_1[name]" id="ingredients_1_name" /><input step="0.5" type="number" name="ingredients_1[value]" id="ingredients_1_value" /><input type="text" name="ingredients_1[unit]" id="ingredients_1_unit" />'
}

window.onload = function() {
    document.getElementById("ingredient_1").innerHTML = input_builder()
}