import wollok.game.*

object manzana {
	const base = 5
	var madurez = 1
	
	method position() = game.at(5, 5)
	
	method image() = "manzana.png"
	
	method energiaQueOtorga() = base * madurez
	
	method madurar() {
		madurez += 1
	}
}

object alpiste {
	method energiaQueOtorga() = 20
}