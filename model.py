from database.parco_DAO import ParcoDAO
from database.escursione_DAO import EscursioneDAO
from database.punto_interesse_DAO import PuntoInteresseDAO

class Model:
    def __init__(self):
        self.escursioni_map = {} # Mappa ID escursione -> oggetti Escursione
        self.punti_interesse_map = {} # Mappa ID punto di interesse -> oggetti PuntoInteresse

        self._pacchetto_ottimo = []
        self._valore_ottimo: int = -1
        self._costo = 0

        # TODO: Aggiungere eventuali altri attributi

        # Caricamento
        self.load_escursioni()
        self.load_punti_interesse()
        self.load_relazioni()

    @staticmethod
    def load_parchi():
        """ Restituisce tutti i parchi disponibili """
        return ParcoDAO.get_parchi()

    def load_escursioni(self):
        """ Carica tutte le escursioni in un dizionario [id, Escursione]"""
        self.escursioni_map = EscursioneDAO.get_escursioni()

    def load_punti_interesse(self):
        """ Carica tutti i punti di interesse in un dizionario [id, PuntoInteresse]"""
        self.punti_interesse_map = PuntoInteresseDAO.get_punti_interesse()

    def load_relazioni(self):
        """
            Interroga il database per ottenere tutte le relazioni fra escursioni e punti di interesse e salvarle nelle strutture dati
            Collega escursione <-> punti di interesse.
            --> Ogni Escursione ha un set di PuntoInteresse.
            --> Ogni PuntoInteresse ha un set di Escursioni.
        """
        # TODO

        relazioni = EscursioneDAO.get_escursioni_punti_interesse()

        if relazioni is None:
            return

        for relazione in relazioni:

            # mappe permettono di recuperare gli oggetti già esistenti tramite ID
            id_escursione = relazione["id_escursione"]
            escursione = self.escursioni_map[id_escursione]

            id_punto = relazione["id_punto_interesse"]
            punto_interesse = self.punti_interesse_map[id_punto]

            # NOTA: la relazione è bidirezionale
            escursione.punti_interesse.add(punto_interesse)
            punto_interesse.escursioni.add(escursione)
            # add inserisce gli oggetti nei rispettivi set

    def genera_pacchetto(self, id_parco: str, max_giorni: int = None, max_budget: float = None):
        """
        Calcola il pacchetto di escursioni ottimale per un parco rispettando i vincoli di durata, budget e punti di interesse unici.
        :param id_parco: id del parco
        :param max_giorni: numero massimo di giorni (può essere None --> nessun limite)
        :param max_budget: costo massimo del pacchetto (può essere None --> nessun limite)

        :return: self._pacchetto_ottimo (una lista di oggetti Escursione)
        :return: self._costo (il costo del pacchetto)
        :return: self._valore_ottimo (il voto complessivo dei visitatori per il pacchetto)
        """
        self._pacchetto_ottimo = []
        self._costo = 0
        self._valore_ottimo = -1

        # TODO

        escursioni_parco = []  # RICORDA: inizializzare sempre prima lista FUORIIII

        # individuo escursioni dello specifico parco
        for escursione in self.escursioni_map.values():  # values scorre oggetti contenuti nei valori del dizionario
            if escursione.id_parco == id_parco:
                escursioni_parco.append(escursione)  # conservo l'escursione

        # così _ricorsione li può leggere
        self.escursioni_parco = escursioni_parco
        self.max_giorni = max_giorni
        self.max_budget = max_budget

        pacchetto_parziale = []
        durata_corrente = 0
        costo_corrente = 0
        valore_corrente = 0
        punti_usati = set()

        self._ricorsione(0, pacchetto_parziale,durata_corrente,costo_corrente,valore_corrente,punti_usati)
        # 0 (start_index) serve a indicare da quale posizione nella lista escursioni_parco inizio a valutare escursioni

        return self._pacchetto_ottimo, self._costo, self._valore_ottimo

    def _ricorsione(self, start_index: int, pacchetto_parziale: list, durata_corrente: int, costo_corrente: float, valore_corrente: int, punti_usati: set):
        """ Algoritmo di ricorsione che deve trovare il pacchetto che massimizza il voto complessivo dei visitatori"""

        # TODO: è possibile cambiare i parametri formali della funzione se ritenuto opportuno

        # quando ho raggiunto la fine della lista, non ci sono più escursioni da valutare
        if valore_corrente > self._valore_ottimo:
            self._pacchetto_ottimo = pacchetto_parziale.copy()
            self._valore_ottimo = valore_corrente
            self._costo = costo_corrente

        if start_index == len(self.escursioni_parco):
            return

        for i in range(start_index, len(self.escursioni_parco)):
            escursione = self.escursioni_parco[i]
            punti_comuni = escursione.punti_interesse.intersection(punti_usati)

            if self.max_giorni is None or (durata_corrente + escursione.durata_giorni) <= self.max_giorni:
                if self.max_budget is None or (costo_corrente + escursione.costo) <= self.max_budget:
                    if len(punti_comuni) == 0:
                        durata_corrente += escursione.durata_giorni
                        costo_corrente += escursione.costo
                        pacchetto_parziale.append(escursione)
                        punti_usati.update(escursione.punti_interesse)   # dobbiamo aggiornare i punti già selezionati
                        # ATTENTO non uso .add perchè ne aggiunge solo uno

                        valore_escursione = sum(punto.voto_visitatori for punto in escursione.punti_interesse)
                        valore_corrente += valore_escursione

                        self._ricorsione(i + 1, pacchetto_parziale, durata_corrente,
                                         costo_corrente, valore_corrente, punti_usati)

                        # imposto backtracking
                        durata_corrente -= escursione.durata_giorni
                        costo_corrente -= escursione.costo
                        valore_corrente -= valore_escursione
                        pacchetto_parziale.pop()
                        punti_usati.difference_update(escursione.punti_interesse)
                        # rimuove da punti_usati tutti i punti dell'escursione appena esplorata


