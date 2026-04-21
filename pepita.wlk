import wollok.game.*
import extras.*
object pepita {
	const perseguidor = silvestre

	var energia = 100

	var property position = game.at(2,3)
    	
	// method position() = position
	// method position(newPosition) {
	// 	position = newPosition
	// }
    method estado(){
	    return if(self.atrapada()) "gris" else "libre"
		//return if(position == perseguidor.position()) "gris" else "libre"
	}

	method atrapada() = position == perseguidor.position()

	method color() = "113300FF"
	method text() = "\n\n\n\n" + energia


    //TESTEAR!!!!!!!!
	method image() = "pepita-" + self.estado() + ".png"
	//method image() = "pepita-" +  (if(self.atrapada()) "gris" else "libre") + ".png"

	method positionX() = position.x()

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

    method mover(direccion){
	  position = direccion.siguiente(position)

	}


	method volar(kms) {
		energia = energia - 10 - kms 
	}
	
	method energia() = energia

}

