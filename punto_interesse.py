from dataclasses import dataclass, field

@dataclass()
class PuntoInteresse:
    id: str
    nome: str
    voto_visitatori: int

    # RELAZIONE (N:N)
    escursioni: set = field(default_factory=set)

    def __eq__(self, other):
        return isinstance(other, PuntoInteresse) and self.id == other.id

    def __str__(self):
        return f"{self.nome} ({self.voto_visitatori})"

    def __repr__(self):
        return f"{self.nome} ({self.voto_visitatori})"

    def __hash__(self):
        return hash(self.id)
