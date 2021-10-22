class VagonPasajero {
	const property ancho
	const property largo
	const property tieneBanio
	var property estaOrdenado
	var property maderasSueltas = 0
	method cantPasajeros(){		
		if (estaOrdenado){
			return if (ancho <=3) {largo * 8} else {largo * 10}
		}else{
			return if (ancho <=3) {largo * 8} else {largo * 10} - 15
		}
	}
	method cantidadMaximaDeCarga(){
		return if (tieneBanio) {300} else {800}
	}
	method peso(){
		return 2000 + 80 * self.cantPasajeros() + self.cantidadMaximaDeCarga()
	}
	
}

class VagonCarga {
	const property cargaIdeal
	var property maderasSueltas
	var property estaOrdenado = true
	const property tieneBanio = false
	method cantPasajeros(){		
		return 0
	}
	method tieneBanio(){
		return false
	}
	method cantidadMaximaDeCarga(){
		return cargaIdeal - (400 * maderasSueltas)
	}
	method peso(){
		return 1500 + self.cantidadMaximaDeCarga()
	}
}

class VagonDormitorio {
	const property compartimientos
	const property cantCamas
	var property maderasSueltas = 0
	var property estaOrdenado = true
	const property tieneBanio = true
	method cantPasajeros(){		
		return compartimientos * cantCamas
	}
	method tieneBanio(){
		return true
	}
	method cantidadMaximaDeCarga(){
		return 1200
	}
	method peso(){
		return 4000 + 80 * self.cantPasajeros() + self.cantidadMaximaDeCarga()
	}
}
