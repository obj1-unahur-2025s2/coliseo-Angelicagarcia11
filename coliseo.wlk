import gladiadores.*

object coliseo {
    const property grupos = #{}
    method combateEntreGrupos(unGrupo,otroGrupo) {
        unGrupo.combatir(otroGrupo)
    }
    method combateDesigual(unGrupo,unGladiador) {
        const unGrupoSolitario = new Grupo(nombre="solitario",gladiadores=#{unGladiador})
        unGrupo.combatir(unGrupoSolitario)
        grupos.add(unGrupoSolitario)
    }
    method curar() {
        grupos.forEach({g=>g.curar()})
    }
}