import wollok.game.*
import pepita.*

object nido {
  var property position = game.at(5,5)
  
  method image() = "nido.png"

  method atravesable() {
    return true
  }

  method colision(personaje) {
		personaje.ganar()
	}
}

object silvestre {
  const presa = pepita

  method position() = game.at(self.x(), 0)

  method x(){
    const xPresa = presa.position().x() 

    return if(xPresa >= 3) xPresa else 3 
  }

  //method xPresa()= presa.position().x() 

  method image() = "silvestre.png"

  method atravesable() = true

  method colisionar(personaje) {
		personaje.perder()
	}
}

object gravedad {

    const property cuerposLibres = #{} //podría solo trabajar con pepita, pero dejo preparado para que otras cosas puedan caerse, quizas los alimentos?
     
    method agregar(cuerpoLibre) {
        cuerposLibres.add(cuerpoLibre)
    }

    method eliminar(cuerpoLibre) {
        cuerposLibres.remove(cuerpoLibre)
    }

    method comenzar() {
        game.onTick(800, "GRAVEDAD", {cuerposLibres.forEach({cuerpoLibre => cuerpoLibre.caer()})})
    }

    method detener() {
        game.removeTickEvent("GRAVEDAD")
    }
}

//Puedo pisar? a quién?
class Muro {
    var property position = game.at(4,5)

    method  image() {
        return "muro.png"
    }
    method atravesable() {
        return false
    }
}