import wollok.game.*

object izquierda{
  method siguiente(position){
 //   return if (position.x() > 0)position().left(1)) })	
//    //if(pepita.position().y() < self.height()-1) visual.position(visual.position().up(1)) })
//     //f(pepita.position().y() > 0) visual.position(visual.position().down(1)) })

  }

}

object derecha{
  method siguiente(position){
    return if (position.x() < game.width()-1) position.right(1) else position
  }

}

object abajo{
  method siguiente(position){
    //return
    //if(pepita.position().y() < self.height()-1) visual.position(visual.position().up(1)) })
     //f(pepita.position().y() > 0) visual.position(visual.position().down(1)) })
     //{ if (visual.position().x() < self.width()-1) visual.position(visual.position().right(1)) })
     //if (visual.position().x() > 0) visual.position(visual.position().left(1)) })	
  }

}

object arriba{
  method siguiente(position){
    //return
    //if(pepita.position().y() < self.height()-1) visual.position(visual.position().up(1)) })
     //f(pepita.position().y() > 0) visual.position(visual.position().down(1)) })
     //{ if (visual.position().x() < self.width()-1) visual.position(visual.position().right(1)) })
     //if (visual.position().x() > 0) visual.position(visual.position().left(1)) })	
  }

}