import Foundation
import AVFoundation
import PlaygroundSupport

// M= datos V= interfaz C= Encargado de coordinar el proceso de la app, y comunica la vista con el modelo. Patrón KVO = key value Observing crea observadores que crean notificaciones (controlador)


// Delegación en procesos asíncronos

class Reproductor: NSObject, AVAudioPlayerDelegate {
    var play = false
    var player = AVAudioPlayer()
    
    func reproduce(audio:String) {
        guard let path = Bundle.main.path(forResource: audio, ofType: "mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            player.delegate = self
            player.play()
            play = true
        }catch {
            fatalError("Error en la reproduccion")
        }
    }
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        play = false
        print("Se acabó la reproducción")
    }
}
// Se utiliza para ejecución indefinida.
//PlaygroundPage.current.needsIndefiniteExecution = true

let player = Reproductor()
player.reproduce(audio: "ScaryOver")


//Utilizar una propiedad que sea del tipo del protocolo a traves de un opcional
//Creamos un protocolo y creamos una clase en quien se delegará


protocol Delegacion {
    func finalDelegado(clase:Miclase)
}
//Esta clase se va a utilizar para delegar. Se inicializa a nil
class Miclase {
    var delegado:Delegacion?
    
    func accion(){
        let _ = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.finAccion), userInfo: nil, repeats: false)
    }
  //llama a la funcion delegada, pasandole mi clase
    @objc func finAccion() {
        delegado?.finalDelegado(clase: self)
    }
}

class clasequeUsaAccion: Delegacion {
    
    func activaAccion() {
        let clase = Miclase()
        clase.delegado = self
        clase.accion()
    }
    
    func finalDelegado(clase: Miclase) {
        print("se acabó la accción ejecutada")
        clase.delegado = nil
    }
}

let test = clasequeUsaAccion()
test.activaAccion()
