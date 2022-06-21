import Foundation
import UIKit


//Control de errores: Inicializadores de tipo throw

protocol ProductoDelegate {
    func abrimosProceso()
    func cerramosProceso()
}

enum errorProducto: Error {
    case noProducto, noInventario, noPrecio
}

struct Producto {
    var delegate:ProductoDelegate?
    
    var nombre:String
    var precio:Int
    var unidades:Int
  
    // Declarar el init que tiene la capacidad de salir a partir de un throw
    init(JSON:[String:Any]) throws {
        delegate?.abrimosProceso()
        
        guard let productoJSON = JSON["product"] as? String else {
            throw errorProducto.noProducto
        }
        guard let inventarioJSON = JSON["units"] as? Int else {
            throw errorProducto.noInventario
        }
        guard let precioJSON = JSON["Price"] as? Int else {
            throw errorProducto.noPrecio
        }
        self.nombre = productoJSON
        self.unidades = inventarioJSON
        self.precio = precioJSON
        // se cierra el proceso sea cual sea la salida
        defer {
            delegate?.cerramosProceso()
        }
    }
}
    


