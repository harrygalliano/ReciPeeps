var step_input_builder = function(id) {
  return `<input type="text" name="steps_${id}[description]" id="steps_${id}_description" />`
}

var counter = 1

$(".steps.new").ready(function() {
  counter = 1
  document.getElementById(`step_${counter}`).innerHTML = step_input_builder(counter)

  document.getElementById('add_step_button').addEventListener("click", function(event){
    event.preventDefault()
    counter += 1
    document.getElementById(`step_${counter}`).innerHTML = step_input_builder(counter)
  });
});
