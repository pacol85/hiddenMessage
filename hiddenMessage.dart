import 'dart:io';

//alphabet with 26 characters into binary code
var alfabeto = {'A' : '00000', 'B' : '01011', 'C' : '10011', 'D' : '00100', 
'E' : '01100', 'F' : '00101', 'G' : '10110', 'H' : '00111', 'I' : '00110', 
'J' : '00001', 'K' : '01010', 'L' : '11000', 'M' : '01110', 'N' : '10101', 
'O' : '11001', 'P' : '01000', 'Q' : '10000', 'R' : '10100', 'S' : '01101', 
'T' : '10111', 'U' : '01111', 'V' : '10001', 'W' : '01001', 'X' : '00010', 
'Y' : '00011', 'Z' : '10010'};

//Message that will be hidden on bigger text or story
var mensaje = "mas esta fuerza tiene el amor, si es perfecto, que olvidamos nuestro "
"contento por contentar a quien amamos fundaciones";

//Big text or story that will contain the hidden message. It's even better for it to be 
//matching with the hidden message in a way to make people believe the message might be
//right in front of you instead of being some kind of cypher
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
  
  //The lenght for both the Binary message and the Big text without extra characters should
  //be the same size otherwise it won't work
  String transformado = menToAlfa(mensaje);
  print("Binary message length: " + transformado.length.toString());
  String texto = removeExtraChar(historia);
  print("Big text length: " + texto.length.toString());
  var ltexto = stringToChar(texto);
  var lmensaje = stringToChar(transformado);
  var codificado = modificar(ltexto, lmensaje);
  split("Encrypted message to be delivered (you still need to add the removed charactes to it)");
  print(codificado);
  split("Binary message");
  stdout.writeln('$transformado');
  split("Original story or Big Text (just to have as reference)");
  print(historia);
}

/*
function to add titles in between prints
*/
split(title){
  print("\n----$title----");
}

/*
Message to Alphabet, transforms the message into binary code
*/
menToAlfa(text) {
  var noSpaceText = removeExtraChar(text);
  var texto = "";
  var contador = 0;
  noSpaceText.runes.forEach((int rune) {
    var character=new String.fromCharCode(rune);
    texto = texto+alfabeto[character];
    contador++;
  });
  return texto;
}

/*
Function to remove all extra characters that aren't part of the alphabet selected
 */
removeExtraChar(text){
  var newText = text.toUpperCase();
  newText = newText.replaceAll(",", "");
  newText = newText.replaceAll(".", "");
  newText = removeN(newText);
  newText = newText.replaceAll("Ñ", "N");
  newText = newText.replaceAll(" ", "");
  newText = newText.replaceAll("—", "");
  newText = newText.replaceAll(";", "");
  newText = newText.replaceAll(":", "");
  return newText;
}

/*
Function to remove numbers and to change tildes to non tilded letters 
*/
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

/*
Function to transform the story to uppercase and lowercase in regards to the binary message
1 equals lowercase
0 equals uppercase
*/
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

/*
Transforms the text received into a list of characters 
*/
stringToChar(texto){
  var lista = [];
  texto.runes.forEach((int rune){
    var character=new String.fromCharCode(rune);
    lista.add(character);
  });
  return lista;
}
