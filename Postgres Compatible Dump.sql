
DROP TABLE IF EXISTS forwarding_agent.ugovor;
DROP TABLE IF EXISTS forwarding_agent.vozac;
DROP TABLE IF EXISTS forwarding_agent.prikolica;
DROP TABLE IF EXISTS forwarding_agent.korisnik_uloga;
DROP TABLE IF EXISTS forwarding_agent.uloga;
DROP TABLE IF EXISTS forwarding_agent.korisnik;
DROP TABLE IF EXISTS forwarding_agent.kamion;
DROP TABLE IF EXISTS forwarding_agent.prevoznik;
DROP TABLE IF EXISTS forwarding_agent.isporuka;
DROP TABLE IF EXISTS forwarding_agent.teret;
DROP TABLE IF EXISTS forwarding_agent.proizvodjac;

CREATE TABLE forwarding_agent.proizvodjac (
  idProizvodjac INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  naziv VARCHAR(45) NOT NULL,
  sediste VARCHAR(45) NOT NULL,
  datumOsnivanja DATE NOT NULL,
  prihod INT NOT NULL,
  slika VARCHAR(100) NULL DEFAULT NULL,
  email VARCHAR(45) NULL DEFAULT NULL,
  telefon VARCHAR(45) NULL DEFAULT NULL);

CREATE TABLE forwarding_agent.teret (
  idTeret INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  tezina INT NOT NULL,
  tip VARCHAR(45) NOT NULL,
  opis VARCHAR(45) NOT NULL,
  Proizvodjac_idProizvodjac INT NOT NULL REFERENCES forwarding_agent.proizvodjac(idProizvodjac));

CREATE TABLE IF NOT EXISTS forwarding_agent.isporuka (
  idIsporuka INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
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
  teret_idTeret INT NOT NULL REFERENCES forwarding_agent.teret(idTeret));

CREATE TABLE IF NOT EXISTS forwarding_agent.prevoznik (
  idPrevoznik INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  naziv VARCHAR(45) NOT NULL,
  sediste VARCHAR(45) NOT NULL,
  datumOsnivanja DATE NOT NULL,
  prihod INT NOT NULL,
  uspesneIsporuke INT NOT NULL,
  neuspesneIsporuke INT NOT NULL,
  slika VARCHAR(100) NULL DEFAULT NULL,
  email VARCHAR(45) NULL DEFAULT NULL,
  telefon VARCHAR(45) NULL DEFAULT null);

CREATE TABLE IF NOT EXISTS forwarding_agent.kamion (
  idKamion INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  model VARCHAR(45) NOT NULL,
  tip VARCHAR(45) NOT NULL,
  godinaProizvodnje INT NOT NULL,
  nosivost INT NOT NULL,
  km INT NULL DEFAULT NULL,
  slika VARCHAR(100) NULL DEFAULT NULL,
  Prevoznik_idPrevoznik INT NOT null REFERENCES forwarding_agent.prevoznik(idPrevoznik));

CREATE TABLE IF NOT EXISTS forwarding_agent.korisnik (
  username VARCHAR(45) NOT NULL PRIMARY KEY,
  password VARCHAR(45) NOT NULL,
  idPreduzeca INT NOT NULL);

CREATE TABLE IF NOT EXISTS forwarding_agent.uloga (
  idRole INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  naziv VARCHAR(45) NOT NULL);

CREATE TABLE IF NOT EXISTS forwarding_agent.korisnik_uloga (
  User_username VARCHAR(45) NOT NULL REFERENCES forwarding_agent.korisnik(username),
  Role_idRole INT NOT NULL REFERENCES forwarding_agent.uloga(idRole));

CREATE TABLE IF NOT EXISTS forwarding_agent.prikolica (
  idPrikolica INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  model VARCHAR(45) NOT NULL,
  tip VARCHAR(45) NOT NULL,
  godinaProizvodnje INT NOT NULL,
  nosivost INT NOT NULL,
  km INT NULL DEFAULT NULL,
  slika VARCHAR(100) NULL DEFAULT NULL,
  Prevoznik_idPrevoznik INT NOT NULL REFERENCES forwarding_agent.prevoznik(idPrevoznik));

CREATE TABLE IF NOT EXISTS forwarding_agent.vozac (
  idVozac INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
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
  prikolica_idPrikolica INT NULL REFERENCES forwarding_agent.prikolica(idPrikolica));

CREATE TABLE IF NOT EXISTS forwarding_agent.ugovor (
  idUgovor INT NOT NULL PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  Proizvodjac_idProizvodjac INT NOT NULL REFERENCES forwarding_agent.proizvodjac (idProizvodjac),
  Prevoznik_idPrevoznik INT NOT NULL REFERENCES forwarding_agent.prevoznik (idPrevoznik),
  isporuka_idIsporuka INT NOT NULL REFERENCES forwarding_agent.isporuka (idIsporuka),
  Vozac_idVozac INT NOT NULL REFERENCES forwarding_agent.vozac (idVozac),
  Kamion_idKamion INT NOT NULL REFERENCES forwarding_agent.kamion (idKamion),
  Prikolica_idPrikolica INT NULL REFERENCES forwarding_agent.prikolica (idPrikolica));


INSERT INTO forwarding_agent.proizvodjac(naziv, sediste, datumOsnivanja, prihod, slika, email, telefon)
	VALUES ('AutoSport','Subotica','2002-10-24',500000,NULL,'cc@cc.com','021/1234-5678'),('Invest','Novi Sad','2005-02-07',279000,NULL,'dd@dd.com','021/1234-5678');

INSERT INTO forwarding_agent.teret(tezina, tip, opis, Proizvodjac_idProizvodjac) 
	VALUES (12,'težak','Bager masina',2),(5,'lomljiv','Staklo paneli 10x10',2),(15,'opasan','Gume zapaljiva materija 500kom',1),(23,'vredan','Motori automobila 20kom',1),(10,'težak','Viljuskar',2),(1,'običan','Sasija automobila',1),(25,'težak','Kolektori',2),(5,'vredan','Farovi 1000kom',1);

INSERT INTO forwarding_agent.isporuka(statusDostave, statusPlacanja, tip, cena, vremePolaska, vremeDolaska, mestoPolaska, mestoDolaska, km, predjeno, Proizvodjac_idProizvodjac, teret_idTeret)
	VALUES ('završena','plaćeno','važna',3000,'2020-01-10 08:00:00','2020-01-10 17:00:00','Subotica','Kraljevo',500,500,1,3),('završena','neplaćeno','hitna',5000,'2020-04-15 11:30:00','2020-04-15 16:00:00','Novi Sad','Niš',700,700,2,1),('u toku','neplaćeno','obična',2500,'2020-04-20 11:30:00','2020-04-23 12:30:00','Loznica','Paraćin',300,100,2,7),('otkazana','neplaćeno','obična',4200,'2020-04-30 12:30:00','2020-05-03 13:30:00','Valjevo','Kruševac',180,0,1,6),('u toku','plaćeno','važna',3800,'2020-05-05 13:30:00','2020-05-06 14:30:00','Pirot','Jagodina',250,145,1,8),('zakasnela','neplaćeno','hitna',2600,'2020-05-10 14:30:00','2020-05-10 21:30:00','Ruma','Sombor',200,200,2,2);

INSERT INTO forwarding_agent.prevoznik(naziv, sediste, datumOsnivanja, prihod, uspesneIsporuke, neuspesneIsporuke, slika, email, telefon)
	VALUES ('AutoTrans','Beograd','2003-10-20',350000,14,2,NULL,'aa@aa.com','021/1234-5678'),('Transped','Nis','2004-05-08',678000,54,3,NULL,'bb@bb.com','021/1234-5678');

INSERT INTO forwarding_agent.kamion(model, tip, godinaProizvodnje, nosivost, km, slika, Prevoznik_idPrevoznik)
	VALUES ('MAN TX-100','Hladnjaca',2016,13,24500,NULL,1),('MERCEDES RS200','Tanker',2014,23,65700,NULL,1),('IVECO KGH','Mesalica',2016,27,45370,NULL,2),('SCANIA GA','Kiper',2012,30,75400,NULL,2),('VOLVO DRS','Tegljac',2017,32,35600,NULL,1),('VONN JAX11','Sanduk',2019,24,3345,NULL,2),('CROSS 22A','Utovarna Ruka',2018,18,23400,NULL,1),('ADLER 345','Standardni',2020,12,2446,NULL,2),('VOLVO DRS','Tegljac',2017,32,27000,NULL,2),('HAM DX-100','Tegljac',2018,30,15346,NULL,1),('HAM DX-200','Tegljac',2018,30,16547,NULL,2),('dfsdf','Tanker',2017,12,346,NULL,1);

INSERT INTO forwarding_agent.korisnik(username, password, idPreduzeca)
	VALUES ('aa','aa',1),('bb','bb',2),('hjk','hjk',3);

INSERT INTO forwarding_agent.uloga(naziv)
	VALUES ('CARRIER'),('MANUFACTURER');

INSERT INTO forwarding_agent.korisnik_uloga(User_username, Role_idRole)
	VALUES ('aa',1),('bb',2),('hjk',2);

INSERT INTO forwarding_agent.prikolica(model, tip, godinaProizvodnje, nosivost, km, slika, Prevoznik_idPrevoznik)
	VALUES ('MERCEDES DX100','Zatvorena Suva',2017,10,34567,NULL,2),('IVECO AA','Hladnjaca',2020,18,3245,NULL,2),('VOLVO TROSS','Cisterna',2015,23,54360,NULL,2),('BOTUM VONN','Kiper',2015,10,54600,NULL,1),('FROSS DX80','Automobili',2013,24,62700,NULL,2),('HANS BOLX','Masine',2019,24,8765,NULL,1),('JOKERS POLLY','Drva',2011,20,76543,NULL,1),('ANDOR BR2OM','Otvorena Ravna',2020,15,4567,NULL,1);

INSERT INTO forwarding_agent.vozac(ime, prezime, adresa, telefon, godineIskustva, datumPridruzivanja, satiVoznje, km, slika, Prevoznik_idPrevoznik, kamion_idKamion, prikolica_idPrikolica)
	VALUES ('Pavle','Šulić','Nušićeva 51/2, Zrenjanin','021/123-4567',10,'2015-05-14',135,4000,NULL,1,NULL,NULL),('Dorđe','Pajkić','Voje Rajkića, Beograd','021/123-4567',10,'2010-02-10',450,15000,NULL,2,NULL,NULL),('David','Kupić','Mirka Drobnjaka, Pančevo','021/123-4567',14,'2012-10-05',134,3000,NULL,1,NULL,NULL),('Miodrag','Bakić','Feke Dmitrova, Pirot','021/123-4567',15,'2013-08-23',678,45670,NULL,2,NULL,NULL),('sdf','sdfs','asd','asd',6,'2014-07-22',2,7,NULL,1,2,7);

INSERT INTO forwarding_agent.ugovor(Proizvodjac_idProizvodjac, Prevoznik_idPrevoznik, isporuka_idIsporuka, Vozac_idVozac, Kamion_idKamion, Prikolica_idPrikolica)
	VALUES (1,2,1,2,9,1),(2,1,2,3,5,6),(2,2,3,4,11,3),(1,1,4,1,5,4),(2,2,6,2,11,5),(1,1,5,1,10,7);








