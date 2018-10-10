import 'dart:io';

var alfabeto = {'A' : '00000', 'B' : '01011', 'C' : '10011', 'D' : '00100', 
'E' : '01100', 'F' : '00101', 'G' : '10110', 'H' : '00111', 'I' : '00110', 
'J' : '00001', 'K' : '01010', 'L' : '11000', 'M' : '01110', 'N' : '10101', 
'O' : '11001', 'P' : '01000', 'Q' : '10000', 'R' : '10100', 'S' : '01101', 
'T' : '10111', 'U' : '01111', 'V' : '10001', 'W' : '01001', 'X' : '00010', 
'Y' : '00011', 'Z' : '10010'};

var mensaje = "mas esta fuerza tiene el amor, si es perfecto, que olvidamos nuestro "
"contento por contentar a quien amamos fundaciones";

var historia = 
"La santa, madre y maestra en el tercer milenio"
" Los santos no mueren; rebasan su tiempo y se perpetúan. Más si se trata de alguien, como "
"Teresa, que ha vivido profundamente el misterio de Dios y del hombre, que ha sabido "
"expresarlo en palabras limpias y claras, y que ha vivido por los otros: la iglesia, el mundo."
" Muchos la veneraban, aún en vida, como madre y como maestra."
"A los seis años de su muerte, en 1588, fray Luis de León edita sus obras fundamentales, Vida,"
" Camino y Moradas, quedando para comienzos del siglo siguiente el libro de las Fundaciones. "
"La Iglesia reconoce muy pronto oficialmente su santidad de vida";

void main() {
  /*stdout.writeln('Type something');
  String input = stdin.readLineSync();*/
  
  String transformado = menToAlfa(mensaje);
  String texto = removeExtraChar(historia);
  print(texto.length);
  var ltexto = stringToChar(texto);
  var lmensaje = stringToChar(transformado);
  var codificado = modificar(ltexto, lmensaje);
  print(codificado);
  print("---------------");
  stdout.writeln('$transformado');
  print(historia);


}

menToAlfa(text) {
  var noSpaceText = removeExtraChar(text);
  var texto = "";
  var contador = 0;
  noSpaceText.runes.forEach((int rune) {
    var character=new String.fromCharCode(rune);
    texto = texto+alfabeto[character];
    contador++;
  });
  print(texto.length);
  return texto;
}

removeExtraChar(text){
  var menUpper = text.toUpperCase();
  var removeComma = menUpper.replaceAll(",", "");
  var removeDot = removeComma.replaceAll(".", "");
  var removeNumbers = removeN(removeDot);
  var removeENE = removeNumbers.replaceAll("Ñ", "N");
  var newText = removeENE.replaceAll(" ", "");
  newText = newText.replaceAll("—", "");
  newText = newText.replaceAll(";", "");
  newText = newText.replaceAll(":", "");
  return newText;
}

removeN(text){
  var texto = text;
  var numeros = ["0","1","2","3","4","5","6","7","8","9"];
  for (var i = 0; i < 10; i++) {
    var textoN = texto.replaceAll(numeros[i], "");
    //print(textoN);
    texto = textoN;
  }
  var tildes = ["Á","É","Í","Ó","Ú"];
  var nonTilde = ["A","E","I","O","U"];
  for (var i = 0; i < 5; i++) {
    var textoT = texto.replaceAll(tildes[i], nonTilde[i]);
    texto = textoT;
  }
  return texto;
}

modificar(ltexto, lmensaje){
  var newText = "";
  for (var i = 0; i < ltexto.length; i++) {
    var caracter = ltexto[i];
    if(lmensaje[i] == "1"){
      caracter = caracter.toLowerCase();
    }
    newText = newText + caracter;
  }
  
  return newText;
}

stringToChar(texto){
  var lista = [];
  texto.runes.forEach((int rune){
    var character=new String.fromCharCode(rune);
    lista.add(character);
  });
  return lista;
}
