require('recipe_forms.js')

test('input_builder returns an name, value and unit inputs ', () => {
    expect(input_builder()).toBe('<input type="text" name="ingredients_1[name]" id="ingredients_1_name" /><input step="0.5" type="number" name="ingredients_1[value]" id="ingredients_1_value" /><input type="text" name="ingredients_1[unit]" id="ingredients_1_unit" />');
  });
