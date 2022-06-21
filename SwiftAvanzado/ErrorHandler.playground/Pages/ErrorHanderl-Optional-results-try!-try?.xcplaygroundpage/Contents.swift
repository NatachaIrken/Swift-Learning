import Foundation

// Resultados opcionales, haciendo que throw se comporte como falible, dato opcional try?
//dato forzado con try! y enlace opcional de un try con throws para evitar errores

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
        defer {
            delegate?.cerramosProceso()
        }
    }
}

let producto1:[String:Any] = ["product": "Star wars rogue one bluray", "units": 100, "price": 10000]
let producto2:[String:Any] = ["product": "Apple iPhone 7 plus", "units": 50]

let bluray = try Producto(JSON: producto1)

//: Funciona como una función falible. Convertir una init de tipo throw en una falible
let blurays = try? Producto(JSON: producto2)

// al desempaquetar try! da un error ya que el producto 2 no cumple con todos los datos
//let blurays2 = try! Producto(JSON: producto2)

