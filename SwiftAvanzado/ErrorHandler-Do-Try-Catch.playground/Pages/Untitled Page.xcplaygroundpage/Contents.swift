import UIKit

// Control de errores: Do, try y catch
//clase bundler, llamamos a un metodo llamado path que es la fuente donde vamos a leer los datos

do {
    let rutaLectura = Bundle.main.path(forResource: "datos", ofType: "plist")
    let datos = FileManager.default.contents(atPath: rutaLectura!)
    let datosSwift = try PropertyListSerialization.propertyList(from: datos!, options: [], format: nil) as! [String: Any]
    let arrayPokemons = datosSwift["pokemons"] as! [String]
} catch {
    print(error.localizedDescription)
}
