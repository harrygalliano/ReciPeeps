var counter = 1

$(".steps.new").ready(function() {
  counter = 1
  document.getElementById(`step_${counter}`).innerHTML = build_steps_input(counter)

  document.getElementById('add_step_button').addEventListener("click", function(event){
    event.preventDefault()
    counter += 1
    document.getElementById(`step_${counter}`).innerHTML = build_steps_input(counter)
  });

  document.getElementById('remove_step_button').addEventListener("click", function(event){
    event.preventDefault()
    document.getElementById(`step_${counter}`).innerHTML = ''
    counter -= 1
  });
});
