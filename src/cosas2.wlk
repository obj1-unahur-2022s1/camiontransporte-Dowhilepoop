/*
 * cosas2: Bien(-). Hay algunos detalles a tener en cuenta con algunos de los objetos y la forma
 * en que fueron implementados los métodos, sobre todo los que cambian variables entre true y false.
 * También hay código con errores en los condicionales, por favor revisá las correcciones.
 * 
 */
object knightRider {
	/* Bien */
	method peso() {return 500}
	method peligrosidad() {return 10}
	method siEsCargado(){ }
	method bulto() {return 1}
}

object bumblebee {
	/* Bien(-). No se debería entregar código comentado que no hace nada. 
	 * El método siEsCargado() debería setear en false el valor de la variable
	 * esAuto. De la forma que estaba hecho, si bumblebee estuviese ya como robot
	 * al cargarlo en el camión se transformaría en auto y eso no sería correcto. Te dejo
	 * escrita la corrección.
	 * Además te dejo un ejemplo de como escribir un método de consulta sin return y 
	 * más simplificado en peligrosidad()
	 */
	var esAuto = true
	method peso() {return 800}
	method bulto() {return 2}
	
	method seTransforma() {esAuto = !esAuto}
	method peligrosidad() = if (esAuto) 15 else 30
	
	method siEsCargado(){ esAuto = false }
}

object paqueteLadrillos {
	/* Regular. El método bulto() está mal codificado. Te faltarían unos paréntesis
	 * para definir la condición de los if. Te los agrego porque sin eso no hay forma
	 * de Ejecutar.
	 * La var cantidad podría ser una var property para que puedas tener el getter y setter
	 * y te ahorrarías el método cantidadLadrillos y deberías reformular el método siEsCargado()
	 */
	var cantidad = 0
	
	method cantidadLadrillos(cuantos) {cantidad += cuantos}
	method peso() {return cantidad * 2}
	method peligrosidad() {return 2}
	method siEsCargado(){ self.cantidadLadrillos(12)}
 	method bulto() {
		if ((cantidad > 0) and (cantidad <= 100)) {return 1}
		else if ((cantidad >= 101) and (cantidad <= 300 )) {return 2}
		else {return 3}
	}
 
 }
	

object arena {
	/* Bien. La var peso podría ser una var property para que puedas tener el getter y setter
	 * y te ahorrarías el método pesoArena(kilogramos) y se debería reformular el método siEsCargado()
	 * Te dejo como sería el código con ese cambio. 
	 * */
	var property peso = 0 
	
	method peligrosidad() {return 1}
	method siEsCargado(){ peso += 20}
	method bulto() {return 1}
}

object bateriaAntiaerea {
	/* Regular. El método estaConMisiles() no solo carga los misiles, porque si lo llamas varias veces, y considerando
	 * que la variable que modifica se llama tiemeMisiles (booleana), cambia de true a false cada invocación. 
	 * Tal vez un nombre más adecuado podría ser cargaDescargaMisiles(). 
	 * Luego, el método peligrosidad() no era correcto, ya que la condición del if no está
	 * utilizando una expresión o el resultado de un método de consulta que devuelva true o false. Ahí se
	 * puede usar directamente la variable tieneMisiles. Te dejo las correcciones.
	 * Y la variable tieneMisiles podría ser una var property así tenés el getter disponible.
	 */
	var property tieneMisiles = true
	
	method cargaDescargaMisiles() {tieneMisiles = !tieneMisiles}
	method peso() {
		if (tieneMisiles) {return 300}
		else {return 200}
	}
	
	method peligrosidad() {
		if (tieneMisiles) {return 100}
		else {return 0}
	}
	
	method bulto() {
		if (tieneMisiles) {return 2}
		else {return 1}
	}
	
	method siEsCargado() {tieneMisiles=true}
}

object contenedorPortuario {
	/* Bien. La lista de contenido podría ser una constante si siempre va a apuntar
	 * a la misma lista que agregará cosas o la vaciará. Si nunca será apuntada esa referencia
	 * a otra lista, entonces conviene que sea una constante. 
	 * Te corregí el nombre del método agregarContenedor()
	 * */
	const contenido = []
	
	method agregarContenedor(cosa) {contenido.add(cosa)}
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
	/* Bien.  */
	var peso 
	
	method pesoResiduos(kilogramos) {peso += kilogramos}
	method peligrosidad() {return 200}
	method siEsCargado(){ self.pesoResiduos(15)}
	method bulto() {return 1}
}

object embalajeSeguridad {
	/* Bien */
	var embalaje 
	
	method embalar(cosa	) {embalaje = cosa}
	method peso() { return embalaje.peso()}
	method peligrosidad() {return embalaje.peligrosidad()/2 } 
	method siEsCargado(){ }
	method bulto() {return 2}
}


