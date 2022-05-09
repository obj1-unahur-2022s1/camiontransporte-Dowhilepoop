import cosas2.*

object camion2  {
	
	var carga = []
	
	
	method cargar(cosa) {
		
		carga.add(cosa)
		cosa.siEsCargado()
	}
	
	method descargar(cosa) {carga.remove(cosa)}
	
	method todoPesoPar() {return carga.filter({cosa=> cosa.peso() % 2 == 0}) }
	
	method hayAlgunoQuePesa(peso) {return carga.any(peso)}
	
	method elDeNivel(nivel) {return carga.find({cosa=> cosa.peligrosidad() == nivel})}
	
	method pesoTotal() {return 1000 + carga.sum({cosa=> cosa.peso()})}
	
	method excedidoDePeso() {return self.pesoTotal() > 2500}
	
	method objetosQueSuperanPeligrosidad(nivel) {return carga.filter({cosa=> cosa.peligrosidad() > nivel})}
	
	method objetosMasPeligrososQue(cosa) {return carga.filter({unaCosa=> unaCosa.peligrosidad() > cosa.peligrosidad()})}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return self.excedidoDePeso() and carga.forEach({cosa=> cosa.peligrosidad() < nivelMaximoPeligrosidad})
	}
	
	method tieneAlgoQuePesaEntre(min, max) {return carga.filter({cosa=> cosa.peso().sublist(min,max)})}
	
	method cosaMasPesada(){return carga.max({cosa=> cosa.peso()})}
	
	method pesos(){return carga.filter({cosa=> cosa.peso()})}
	method totalBultos() {return carga.sum({cosa=> cosa.bulto()})}
	
	
}
