import Foundation

//Propiedades calculadas: no se guardan valores porque es almcenada

struct area {
    var ancho: Float
    var alto: Float
    var centro:(x: Float, y:Float) {
        get { return (ancho/2, alto/2) }
    // set tiene una propiedad que se crea = newValue
        set {
            ancho = newValue.x * 2
            alto = newValue.y * 2
        }
    }
}
//set: asignar los valores de propiedades almacenadas que afectan al calculo de la propiedad calculada, por si nosotros asignamos a traves de esta propiedad calculada las propiedades almacenadas den el mismo resultado que asignamos

var unArea = area(ancho: 60.7, alto: 40.3)

unArea.centro
unArea.ancho
unArea.alto
unArea.centro = (30.0, 40)
unArea.ancho
unArea.alto
unArea.centro

//Observadores de las propiedades, usar en una variable con valor inicial
//didSet = va a saltar cuando se realice el cambio de valor, willSet= salta cuando va a realizar el cambio de valor pero aun no se ha realizado
//oldvalue = propiedad de didset, que conserva el valor antiguo

var valorRango:Int = 0 {
    didSet {
        if valorRango < 0 {
            valorRango = 0
        }
        if valorRango > 100 {
                valorRango = 100
        }
    }
}

valorRango
valorRango = 60
valorRango
valorRango = 120
valorRango

//wilSet

class GuerreraElfa {
    enum Estado {
        case vivo, muerto
    }
    var fuerza = 80
    var destreza = 120
    var ataque:Int {
        get { return fuerza + destreza }
        set (nuevoValor) {
            fuerza = Int(Float(nuevoValor) * 0.4)
            destreza = nuevoValor - fuerza
        }
    }
    
    var vida = 100 {
        didSet {
            if estado == .muerto {
                vida = 0
            }
        }
        willSet {
            if newValue <= 0 {
                muerte()
            }
        }
    }
    var estado:Estado = .vivo
    
    func muerte() {
        print("Se quedó sin vida")
        estado = .muerto
    }
}

let guerrera = GuerreraElfa()
print(guerrera.fuerza, guerrera.destreza, guerrera.vida, guerrera.estado)
guerrera.ataque
guerrera.ataque = 240
print(guerrera.fuerza, guerrera.destreza, guerrera.vida, guerrera.estado)

guerrera.vida = 50
print(guerrera.fuerza, guerrera.destreza, guerrera.vida, guerrera.estado)

guerrera.vida = -10
print(guerrera.fuerza, guerrera.destreza, guerrera.vida, guerrera.estado)

// lazy properties: Es una propiedad cuyo valor inicial no se calcula hasta la primera vez que se llama. Es parte de una familia de propiedades en la que tenemos propiedades constantes, propiedades calculadas y propiedades mutables.

//class Facebook {
//
//    lazy var fbName: String? = self.recuperadoDatos()
//
//    func recuperadoDatos() -> String {
//        print("Conecto")
//        print("Tarda")
//        let dato = "Spock"
//        print("Termina")
//        return dato
//    }
//}
//
//let fb = Facebook()
//fb.fbName




//class Enemigo: Personaje {
//   enum Armas {
//       case sable, arco, vara
//   }
//   var arma: Armas

// Herencia de propiedades = sobreescritura de una propiedad de una clase padre, no se puede cambiar ni nombre ni el tipo de dato.
// convertir de una almacenada en un propiedad que sea calculada o ponerle observaddores de propiedad almacenada, solamente en el hijo

//override var vida: Int {
//    get {
//        return fuerza * 2
//    }
//    set }
//self.fuerza = newValue * 2
//}
//
//   convenience init() {
//       self.init(vida: 50, fuerza: 20, arma: .sable)
//   }
//
//    required init(vida: Int, fuerza: Int) {
//        self.arma = .sable
//        super.init(vida: vida, fuerza: fuerza)
//    }
//
//    // sobreescribe los metodos de su padre
//    override func haMuerto() {
//        puntos += fuerza
//        super.haMuerto()
//    }
//}


