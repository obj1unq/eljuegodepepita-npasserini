import wollok.game.*

object izquierda {
  method siguiente(position) {
    if (position.x() <= 0) self.error("Estás en el límite del tablero")
    return position.left(1)
  }
}

object derecha {
  method siguiente(position) {
    if (position.x() >= game.width() - 1) self.error("Estás en el límite del tablero")
    return position.right(1)
  }
}

object abajo {
  method siguiente(position) {
    if (position.y() <= 0) self.error("Estás en el límite del tablero")
    return position.down(1)
  }
}

object arriba {
  method siguiente(position) {
    if (position.y() >= game.height() - 1) self.error("Estás en el límite del tablero")
    return position.up(1)
  }
}