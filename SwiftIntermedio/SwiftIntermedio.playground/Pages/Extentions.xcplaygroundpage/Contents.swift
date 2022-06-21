import Foundation
import UIKit
import GameplayKit

//Extensiones: permite ampliar la funcionalidad de cualquier clase, struct,enum. Aunque no dispongamos del código fuente original de la misma. De cualquier libreria aunque está cerrada. Incluye nuevos métodos o propiedades (sólo calculadas).

extension String {
//Función PosicionEn para una cadena, recibe 2 parámetros de entrada (Función Falible)
    func posicionEn(sub:String) -> Int? {
    //guard que lo que hace es recuperar el rango de la subcadena, dentro de la cadena. Esto es un método que devueleve un opcional
        guard let rango = self.range(of: sub), !sub.isEmpty else {
            return nil
        }
        return self.distance(from: self.startIndex, to: rango.lowerBound)
    }
    var espacios: Int {
        get { return self.components(separatedBy: " ").count }
    }
}

let cadena = "A long time a go, in a galaxy far far away"
cadena.posicionEn(sub: "galaxy")
"One ring to them all".posicionEn(sub: "ring")
cadena.espacios


// Extensiones de protocolos (extensiones dan funcionalidad por defecto a los protocolos)
protocol Luchador {
    func lanzarAtaque() -> Int
    var ataque: Int { get set }
    var fuerza: Int { get set }
}

extension Luchador {
    func lanzarAtaque() -> Int {
        return GKRandomDistribution.init(forDieWithSideCount: ataque).nextInt()
    }
    var ataque: Int {
        get { return fuerza * 2 }
        set { fuerza = newValue / 2 }
    }
}

class Personaje {
    var vida: Int
    var muerto = false

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
    }
    
   convenience init() {
       self.init(vida: 100)
    }
}

class Heroe: Personaje, Luchador {
    enum Poderes {
        case espada, magia, saltar
    }
    
    var poder: Poderes
    var fuerza: Int
    
    init(vida:Int, fuerza:Int, poder:Poderes) {
        self.poder = poder
        self.fuerza = fuerza
        super.init(vida: vida)
    }
    
    convenience init() {
        self.init(vida: 100, fuerza: 40, poder: .magia)
    }
}

let aragorn = Heroe(vida: 200, fuerza: 150, poder: .espada)
aragorn.ataque
aragorn.lanzarAtaque()




