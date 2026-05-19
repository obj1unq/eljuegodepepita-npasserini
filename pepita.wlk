import direcciones.*
import extras.*
import comidas.*
import wollok.game.*
import nivel.*

object ganadora {
	
	method image() = "ganadora"

	method ganar(ave){
		ave.terminar("gané!")
	}

	method puedeIr(siguientePosicion) {
		return false
	}
}
object perdedora {

	method image() = "perdedora"
	
	method perder(ave){
		ave.terminar("perdí!")
	}

	method puedeIr(siguientePosicion) {
		return false
	}
}

object cansada {

	method image() = "perdedora"
	
	method perder(ave){
		ave.estado(perdedora)
		ave.perder()
	}

	method puedeIr(siguientePosicion) {
		return false
	}
}

object libre {
 	method image() = "libre"

	method ganar(ave){
		ave.estado(ganadora)
		ave.ganar()
	}

	method perder(ave){
		ave.estado(perdedora)
		ave.perder()
	}

	method puedeIr(siguientePosicion) {
		return tablero.dentro(siguientePosicion) and not juego.hayObstaculo(siguientePosicion)
	}
}

object pepita {
	var energia = 100

	var property position = game.origin()

	var property estado = libre
	
	method image() {
		return "pepita-" + estado.image() + ".png"
	}

	method text() {
		return energia.toString()
	}
	method textColor() {
		return "FF0000FF"
	}
	
	method ganar() {
		estado.ganar(self)
	}
	
	method perder() {
		estado.perder(self)
	}

	method terminar(mensaje) {
		game.say(self, mensaje)
		gravedad.detener()
		game.schedule(2000, {game.stop()})
	}


	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
		if (game.hasVisual(comida)){ //lo dejo con un if porque pepita podría comer cosas que no están en el tablero, por ejemplo en los tests
			game.removeVisual(comida)
		}
	}

	method validarVolar(distancia){
		if (not self.puedeVolar(distancia)) {
			self.error("No puedo volar " + distancia)
		}
	}

	method volar(kms) {
		self.validarVolar(kms)
		energia = energia - self.energiaQueGasta(kms)
	}
	
	method energia() {
		return energia
	}

	method energiaQueGasta(distancia) {
		return  10 + distancia
	}

	method puedeVolar(distancia) {
		return self.energiaQueGasta(distancia) <= energia
	}

	method puedeMover(siguientePosicion) {
		return self.puedeVolar(1) and self.puedeIr(siguientePosicion) 
	}
	
	method puedeIr(siguientePosicion) {
		return self.estado().puedeIr(siguientePosicion)
	} 

	method validarMover(siguientePosicion){
		if (not self.puedeMover(siguientePosicion)) {
			self.error("No puedo ir ahí")
		}
	}

	method mover(direccion) {
		const siguientePosicion = direccion.siguiente(position)
		self.validarMover(siguientePosicion)
		self.volar(1)
		position = siguientePosicion
	}
	
	method caer() {
		const siguiente = abajo.siguiente(position)
		//para pensar: por que acá hago un if e ignoro mientras que en el mover valido y rompo?
		if (self.puedeIr(siguiente)) {
			position = siguiente
		}
		else{
			if (not self.puedeVolar(1)) { //Si no pudo caer y no puede volar más, entonces perdió
				self.perder()
			}
		}
	}

}

