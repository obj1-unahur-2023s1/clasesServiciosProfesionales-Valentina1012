
class Persona{
	var property provincia
	
	method puedeSerAtendido(profesional){
		return profesional.provinciasDondePuedeTrabajar().contains(self.provincia())
	}
}

class Institucion{
	const universidades=[]
	
	method puedeSerAtendido(profesional){
		return universidades.any({uni=>uni==profesional.universidad()})
	}
}