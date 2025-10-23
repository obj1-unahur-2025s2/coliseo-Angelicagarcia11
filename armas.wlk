import gladiadores.*


class ArmaFilo{
    const longitud
    const filo

    method initialize() {
        if(!filo.between(0, 1)) {
            self.error("El filo debe estar entre 0 y 1")
        }
    }
    method filo()= 0.max(1.min(filo))

    method valorAtaque() = self.filo()*longitud
}



class ArmaContundente{
    const peso
    method valorAtaque()=peso
}



object casco{
   method defensa(unGladiador) = 10
}


object escudo{
    method defensa(unGladiador) = 5 + unGladiador.destreza() *0.10
}
