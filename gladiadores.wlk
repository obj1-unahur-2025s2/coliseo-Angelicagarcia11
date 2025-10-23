import armas.*

class Gladiador{
    

}



class Mirmillon{
    var vida = 100
    var proteccion
    const property fuerza
    const arma

    //method fuerza()= fuerza
    method proteccion()= proteccion
    method cambiarProteccion(unaProteccion){proteccion=unaProteccion}
    method destreza()=15
    method vida()=vida
    method estaVivo() = vida > 0
    method poderAtaque()= fuerza + arma.valorAtaque()
    
    
    method defensa(){
        proteccion.defensa() + self.destreza()
    }

    method atacar(enemigo) {
        if(self.puedeInfringirDanio(enemigo) && enemigo.estaVivo()) {
            enemigo.sufrirDanio(self.poderAtaque() - enemigo.defensa())
        }
    }
    method sufrirDanio(unValor) {
        vida = (vida - unValor).max(0)
    }

    method puedeInfringirDanio(enemigo) {
        return self.poderAtaque() > enemigo.defensa()
    }

    method pelear(enemigo) {
        self.atacar(enemigo)
        enemigo.atacar(self)
    }

    method curar() {vida = 100}


    method crearGrupo(otroGladiador) = 
        new Grupo(nombre="mirmillolandia", gladiadores = #{self,otroGladiador})
}
    



class Dimacheru{
    var vida = 100

    var destreza
    const property armas=#{}

    method agregarArma(unArma) {
      armas.add(unArma)
    }

    method perderArma(unArma) {
      armas.remove(unArma)
    }


    method destreza()=destreza
    method vida()=vida
    method estaVivo() = vida > 0
    method fuerza()= 10
    method proteccion()= "sin proteccion"

    method poderAtaque()= self.fuerza() + armas.sum({unArma => unArma.valorAtaque()})
    
        method defensa(){
        proteccion.defensa() + self.destreza() //revisar
    }

    method atacar(enemigo) {
        if(self.puedeInfringirDanio(enemigo) && enemigo.estaVivo()) {
            enemigo.sufrirDanio(self.poderAtaque() - enemigo.defensa())
            destreza+=1
        }
    }
    method sufrirDanio(unValor) {
        vida = (vida - unValor).max(0)
    }

    method puedeInfringirDanio(enemigo) {
        return self.poderAtaque() > enemigo.defensa()
    }

    method pelear(enemigo) {
        self.atacar(enemigo)
        enemigo.atacar(self)
    }

    method curar() {vida = 100}


    method crearGrupo(otroGladiador) = 
        new Grupo(nombre="D-" + (self.poderAtaque() + otroGladiador.poderAtaque()).toString(), gladiadores= #{self, otroGladiador})

    
}











class Grupo{
    const property nombre

    const property gladiadores = #{}
    var cantPeleas = 0

    method agregar(unGladiador){
        gladiadores.add(unGladiador)
    }

    method quitar(unGladiador){
        gladiadores.remove(unGladiador)
    }

     method gladiadoresVivos() = gladiadores.filter({g=>g.estaVivo()})
    method hayAlgunGladiadorVivo() = gladiadores.any({g=>g.estaVivo()})
    method campeon() {
        return self.gladiadoresVivos().max({g=>g.fuerza()})
    }
    method pelearCon(otroGrupo) {
        if(self.hayAlgunGladiadorVivo() && otroGrupo.hayAlgunGladiadorVivo()) {
            self.campeon().pelear(otroGrupo.campeon())
        }
    }
    method registrarPelea() {cantPeleas += 1}
    method combatir(otroGrupo) {
        (1..3).forEach({
            self.pelearCon(otroGrupo)
        })
        self.registrarPelea()
        otroGrupo.registrarPelea()
    }
    method curar() {
        gladiadores.forEach({g=>g.curar()})
    }

}


