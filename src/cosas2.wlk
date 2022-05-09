object knightRider {
	
	method peso() {return 500}
	method peligrosidad() {return 10}
	method siEsCargado(){ }
	method bulto() {return 1}
}

object bumblebee {

	var esAuto = true
	//method esAuto() {return true}
	//method esRobot() {return true}
	method peso() {return 800}
	method bulto() {return 2}
	

	
	method seTransforma() {esAuto = !esAuto}
	method peligrosidad() {
		if (esAuto) {return 15}
		else {return 30}
		
	}
	
	method siEsCargado(){ self.seTransforma()}
}

object paqueteLadrillos{
	var cantidad = 0
	
	method cantidadLadrillos(cuantos) {cantidad += cuantos}
	method peso() {return cantidad * 2}
	method peligrosidad() {return 2}
	method siEsCargado(){ self.cantidadLadrillos(12)}
	method bulto() {
		
		if (cantidad > 0) and (cantidad <= 100) {return 1}
		else if (cantidad >= 101) and (cantidad <= 300 ) {return 2}
		else {return 3}
	
	} 
		

 }
	

object arena {

	var peso 
	
	method pesoArena(kilogramos) {peso += kilogramos}
	method peso() {return peso}
	method peligrosidad() {return 1}
	method siEsCargado(){ self.pesoArena(20)}
	method bulto() {return 1}
}

object bateriaAntiarea {
	
	method estaConMisiles() {return true}
	method peso() {
		if (self.estaConMisiles()) {return 300}
		else {return 200}
	}
	
	method peligrosidad() {
		if (self.estaConMisiles()) {return 100}
		else {return 0}
	}
	method siEsCargado(){ return self.estaConMisiles()}
	
	method bulto() {
		if (self.estaConMisiles()) {return 2}
		else {return 1}
	}
}

object contenedorPortuario {
	var contenido = []
	
	method agragarContenedor(cosa) {contenido.add(cosa)}
	method quitarContenedor(cosa) {contenido.remove(cosa)}
	method peso() {return 100 + contenido.sum({cosa => cosa.peso()})}
	method muyPeligroso( ){return contenido.max({cosa => cosa.peligrosidad()})}
	method siEsCargado(){ contenido.forEach({cosa=> cosa.siEsCargado()})}
	
	method peligrosidad(){
		if (contenido.isEmpty()) {return 0}
		else { return self.muyPeligroso().peligrosidad()}
	}
	method bulto() {return 1 + contenido.sum({cosa=> cosa.bulto()})}
}
	
	
object residuosRadioactivos {
	var peso 
	
	method pesoResiduos(kilogramos) {peso += kilogramos}
	method peligrosidad() {return 200}
	method siEsCargado(){ self.pesoResiduos(15)}
	method bulto() {return 1}
}

object embalajeSeguridad {
	var embalaje 
	
	method embalar(cosa	) {embalaje = cosa}
	method peso() { return embalaje.peso()}
	method peligrosidad() {return embalaje.peligrosidad()/2 } 
	method siEsCargado(){ }
	method bulto() {return 2}
}


