import Foundation

//Diccionario: Tipo de dato de coleccion, no ordenada. Devuelven valores opcionales ,
//var mutatble, let inmutable. Colecciones tipos de datos por valor

var diccionario:[Int:String] = [:]

diccionario = [1:"uno", 2:"dos", 3:"tres"]

var diccionario2:[Int:Int] = [1:5, 2:3, 6:7, 8:1]

//Inferencia de tipo

var diccionario3 = [5:"cinco", 6:"seis", 7:"siete"]
var diccionario4 = ["Uno":1, "Dos":2, "Tres": 3]

//Acceso a Datos ej:

diccionario2[6]
diccionario3[7]

//Desempaquetar el valor

if let valor = diccionario4["Dos"] {
    print(valor)
}

var diccionario6:[String:String] = ["nombre": "Victoria"]

diccionario6["nombre"] = "Victoria"

let diccionarioStar = [1977:"A new hope", 1980:"The empire strikes back", 1983:"The return of jedi", 1999:"The phantom Menace", 2002:"Attack of the clones", 2005:"Revenge of the sith",
    2015:"The force awakes", 2016:"Rogue one", 2017:"The last jedi"]

let diccionarioStars = ["Star wars": 1977, "The empire strickes back": 1980, "The return of jedi": 1983, "The phantom menace": 1999, "Atacj of clones": 2002
]
// Nos saca ambos valores como 1 solo

for detalle in diccionarioStar {
    print(detalle)
}

// Se interpolan los valores

for (año,film) in diccionarioStar {
    print("La pelicula \(film) se estrenó en \(año)")
}

//Se utiliza el where para rango de valores

for (año,film) in diccionarioStar where año < 1990 {
    print("La pelicula \(film) se estrenó en \(año)")
}

//Acceder a las .keys o .values

for valor in diccionarioStar.keys {
    print(valor)
}

// Para sacar los valores de un diccionario y meterlos a un Array

let array = [String]()

let arrayValores = [String](diccionarioStar.values)

//Para ordenar los datos del diccionario en el array, desempaqueto los datos

for clave in diccionarioStar.keys.sorted() {
    print("Película \(diccionarioStar[clave]!)")
}

// Crear un Array de Diccionario

let dic1:[String:String] = ["Film": "Interstellar", "Director": "Chris Nolan", "Música": "Hans Zimmer"]
let dic2:[String:String] = ["Film": "Jurassica World", "Director": "Colin Trevorrow", "Música": "Michael Giacchino"]

var arrayDiccionario = [[String: String]]()

arrayDiccionario.append(dic1)
arrayDiccionario.append(dic2)

// Sacar los valores del diccionario

if let film = arrayDiccionario[1]["Film"] {
    print(film)
}

// Colocar valor por defecto para que, si no tiene valor, devuelva 0. Se puede realizar de estas 2 formas

let añosStarWars1 = diccionarioStars["Star wars"] ?? 0
let añosStarWars = diccionarioStars["A new hope", default: 0]

