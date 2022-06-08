import Foundation

// Conjuntos o set: Tipo de dato que no se puede declarar utilizando la inferencia. Colección no ordenada donde no se puede acceder a los datos de el.
//Se pueden realizar: unión, symmetricDifference( elementos no comunes en los conjuntos a comparar, resta, intersección

var conjunto1 = Set<String>()
var conjunto2:Set = ["Dragon ball", "Slam Dunk", "Los caballeros del zodiaco"]

conjunto1.count

conjunto2.contains("Dragon ball")

//Permite acceder al primer valor del conjunto

conjunto1.first
conjunto2.first


conjunto2.insert("Sakura card captor")

conjunto2.remove("Slam Dunk")

//Iteración sobre conjuntos, entrega los datos en cualquier orden

for valor in conjunto2 {
    print(valor)
}

//Sorted para ordenar la iteración de los datos

for valor in conjunto2.sorted() {
    print(valor)
}

// Algebra de conjuntos: Unión, symmetricDifference( elementos no comunes en los conjuntos a comparar, resta, intersección ( Elementos comunes en conjuntos)

var personajesDragonBall:Set = ["Gokú", "Vegeta", "Trunks", "Gohan", "Krilim", "Yamcha"]
var personajesSlamDunk:Set = ["Hanamichi", "Rukawa", "Akagi", "Miyagi", "Mitsui", "Kogure"]
var personajesSakuraCardCaptor:Set = ["Sakura", "Yukito", "Tomoyo", "Kero", "Eriol", "Syaoran"]
var seriesDeAccion:Set = ["Los caballeros del zodiaco", "Dragon ball", "Dragon fly", "Bersek", "Atack of titan"]
var seriesDeComediaAnime:Set = ["Slam Dunk", "Dragon Ball", "Dragon Fly"]

//Suma de elementos
var personajesShonen = personajesSlamDunk.union(personajesDragonBall)

//Se añaden elementos que no estaban
personajesShonen.formUnion(personajesDragonBall)

//Resta de conjuntos

var seriesAnimeAccion = seriesDeAccion.subtracting(personajesShonen)
seriesDeAccion.subtracting(personajesShonen)

//Intersección en conjuntos: Elementos en común entre conjuntos

var seriesComedia = seriesDeAccion.intersection(seriesDeComediaAnime)
seriesDeAccion.formIntersection(seriesDeComediaAnime)

// Subconjunto

seriesDeComediaAnime.isSubset(of: personajesSlamDunk)

//SuperConjunto

personajesSlamDunk.isSuperset(of: seriesDeComediaAnime)


//Comparación Estricta

seriesDeAccion.isStrictSuperset(of: seriesDeComediaAnime)

//Conjunto disjuntos, si no están inlcluidos , no tienen elementos iguales entre ellos

seriesDeAccion.isDisjoint(with: seriesDeComediaAnime)

