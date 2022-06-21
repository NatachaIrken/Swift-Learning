import Foundation
import Darwin


//Control de errores: Es importante el orden, lo primero que se coloca es el control de la calidad del dato y luego los errores que se pueden provocar a partir del mal uso del dato que se ha enviado

enum errores: Error {
    case subCadenaNoEncontrada, cadenaVacia, subcadenaVacia
}

//: Función convertida en tipo *throws*
//: Podemos usar fatalError si queremos parar la ejecución de la app

func posicionEn1(cadena:String, sub:String) throws -> Int {
    guard let rango = cadena.range(of: sub), !sub.isEmpty else {
        throw NSError(domain: "error", code: 0, userInfo: nil)
        throw errores.subCadenaNoEncontrada
        //fatalError("La cadena buscada no existe")
    }
    if cadena.isEmpty {
        throw errores.cadenaVacia
    }
    if sub.isEmpty {
        throw errores.subcadenaVacia
    }
    return cadena.distance(from: cadena.startIndex, to: rango.lowerBound)
}

let cadena1 = "One ring to rule them all"
let cadena2 = ""

// al colocar el throws me obliga a colocarlo dentro de lo que es el do y el catch
do {
    let pos = try posicionEn1(cadena: "One ring to rule them all", sub: "hobbit")
    print("La subcadena está en la posición \(pos)")
} catch {
    print("ERROR")
}

//: Creamos un tipo de Error personalizado
enum errorCadena:Error {
    case subNoEncontrada, cadenaVacia
}

//: Ahora el *throw* lanza nuestro tipo de error
func posicionEn(cadena:String, sub:String) throws -> Int {
    if cadena.isEmpty || sub.isEmpty {
        throw errorCadena.cadenaVacia
    }
    guard let rango = cadena.range(of: sub) else {
        throw errorCadena.subNoEncontrada
    }
    return cadena.distance(from: cadena.startIndex, to: rango.lowerBound)
}

//: Con los catch controlamos que throw es el que se ha lanzado
do {
    let pos = try posicionEn(cadena: "One ring to rule them all", sub: "ring")
    print("La subcadena está en la posición \(pos)")
    
} catch errorCadena.subNoEncontrada {
    print("No existe la subcadena en la cadena")
    
} catch errorCadena.cadenaVacia {
    print("Algunas de las cadenas es vacía")
}

//: También podemos usar el control de errores dentro de una extensión
extension String {
    enum errorCadena:Error {
        case subNoEncontrada, cadenaVacia
    }
    
    func posicionEn(sub:String) throws -> Int {
        if isEmpty || sub.isEmpty {
            throw errorCadena.cadenaVacia
        }
        guard let rango = range(of: sub) else {
            throw errorCadena.subNoEncontrada
        }
        return distance(from: startIndex, to: rango.lowerBound)
    }
}

//: Y usar el control tal cual con try directamente sobre el tipo extendido
do {
    let pos = try "One to rule them all".posicionEn(sub: "ring")
    print("La subcadena está en la posición \(pos)")
    
} catch String.errorCadena.subNoEncontrada {
    print("No existe la subcadena en la cadena")
    
} catch String.errorCadena.cadenaVacia {
    print("La cadena es vacía")
    
} catch {
    print("Ha ocurrido algo")
}
