import wollok.game.*

object pepita {
	var energia = 100
	var property position = game.at(2,3)

	// method position() = position
	// method position(newPosition) {
	// 	position = newPosition
	// }

	method image() = "pepita.png"
	method positionX() = position.x()

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() = energia

}

