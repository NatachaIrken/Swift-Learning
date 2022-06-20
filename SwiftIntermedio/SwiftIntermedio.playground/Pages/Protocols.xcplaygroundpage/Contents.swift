import Foundation
import UIKit

//Protocolos: Plantilla de Requisitos/ condiciones, recoge solo la especificacion nunca el código. Asegurar una funcionalidad o componentes
//Protocolo, propiedad calculada.

//Utilizo CustomStringConvertible como propiedad calculada y con la propiedad description (propiedad calculada) a la que se le va a devolver un valor

class Bicho: CustomStringConvertible {
    var nombre: String
    
    var description: String {
    return self.nombre
    }
    
    init (nombre:String) {
        self.nombre = nombre
    
    }
}
let bichito = Bicho(nombre:"Cletus")
print(bichito)

// dentro del protocolo solo va la especificacion y propiedades calculadas no almacenadas. Cuando aplico el protoloco si me deja utlizar una propiedad almacenada


protocol MiProtocolo {
    func miFuncion()
    var variable:Int { get }
}
// Herencia de protocolos: suma de condiciones para cumplir el protocolo
protocol Miprotocolo2: MiProtocolo {
    init(numero:Int)
}

class MiClase: UIButton, MiProtocolo {
    var variable: Int {
        get {return 0 }
    }
    
    func miFuncion() {
        
    }
}
// Incluye los init requerido

class MiClase2: Miprotocolo2 {
    func miFuncion() {
        
    }
    var variable: Int = 0
    required init(numero: Int) {
    }
}

struct MiStruct: MiProtocolo {
    var variable: Int = 0
    func miFuncion() {
        
    }
}

enum MiEnum: MiProtocolo {
    var variable: Int {
        get { return 0}
    }
    func miFuncion() {
        
    }
}

 
// casos especiales en protocolos : struct ( ya que sus propiedades son inmutables)

protocol MiProtocolo3 {
   mutating func funcion()
    var otraVariable: Int { get }
}

//struct es inmutable

struct MiOtroStruct: MiProtocolo3 {
    var otraVariable: Int = 0
   mutating func funcion() {
        otraVariable += 1
    }
}
// ignora el mutating que existe en el protocolo

class MiOtraClase: MiProtocolo3 {
    var otraVariable: Int = 0
    func  funcion() {
    }
}

//Los protocolos de Swift tienen que cumplir todas las condiciones que coloquemos dentro de ellos, a menos que utilicemos @objc opcional dejando la propiedad no obligatoria dentro del protocolo

@objc protocol MiProtocol: class {
    func funcion()
    @objc optional var variable:Int { get }
}

class miClase: MiProtocol {
    func funcion() {
    
    }
}

// Protocolo para clases y struct o enum utilizando mutating

protocol Coloreable {
    mutating func colorear(color: UIColor)
}

class boton: UIButton, Coloreable {
    func colorear(color: UIColor) {
        self.setTitleColor(color, for: .normal)
    }
    
    func mostrar() {
        self.isHidden = true
    }
}

struct listas: Coloreable {
    var color: UIColor
    var datos = [String]()
    
    mutating func colorear(color: UIColor) {
        self.color = color
    }
}

let nuevoBoton = boton()
nuevoBoton.colorear(color: .green)

var nuevaLista = listas(color: .blue, datos: ["Dato1","Dato2","Dato3"])
nuevaLista.color
nuevaLista.colorear(color: .cyan)

// Protocolos como tipo de datos

let nuevoBoton1 = boton()
let nuevoBoton2 = boton()
let nuevoBoton3 = UIButton()

let nuevaLista1 = listas(color: .black, datos: ["1","2","3"])
let nuevaLista2 = listas(color: .red, datos: ["4","5","6"])

//Se realiza un array con un protocolo
var mundoColor = [Coloreable]()
mundoColor.append(nuevoBoton1)
mundoColor.append(nuevoBoton1)
mundoColor.append(nuevaLista)

// casting de datos. as! subir el tipo de datos a su protocolo conformado (botonN es de tipo boton) me pertite acceder a la funcion colorear
let botonN = mundoColor[1] as! boton


