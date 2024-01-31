USE Stajnia2
GO

DROP VIEW Widok_Stajenni
DROP VIEW Widok_PrzydzialBoksy
DROP VIEW Widok_NagrodyKoni
DROP VIEW Widok_TreningiKoni
DROP VIEW Widok_ZapotrzebowanieKonia
DROP VIEW Widok_ChorobyKonia
DROP VIEW Widok_WizytyKonia
DROP VIEW Widok_TreningiJeüdzieckie
GO

--Widok_Stajenni
CREATE VIEW Widok_Stajenni AS
		SELECT dbo.Pracownik.imie, dbo.Pracownik.nazwisko, dbo.Pracownik.telefon
		FROM     dbo.Pracownik INNER JOIN
						  dbo.PracownikStanowisko ON dbo.PracownikStanowisko.stanowiskoId = dbo.Pracownik.stanowiskoId
		WHERE  (dbo.PracownikStanowisko.stanowiskoId = 2)
GO
--Widok_PrzydzialBoksy
CREATE VIEW Widok_PrzydzialBoksy AS
		SELECT dbo.Pracownik.imie, dbo.Pracownik.nazwisko, dbo.KonBoks.numer
		FROM     dbo.Pracownik INNER JOIN
                  dbo.Pracownik_Boks ON dbo.Pracownik.pracownikId = dbo.Pracownik_Boks.pracownikId INNER JOIN
                  dbo.PracownikStanowisko ON dbo.Pracownik.pracownikId = dbo.PracownikStanowisko.stanowiskoId INNER JOIN
                  dbo.KonBoks ON dbo.Pracownik_Boks.boksId = dbo.KonBoks.boksId
GO
--Widok_NagrodyKoni
CREATE VIEW Widok_NagrodyKoni AS
		SELECT dbo.Kon.imie, dbo.ZawodyNagroda.nazwa, dbo.ZawodyNagroda.kwota
		FROM     dbo.ZawodyNagroda INNER JOIN
						  dbo.Zawody ON dbo.ZawodyNagroda.zawodyId = dbo.Zawody.zawodyId INNER JOIN
						  dbo.Zawody_Kon_Pracownik ON dbo.Zawody.zawodyId = dbo.Zawody_Kon_Pracownik.zawodyId INNER JOIN
						  dbo.Kon ON dbo.Zawody_Kon_Pracownik.konId = dbo.Kon.konId
GO
--Widok_TreningiKoni
CREATE VIEW Widok_TreningiKoni AS
		SELECT dbo.Kon.imie AS kon, dbo.Trening.data AS kiedy, dbo.TreningRodzaj.nazwa AS rodzaj, dbo.Pracownik.imie AS imie_pracownika, dbo.Pracownik.nazwisko AS nazwisko_pracownika, dbo.Ujezdzalnia.nazwa AS ujezdzalnia
		FROM     dbo.Kon INNER JOIN
                  dbo.Trening_Kon ON dbo.Kon.konId = dbo.Trening_Kon.konId INNER JOIN
                  dbo.Trening ON dbo.Trening_Kon.treningId = dbo.Trening.treningId INNER JOIN
                  dbo.Pracownik ON dbo.Trening.pracownikId = dbo.Pracownik.pracownikId INNER JOIN
                  dbo.Ujezdzalnia ON dbo.Trening.ujezdzalniaId = dbo.Ujezdzalnia.ujezdzalniaId INNER JOIN
                  dbo.TreningRodzaj ON dbo.Trening.rodzajId = dbo.TreningRodzaj.rodzajId
GO
--Widok_ZapotrzebowanieKonia
CREATE VIEW Widok_ZapotrzebowanieKonia AS
		SELECT dbo.Kon.imie AS kon, dbo.DietaPosilek.nazwa AS posilek, dbo.DietaPosilek.godzina AS godzina_posilku, dbo.DietaPosilek_Towar.iloúÊ AS ilosc_pozywienia, dbo.TowarRodzaj.rodzajNazwa AS rodzaj_pozywienia, dbo.Dieta.dietaId
		FROM     dbo.DietaPosilek_Towar INNER JOIN
                  dbo.DietaPosilek ON dbo.DietaPosilek_Towar.posilekId = dbo.DietaPosilek.posilekId INNER JOIN
                  dbo.Dieta_DietaPosilek ON dbo.DietaPosilek.posilekId = dbo.Dieta_DietaPosilek.posilekId INNER JOIN
                  dbo.Dieta ON dbo.Dieta_DietaPosilek.dietaId = dbo.Dieta.dietaId INNER JOIN
                  dbo.Kon ON dbo.Dieta.konId = dbo.Kon.konId INNER JOIN
                  dbo.Towar ON dbo.DietaPosilek_Towar.towarId = dbo.Towar.towarId INNER JOIN
                  dbo.TowarRodzaj ON dbo.Towar.rodzajId = dbo.TowarRodzaj.rodzajId
GO
--Widok_ChorobyKonia
CREATE VIEW Widok_ChorobyKonia AS
		SELECT dbo.Kon.imie AS kon, dbo.KonChoroba.nazwa AS choroba, dbo.Kon_KonChoroba.odKiedy, dbo.Kon_KonChoroba.doKiedy
		FROM     dbo.Kon INNER JOIN
                  dbo.Kon_KonChoroba ON dbo.Kon.konId = dbo.Kon_KonChoroba.konId INNER JOIN
                  dbo.KonChoroba ON dbo.Kon_KonChoroba.chorobaId = dbo.KonChoroba.chorobaId
				GROUP BY dbo.Kon.imie, dbo.KonChoroba.nazwa, dbo.Kon_KonChoroba.odKiedy, dbo.Kon_KonChoroba.doKiedy
GO
--Widok_WizytyKonia
CREATE VIEW Widok_WizytyKonia AS
		SELECT dbo.Kon.imie AS kon, dbo.Wizyta.cena, dbo.Wizyta.cel, dbo.Wizyta.data, dbo.Firma.nazwa
		FROM     dbo.Wizyta INNER JOIN
                  dbo.Wizyta_WizytaWeterynarz ON dbo.Wizyta.wizytaId = dbo.Wizyta_WizytaWeterynarz.wizytaId INNER JOIN
                  dbo.WizytaWeterynarz ON dbo.Wizyta_WizytaWeterynarz.weterynarzId = dbo.WizytaWeterynarz.weterynarzId INNER JOIN
                  dbo.Wizyta_WizytaKowal ON dbo.Wizyta.wizytaId = dbo.Wizyta_WizytaKowal.wizytaId INNER JOIN
                  dbo.WizytaKowal ON dbo.Wizyta_WizytaKowal.kowalId = dbo.WizytaKowal.kowalId INNER JOIN
                  dbo.Kon ON dbo.Wizyta.konId = dbo.Kon.konId INNER JOIN
                  dbo.Firma ON dbo.WizytaWeterynarz.firmaId = dbo.Firma.firmaId AND dbo.WizytaKowal.firmaId = dbo.Firma.firmaId
				GROUP BY dbo.Kon.imie, dbo.Wizyta.cena, dbo.Wizyta.cel, dbo.Wizyta.data, dbo.Firma.nazwa
GO
--Widok_TreningiJeüdzieckie
CREATE VIEW Widok_TreningiJeüdzieckie AS
		SELECT dbo.TreningUczestnik.imie, dbo.TreningUczestnik.nazwisko, dbo.Kon.imie AS kon, dbo.Kon.rasa AS rasaKonia, dbo.Trening.data, dbo.Trening.godzinaRozpoczecia, dbo.Trening.godzinaZakonczenia, dbo.Ujezdzalnia.nazwa AS ujezdzalnia, 
                  dbo.Pracownik.imie AS imiePracownika, dbo.Pracownik.nazwisko AS nazwiskoPracownika
		FROM     dbo.Trening INNER JOIN
                  dbo.Trening_TreningUczestnik ON dbo.Trening.treningId = dbo.Trening_TreningUczestnik.treningId INNER JOIN
                  dbo.Kon ON dbo.Trening_TreningUczestnik.konId = dbo.Kon.konId INNER JOIN
                  dbo.TreningUczestnik ON dbo.Trening_TreningUczestnik.uczestnikId = dbo.TreningUczestnik.uczestnikId INNER JOIN
                  dbo.Pracownik ON dbo.Trening.pracownikId = dbo.Pracownik.pracownikId INNER JOIN
                  dbo.Ujezdzalnia ON dbo.Trening.ujezdzalniaId = dbo.Ujezdzalnia.ujezdzalniaId
GO

