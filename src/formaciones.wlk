import vagones.*
import locomotoras.*
class Formacion {
	var vagones = []
	var cantVagonesPopulares = 0
	var locomotoras = []
	method vagones(){
		return vagones
	}
	method locomotoras(){
		return locomotoras
	}
	method agregarVagones(listaVagones){
		vagones.addAll(listaVagones)
	}
	method agregarLocomotoras(listaLocomotoras){
		locomotoras.addAll(listaLocomotoras)
	}
	method pasajerosTotales(){
		return vagones.sum({pasajerosAContar => pasajerosAContar.cantPasajeros()})
	}
	method esPopular(){
		return vagones.count({vagonesPopu => vagonesPopu.cantPasajeros() > 50})
	}
	method esCarguera(){
		return vagones.all({vagonesCarga => vagonesCarga.cantidadMaximaDeCarga() >= 1000})
	}
	method vagonMasPesado(){
		return vagones.max {masPesado => masPesado.peso()}
	}
	method vagonMasLiviano(){
		return vagones.min {masLiviano => masLiviano.peso()}
	}
	method dispersionDePesos(){
		return self.vagonMasPesado().peso() - self.vagonMasLiviano().peso()
	}
	method cantBanios(){
		return vagones.count{conBanios => conBanios.tieneBanio()}
	}
	method hacerMantenimiento(){
		vagones.forEach({ordenar => ordenar.estaOrdenado(true)})
		vagones.forEach({arreglarMadera =>arreglarMadera.maderasSueltas( 0.max(arreglarMadera.maderasSueltas()-2) )})
	}
	method vagonConMasPasajeros(){
		return vagones.max {masPasajeros => masPasajeros.cantPasajeros()}
	}
	method estaEquilibrado(){
		return self.vagonConMasPasajeros().cantPasajeros() - vagones.find ({noSupera20 =>noSupera20.cantPasajeros()<20}).cantPasajeros()
	}
	method velocidadMaxima(){
		return locomotoras.min({ velocidad => velocidad.velocidad()}).velocidad()
	}
	method esEficiente(){
		return locomotoras.all{eficientes => eficientes.esEficiente()}
	}
	method fuerzaDeArrastre(){
		return locomotoras.sum{potencia =>potencia.pesoArrastre()}
	}
	method peso(){
		return vagones.sum({pesoVagones =>pesoVagones.peso()}) + locomotoras.sum({pesoMotor =>pesoMotor.peso()})
	}
	method puedeMoverse(){
		return self.fuerzaDeArrastre() >= self.peso()
	}
	method kilosDeEmpujeParaMoverse(){
		return 0.max(self.peso() - self.fuerzaDeArrastre())
	}
	method estaOrganizada(){
		var vagonesPasajeros = vagones.filter{c => c.cantPasajeros() > 0}
		var vagonesCarga = vagones.filter{c => c.cantPasajeros() == 0}
		return (vagonesPasajeros + vagonesCarga) == vagones
	}
}