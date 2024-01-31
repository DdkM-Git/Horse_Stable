USE Stajnia
GO

--Kon
INSERT INTO Kon
           (konId, imie, numerPaszportu, rasa, ojciec, matka, uwagi)
     VALUES
           (1, 'Bianka', 1206529186165114541, 'fryzyjski', 'Piorun', 'Amelia', NULL),
           (2, 'Amarynt', 5161981516510230304, 'fryzyjski', 'Alabaster', 'Klea', NULL),
           (3, 'Gatek', 1891561654981626511, 'shire', 'Mecenas', 'Siwa', NULL),
           (4, 'Klops', 4415131807116321863, 'arab', 'Zigi', 'Sela', NULL),
           (5, 'Jamnik', 7546529186165114534, 'shire', 'Szybki Bieg', 'Nasturcja', NULL),
           (6, 'Deli', 4798529186165587541, 'shire', 'Amarant', 'Pogoñ', NULL),
           (7, 'Zwiewka', 6542129186165114245, 'arab', 'Albatros', 'Kuna', NULL),
           (8, 'Panienka', 6146529186165114547, 'fryzyjski', 'Gacek', 'Bori', NULL),
           (9, 'Tyrka', 3245529186165114374, 'shire', 'Kali', 'Freja', NULL)           
GO
--KonStatus
INSERT INTO KonStatus
           (statusId, nazwa)
     VALUES
           (1, 'w boksie'),
           (2, 'tren jeŸdziecki'),
           (3, 'tren konia'),
           (4, 'na padoku'),
           (5, 'na zawodach')
GO
--Kon_KonStatus
INSERT INTO Kon_KonStatus
           (konId,statusId, odKiedy, doKiedy)
     VALUES
           (4,2, '2015-12-14 15:45:00.000','2015-08-14 16:30:00.000'),
           (4,1, '2015-08-14 16:30:00.000','2015-08-14 16:30:00.000'),
           (4,4, '2015-08-15 07:45:00.000',NULL),
           (7,1, '2015-08-13 21:10:00.000','2015-08-14 16:30:00.000'),
           (7,5, '2015-08-14 09:35:00.000',NULL),
           (1,2, '2015-08-14 00:00:00.000',NULL),
           (3,4, '2016-08-15 00:00:00.000',NULL),
           (2,3, '2015-08-14 00:00:00.000',NULL),
           (5,4, '2015-08-14 00:00:00.000',NULL)
GO
--KonBoks
INSERT INTO KonBoks
           (boksId, numer)
     VALUES
           (1, 'A1'),
           (2, 'A2'),
           (3, 'A3'),
           (4, 'B1'),
           (5, 'B2'),
           (6, 'B3'),
           (7, 'B4'),
           (8, 'B5')
GO
--Kon_KonBoks
INSERT INTO Kon_KonBoks
           (konId, boksId, odKiedy, doKiedy)
     VALUES
           (1, 2, '2015-04-16', '2015-12-11'),
           (1, 5, '2015-12-12', NULL),
           (2, 4, '2015-02-02', '2015-12-11'),
           (2, 7, '2015-07-05', '2015-12-11'),
           (2, 3, '2016-02-05', NULL),
           (3, 1, '2014-03-15', '2015-12-11'),
           (3, 2, '2015-03-28', NULL),
           (4, 1, '2015-03-28', NULL),
           (5, 4, '2015-03-28', NULL),
           (6, 6, '2015-03-28', NULL)
GO
--KonChoroba
INSERT INTO KonChoroba
           (chorobaId, nazwa)
     VALUES
           (1, 'zwichniêcie nogi lewej przedniej'),
           (2, 'zwichniêcie nogi prawej przednij'),
           (3, 'zapalenie ¿o³¹dka'),
           (4, 'nadwyrê¿enie karku')
GO
--Kon_KonChoroba
INSERT INTO Kon_KonChoroba
           (konId, chorobaId, odKiedy, doKiedy)
     VALUES
           (1, 4, '2015-10-16', NULL),
           (1, 2, '2015-04-13', '2015-09-15'),
           (2, 4, '2014-08-15', '2014-09-14'),
           (2, 2, '2015-05-09', '2015-09-15'),
           (2, 3, '2014-08-01', '2014-09-06'),
           (3, 1, '2015-10-16', '2015-11-20'),
           (3, 2, '2018-06-04', NULL),
           (4, 1, '2015-10-15', '2015-12-01')
GO
--KonDzierzawa
INSERT INTO KonDzierzawa
           (dzierzawaId, dzierzawcaImie, dzierzawcaNazwisko, dataRozpoczecia, dataZakonczenia, czynsz)
     VALUES
           (1, 'Kamil', 'Dzwonik', '2014-09-15', '2015-04-07', 480),
           (2, 'Zuzanna', 'Skowik', '2015-03-30', NULL, 570),
           (3, 'Filip', 'Maskit', '2014-03-07', NULL, 525)
GO
--KonStajnia
INSERT INTO KonStajnia
           (wlasnoscStajniaId, konId, dataZakupu, dataSprzedazy, cenaZakupu, cenaSprzedazy, dzierzawaId)
     VALUES
           (1, 6, '2014-03-15', '2016-03-07', 2400, 2800, NULL),
           (2, 4, '2014-03-15', NULL, 2300, NULL, 3),
           (3, 3, '2014-03-15', NULL, 2700, NULL, 2),
           (4, 6, '2014-03-15', '2016-03-07', 2100, 2700, NULL),
           (5, 7, '2014-03-15', '2016-03-07', 1900, 2200, NULL)
GO
--KonPrywatny
INSERT INTO KonPrywatny
           (wlasnoscPrywatnyId, konId, wlascicielImie, wlascicielNazwisko, dataPrzyjecia, dataWydania, czynsz)
     VALUES
           (1, 2, 'Adam', 'Nowak', '2014-07-12', '2016-05-04', 800),
           (2, 5, 'Piotr', 'Kowalski', '2014-05-25', NULL, 1100)
GO
--Dieta
INSERT INTO Dieta
           (dietaId, konId, uwagi)
     VALUES
           (1, 1, NULL),
           (2, 2, NULL),
           (3, 3, NULL),
           (4, 4, NULL),
           (5, 5, NULL),
           (6, 6, NULL),
           (7, 7, NULL)
GO
--DietaPosilek
INSERT INTO DietaPosilek
           (posilekId, nazwa, godzina)
     VALUES
           (1, 'œniadanie-domyœlne', '06:30:00'),
           (2, 'obiad-domyœlne', '13:00:00'),
           (3, 'kolacja-domyœlne', '18:00:00'),
           (4, 'œniadanie-dodatkwe', '10:00:00'),
           (5, 'obiad-zdrowotny', '12:30:00')
GO
--Dieta_DietaPosilek
INSERT INTO Dieta_DietaPosilek
           (dietaId, posilekId)
     VALUES
           (1, 1),
           (1, 2),
           (1, 3),
           (2, 1),
           (2, 4),
           (2, 3),
           (3, 1),
           (3, 2),
           (3, 3)
GO
--Firma
INSERT INTO Firma
           (firmaId, nazwa, nip, numerKonta)
     VALUES
           (1, 'Farma Zbo¿ex', 1234567891, 15246151287688756585687523),
           (2, 'HurtDet', 9876543210, 21665161651651651651651615),
           (3, 'WetHelth', 5615156511, 6515616516516516516165),
           (4, 'KowalStal', 6546546545, 456465465465465465464564)
GO
--TowarRodzaj
INSERT INTO TowarRodzaj
           (rodzajId, rodzajNazwa)
     VALUES
           (1, 'produkt'),
           (2, 'warzywo'),
           (3, 'lek'),
           (4, 'dodatekDie'),
           (5, 'zboze')
GO
--Towar
INSERT INTO Towar
           (towarId, nazwa, stan, jednsotka, rodzajId)
     VALUES
           (1, 'owies', 204.7500, 'kg', 5),
           (2, 'jêczmieñ', 120.3460, 'kg', 5),
           (3, 'marchew', 50, 'kg', 2),
           (4, 'burak', 24, 'kg', 2),
           (5, 'siod³o', 5, NULL, 1),
           (6, 'kantar', 7, NULL, 1),
           (7, 'lek na jelita', 20, 'pud', 3),
           (8, 'lek przeciwbólowy', 5, 'pud', 3),
           (9, 'kostka soli dla konia', 16, NULL, 4),
           (10, 'szczotka', 2, NULL, 1),
           (11, 'kalosze', 5, 'para', 1)
GO
--TowarZakup
INSERT INTO TowarZakup
           (zakupId, data, firmaId, uwagi)
     VALUES
           (1, '2015-04-02', 1,NULL),
           (2, '2015-04-28', 1,NULL),
           (3, '2015-04-14', 2,NULL),
           (4, '2015-04-15', 2,NULL)
GO
--Towar_TowarZakup
INSERT INTO Towar_TowarZakup
           (zakupId, towarId, cena, iloœæ, jednostka)
     VALUES
           (1, 1, 740, 0.2, 't'),
           (1, 2, 780, 0.15, 't'),
           (3, 8, 25, 5, NULL),
           (2, 5, 5, 15, 'kg'),
           (4, 5, 3, 20, 'kg'),
           (1, 5, 4, 14, 'kg')
GO
--Towar_TowarZakup
INSERT INTO Towar_TowarZakup
           (zakupId, towarId, cena, iloœæ, jednostka)
     VALUES
           (1, 1, 740, 0.2, 't'),
           (1, 2, 780, 0.15, 't'),
           (3, 8, 25, 5, NULL),
           (2, 5, 5, 15, 'kg'),
           (4, 5, 3, 20, 'kg'),
           (1, 5, 4, 14, 'kg')
GO
--DietaPosilek_Towar
INSERT INTO DietaPosilek_Towar
           (posilekId, towarId, iloœæ)
     VALUES
           (1, 3, 5),
           (2, 2, 41),
           (1, 1, 67),
           (3, 2, 33)
GO


--Wizyta
INSERT INTO Wizyta
           (wizytaId, konId, cel, cena, data)
     VALUES
           (1, 2, 'Skrêcone kopyto', 50, '2015-04-15'),
           (2, 5, 'problemy z ¿o³¹dkiem', 80, '2015-05-09'),
           (3, 7, 'zrobienie kopyt', 120, '2015-05-03')
GO
--WizytaWeterynarz
INSERT INTO WizytaWeterynarz
           (weterynarzId, imie, nazwisko, firmaId)
     VALUES
           (1, 'Piotr', 'Kuna', 3),
           (2, 'Stanis³aw', 'Bieski', 3)
GO
--Wizyta_WizytaWeterynarz
INSERT INTO Wizyta_WizytaWeterynarz
           (wizytaId, weterynarzId)
     VALUES
           (1, 2),
           (2, 1)
GO
--WizytaKowal
INSERT INTO WizytaKowal
           (kowalId, imie, nazwisko, firmaId)
     VALUES
           (1, 'Grzegorz', 'Dabit', 4),
           (2, 'Robert', 'Kielecki', 4)
GO
--Wizyta_WizytaKowal
INSERT INTO Wizyta_WizytaKowal
           (wizytaId, kowalId)
     VALUES
           (1, 2)
GO
--PracownikStanowisko
INSERT INTO PracownikStanowisko
           (stanowiskoId, stanowiskoNazwa)
     VALUES
           (1, 'trener'),
           (2, 'stajenny'),
           (3, 'inne')
GO
--Pracownik
INSERT INTO Pracownik
           (pracownikId, imie, nazwisko, pensja, numerKonta, adres, telefon, stanowiskoId)
     VALUES
           (1, 'Jakub', 'Skowik', 2100, 2551156157556456135130, 'Fio³kowa 7', '543-481-153', 1),
           (2, 'Sebastian', 'Gryczka', 2200, 15616198951891615317981, 'Grunwaldzka 4', '656-348-164', 1),
           (3, 'Bart³omiej', 'Sujka', 2100, 165681681532165106053152, 'Konwaliowa 6', '513-875-531', 1),
           (4, 'Bogadn', 'Zagórski', 2000, 8489489486541689886846468, 'Tysi¹ca 8', '168-554-235', 2),
           (5, 'Stefan', 'Oleñski', 1900, 1568486464818884681354684, 'Rotundy 13', '468-864-453', 2)
GO
--Pracownik_Boks
INSERT INTO Pracownik_Boks
           (pracownikId, boksId, odKiedy, doKiedy)
     VALUES
           (1, 1, '2015-08-05 00:00:00.000', NULL),
           (1, 2, '2015-08-05 00:00:00.000', NULL),
           (1, 3, '2015-08-05 00:00:00.000', NULL),
           (1, 4, '2015-08-05 00:00:00.000', NULL),
           (2, 5, '2015-04-15 00:00:00.000', NULL),
           (2, 6, '2015-04-15 00:00:00.000', NULL),
           (2, 7, '2015-04-15 00:00:00.000', NULL),
           (2, 8, '2015-04-15 00:00:00.000', NULL)
GO
--TreningRodzaj
INSERT INTO TreningRodzaj
           (rodzajId, nazwa, cena)
     VALUES
			(1, 'przyg do zawodów', NULL),
			(2, 'jeŸdŸ grupowy', 50),
			(3, 'jeŸdŸ personalny', 300)
GO
--Ujezdzalnia
INSERT INTO Ujezdzalnia
           (ujezdzalniaId, nazwa, status)
     VALUES
			(1, 'kryta du¿a', 'tylko grupy'),
			(2, 'kryta ma³a', NULL),
			(3, 'okr¹g³a', 'do wewnêtzrnego u¿ytku stajni'),
			(4, 'na dworze', NULL)
GO
--Trening
INSERT INTO Trening
           (treningId, ujezdzalniaId, pracownikId, rodzajId, data, godzinaRozpoczecia, godzinaZakonczenia)
     VALUES
           (1, 2, 2, 2, '2015-04-03', '14:15:00', '15:30:00'),
           (2, 4, 1, 3, '2015-04-03', '14:30:00', '15:45:00'),
           (3, 3, 3, 1, '2015-04-03', '12:00:00', '14:20:00'),
           (4, 2, 3, 2, '2015-04-03', '15:45:00', '17:00:00'),
           (5, 3, 3, 1, '2015-04-03', '15:20:00', '17:00:00'),
           (6, 2, 3, 2, '2015-06-07', '14:30:00', '16:00:00'),
           (7, 2, 3, 2, '2016-04-01', '12:00:00', '17:00:00')
GO
--TreningUczestnik
INSERT INTO TreningUczestnik
           (uczestnikId, imie, nazwisko, waga)
     VALUES
			(1, 'Maciek','Firlej', 80),
			(2, 'Zuzanna','Skoczek', 60),
			(3, 'Filip','Muniewski', 87),
			(4, 'Ewa','Makowska', 58),
			(5, 'Robert','Kosecki', 76),
			(6, 'Daniel','Moskowski', 74),
			(7, 'Bart³omiej','Cyliñski', 63),
			(8, 'Danuta','Joniak', 71),
			(9, 'Robert','Zadro¿ny', 68),
			(10, 'Sylwia','Kryczko', 65)
GO
--Trening_TreningUczestnik
INSERT INTO Trening_TreningUczestnik
           (uczestnikId, treningId, konId)
     VALUES
			(1, 1, 3),
			(2, 1, 4),
			(3, 1, 6),
			(4, 2, 1),
			(5, 1, 7),
			(6, 4, 2),
			(7, 4, 6),
			(8, 4, 7),
			(9, 4, 4),
			(10, 4, 1)
GO
--Trening_Kon
INSERT INTO Trening_Kon
           (konId, treningId)
     VALUES
			(8, 3),
			(9, 5)
GO
--ZawodyRodzaj
INSERT INTO ZawodyRodzaj
           (rodzajId, nazwa)
     VALUES
			(1, 'przeszkody'),
			(2, 'wyœcigi')
GO
--Zawody
INSERT INTO Zawody
           (zawodyId, nazwa, rodzajId, data)
     VALUES
			(1, 'Puchar konika', 2, '2015-04-09'),
			(2, 'Miejskie derby', 1, '2015-04-16'),
			(3, 'Wielki bieg', 2, '2015-04-20')
GO
--ZawodyNagroda
INSERT INTO ZawodyNagroda
           (nagrodaId, zawodyId, nazwa, kwota)
     VALUES
           (1, 2, '', 3000),
           (2, 2, '', 2000),
           (3, 3, '', 1200),
           (4, 3, '', 300),
           (5, 3, 'Puchar', NULL),
           (6, 1, 'Medal', NULL),
           (7, 1, '', 1400)
GO
--Zawody_Kon_Pracownik
INSERT INTO Zawody_Kon_Pracownik
           (zawodyId, konId, pracownikId, miejsce)
     VALUES
           (1, 4, 2, 2),
           (1, 6, 3, 5),
           (1, 3, 1, 6),
           (2, 5, 1, 1),
           (2, 6, 3, 2),
           (2, 9, 2, 3),
           (3, 8, 2, 1)
GO