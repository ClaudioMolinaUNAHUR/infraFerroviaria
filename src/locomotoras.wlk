import vagones.*

class Locomotora {
	var peso
	var pesoArrastre
	var velocidad
	method esEficiente(){
		return  (peso * 5) <= pesoArrastre
	}
	method velocidad(){
		return velocidad
	}
	method pesoArrastre(){
		return pesoArrastre
	}
	method peso(){
		return peso
	}	
}