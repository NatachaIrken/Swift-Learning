import Foundation

//Enum: Exponer o nombrar de una manera sucesiva y uno tras otro los elementos que forman un conjunto, una serie o un todo. Podemos acceder a sus valores mediante un .
// tipo de dato que no es un dato ej: Int, Double
// Enum también puede utilizar inicializadores

enum Generos {
    case aventuras, acción, comedia, scifi, drama, infantil
    
    init() {
        self = .scifi
    }
}

var genero1 = Generos.comedia
var genero2:Generos = .acción

if genero1 == .comedia {
    print("es comedia")
}

var frase = "Esta peliculs es de tipo "
switch genero1 {
case .aventuras: frase += "aventura"
case .acción: frase += "acción"
case .comedia: frase += "comedia"
case .scifi: frase += "scifi"
case .drama: frase += "drama"
case .infantil: frase += "infantil"
}
print(frase)

// tipificar una enumenacion hashValue, rawValue
 
//enum Generos: Int {
//    case aventuras, acción, comedia, scifi, drama, infantil
//}

//genero1.rawValue
