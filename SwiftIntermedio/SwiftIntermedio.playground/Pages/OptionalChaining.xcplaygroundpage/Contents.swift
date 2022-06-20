import Foundation

//Encadenamiento de opcionales: Es una forma por la que podemos acceder a las propiedades o métodos de un objeto que es opcional.
// pasar a través de una instancia o propieda opcional con ? porque no sabemos si será o no nil. si es nil, no pasará del ? y no hará nada


class Compositor {
    var name: String
    var filmografia: Filmografia?
    
    init(name: String) {
        self.name = name
    }
}

class Pelicula {
    var nombre: String
    var año: Int?
    var cd: CD?
    
    init(nombre:String) {
        self.nombre = nombre
    }
    
}

class CD {
    var duracion: Double?
    var npistas: Int?
}

class Filmografia {
    var peliculas = [Pelicula] ()
    var fichaIMDB: URL?
}

let mg = Compositor(name:"Michael Giacchino")
let tomorrowland = Pelicula(nombre: "Tomorrowland")
let jurassicworld = Pelicula(nombre: "Jurassic World")

let giachinno_film = Filmografia()
giachinno_film.peliculas = [tomorrowland,jurassicworld]

let pistas = CD()
pistas.duracion = 73.24
pistas.npistas = 20

tomorrowland.cd = pistas
mg.filmografia = giachinno_film

func buscarPelicula (pelis:[Pelicula], titulo: String) ->  Int? {
    for (indice, film) in pelis.enumerated() {
        if film.nombre == titulo {
            return indice
        }
    }
    return nil
}

//if let filmografia = mg.filmografia, let indice = buscarPelicula(pelis: filmografia.peliculas, titulo: "tomorrowland"), let cd = filmografia.peliculas[indice].cd, let duracion = cd.duracion {
//            print("La banda sonora de \(filmografia.peliculas[indice].nombre) tiene una duracion \(duracion)")
//}

//encadenamiento de opcionales:

if let peliculas = mg.filmografia?.peliculas, let indice = buscarPelicula(pelis: peliculas, titulo: "Tomorrowland"), let duracion = mg.filmografia?.peliculas[indice].cd?.duracion {
    print("La banda sonora de \(mg.filmografia!.peliculas[indice].cd?.duracion) tiene una duracion \(duracion)")
}
