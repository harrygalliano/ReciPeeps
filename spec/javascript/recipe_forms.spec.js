require('recipe_forms.js')

describe("input_builder", () => { 

  test('input_builder returns an name, value and unit inputs ', () => {
      var test = input_builder();
    expect(test).toBe('<input type="text" name="ingredients_1[name]" id="ingredients_1_name" /><input step="0.5" type="number" name="ingredients_1[value]" id="ingredients_1_value" /><input type="text" name="ingredients_1[unit]" id="ingredients_1_unit" />');
    });
});

var input_builder = function() {
  return '<input type="text" name="ingredients_1[name]" id="ingredients_1_name" /><input step="0.5" type="number" name="ingredients_1[value]" id="ingredients_1_value" /><input type="text" name="ingredients_1[unit]" id="ingredients_1_unit" />'
}

