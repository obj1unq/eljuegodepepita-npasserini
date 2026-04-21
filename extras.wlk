import wollok.game.*
import pepita.*

object silvestre {
  const presa = pepita

  method position() = game.at(self.x(), 0)

  method x(){
    const xPresa = presa.position().x() 

    return if(xPresa >= 3) xPresa else 3 
  }

  //method xPresa()= presa.position().x() 

  method image() = "silvestre.png"
}