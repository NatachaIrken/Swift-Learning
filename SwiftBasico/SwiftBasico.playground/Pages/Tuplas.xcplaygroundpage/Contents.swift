import Foundation

//Tuplas: Tipo de dato por valor ( dato dentro de var o let) , no por referencia. Son varios tipos de datos, encapsulados bajo un mismo nombre

let dic1:[String:String] = ["Film": "Interstellar","Director": "Chris Nolan", "Musica": "Hans Zimmer"]

//Tupla: valores () y separados por coma
for (clave, valor) in dic1 {
    print(clave,valor)
}

//Permite acceder a sus propiedades através de una etiqueta. Se le pueden quitar las etiquetas de igual forma
let pelicula = (pelicula: "El señor de los anillos", año: 2001)
pelicula.0
pelicula.1
pelicula.pelicula
pelicula.año

let pelicula2:(pelicula: String, año: Int)
let pelicula3:(String, Int) = ("Jurassic World", 2015)



// Asignando datos por descomposición

print(pelicula)

let (film, year) = pelicula

film
year

let nombre = pelicula.pelicula

// Arrays de Tuplas:

let otrasPeliculas:[(pelicula: String, año: Int, ranking: Int)] = [("Tomorrowland", 2015, 9), ("Inside Out", 2015, 9), ("Interstellar", 2014, 10), ("Groundhog Day", 1993, 8), ("The goonies", 1985, 9), ("The dark knight", 2008, 9), ("Artificial Intelligence", 2001, 10), ("Jurasic Park", 1993, 8)]

for film in otrasPeliculas {
    print("La pelicula \(film.pelicula) se estrenó el año \(film.año) y tiene una valoración de \(film.ranking)")
}

// Me va sacar los datos que sean > 9

for film in otrasPeliculas where film.ranking > 9 {
    print("La pelicula \(film.pelicula) se estrenó el año \(film.año) y tiene una valoración de \(film.ranking)")
}

//Switch con PlaceHolder (Se usa para ignorar el resto de valores de la tupla), utilizo let para capturar valores y where para preguntar

for film in otrasPeliculas {
    var mensaje: String
    switch film {
    case(_, 2015, _): mensaje = "La pelicula \(film.pelicula) es de 2015"
    case let (_, year, _) where year < 2000: mensaje = "La película \(film.pelicula) es anterior al año 2000"
        // colocamos en mensaje "" (vacio) cuando no encuentra ninguno de los case anteriores pasa al default apareciendo nada,
       // para que no aparzcan saltos de linea utilizar un if (if =!mensaje.isEmpy { print(mensaje) }
    default: mensaje = ""
    }
    if !mensaje.isEmpty {
    print(mensaje)
    }
}

// Asignación de variables a través de tuplas

//let var1 = "Hola"
//let var2 = "K ases"
//let var3 = "Programas"
//let var4 = "O ke ases"

// Tupla con los 4 valores String

//let valores = ("Hola","K ases", "Pogramas", "O k ases")
//
//let (var1,var2,var3,var4) = valores
//var1
//var2
//var3
//var4

// o se puede ser realizar de igual forma:

let (var1,var2,var3,var4) = ("Hola","K ases", "Pogramas", "O k ases")

var x = 320
var y = 200

// Asigno valores intercambiados, decomponiendo la tupla. Y va ir a la X y X va ir a la Y

(x,y) = (y,x)
