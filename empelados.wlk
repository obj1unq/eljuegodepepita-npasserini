object gimenez {
  var fondo = 300000
  
  method fondo() {
    return fondo
  }
  
  method pagarSueldo(empleado) {
    fondo -= empleado.sueldo()
    empleado.cobrar()
  }
}

object baigorria {
  var cantVendidas = 0
  var totalCobrado = 0
  var property precioEmpanada = 15

  method vender(cantidad) {
    cantVendidas += cantidad
  }
  
  method cobrarSueldo() {
    totalCobrado += self.sueldo()
    cantVendidas = 0
  }
  
  method sueldo() = precioEmpanada * cantVendidas
  
  method totalCobrado() = totalCobrado
}