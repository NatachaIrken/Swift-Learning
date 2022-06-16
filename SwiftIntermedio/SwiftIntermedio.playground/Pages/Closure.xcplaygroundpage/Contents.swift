import Foundation

// Closure función anónima. Función que no tiene nombre en los parámetros, pero si se puede renombrar dentro de la especificación.
// Para crear un closure: Eliminamos func, eliminamos el nombre de la función, ponemos { en vez de func y nomnbre, Quitar la llave que abre especificación y ponemos la palabra in en su lugar

_ = { () -> () in }
// agregamos para _ para no utilizar la etiqueta
func sumar3(_ numero: Int) -> Int {
    return numero + 3
}

var suma3 = {(numero: Int) -> Int in
    return numero + 3
}

sumar3(2)
//no tiene nombre de parámetro
suma3(2)

//Closure como parámetros en funciones
//Tipificar un tipo de función: (Tipo de entrada) -> Tipo de salida
//                                (Int)           ->    Int

func sumatorio(valor:Int, sumaFunc:(Int) -> Int) -> Int {
    return sumaFunc(valor)
}

//                especificación                  implementación
let closure = {(valorNumero:Int) -> Int in return valorNumero + 5 }
// o let closure = { $0 + 5 }

sumatorio(valor: 4, sumaFunc: closure)
sumatorio(valor: 4, sumaFunc: {(valorNumero:Int) -> Int in return valorNumero + 5 })

// Reducción de los closures
sumatorio(valor: 4, sumaFunc: { valorNumero in return valorNumero + 5 })

// Parámetro abreviado de los closures  $0, si hay más parámetros agregamos 1,2,3 etc al $
sumatorio(valor: 4, sumaFunc: { $0 + 5 })

// trailing closure o closure de cierre
sumatorio(valor: 4) { $0 + 5 }
let suma = sumatorio(valor: 4) { $0 + 5 }
suma

func repetir(veces: Int, tarea:() -> ()) {
    for _ in 0..<veces {
        tarea()
    }
}

repetir(veces: 6) { print("repite") }
func unaTarea() {
    print("Estoy haciendo algo")
}

repetir(veces: 10, tarea: unaTarea)
