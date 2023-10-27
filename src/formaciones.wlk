import vagones.*
import locomotoras.*

class Formacion{
     const vagones= new List()
     const locomotoras= new List()
     
     method agregarVagon(unVagon){vagones.add(unVagon)}
     
     method cantMaxPasajeros()= vagones.sum{v => v.cantDePasajeros()}
     method cantVagonesPopu()= vagones.count{v => v.esPopular()}
     method esFormacionCarguera()= vagones.all{v => v.cargaMaxima()>1000}    
     method vagonMasPesado()= vagones.max{v => v.pesoMaximo()}.pesoMaximo()
     method vagonMasLiviano()= vagones.min{v => v.pesoMaximo()}.pesoMaximo()
     method dispersionDePeso()= self.vagonMasPesado()- self.vagonMasLiviano()
  	 method cantDeBanios()=  vagones.count{v=>v.tieneBanio()}
  	 method vagonesConPasajeros()= vagones.filter{v => v.cantDePasajeros() > 0}
  	 method vagonConMaxPasajeros()= self.vagonesConPasajeros().max{v => v.cantDePasajeros()}.cantDePasajeros()
  	 method vagonConMinPasajeros()= self.vagonesConPasajeros().min{v => v.cantDePasajeros()}.cantDePasajeros()
  	 method estaEquilibrada()= (self.vagonConMaxPasajeros()-self.vagonConMinPasajeros())<= 20
  	 method hacerMantenimiento(){vagones.forEach{v => v.mantenimiento()}}
 	 method locomotoraMasLenta()= locomotoras.min{l=>l.velocidadMax()} 
 	 method velocidadMax()= self.locomotoraMasLenta().velocidadMax()
 	 method esEficiente()= locomotoras.all{l=>l.esEficiente()}
 	 method puedeMoverse()= self.sumaDelArrastre()>= self.pesoMaxFormacion()
 	 method sumaDelArrastre()= locomotoras.sum{l=>l.pesoQuePuedeArrastrar()}
 	 method pesoLocomotoras()= locomotoras.sum{l=>l.peso()}
 	 method pesoVagones()= vagones.sum{v=>v.pesoMaximo()}
  	 method pesoMaxFormacion()= self.pesoVagones()+self.pesoLocomotoras()
 }