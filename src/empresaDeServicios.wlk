import solicitantes.*
import profesionales.*

class EmpresaDeServicios{
	const profesionales=[]
	const clientes=[]
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
	
	method profesionalQuePuedeAtender(solicitante){
		return profesionales.find({profesional=>profesional.provinciasDondePuedeTrabajar().contains(solicitante.provincia())})
	}
	
	method cantidadClientes(){
		return clientes.size()
	}
	
	method tieneACliente(solicitante){
		return clientes.any({cliente=>cliente==solicitante})
	}
	
	method agregarClienteSiNoEsta(unCliente){
		if(!self.tieneACliente(unCliente)){
			clientes.add(unCliente)
		}
	}
	
	method quitarCliente(unCliente){
		clientes.remove(unCliente)
	}
	
	method darServicio(solicitante){
		if(self.puedeSatisfacerA(solicitante)){
			const profesional=self.profesionalQuePuedeAtender(solicitante)
			
			profesional.cobrarImporte(profesional.honorariosPorHora())
			self.agregarClienteSiNoEsta(solicitante)
		}
	}
	
	method profesionalEsAtracivo(unProfesional){
		const profQueCumplen=profesionales.filter({profesional=>profesional.provinciasDondePuedeTrabajar().contains(unProfesional.provinciasDondePuedeTrabajar())})
		var ret=false
		if(!profQueCumplen.isEmpty()){
			ret=profQueCumplen.any({profesional=>profesional.honorariosPorHora()<unProfesional.honorariosPorHora()})
		}
		return ret
	}
}
