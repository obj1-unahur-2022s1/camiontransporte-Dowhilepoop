object knightRider {
	
	method peso() {return 500}
	method peligrosidad() {return 10}
}

object bumblebee {

	var esAuto = true
	//method esAuto() {return true}
	//method esRobot() {return true}
	method peso() {return 800}
	

	
	method seTransforma() {esAuto = !esAuto}
	method peligrosidad() {
		if (esAuto) {return 15}
		else {return 30}
		
	}
}

object paqueteLadrillos{
	var cantidad
	
	method cantidadLadrillos(cuantos) {cantidad = cuantos}
	method peso() {return cantidad * 2}
	method peligrosidad() {return 2}
}


object arena {

	var peso
	
	method pesoArena(kilogramos) {peso = kilogramos}
	method peso() {return peso}
	method peligrosidad() {return 1}
}

object bateriaAntiaerea {
	
	var tieneMisiles = true
	
	method estaConMisiles() {tieneMisiles = !tieneMisiles}
	method peso() {
		if (tieneMisiles) {return 300}
		else {return 200}
	}
	
	method peligrosidad() {
		if (tieneMisiles) {return 100}
		else {return 0}
	}
	
}

object contenedorPortuario {
	var contenido = []
	
	method agregarContenedor(unaCosa) {contenido.add(unaCosa)}
	method quitarContenedor(unaCosa) {contenido.remove(unaCosa)}
	method peso() {return 100 + contenido.sum({cosa => cosa.peso()})}
	method muyPeligroso( ){return contenido.max({cosa => cosa.peligrosidad()})}
	
	method peligrosidad(){
		if (contenido.isEmpty()) {return 0}
		else { return self.muyPeligroso().peligrosidad()}
	}
}
	
	


object residuosRadioactivos {
	var peso
	
	method pesoResiduos(kilogramos) {peso = kilogramos}
	method peligrosidad() {return 200}
}

object embalajeSeguridad {
	var embalaje 
	
	method embalar(unaCosa) {embalaje = unaCosa}
	method peso() { return embalaje.peso()}
	method peligrosidad() {return embalaje.peligrosidad()/2 } 
}



