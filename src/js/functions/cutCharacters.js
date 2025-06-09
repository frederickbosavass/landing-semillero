/*
    Funcion: Cortar caracteres // cutCharacters()
    Retorna: undefined
    Descripcion: se encarga de cortar un texto SIMPLE al numero de caracteres propuesto.
    EJ: 
        cutCharacters($(´.v-t-footer__text´), 55);
*/
/*window.cutCharacters = function ($text, maxCharacters, after) {
    if ($text.text().trim().length > maxCharacters) {
        $text.text($text.text().trim().substring(0, maxCharacters) + `${after}`);
    }
    return;
}*/

/*cortado de caractres por palabras- example de uso cutCharacters($('.class'), 120, "...");
 */
window.cutCharacters = function ($element, maxCharacters, after) {
    let textContent = $element.text().trim();
    if (textContent.length > maxCharacters) {
      let words = textContent.split(" ");
      let newText = "";
      for (let word of words) {
        if ((newText + word).length > maxCharacters) break;
        newText += (newText ? " " : "") + word;
      }
      $element.text(newText + after);
    };
  }
  