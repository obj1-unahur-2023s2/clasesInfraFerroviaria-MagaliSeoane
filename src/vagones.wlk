class Vagon{
	method cantDePasajeros()=0
	method cargaMaxima()=0
	method esPopular()= self.cantDePasajeros()>50
}

class Pasajeros inherits Vagon {
	const property largo
	const property ancho
	const property tieneBanio
	var property estaOrdenado=true
	
	override method cantDePasajeros(){
   	const pasajeros = if(ancho<=3){8 * largo} else { 10 * largo }
  	return if (!estaOrdenado){0.max(pasajeros-15)} else {pasajeros}
  
  	}
	override method cargaMaxima()= if(tieneBanio){300} else {800}
	method pesoMaximo()=2000+80*self.cantDePasajeros()+self.cargaMaxima()
	method mantenimiento(){if(!estaOrdenado){estaOrdenado=true} else {}}
}

class Carga inherits Vagon{
	const property cargaMaxIdeal
	const property cantMaderasSueltas
	
	override method cargaMaxima()=0.max(cargaMaxIdeal - (400*cantMaderasSueltas))
	method tieneBanio()= false
	method mantenimiento(){0.max(cantMaderasSueltas - 2)}
	method pesoMaximo()=1500+self.cargaMaxima()
}

class Dormitorio inherits Vagon{
	const property cantCompartimientos
	const property cantCamasPorCompartimiento
	
	method tieneBanio()=true
	override method cantDePasajeros()= cantCompartimientos*cantCamasPorCompartimiento
	override method cargaMaxima()=1200
	method pesoMaximo()=4000+ 80*self.cantDePasajeros() + self.cargaMaxima()
	method mantenimiento(){}
}