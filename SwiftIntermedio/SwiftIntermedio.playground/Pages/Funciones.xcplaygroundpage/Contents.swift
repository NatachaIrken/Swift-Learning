import Foundation

//Funciones: Encapsulación de un código.
//La variable que coloquemos como parámetro, siempre será una constante  y no podrá modificarse su valor dentro de la función y no se puede colocar inferencia dentro de la función. La inferencia se usa en las llamadas a las funciones, no en la declaración

//func alerta() {
//let titulo = "Alerta"
//let mensaje = "Ha pulsado el botón"
//print("\(titulo) : \(mensaje)")
//}

//Parametros de entrada y condiciones

func alerta(mensaje: String, titulo: String) {
    let titulo = "Alerta"
    print("\(titulo) : \(mensaje)")
}

alerta(mensaje: "Gracias por llamar", titulo: "Aviso")
alerta(mensaje:"Ha ingresado", titulo: "Información")

// Parámetros de salida en funciones, que puedan devolver algo, un resultado.
// Utilizar return, para decirle lo que vamos a devolver

var test = [2, 5, 8, 20, 40, 1, 4, 18]

func sumar(numeros:[Int]) -> Int {
    var resultado = 0
    for numero in numeros {
        resultado += numero
    }
    return resultado
}

//func sumar(numeros:[Int]) -> Int {
//    if numeros.isEmpty {
//        return 0
//    }
//}

sumar(numeros: test)

let resultado = sumar(numeros: test)

sumar(numeros: [])

// Devolver más de un valor como resultado en funciones, utilizando tuplas ejemplo:
//Podemos colocar etiquetas además ej: -> (sumatoria: Int, multiplicacion : Int)

func sumaMultiple(numeros:[Int]) -> (sumatoria: Int,Int) {
    if numeros .isEmpty {
        return (0,0)
    }
    var resultado1 = 0
    var resultado2 = 1
    for numero in numeros {
        resultado1 += numero
        resultado2 *= numero
    }
    return (resultado1, resultado2)
}

//Accedemos a la etiqueta

let resultado2 = sumaMultiple(numeros: test).sumatoria
let resul = sumaMultiple(numeros: test)
resul.sumatoria
//let (suma, multiplica) = sumaMultiple(numeros: test)
suma
multiplica


//Polimorfirmo en funciones: misma función con mismo nombre, pero distintos parámetros

let test2 = [0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7, 0.8, 0.9]
func sumaMultiple(numeros:[Double]) -> (sumatoria: Double, Double) {
    if numeros .isEmpty {
        return (0.0 ,0.0)
    }
    var resultado1 = 0.0
    var resultado2 = 1.0
    for numero in numeros {
        resultado1 += numero
        resultado2 *= numero
    }
    return (resultado1, resultado2)
}

let (suma, multiplica) = sumaMultiple(numeros: test2)

func sumaMultiple(numeros: inout [Int], operacion: String) -> Int {
    var resultado = 0
    if operacion == "*" || operacion == "/" {
        resultado = 1
    }
    for numero in numeros {
        switch operacion {
        case "+": resultado += numero
        case "-": resultado -= numero
        case "*": resultado *= numero
        case "/": resultado /= numero
        default: ()
        }
    }
    numeros.append(resultado)
    return resultado
}
let resultadoM = sumaMultiple(numeros: &test, operacion: "*")


// Parámetro inout modificar valores dentro de una funcion de variables que están fuera de una función ( parámetros de entrada y salida inout)

// Parámetros externos ejemplo: colocamos una etiqueta al parámetro interno, para luego llamarlo más abajo

//func sumaMultiple( operador numeros:[Int], signo operacion: String) -> Int {
//    }
//let resultadoM = sumaMultiple(operador: test, signo: "*")



// Se puede reemplazar con un PlaceHolder, para luego sólo llamar al parámetro :

//func sumaMultiple(_ numeros:[Int], _ operacion: String) -> Int {
//    }
//let resultadoM = sumaMultiple(test, "*")


// Funciones variádicas : (Parecido a un array) Permiten usar un numero indeterminado de valores, para un mismo parámetro. Puedo seguir colocando valores dentro del array [Int...]

var test3 = [4,8,10,12,14,16,18,20]

func pruebaVaridiac (numero: Int...) -> Int {
    var prueba = 0
    for numero in test3 {
        prueba += numero
    }
    return prueba
}

let resultadoPrueba:Int = pruebaVaridiac(numero: 4,7,9,4,7,2,16,20)

// Defer, bloques diferidos en una funcion . Bloque de salida que se ejecuta al final de una funcion.
//


func conexionFacebook() {
    let errorInicio = false
    let errorValidacion = false
    let errorConexion = false
    
    defer {
        print("Cierra la conexión con facebook")
    }
    
    print("Inicio la conexión con Facebook")
    if errorInicio {
        print("Error de inicio")
        return
    }
    if errorValidacion {
        print("Error en la validación")
        return
    }
    if errorConexion {
        print("Error en la conexión")
        return
    }
    print("He conectado a facebook")
}

conexionFacebook()
