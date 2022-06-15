import Foundation

// struct tipos de datos por valor y no por referencia, no tienen herencia.
//struct: el self que nos los referencia es inmutable

struct Empleado {
    enum Departamentos {
        case contabilidad, informática, administración, diseño
    }
    var nombre: String
    let apellidos: String
    let departamento: Departamentos
    var salario: Double
    
    init(contabilidad nombre: String, apellidos: String){
        self.nombre = nombre
        self.apellidos = apellidos
        self.departamento = .contabilidad
        self.salario = 3000000
    }
    
    init(informatica nombre: String, apellidos: String) {
        self.nombre = nombre
        self.apellidos = apellidos
        self.departamento = .informática
        self.salario = 4000000
    }
    
    func impuesto() -> Double {
        var retencion = 0.13
        switch salario {
        case let sueldo where sueldo > 3500000: retencion = 0.42
        case let sueldo where sueldo > 300000: retencion = 0.33
        case let sueldo where sueldo > 31000: retencion = 0.25
        case let sueldo where sueldo > 240000: retencion = 0.18
        default: ()
        }
        return salario * retencion
    }
    // se cambia de let a var la propiedad salario + mutating en la función
   mutating func subirSalario(aumento:Double) {
        self.salario += aumento
    }
}

var empleado1 = Empleado(contabilidad: "Julio", apellidos: "Fernandez")
let empleado2 = Empleado(informatica: "Sheldon", apellidos: "Cooper")
empleado1.nombre = "Leonard"
empleado1.impuesto()
empleado1.subirSalario(aumento: 15000)


