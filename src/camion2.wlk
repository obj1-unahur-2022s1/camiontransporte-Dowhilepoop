/* 
 * 
 */
import cosas2.*

object camion  {
	/* Regular. 
	 * En el método todoPesoPar() se podía usar el mensaje even().
	 * El método hayAlgunoQuePesa(peso) no está correctamente implementado para la colección. Dejo la corrección.
	 * El método objetosMasPeligrososQue(cosa) se podría hacer usando el método objetosQueSuperanPeligrosidad(nivel). Dejo el cambio
	 * El método puedeCircularEnRuta(nivelMaximoPeligrosidad) no está bien desarrollado. Te dejo la corrección.
	 * El método tieneAlgoQuePesaEntre(min, max) no devuelve un booleano, sino una colección. No es correcto, te dejo la corrección.
	 * El método pesos() no debe devolver otra colección de objetos contenidos filtrada, sino el map de esos objetos. Dejo la corrección.
	 */
	var carga = []
	
	
	method cargar(cosa) {
		
		carga.add(cosa)
		cosa.siEsCargado()
	}
	
	method descargar(cosa) {carga.remove(cosa)}
	
	method todoPesoPar() {return carga.filter({cosa=> cosa.peso().even()}) }
	
	method hayAlgunoQuePesa(peso) {return carga.any({c=>c.peso()==peso})}
	
	method elDeNivel(nivel) {return carga.find({cosa=> cosa.peligrosidad() == nivel})}
	
	method pesoTotal() {return 1000 + carga.sum({cosa=> cosa.peso()})}
	
	method excedidoDePeso() {return self.pesoTotal() > 2500}
	
	method objetosQueSuperanPeligrosidad(nivel) {return carga.filter({cosa=> cosa.peligrosidad() > nivel})}
	
	method objetosMasPeligrososQue(cosa) = self.objetosQueSuperanPeligrosidad(cosa.peligrosidad())
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoDePeso() and self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}
	
	method tieneAlgoQuePesaEntre(min, max) {
		return carga.any({ cosa => cosa.peso().between(min,max)})
	}
	
	method cosaMasPesada(){return carga.max({cosa=> cosa.peso()})}
	
	method pesos(){return carga.map({cosa=> cosa.peso()})}
	method totalBultos() {return carga.sum({cosa=> cosa.bulto()})}
	
	
}
