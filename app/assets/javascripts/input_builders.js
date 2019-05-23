(function(exports) {

  var build_ingredients_input = function(id) {
    form = [`<label class="new-ingredient-label" for="ingredients_${id}_name">Ingredient: </label>`,
            `<input type="text" name="ingredients_${id}[name]" id="ingredients_${id}_name" required />`,
            `<label class="new-ingredient-label" for="ingredients_${id}_value">Amount: </label>`,
            `<input step="0.5" type="number" name="ingredients_${id}[value]" id="ingredients_${id}_value" required />`,
            `<label class="new-ingredient-label" for="ingredients_${id}_unit">Unit: </label>`,
            `<input type="text" name="ingredients_${id}[unit]" id="ingredients_${id}_unit" required />`
          ].join('')
    return form
  };

  var build_steps_input = function(id) {
    return `<input type="text" name="steps_${id}[description]" id="steps_${id}_description" required />`
  };

  exports.build_ingredients_input = build_ingredients_input,
  exports.build_steps_input = build_steps_input

})(this);
