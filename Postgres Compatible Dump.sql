
-- -----------------------------------------------------
-- Table `forwarding_agent`.`proizvodjac`
-- -----------------------------------------------------
CREATE TABLE forwarding_agent.proizvodjac (
  idProizvodjac INT NOT NULL PRIMARY KEY,
  naziv VARCHAR(45) NOT NULL,
  sediste VARCHAR(45) NOT NULL,
  datumOsnivanja DATE NOT NULL,
  prihod INT NOT NULL,
  slika VARCHAR(100) NULL DEFAULT NULL,
  email VARCHAR(45) NULL DEFAULT NULL,
  telefon VARCHAR(45) NULL DEFAULT NULL)

-- -----------------------------------------------------
-- Table `forwarding_agent`.`teret`
-- -----------------------------------------------------
CREATE TABLE forwarding_agent.teret (
  idTeret INT  NOT NULL PRIMARY KEY,
  tezina INT NOT NULL,
  tip VARCHAR(45) NOT NULL,
  opis VARCHAR(45) NOT NULL,
  Proizvodjac_idProizvodjac INT NOT NULL REFERENCES forwarding_agent.proizvodjac(idProizvodjac))

-- -----------------------------------------------------
-- Table `forwarding_agent`.`isporuka`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS forwarding_agent.isporuka (
  idIsporuka INT NOT NULL PRIMARY KEY,
  statusDostave VARCHAR(45) NOT NULL,
  statusPlacanja VARCHAR(45) NOT NULL,
  tip VARCHAR(45) NOT NULL,
  cena INT NOT NULL,
  vremePolaska TIMESTAMP NOT NULL,
  vremeDolaska TIMESTAMP NOT NULL,
  mestoPolaska VARCHAR(45) NOT NULL,
  mestoDolaska VARCHAR(45) NOT NULL,
  km INT NOT NULL,
  predjeno INT NULL DEFAULT NULL,
  Proizvodjac_idProizvodjac INT NOT NULL REFERENCES forwarding_agent.proizvodjac(idProizvodjac),
  teret_idTeret INT NOT NULL REFERENCES forwarding_agent.teret(idTeret))

-- -----------------------------------------------------
-- Table `forwarding_agent`.`prevoznik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS forwarding_agent.prevoznik (
  idPrevoznik INT NOT NULL PRIMARY KEY,
  naziv VARCHAR(45) NOT NULL,
  sediste VARCHAR(45) NOT NULL,
  datumOsnivanja DATE NOT NULL,
  prihod INT NOT NULL,
  uspesneIsporuke INT NOT NULL,
  neuspesneIsporuke INT NOT NULL,
  slika VARCHAR(100) NULL DEFAULT NULL,
  email VARCHAR(45) NULL DEFAULT NULL,
  telefon VARCHAR(45) NULL DEFAULT null)

-- -----------------------------------------------------
-- Table `forwarding_agent`.`kamion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS forwarding_agent.kamion (
  idKamion INT NOT NULL PRIMARY KEY,
  model VARCHAR(45) NOT NULL,
  tip VARCHAR(45) NOT NULL,
  godinaProizvodnje INT NOT NULL,
  nosivost INT NOT NULL,
  km INT NULL DEFAULT NULL,
  slika VARCHAR(100) NULL DEFAULT NULL,
  Prevoznik_idPrevoznik INT NOT null REFERENCES forwarding_agent.prevoznik(idPrevoznik))

-- -----------------------------------------------------
-- Table `forwarding_agent`.`korisnik`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS forwarding_agent.korisnik (
  username VARCHAR(45) NOT NULL PRIMARY KEY,
  password VARCHAR(45) NOT NULL,
  idPreduzeca INT NOT NULL)

-- -----------------------------------------------------
-- Table `forwarding_agent`.`uloga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS forwarding_agent.uloga (
  idRole INT NOT NULL PRIMARY KEY,
  naziv VARCHAR(45) NOT NULL)

-- -----------------------------------------------------
-- Table `forwarding_agent`.`korisnik_uloga`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS forwarding_agent.korisnik_uloga (
  User_username VARCHAR(45) NOT NULL REFERENCES forwarding_agent.korisnik(username),
  Role_idRole INT NOT NULL REFERENCES forwarding_agent.uloga(idRole))

-- -----------------------------------------------------
-- Table `forwarding_agent`.`prikolica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS forwarding_agent.prikolica (
  idPrikolica INT NOT NULL PRIMARY KEY,
  model VARCHAR(45) NOT NULL,
  tip VARCHAR(45) NOT NULL,
  godinaProizvodnje INT NOT NULL,
  nosivost INT NOT NULL,
  km INT NULL DEFAULT NULL,
  slika VARCHAR(100) NULL DEFAULT NULL,
  Prevoznik_idPrevoznik INT NOT NULL REFERENCES forwarding_agent.prevoznik(idPrevoznik))

-- -----------------------------------------------------
-- Table `forwarding_agent`.`vozac`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS forwarding_agent.vozac (
  idVozac INT NOT NULL PRIMARY KEY,
  ime VARCHAR(45) NOT NULL,
  prezime VARCHAR(45) NOT NULL,
  adresa VARCHAR(45) NULL DEFAULT NULL,
  telefon VARCHAR(45) NULL DEFAULT NULL,
  godineIskustva INT NOT NULL,
  datumPridruzivanja DATE NOT NULL,
  satiVoznje INT NOT NULL,
  km INT NULL DEFAULT NULL,
  slika VARCHAR(100) NULL DEFAULT NULL,
  Prevoznik_idPrevoznik INT NOT NULL REFERENCES forwarding_agent.prevoznik(idPrevoznik),
  kamion_idKamion INT NULL REFERENCES forwarding_agent.kamion(idKamion),
  prikolica_idPrikolica INT NULL REFERENCES forwarding_agent.prikolica(idPrikolica))

-- -----------------------------------------------------
-- Table `forwarding_agent`.`ugovor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS forwarding_agent.ugovor (
  idUgovor INT NOT NULL PRIMARY KEY,
  Proizvodjac_idProizvodjac INT NOT NULL REFERENCES forwarding_agent.proizvodjac (idProizvodjac),
  Prevoznik_idPrevoznik INT NOT NULL REFERENCES forwarding_agent.prevoznik (idPrevoznik),
  isporuka_idIsporuka INT NOT NULL REFERENCES forwarding_agent.isporuka (idIsporuka),
  Vozac_idVozac INT NOT NULL REFERENCES forwarding_agent.vozac (idVozac),
  Kamion_idKamion INT NOT NULL REFERENCES forwarding_agent.kamion (idKamion),
  Prikolica_idPrikolica INT NULL REFERENCES forwarding_agent.prikolica (idPrikolica))



INSERT INTO forwarding_agent.proizvodjac VALUES (1,'AutoSport','Subotica','2002-10-24',500000,NULL,'cc@cc.com','021/1234-5678'),(2,'Invest','Novi Sad','2005-02-07',279000,NULL,'dd@dd.com','021/1234-5678');

INSERT INTO forwarding_agent.teret VALUES (1,12,'težak','Bager masina',2),(2,5,'lomljiv','Staklo paneli 10x10',2),(3,15,'opasan','Gume zapaljiva materija 500kom',1),(4,23,'vredan','Motori automobila 20kom',1),(5,10,'težak','Viljuskar',2),(6,1,'običan','Sasija automobila',1),(7,25,'težak','Kolektori',2),(8,5,'vredan','Farovi 1000kom',1);

INSERT INTO forwarding_agent.isporuka VALUES (1,'završena','plaćeno','važna',3000,'2020-01-10 08:00:00','2020-01-10 17:00:00','Subotica','Kraljevo',500,500,1,3),(2,'završena','neplaćeno','hitna',5000,'2020-04-15 11:30:00','2020-04-15 16:00:00','Novi Sad','Niš',700,700,2,1),(3,'u toku','neplaćeno','obična',2500,'2020-04-20 11:30:00','2020-04-23 12:30:00','Loznica','Paraćin',300,100,2,7),(4,'otkazana','neplaćeno','obična',4200,'2020-04-30 12:30:00','2020-05-03 13:30:00','Valjevo','Kruševac',180,0,1,6),(5,'u toku','plaćeno','važna',3800,'2020-05-05 13:30:00','2020-05-06 14:30:00','Pirot','Jagodina',250,145,1,8),(6,'zakasnela','neplaćeno','hitna',2600,'2020-05-10 14:30:00','2020-05-10 21:30:00','Ruma','Sombor',200,200,2,2);

INSERT INTO forwarding_agent.prevoznik VALUES (1,'AutoTrans','Beograd','2003-10-20',350000,14,2,NULL,'aa@aa.com','021/1234-5678'),(2,'Transped','Nis','2004-05-08',678000,54,3,NULL,'bb@bb.com','021/1234-5678');

INSERT INTO forwarding_agent.kamion VALUES (1,'MAN TX-100','Hladnjaca',2016,13,24500,NULL,1),(2,'MERCEDES RS200','Tanker',2014,23,65700,NULL,1),(3,'IVECO KGH','Mesalica',2016,27,45370,NULL,2),(4,'SCANIA GA','Kiper',2012,30,75400,NULL,2),(5,'VOLVO DRS','Tegljac',2017,32,35600,NULL,1),(6,'VONN JAX11','Sanduk',2019,24,3345,NULL,2),(7,'CROSS 22A','Utovarna Ruka',2018,18,23400,NULL,1),(8,'ADLER 345','Standardni',2020,12,2446,NULL,2),(9,'VOLVO DRS','Tegljac',2017,32,27000,NULL,2),(16,'HAM DX-100','Tegljac',2018,30,15346,NULL,1),(17,'HAM DX-200','Tegljac',2018,30,16547,NULL,2),(24,'dfsdf','Tanker',2017,12,346,NULL,1);

INSERT INTO forwarding_agent.korisnik VALUES ('aa','aa',1),('bb','bb',2),('hjk','hjk',3);

INSERT INTO forwarding_agent.uloga VALUES (1,'CARRIER'),(2,'MANUFACTURER');

INSERT INTO forwarding_agent.korisnik_uloga VALUES ('aa',1),('bb',2),('hjk',2);

INSERT INTO forwarding_agent.prikolica VALUES (1,'MERCEDES DX100','Zatvorena Suva',2017,10,34567,NULL,2),(2,'IVECO AA','Hladnjaca',2020,18,3245,NULL,2),(3,'VOLVO TROSS','Cisterna',2015,23,54360,NULL,2),(4,'BOTUM VONN','Kiper',2015,10,54600,NULL,1),(5,'FROSS DX80','Automobili',2013,24,62700,NULL,2),(6,'HANS BOLX','Masine',2019,24,8765,NULL,1),(7,'JOKERS POLLY','Drva',2011,20,76543,NULL,1),(8,'ANDOR BR2OM','Otvorena Ravna',2020,15,4567,NULL,1);

INSERT INTO forwarding_agent.vozac VALUES (1,'Pavle','Šulić','Nušićeva 51/2, Zrenjanin','021/123-4567',10,'2015-05-14',135,4000,NULL,1,NULL,NULL),(2,'Dorđe','Pajkić','Voje Rajkića, Beograd','021/123-4567',10,'2010-02-10',450,15000,NULL,2,NULL,NULL),(3,'David','Kupić','Mirka Drobnjaka, Pančevo','021/123-4567',14,'2012-10-05',134,3000,NULL,1,NULL,NULL),(4,'Miodrag','Bakić','Feke Dmitrova, Pirot','021/123-4567',15,'2013-08-23',678,45670,NULL,2,NULL,NULL),(10,'sdf','sdfs','asd','asd',6,'2014-07-22',2,7,NULL,1,2,7);

INSERT INTO forwarding_agent.ugovor VALUES (1,1,2,1,2,9,1),(2,2,1,2,3,5,6),(3,2,2,3,4,17,3),(4,1,1,4,1,5,4),(5,2,2,6,2,17,5),(6,1,1,5,1,16,7);





