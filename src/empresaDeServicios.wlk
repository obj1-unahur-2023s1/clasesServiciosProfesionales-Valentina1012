import solicitantes.*

class EmpresaDeServicios{
	const profesionales=[]
	var property honorario=0
	
	method profesionales(){
		return profesionales
	}
	
	method agregarProfesional(profesional){
		profesionales.add(profesional)
	}
	
	method quitarProfesional(profesional){
		profesionales.remove(profesional)
	}
	
	method cuantosEnUniversidad(universidad){
		return profesionales.count({profesional=>profesional.universidad()==universidad})
	}
	
	method profesionalesCaros(){
		return profesionales.filter({profesional => profesional.honorariosPorHora() > self.honorario()}).asSet()
	}
	
	method universidadesFormadoras(){
		return profesionales.map({profesional=>profesional.universidad()}).asSet()
	}
	
	method profesionalMasBarato(){
		return profesionales.min({profesional=>profesional.honorariosPorHora()})
	}
	
	method esAcotada(){
		return profesionales.all({profesional=>profesional.provinciasDondePuedeTrabajar().size()<=3})
	}
	
	method puedeSatisfacerA(solicitante){
		return profesionales.any({profesional=>solicitante.puedeSerAtendido(profesional)})
	}
}
