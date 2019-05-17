import { build_ingredients_input, build_steps_input } from '../../app/assets/javascripts/input_builders.js';

test('build_ingredients_input returns an name, value and unit inputs with given id', () => {
    expect(build_ingredients_input(1)).toBe('<input type="text" name="ingredients_1[name]" id="ingredients_1_name" /><input step="0.5" type="number" name="ingredients_1[value]" id="ingredients_1_value" /><input type="text" name="ingredients_1[unit]" id="ingredients_1_unit" />');
  });
test('input_builder returns an name, value and unit inputs ', () => {
    expect(build_steps_input(1)).toBe('<input type="text" name="steps_1[description]" id="steps_1_description" />');
  });
