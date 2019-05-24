$(".recipes.show").ready(function() {
  var servings = parseInt(document.getElementById('serving-num').innerHTML);

  document
    .getElementById("plus-serving")
    .addEventListener("click", function(event) {
      event.preventDefault();
      ingredients = document.getElementsByClassName('ingredient-value')
      for (i=0; i<ingredients.length; i++) {
        var num = Number(ingredients[i].innerHTML)
        ingredients[i].innerHTML = ((num/servings) * (servings + 1)).toFixed(1)
      };
      servings = servings + 1
      document.getElementById('serving-num').innerHTML = servings
    });

    document
      .getElementById("minus-serving")
      .addEventListener("click", function(event) {
        event.preventDefault();
        if(servings <= 1){} else {
          ingredients = document.getElementsByClassName('ingredient-value')
          for (i=0; i<ingredients.length; i++) {
            var num = Number(ingredients[i].innerHTML)
            ingredients[i].innerHTML = ((num/servings) * (servings - 1)).toFixed(1)
          };
          servings = servings - 1
          document.getElementById('serving-num').innerHTML = servings
      }
    });
  });
