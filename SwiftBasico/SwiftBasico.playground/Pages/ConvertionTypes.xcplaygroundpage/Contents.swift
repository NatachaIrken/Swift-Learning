import Foundation
import UIKit

// Convertion Types: Upcast y Downcast

//Downcasting

let matrizMixta:[Any] = ["Uno", 2 , "tres", 4.0, true]

// Conversión forzada = utilizar cuando se esté seguro del valor del dato ej: que sea String, no Int y viceversa

let valor = matrizMixta[2] as! String

// Conversión condicional = Al colocar opcional el valor de la operación es opcional

let valor2 = matrizMixta[2] as? String


// Upcasting, /Conversión segura

let valorAny = "Tres" as Any

// Creación de Interfaz

let boton = UIButton(type: .system)
let etiqueta = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 20))
etiqueta.text = "Campo"
let campo = UITextField(frame: CGRect(x: 0, y: 100, width: 50, height: 30))
campo.placeholder = "Coloca un valor"

let interfaz = ["boton": boton, "etiqueta": etiqueta, "campo": campo]

// Vamos a realizar una conversión de el botón de la clase UIView a UIButtom
//Opción 1
let boton2 = interfaz["boton"] as! UIButton

//Downcast condicional.
//Opción Correcta, usando el if let nos va a sacar el valor opccional del diccionario y nos va a realizar la conversión del tipo de dato 

if let boton3 = interfaz["boton"] as? UIButton {

}
