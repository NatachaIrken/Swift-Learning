import Foundation

//Falibilidad la capacidad que tendrá una función class, struct o enum, de fallar en su propósito por
//que los datos son inapropiados, por lo que devolvemos nil (devuelven un dato opcional)

// Funcion falible: devuelve un opcional

func sumar(numeros:[Int]) -> Int? {
    if numeros.isEmpty {
 //     return 0
        return nil
    }
    var resultado = 0
    for numero in numeros {
        resultado += numero
    }
    return resultado
}

var numeros1 = [Int]()
var numeros2 = [2,5,8,10,15,18]
var numeros3 = [-2,5,-3]
// numeros1 devuelve un nil
sumar(numeros: numeros1)
sumar(numeros: numeros2)
sumar(numeros: numeros3)


// class Compositor {
struct Compositor {
    var name: String
//Aqui hago que el inicializador sea falible, colocando ? para que compositor 2 tenga un valor nil.
 //   Al hacerlo opcional las otras instancias de la clase, tambien quedan opcionales
    init? (name:String) {
        self.name = name
        if name.isEmpty {
            return nil
        }
    }
        // Se crea otro init sin ? para que su instancia no sea de tipo opcional
    init() {
        self.name = "Compositor desconocido"
    }
}

let compositor1 = Compositor(name: "Yiruma")
let compositor2 = Compositor(name: "")
//esta instancia no es de tipo opcional
let compositor3 = Compositor()

enum Semana:String {
    case lunes, martes, miercoles, jueves, viernes, sabado, domingo
}

let dia1:Semana = .miercoles
//RawValue = inicializador falible
let dia2 = Semana(rawValue: "Lunes")

enum DiasSemana {
    case lunes, martes, miercoles, jueves, viernes, sabado, domingo
    init?(valor:Character) {
        switch valor {
            case "L", "l": self = .lunes
            case "M", "m": self = .martes
            case "X", "x": self = .miercoles
            case "J", "j": self = .jueves
            case "V", "v": self = .viernes
            case "S", "s": self = .sabado
            case "D", "d": self = .domingo
            default:return nil
        }
    }
}

let dial = DiasSemana(valor: "1")
let diam:DiasSemana = .lunes
