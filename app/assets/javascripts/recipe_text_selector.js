$(".ocr_output").ready(function() {

  new DragSelect({
    selectables: document.getElementsByClassName('selectable'),
    area: document.getElementById('ocr_text_container'),
    callback: function(e) {
      var string = ''
      for (i = 0; i < e.length; i++) { string += htmlDecode(e[i].innerHTML) }
      copyStringToClipboard(string)
    }
  });
});

function copyStringToClipboard (str) {
   var el = document.createElement('textarea');
   el.value = str;
   el.setAttribute('readonly', '');
   el.style = {position: 'absolute', left: '-9999px'};
   document.body.appendChild(el);
   el.select();
   document.execCommand('copy');
   document.body.removeChild(el);
}

function htmlDecode(input){
  var e = document.createElement('div');
  e.innerHTML = input;
  return e.childNodes[0].nodeValue;
}
