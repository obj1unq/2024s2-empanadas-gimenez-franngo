object gimenez {
    var fondo = 300000

    method fondo() {
        return fondo
    }

    //es mejor evitar tener empleado como variable y emplear el polimorfismo
    method pagarSueldo(empleado) {
        fondo -= empleado.sueldo()
        empleado.cobrar()
    }
}

object galvan  {
    var sueldo = 15000
    var saldo = 0
    //como dinero y deudas en realidad dependen del saldo (de si este es positivo o negativo), se modela es saldo y, a partir de este,
    //se averigua a los otros 2. Recordemos que, siempre que sea posible deducir algo, lo deducimos en vez que volverlo un atributo
    //(postcálculo por sobre precálculo)

    //getter
    method sueldo() {
        return sueldo
    }

    //setter
    method sueldo(_sueldo) {
        sueldo = _sueldo
    }

    method cobrar() {
        saldo += sueldo
    }

    method gastar(cantidad) {
        saldo -= cantidad
    }

    //opción más piola: return saldo.max(0)
    method dinero() {
        if(saldo>=0) {
            return saldo
        } else {
            return 0
        }
    }

    //opción más piola: return saldo.min(0).abs()
    method deuda() {
        if(saldo<0) {
            return saldo.abs()
        } else {
            return 0
        }
    }
}

object baigorria {
    var empanadasVendidas = 0
    const precioEmpanada = 15
    var totalCobrado = 0

    //no es setter de empanadas porque SUMA la cantidad y no la setea
    method vender(cantidad) {
        empanadasVendidas += cantidad
    }

    //no es getter xq el sueldo no es un atributo
    //si algo se puede deducir, entonces NO va como atributo, como en este caso (POSTCÁLCULO)
    method sueldo() {
        return precioEmpanada * empanadasVendidas
    }

    //el que tiene la mayor cantidad de información es a quien se le delega la responsabilidad
    //(el empleador no le paga, sino que es el empleado mismo quien se cobra)
    method cobrar() {
        totalCobrado += self.sueldo()
        empanadasVendidas = 0
    }

    //se nos pide en la consigna que baigorria entienda el mensaje totalCobrado()
    method totalCobrado() {
        return totalCobrado
    }
}
