import Foundation

//: Convertir una función convencional en una que lanza un closure
//Crearemos un closure, que será el que reciba la funcionalidad y sea el que haga la funcionalidad correspondiente

enum errores: Error {
    case subcadenaNoEncontrada, cadenaVacia, subCadenaVacia
}
                                                   //closure  - rethrows:  Puede permitir derivar todos los errores al clcosure de la                            funcion. No va a lanzar errores y va a contener funciones o elementos que van a devolver         un throw. No va   tener salida throws, sólo va a tener returns
func posicionEn(cadena: String, sub: String, funcion:(String, String) throws -> Int) rethrows -> Int {
//  Aquí hacemos el doble throws y ejecutamos funcion con el try para que el throw pase por él.
    return try funcion(cadena, sub)
}

let cadena1 = "One ring to rule them all"
let cadena2 = ""

do {
    try posicionEn(cadena: cadena1, sub: "ring") {
        if $0.isEmpty {
            throw errores.cadenaVacia
        }
        if $1.isEmpty {
            throw errores.subCadenaVacia
        }
        //el valor de guard let no está siendo usado. Solo lo usamos para comprobar que la subcadena existe.
        guard let rango = $0.range(of:$1) else {
            throw errores.subcadenaNoEncontrada
        }
        return $0.distance(from: $0.startIndex, to: rango.lowerBound)
    }
}catch errores.subcadenaNoEncontrada {
    print("La subcadena no existe")
}catch errores.cadenaVacia {
    print("La cadena está vacia")
}catch errores.subCadenaVacia {
    print("La subcandean está vacía")
}catch {
    print("Nosé qué pasó")
}
