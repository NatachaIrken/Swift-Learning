import Foundation

//POO
//abstraccion y clases: Conjunto de algo que queremos clasificar por sus atributos , métodos. Luego empezamos a instaciar, realizar copias de esa plantilla
//Herencia de las clases

class Test {
    var propiedad: Int?
    func metedo() {
        
    }
}

class TestHijo: Test {
    var nuevaPropiedad: Int?
}
let test = Test()
let testHijo = TestHijo()

test.propiedad = 1
testHijo.propiedad = 2

//Sobreescritura, cambiando la funcionalidad en metodos de la clase hija

// Siempre se crean las clases dentro de constantes, nunca de variables.
//La referencia al objeto es algo que no vamos a alterar, se crea en un let, pero no signitica que las propiedas no se puedan modificar, que son de tipo de var
//Una clase ha de tener sus propiedades inicializadas: estos son init designados o principales

var partida =  true
var puntos = 0

class Personaje {
    var vida: Int
    var fuerza: Int
    var muerto = false
//  var magia: Int? = nil
    var timer: Timer?
    
    func pierdeVida(cantidad:Int) {
        vida -= cantidad
        if vida <= 0 {
            haMuerto()
        }
    }
    
    func haMuerto() {
        muerto = true
    }
    
    init(vida:Int) {
        self.vida = vida
        self.fuerza = 40
    }
    // Inicializadores obligatorios
   required init(vida: Int, fuerza: Int) {
        self.vida = vida
        self.fuerza = fuerza
       //llamamos a una funcion a traves de un selector, estos forman parte de objc
       timer = Timer.scheduledTimer(timeInterval: 60, target: self, selector:#selector(self.sumaPunto), userInfo: nil, repeats: true)
    }
    init(fuerza:Int){
        self.vida = 100
        self.fuerza = fuerza
    }
    
    @objc func sumaPunto() {
        vida += 1
    }
    // Inicializadores de conveniencia secundarios : es un init que inicializa la clase, pero no inicializa por si misma, se apoya en un principal
   convenience init() {
       self.init(vida: 100, fuerza: 40)
       self.vida += 20
       self.pierdeVida(cantidad: 40)
    }
    // borrar memoria, apagando el timer. Utilizando la funcion de deinicilización
    deinit{
        if let timer = timer {
            timer.invalidate()
        }
    }
}


// Herencia

class Heroe: Personaje {
    enum Poderes {
        case espada, magia, saltar
    }
    var poder: Poderes
    
    init(vida:Int, fuerza:Int, poder:Poderes) {
        self.poder = poder
        super.init(vida: vida, fuerza: fuerza)
    }
    
    convenience init() {
        self.init(vida: 100, fuerza: 40, poder: .espada)
    }
    // Inicializadores obligatorios
    required init(vida: Int, fuerza: Int) {
        self.poder = .saltar
        super.init(vida: vida, fuerza: fuerza)
    }
    
    override func haMuerto() {
        partida = false
        super.haMuerto()
    }
}
let ladrona = Heroe(vida: 120, fuerza: 60, poder: .saltar)
let mago = Heroe(vida: 60, fuerza: 50, poder: .magia)

let guerrero = Heroe(vida: 150, fuerza: 100, poder: .espada)

let heroe = Personaje()
let heroe2 = Personaje(vida: 120, fuerza: 80)

heroe.vida
heroe.muerto
heroe.pierdeVida(cantidad: 20)



 class Enemigo: Personaje {
    enum Armas {
        case sable, arco, vara
    }
    var arma: Armas
    init(vida: Int, fuerza: Int, arma: Armas) {
        self.arma = arma
        super.init(vida: vida, fuerza: fuerza)
    }
    convenience init() {
        self.init(vida: 50, fuerza: 20, arma: .sable)
    }
     
     required init(vida: Int, fuerza: Int) {
         self.arma = .sable
         super.init(vida: vida, fuerza: fuerza)
     }
     
     // sobreescribe los metodos de su padre
     override func haMuerto() {
         puntos += fuerza
         super.haMuerto()
     }
}

let enemigo1 = Enemigo()
let enemigo2 = Enemigo(vida: 20, fuerza: 30, arma: .arco)

enemigo2.vida
enemigo2.muerto
enemigo2.pierdeVida(cantidad: 30)
enemigo2.vida
enemigo2.muerto

mago.vida
partida
mago.muerto
mago.pierdeVida(cantidad: 60)
mago.muerto
partida


