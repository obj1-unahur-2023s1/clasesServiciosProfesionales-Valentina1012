class Universidad {
	var property provincia
	var property pago
	var property totalRecaudado=0
}


object asociacionProfesionalesLitoral{
	var property totalRecaudado=0
}

class ProfesionalAsociado {
	var property universidad /*UNIVERSIDAD DONDE ESTUDIO*/
	
	method provinciasDondePuedeTrabajar() { return #{"Entre Ríos", "Corrientes", "Santa Fe"} }
	
	method honorariosPorHora() { return 3000 }
	
	method cobrarImporte(importe){
		asociacionProfesionalesLitoral.totalRecaudado(importe)
	}
}


class ProfesionalVinculado {
	var property universidad /*UNIVERSIDAD DONDE ESTUDIO*/
	
	method provinciasDondePuedeTrabajar(){
		return [universidad.provincia()].asSet()
	}
	method honorariosPorHora(){
		return universidad.pago()
	}
	method cobrarImporte(importe){
		universidad.totalRecaudado(importe/2)
	}
}


class ProfesionalLibre {
	var property universidad /*UNIVERSIDAD DONDE ESTUDIO*/
	var property honorariosPorHora
	var totalRecaudado=0
	const provincias=[]
	
	method provinciasDondePuedeTrabajar(){
		return provincias.asSet()
	}
	method agregarProvincia(provincia){
		provincias.add(provincia)
	}
	method quitarProvincia(provincia){
		provincias.remove(provincia)
	}
	method cobrarImporte(importe){
		totalRecaudado+=importe
	}
	method pasarDinero(profesionalLibre, cantidad){
		totalRecaudado-=cantidad
		profesionalLibre.cobrarImporte(cantidad)
	}
}