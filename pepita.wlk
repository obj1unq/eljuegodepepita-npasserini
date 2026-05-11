import wollok.game.*
import extras.*
object pepita {
	const perseguidor = silvestre
	var energia = 100
	var property position = game.at(2,3)
	var estado = viva
    	
	method init() {
		estado = viva
		position = game.at(2,3)
		energia = 100
	}

	method estado() {
		return if(self.atrapada()) "gris" else "libre"
		//return if(position == perseguidor.position()) "gris" else "libre"
	}

	method atrapada() = position == perseguidor.position()

	method color() = "113300FF"
	method text() = "\n\n\n\n" + energia + ""

	//TESTEAR!!!!!!!!
	method image() = "pepita-" + self.estado() + ".png"
	//method image() = "pepita-" +  (if(self.atrapada()) "gris" else "libre") + ".png"

	method positionX() = position.x()

	method comerAca() {
		self.comer(game.uniqueCollider(self))
	}

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
		game.removeVisual(comida)
	}

  method mover(direccion) {
		estado.mover(direccion)
	}

	method volar(kms) {
		energia = energia - 9 * kms 
	}
	
	method energia() = energia

	method morir() { 
		estado = muerta
	}
}

object viva {
	method mover(direccion) {
		pepita.position(direccion.siguiente(pepita.position()))
		pepita.volar(1)
	}
}

object muerta {
	method mover(direccion) {
		self.error("Pepita esta muerta")
	}
}