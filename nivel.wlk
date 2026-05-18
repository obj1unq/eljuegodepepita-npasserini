import wollok.game.*
import pepita.*
import direcciones.*
import extras.*
import comidas.*
import randomizer.*

object juego{    
    var property mapaActual = mapa
    const obstaculos = #{}

    method agregarObstaculo(obstaculo){
        obstaculos.add(obstaculo)
    }

    method hayObstaculo(posicion){
        return obstaculos.any({ obstaculo => obstaculo.position() == posicion})
    }

    method configurarJuego(){

        self.configurarTeclas()
        self.agregarVisuales()
		
        gravedad.agregar(pepita)
    	gravedad.comenzar()

	    game.onCollideDo(pepita, {algo => algo.colisionar(pepita)})
    }

    //Se descarta en pos de dibujar el mapa
    method agregarVisuales(){
        self.crearMapa()
        //game.addVisual(nido)
    	//game.addVisual(silvestre)
    	//game.addVisual(new Muro())
    	//game.addVisual(new Manzana())
    	//game.addVisual(new Alpiste())
        comidas.comenzar()
    	//game.addVisual(pepita)
    } 
    

    method configurarTeclas(){
	    keyboard.left().onPressDo({pepita.mover(izquierda)})
	    keyboard.right().onPressDo({pepita.mover(derecha)})
	    keyboard.up().onPressDo({pepita.mover(arriba)})
	    keyboard.down().onPressDo({pepita.mover(abajo)})
    }

    method crearMapa(){
        mapaActual.construir()
    }
}

object _{
    method dibujar(position) {

    }
}

object m{
    method dibujar(position) {
        const muro = new Muro(position=position)
        juego.agregarObstaculo(muro)
        game.addVisual(muro)
    }
}

object n{
    method dibujar(position) {
        nido.position(position)
        game.addVisual(nido)
    }

}

object p{
    
    method dibujar(position) {
        pepita.position(position)
    }
     
}

object s{
    method dibujar(position) {
        game.addVisual(silvestre)        
    }
}

object mapa {

    const dibujo =[
        [ _, _, _, m, _, _, n, _, _, _ ],
        [ _, _, _, m, _, _, _, _, _, _ ],
        [ _, _, _, m, _, _, _, _, _, _ ],
        [ _, _, _, m, _, _, _, _, _, _ ],
        [ _, _, _, m, m, m, _, _, _, _ ],
        [ _, _, _, _, _, _, _, _, _, _ ],
        [ _, _, _, m, m, _, _, _, _, _ ],
        [ p, _, _, _, _, _, _, _, _, _ ],
        [ _, _, _, s, _, _, _, _, _, _ ]
    ].reverse() //Es necesario el reverse porque el y=0 en realidad corresponde a la altura mas alta

    method construir() {
        game.height(dibujo.size()) //configuro el alto segun la cantidad de filas del dibujo
        game.width(dibujo.anyOne().size()) //configuro el ancho segun la cantidad de columnas del dibujo
        //itero por el ancho y luego por el alto.
        (0 .. game.width() - 1).forEach({ x => 
            (0 .. game.height() - 1).forEach({y => 
                dibujo.get(y).get(x).dibujar(game.at(x,y))  //obtengo el dibujante de la cordenada que corresponde a la iteracion y le pido que dibuje en esa cordenada
            })
        })
        game.addVisual(pepita)

    }





}