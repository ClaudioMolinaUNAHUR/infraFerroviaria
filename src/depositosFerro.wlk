import vagones.*
import locomotoras.*
import formaciones.*
class DepositoFerroviario{
	var formaciones = []
	var locomotorasSueltas = []
	method formacionConVagonMasPesado(){
		return formaciones.filter({pesoMax => pesoMax.vagonMasPesado()})
	}
	method necesitaConductorExperimentado(){
		return formaciones.find({c => ((c.locomotoras().size() + c.vagones().size()) > 8) && c.peso() > 80000})
	}
	method hayLocomotoraParaFormacion(numFormacion){
		return locomotorasSueltas.any(self.codigoParaArrastreMayorQueEmpujeDe(numFormacion))
	}
	method locomotoraParaFormacion(numFormacion){
		return locomotorasSueltas.find(self.codigoParaArrastreMayorQueEmpujeDe(numFormacion))
	}
	method agregarLocomotora(numFormacion){
		if(not formaciones.get(numFormacion).puedeMoverse() && self.hayLocomotoraParaFormacion(numFormacion)){
			formaciones.get(numFormacion).agregarLocomotoras([self.locomotoraParaFormacion(numFormacion)])
		}
	}
	method codigoParaArrastreMayorQueEmpujeDe(unaFormacion){
		return {c => c.pesoArrastre() >= formaciones.get(unaFormacion).kilosDeEmpujeParaMoverse()}
	}
}
