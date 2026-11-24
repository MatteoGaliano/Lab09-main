-- --------------------------------------------------------
-- Database: parchi_naturali
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Creazione database parchi_naturali
CREATE DATABASE IF NOT EXISTS `parchi_naturali` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `parchi_naturali`;

-- Drop tables se già esistono
DROP TABLE IF EXISTS `escursione_punto_interesse`;
DROP TABLE IF EXISTS `punto_interesse`;
DROP TABLE IF EXISTS `escursione`;
DROP TABLE IF EXISTS `parco`;

-- Creazione tabella parco
CREATE TABLE IF NOT EXISTS `parco` (
    id VARCHAR(5) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL
);

-- Inserimento parchi
/*!40000 ALTER TABLE `parco` DISABLE KEYS */;
INSERT INTO `parco` (id, nome) VALUES
('COS', 'Costa Selvaggia'),
('DUN', 'Dune Dorate'),
('FOR', 'Foresta Antica'),
('GHI', 'Ghiacciai Alti'),
('GOL', 'Gole Rosse'),
('LAG', 'Lago Smeraldo'),
('MON', 'Monte Azzurro'),
('VAL', 'Valli Nebbiose');
/*!40000 ALTER TABLE `parco` ENABLE KEYS */;

-- Creazione tabella escursione
CREATE TABLE IF NOT EXISTS `escursione` (
    id VARCHAR(5) PRIMARY KEY,
    id_parco VARCHAR(5) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    durata_giorni INT NOT NULL,
    costo DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_parco) REFERENCES parco(id) ON DELETE CASCADE
);

-- Inserimento escursioni
/*!40000 ALTER TABLE `escursione` DISABLE KEYS */;
INSERT INTO `escursione` (id, id_parco, nome, durata_giorni, costo) VALUES
('E001','COS','Escursione Faro Vecchio e Scogliera dei Gabbiani',2,130.00),
('E002','COS','Escursione Baia delle Sirene e Faro Vecchio',2,210.00),
('E003','COS','Escursione Scogliera dei Gabbiani e Sentiero dei Pescatori',3,300.00),
('E004','COS','Escursione Grotta del Corsaro',1,100.00),
('E005','COS','Escursione Spiaggia Nascosta e Faro Vecchio',3,320.00),
('E006','COS','Escursione Sentiero dei Pescatori e Faro Vecchio',3,240.00),
('E007','COS','Escursione Torre di Guardia e Pineta sul Mare',2,120.00),
('E008','COS','Escursione Isolotto dei Cormorani e Spiaggia Nascosta',2,260.00),
('E009','COS','Escursione Arco di Roccia, Baia delle Sirene e Sentiero dei Pescatori',3,230.00),
('E010','COS','Escursione Pineta sul Mare e Arco di Roccia',1,100.00),
('E011','DUN','Escursione Duna Grande e Faro delle Sabbie',2,160.00),
('E012','DUN','Escursione Oasi dei Fenicotteri',1,80.00),
('E013','DUN','Escursione Laguna Salata e Dune Bianche',1,160.00),
('E014','DUN','Escursione Cammino delle Tamerici e Laguna Salata',1,120.00),
('E015','DUN','Escursione Belvedere del Tramonto e Faro delle Sabbie',1,90.00),
('E016','DUN','Escursione Villaggio dei Pescatori e Stagni Rosa',1,90.00),
('E017','DUN','Escursione Pineta Costiera e Duna Grande',3,320.00),
('E018','DUN','Escursione Dune Bianche e Cammino delle Tamerici',1,110.00),
('E019','DUN','Escursione Stagni Rosa, Dune Bianche e Laguna Salata',4,380.00),
('E020','DUN','Escursione Faro delle Sabbie e Dune Bianche',2,250.00),
('E021','FOR','Escursione Quercia Millenaria e Cascata del Velo',2,180.00),
('E022','FOR','Escursione Radura delle Fate e Sorgente Cristallina',3,270.00),
('E023','FOR','Escursione Ponte di Legno',1,110.00),
('E024','FOR','Escursione Sorgente Cristallina e Torrente Verde',2,240.00),
('E025','FOR','Escursione Rifugio del Cervo, Sorgente Cristallina e Radura delle Fate',3,290.00),
('E026','FOR','Escursione Cascata del Velo e Grotta del Lupo',2,190.00),
('E027','FOR','Escursione Bosco dei Funghi e Sorgente Cristallina',3,340.00),
('E028','FOR','Escursione Torrente Verde e Bosco dei Funghi',2,230.00),
('E029','FOR','Escursione Belvedere dei Faggi e Bosco dei Funghi',3,250.00),
('E030','FOR','Escursione Grotta del Lupo e Quercia Millenaria',2,150.00),
('E031','GHI','Escursione Ghiacciaio Grande e Passo dei Camosci',2,170.00),
('E032','GHI','Escursione Lago Glaciale e Ghiacciaio Grande',3,310.00),
('E033','GHI','Escursione Rifugio Vetta Bianca, Passo dei Camosci e Prati delle Marmotte',3,360.00),
('E034','GHI','Escursione Passo dei Camosci e Valle Morenica',1,70.00),
('E035','GHI','Escursione Grotta di Ghiaccio e Rifugio Vetta Bianca',2,190.00),
('E036','GHI','Escursione Cresta del Falco e Grotta di Ghiaccio',1,140.00),
('E037','GHI','Escursione Valle Morenica e Belvedere Alto',3,300.00),
('E038','GHI','Escursione Cascata Gelata',1,120.00),
('E039','GHI','Escursione Prati delle Marmotte e Valle Morenica',2,120.00),
('E040','GHI','Escursione Belvedere Alto e Lago Glaciale',3,170.00),
('E041','GOL','Escursione Gola Rossa e Arco Naturale',1,110.00),
('E042','GOL','Escursione Ponte Sospeso e Arco Naturale',2,190.00),
('E043','GOL','Escursione Cascata Nascosta, Canyon Stretto e Sentiero dell\'Ocra',3,180.00),
('E044','GOL','Escursione Canyon Stretto e Cascata Nascosta',2,230.00),
('E045','GOL','Escursione Torrente Rosso e Rifugio della Gola',2,150.00),
('E046','GOL','Escursione Grotta delle Stalattiti e Torrente Rosso',2,160.00),
('E047','GOL','Escursione Belvedere del Canyon e Rifugio della Gola',3,320.00),
('E048','GOL','Escursione Sentiero dell\'Ocra',1,120.00),
('E049','GOL','Escursione Rifugio della Gola e Grotta delle Stalattiti',2,250.00),
('E050','GOL','Escursione Arco Naturale e Cascata Nascosta',2,150.00),
('E051','LAG','Escursione Lago Smeraldo Nord',1,130.00),
('E052','LAG','Escursione Isola dei Cigni e Belvedere Sud',2,220.00),
('E053','LAG','Escursione Pontile Antico e Isola dei Cigni',2,230.00),
('E054','LAG','Escursione Sentiero dei Canneti, Spiaggia Sassosa e Lago Smeraldo Nord',3,280.00),
('E055','LAG','Escursione Cascata Alta e Spiaggia Sassosa',3,290.00),
('E056','LAG','Escursione Rifugio del Lago e Isola dei Cigni',3,300.00),
('E057','LAG','Escursione Spiaggia Sassosa e Sentiero dei Canneti',2,130.00),
('E058','LAG','Escursione Belvedere Sud e Pontile Antico',2,140.00),
('E059','LAG','Escursione Torbiera e Cascata Alta',1,100.00),
('E060','LAG','Escursione Sorgenti Termali e Sentiero dei Canneti',2,170.00),
('E061','MON','Escursione Vetta Azzurra e Belvedere Panoramico',2,250.00),
('E062','MON','Escursione Rifugio Alpino e Grotta del Pastore',1,80.00),
('E063','MON','Escursione Lago d\'Altura e Belvedere Panoramico',3,340.00),
('E064','MON','Escursione Prato Fiorito e Vetta Azzurra',2,190.00),
('E065','MON','Escursione Passo del Vento e Rifugio Alpino',1,130.00),
('E066','MON','Escursione Cascata dell\'Aquila e Rifugio Alpino',2,180.00),
('E067','MON','Escursione Grotta del Pastore e Belvedere Panoramico',2,140.00),
('E068','MON','Escursione Cresta Sud e Belvedere Panoramico',2,130.00),
('E069','MON','Escursione Bosco di Larici',1,110.00),
('E070','MON','Escursione Belvedere Panoramico, Vetta Azzurra e Lago d\'Altura',4,430.00),
('E071','VAL','Escursione Valle Nebbiosa e Torre della Valle',2,210.00),
('E072','VAL','Escursione Mulino Abbandonato e Cascata del Mulino',2,180.00),
('E073','VAL','Escursione Torrente Argento e Bosco Incantato',2,190.00),
('E074','VAL','Escursione Borgo Fantasma',1,130.00),
('E075','VAL','Escursione Cascata del Mulino e Faggeta Magica',2,140.00),
('E076','VAL','Escursione Faggeta Magica e Ponte di Pietra',1,150.00),
('E077','VAL','Escursione Pascolo Alto e Bosco Incantato',2,230.00),
('E078','VAL','Escursione Ponte di Pietra e Borgo Fantasma',2,220.00),
('E079','VAL','Escursione Torre della Valle e Bosco Incantato',2,130.00),
('E080','VAL','Escursione Bosco Incantato, Cascata del Mulino e Pascolo Alto',3,320.00);
/*!40000 ALTER TABLE `escursione` ENABLE KEYS */;

-- Creazione tabella punto_interesse
CREATE TABLE IF NOT EXISTS `punto_interesse` (
    id VARCHAR(5) PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    voto_visitatori INT NOT NULL
);

-- Inserimento punti di interesse
/*!40000 ALTER TABLE `punto_interesse` DISABLE KEYS */;
INSERT INTO `punto_interesse` (id, nome, voto_visitatori) VALUES
-- Costa Selvaggia
('I001','Faro Vecchio',7),('I002','Baia delle Sirene',9),('I003','Scogliera dei Gabbiani',8),('I004','Grotta del Corsaro',8),('I005','Spiaggia Nascosta',9),('I006','Sentiero dei Pescatori',6),('I007','Torre di Guardia',6),('I008','Isolotto dei Cormorani',7),('I009','Arco di Roccia',8),('I010','Pineta sul Mare',5),
-- Dune Dorate
('I011','Duna Grande',9),('I012','Oasi dei Fenicotteri',8),('I013','Laguna Salata',7),('I014','Cammino delle Tamerici',5),('I015','Belvedere del Tramonto',9),('I016','Villaggio dei Pescatori',4),('I017','Pineta Costiera',6),('I018','Dune Bianche',8),('I019','Stagni Rosa',7),('I020','Faro delle Sabbie',5),
-- Foresta Antica
('I021','Quercia Millenaria',9),('I022','Radura delle Fate',7),('I023','Ponte di Legno',5),('I024','Sorgente Cristallina',7),('I025','Rifugio del Cervo',6),('I026','Cascata del Velo',9),('I027','Bosco dei Funghi',4),('I028','Torrente Verde',6),('I029','Belvedere dei Faggi',8),('I030','Grotta del Lupo',7),
-- Ghiacciai Alti
('I031','Ghiacciaio Grande',10),('I032','Lago Glaciale',9),('I033','Rifugio Vetta Bianca',7),('I034','Passo dei Camosci',8),('I035','Grotta di Ghiaccio',9),('I036','Cresta del Falco',8),('I037','Valle Morenica',6),('I038','Cascata Gelata',8),('I039','Prati delle Marmotte',5),('I040','Belvedere Alto',9),
-- Gole Rosse
('I041','Gola Rossa',10),('I042','Ponte Sospeso',8),('I043','Cascata Nascosta',9),('I044','Canyon Stretto',8),('I045','Torrente Rosso',6),('I046','Grotta delle Stalattiti',8),('I047','Belvedere del Canyon',9),('I048','Sentiero dell\'Ocra',5),('I049','Rifugio della Gola',5),('I050','Arco Naturale',7),
-- Lago Smeraldo
('I051','Lago Smeraldo Nord',9),('I052','Isola dei Cigni',8),('I053','Pontile Antico',5),('I054','Sentiero dei Canneti',4),('I055','Cascata Alta',8),('I056','Rifugio del Lago',6),('I057','Spiaggia Sassosa',6),('I058','Belvedere Sud',8),('I059','Torbiera',5),('I060','Sorgenti Termali',7),
-- Monte Azzurro
('I061','Vetta Azzurra',10),('I062','Rifugio Alpino',7),('I063','Lago d\'Altura',8),('I064','Prato Fiorito',7),('I065','Passo del Vento',6),('I066','Cascata dell\'Aquila',9),('I067','Grotta del Pastore',5),('I068','Cresta Sud',8),('I069','Bosco di Larici',6),('I070','Belvedere Panoramico',9),
-- Valli Nebbiose
('I071','Valle Nebbiosa',8),('I072','Mulino Abbandonato',5),('I073','Torrente Argento',6),('I074','Borgo Fantasma',7),('I075','Cascata del Mulino',7),('I076','Faggeta Magica',8),('I077','Pascolo Alto',5),('I078','Ponte di Pietra',6),('I079','Torre della Valle',6),('I080','Bosco Incantato',7);
/*!40000 ALTER TABLE `punto_interesse` ENABLE KEYS */;

-- Creazione tabella escursione_punto_interesse (N:N)
CREATE TABLE IF NOT EXISTS `escursione_punto_interesse` (
    id_escursione VARCHAR(5) NOT NULL,
    id_punto_interesse VARCHAR(5) NOT NULL,
    PRIMARY KEY (id_escursione, id_punto_interesse),
    FOREIGN KEY (id_escursione) REFERENCES escursione(id) ON DELETE CASCADE,
    FOREIGN KEY (id_punto_interesse) REFERENCES punto_interesse(id) ON DELETE CASCADE
);

/*!40000 ALTER TABLE `escursione_punto_interesse` DISABLE KEYS */;
-- Inserimento relazioni escursione_punto_interesse
INSERT INTO `escursione_punto_interesse` (id_escursione, id_punto_interesse) VALUES
-- Costa Selvaggia
('E001','I001'),('E001','I003'),('E002','I002'),('E002','I001'),('E003','I003'),('E003','I006'),('E004','I004'),('E005','I005'),('E005','I001'),('E006','I006'),('E006','I001'),('E007','I007'),('E007','I010'),('E008','I008'),('E008','I005'),('E009','I009'),('E009','I002'),('E009','I006'),('E010','I010'),('E010','I009'),
-- Dune Dorate
('E011','I011'),('E011','I020'),('E012','I012'),('E013','I013'),('E013','I018'),('E014','I014'),('E014','I013'),('E015','I015'),('E015','I020'),('E016','I016'),('E016','I019'),('E017','I017'),('E017','I011'),('E018','I018'),('E018','I014'),('E019','I019'),('E019','I018'),('E019','I013'),('E020','I020'),('E020','I018'),
-- Foresta Antica
('E021','I021'),('E021','I026'),('E022','I022'),('E022','I024'),('E023','I023'),('E024','I024'),('E024','I028'),('E025','I025'),('E025','I024'),('E025','I022'),('E026','I026'),('E026','I030'),('E027','I027'),('E027','I024'),('E028','I028'),('E028','I027'),('E029','I029'),('E029','I027'),('E030','I030'),('E030','I021'),
-- Ghiacciai Alti
('E031','I031'),('E031','I034'),('E032','I032'),('E032','I031'),('E033','I033'),('E033','I034'),('E033','I039'),('E034','I034'),('E034','I037'),('E035','I035'),('E035','I033'),('E036','I036'),('E036','I035'),('E037','I037'),('E037','I040'),('E038','I038'),('E039','I039'),('E039','I037'),('E040','I040'),('E040','I032'),
-- Gole Rosse
('E041','I041'),('E041','I050'),('E042','I042'),('E042','I050'),('E043','I043'),('E043','I044'),('E043','I048'),('E044','I044'),('E044','I043'),('E045','I045'),('E045','I049'),('E046','I046'),('E046','I045'),('E047','I047'),('E047','I049'),('E048','I048'),('E049','I049'),('E049','I046'),('E050','I050'),('E050','I043'),
-- Lago Smeraldo
('E051','I051'),('E052','I052'),('E052','I058'),('E053','I053'),('E053','I052'),('E054','I054'),('E054','I057'),('E054','I051'),('E055','I055'),('E055','I057'),('E056','I056'),('E056','I052'),('E057','I057'),('E057','I054'),('E058','I058'),('E058','I053'),('E059','I059'),('E059','I055'),('E060','I060'),('E060','I054'),
-- Monte Azzurro
('E061','I061'),('E061','I070'),('E062','I062'),('E062','I067'),('E063','I063'),('E063','I070'),('E064','I064'),('E064','I061'),('E065','I065'),('E065','I062'),('E066','I066'),('E066','I062'),('E067','I067'),('E067','I070'),('E068','I068'),('E068','I070'),('E069','I069'),('E070','I070'),('E070','I061'),('E070','I063'),
-- Valli Nebbiose
('E071','I071'),('E071','I079'),('E072','I072'),('E072','I075'),('E073','I073'),('E073','I080'),('E074','I074'),('E075','I075'),('E075','I076'),('E076','I076'),('E076','I078'),('E077','I077'),('E077','I080'),('E078','I078'),('E078','I074'),('E079','I079'),('E079','I080'),('E080','I080'),('E080','I075'),('E080','I077');
/*!40000 ALTER TABLE `escursione_punto_interesse` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
