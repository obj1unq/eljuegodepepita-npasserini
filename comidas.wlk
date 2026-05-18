import wollok.game.*
import randomizer.*

class Manzana {
	const base = 5
	var madurez = 1

	var property position = game.origin()

	method image() {
		return "manzana.png"
	}

	method energiaQueOtorga() {
		return base * madurez	
	}
	
	method madurar() {
		madurez = madurez + 1
		//madurez += 1
	}

    // method atravesable() {
    //     return true
    // }

	method colisionar(personaje) {
		personaje.comer(self)
		game.removeVisual(self)
	}
}

//const alpiste = new Alpiste(energiaQueAporta = 100)

//Esto es reemplazado por una instancia de Alpiste referenciada por la variable global alpiste.
/*object alpiste {

	method position() {
		return game.at(3,8)
	}
	
	method image() {
		return "alpiste.png"
	}

	method energiaQueOtorga() {
		return 20
	} 
    method atravesable() {
        return true
    }

	method colision(personaje) {
		personaje.comer(self)
	}
}*/

class Alpiste {
    const property peso = 40 //Si no se dice al instanciar se utiliza este valor por defecto.
	//const property energiaQueAporta //Obliga a que al crearlo se deba indicar un valor.
	var property position = game.origin()
	
	method image() {
		return "alpiste.png"
	}

	method energiaQueOtorga() {
		return peso
	} 

    // method atravesable() {
    //     return true
    // }

	method colisionar(personaje) {
		personaje.comer(self)
		game.removeVisual(self)
		comidas.liberarComida()
	}
}

class AlpisteCambiante {
    const property pesoMin = 40
	const property pesoMax = 100
	
	var property position = game.origin()
	
	method image() {
		return "alpiste.png"
	}

	method energiaQueOtorga() {
		return pesoMin.randomUpTo(pesoMax).truncate(0)
	} 

    // method atravesable() {
    //     return true
    // }

	method colisionar(personaje) {
		personaje.comer(self)
		game.removeVisual(self)
		comidas.liberarComida()
	}
}

//Ejemplo con factory (fábrica). 
object manzanaFactory {
	method crear() {
		return new Manzana(position = randomizer.emptyPosition())
	}
}

object alpisteFactory {
	method crear() {
		return new Alpiste(position = randomizer.emptyPosition(), peso=40.randomUpTo(100).truncate(0))
	}
}

object alpisteCambianteFactory {
	method crear() {
		return new AlpisteCambiante(position = randomizer.emptyPosition())
	}
}

object comidas {
	const factories = [alpisteFactory, manzanaFactory, alpisteCambianteFactory, manzanaFactory]
	var enElTablero = 0

	method liberarComida(){
		enElTablero -= 1
	}

	method comenzar() {
		game.onTick(3000, "COMIDAS", {self.nuevaComida()})
	}

	method maximo() {
		return 3
	}

	method nuevaComida() {
		if (enElTablero < self.maximo()) {
			game.addVisual(self.crearComida())
			enElTablero += 1
		}
	}

	method crearComida() {
		return self.elegirFactory().crear()
	}
	
	method elegirFactory() {
		return factories.anyOne()
		// Para probabilidades raras
		// const probabilidad =  0.randomUpTo(1) 
		// if (probabilidad.between(0, 0.15)) {
		// 	return alpisteFactory
		// }
		// else if (probabilidad.between(0.15,0.65)) {
		// 	return manzanaFactory
		// }
		// else {
		// 	return milanesaFactory
		// }
	}

	method remover(comida) {
		if (enElTablero.contains(comida)){ //lo dejo con un if porque pepita podría comer cosas que no están en el tablero, por ejemplo en los tests
			enElTablero.remove(comida)
		}
	}
}
