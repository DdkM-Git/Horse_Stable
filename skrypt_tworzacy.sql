CREATE DATABASE Stajnia
GO

USE Stajnia
GO

--Kon
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Kon'))
	PRINT ' Tabela Kon istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Kon w BD Stajnia'
		CREATE TABLE Kon
		(
			[konId] [int] NOT NULL PRIMARY KEY,
			[imie] [varchar](20) NOT NULL,
			[numerPaszportu] [varchar](20) NOT NULL,
			[rasa] [varchar](15) NOT NULL,
			[ojciec] [varchar](20) NOT NULL,
			[matka] [varchar](20) NOT NULL,
			[uwagi] [varchar](50) NULL,
		)
	END
--KonStatus
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'KonStatus'))
	PRINT ' Tabela KonStatus istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele KonStatus w BD Stajnia'
		CREATE TABLE KonStatus
		(
			[statusId] [int] NOT NULL PRIMARY KEY,
			[nazwa] [varchar](15) NOT NULL,
		)
	END
--Kon_KonStatus
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Kon_KonStatus'))
	PRINT ' Tabela Kon_KonStatus istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Kon_KonStatus w BD Stajnia'
		CREATE TABLE Kon_KonStatus
		(
			[konId] [int] NOT NULL,
			[statusId] [int] NOT NULL,
			[odKiedy] [datetime] NOT NULL,
			[doKiedy] [datetime] NULL
		)
	END
--KonBoks
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'KonBoks'))
	PRINT ' Tabela KonBoks istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele KonBoks w BD Stajnia'
		CREATE TABLE KonBoks
		(
			[boksId] [int] NOT NULL PRIMARY KEY,
			[numer] [varchar](6) NOT NULL,
		)
	END
--Kon_KonBoks
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Kon_KonBoks'))
	PRINT ' Tabela Kon_KonBoks istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Kon_KonBoks w BD Stajnia'
		CREATE TABLE Kon_KonBoks
		(
			[konId] [int] NOT NULL,
			[boksId] [int] NOT NULL,
			[odKiedy] [date] NOT NULL,
			[doKiedy] [date] NULL
		)
	END
--KonChoroba
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'KonChoroba'))
	PRINT ' Tabela KonChoroba istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele KonChoroba w BD Stajnia'
		CREATE TABLE KonChoroba
		(
			[chorobaId] [int] NOT NULL PRIMARY KEY,
			[nazwa] [varchar](40) NOT NULL,
		)
	END
--Kon_KonChoroba
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Kon_KonChoroba'))
	PRINT ' Tabela Kon_KonChoroba istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Kon_KonChoroba w BD Stajnia'
		CREATE TABLE Kon_KonChoroba
		(
			[konId] [int] NOT NULL,
			[chorobaId] [int] NOT NULL,
			[odKiedy] [date] NOT NULL,
			[doKiedy] [date] NULL
		)
	END
--KonStajnia
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'KonStajnia'))
	PRINT ' Tabela KonStajnia istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele KonStajnia w BD Stajnia'
		CREATE TABLE KonStajnia
		(
			[wlasnoscStajniaId] [int] NOT NULL PRIMARY KEY,
			[konId] [int] NOT NULL,
			[dataZakupu] [date] NOT NULL,
			[dataSprzedazy] [date] NULL,
			[cenaZakupu] [decimal](10, 2) NOT NULL,
			[cenaSprzedazy] [decimal](10, 2) NULL,
			[dzierzawaId] [int] NULL,
		)
	END
--KonDzierzawa
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'KonDzierzawa'))
	PRINT ' Tabela KonDzierzawa istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele KonDzierzawa w BD Stajnia'
		CREATE TABLE KonDzierzawa
		(
			[dzierzawaId] [int] NOT NULL PRIMARY KEY,
			[dzierzawcaImie] [varchar](15) NOT NULL,
			[dzierzawcaNazwisko] [varchar](20) NOT NULL,
			[dataRozpoczecia] [date] NOT NULL,
			[dataZakonczenia] [date] NULL,
			[czynsz] [decimal](7, 2) NOT NULL,
		)
	END
--KonPrywatny
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'KonPrywatny'))
	PRINT ' Tabela KonPrywatny istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele KonPrywatny w BD Stajnia'
		CREATE TABLE KonPrywatny
		(
			[wlasnoscPrywatnyId] [int] NOT NULL PRIMARY KEY,
			[konId] [int] NOT NULL,
			[wlascicielImie] [varchar](15) NOT NULL,
			[wlascicielNazwisko] [varchar](20) NOT NULL,
			[dataPrzyjecia] [date] NOT NULL,
			[dataWydania] [date] NULL,
			[czynsz] [decimal](7, 2) NOT NULL,
		)
	END
--Dieta
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Dieta'))
	PRINT ' Tabela Dieta istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Dieta w BD Stajnia'
		CREATE TABLE Dieta
		(
			[dietaId] [int] NOT NULL PRIMARY KEY,
			[konId] [int] NOT NULL,
			[uwagi] [varchar](50) NULL,
		)
	END
--DietaPosilek
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'DietaPosilek'))
	PRINT ' Tabela DietaPosilek istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele DietaPosilek w BD Stajnia'
		CREATE TABLE DietaPosilek
		(
			[posilekId] [int] NOT NULL PRIMARY KEY,
			[nazwa] [varchar](20) NOT NULL,
			[godzina] [time](0) NOT NULL,
		)
	END
--Dieta_DietaPosilek
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Dieta_DietaPosilek'))
	PRINT ' Tabela Dieta_DietaPosilek istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Dieta_DietaPosilek w BD Stajnia'
		CREATE TABLE Dieta_DietaPosilek
		(
			[dietaId] [int] NOT NULL,
			[posilekId] [int] NOT NULL
		)
	END
--DietaPosilek_Towar
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'DietaPosilek_Towar'))
	PRINT ' Tabela DietaPosilek_Towar istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele DietaPosilek_Towar w BD Stajnia'
		CREATE TABLE DietaPosilek_Towar
		(
			[posilekId] [int] NOT NULL,
			[towarId] [int] NOT NULL,
			[iloœæ] [decimal](10, 2) NOT NULL
		)
	END
--Wizyta
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Wizyta'))
	PRINT ' Tabela Wizyta istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Wizyta w BD Stajnia'
		CREATE TABLE Wizyta
		(
			[wizytaId] [int] NOT NULL PRIMARY KEY,
			[konId] [int] NOT NULL,
			[cel] [varchar](30) NOT NULL,
			[cena] [decimal](6, 2) NOT NULL,
			[data] [date] NOT NULL,
		)
	END
--WizytaWeterynarz
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'WizytaWeterynarz'))
	PRINT ' Tabela WizytaWeterynarz istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele WizytaWeterynarz w BD Stajnia'
		CREATE TABLE WizytaWeterynarz
		(
			[weterynarzId] [int] NOT NULL PRIMARY KEY,
			[imie] [varchar](10) NOT NULL,
			[nazwisko] [varchar](15) NOT NULL,
			[firmaId] [int] NOT NULL,
		)
	END
--Wizyta_WizytaWeterynarz
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Wizyta_WizytaWeterynarz'))
	PRINT ' Tabela Wizyta_WizytaWeterynarz istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Wizyta_WizytaWeterynarz w BD Stajnia'
		CREATE TABLE Wizyta_WizytaWeterynarz
		(
			[wizytaId] [int] NOT NULL,
			[weterynarzId] [int] NOT NULL,
		)
	END
--WizytaKowal
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'WizytaKowal'))
	PRINT ' Tabela WizytaKowal istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele WizytaKowal w BD Stajnia'
		CREATE TABLE WizytaKowal
		(
			[kowalId] [int] NOT NULL PRIMARY KEY,
			[imie] [varchar](10) NOT NULL,
			[nazwisko] [varchar](15) NOT NULL,
			[firmaId] [int] NOT NULL,
		)
	END
--Wizyta_WizytaKowal
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Wizyta_WizytaKowal'))
	PRINT ' Tabela Wizyta_WizytaKowal istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Wizyta_WizytaKowal w BD Stajnia'
		CREATE TABLE Wizyta_WizytaKowal
		(
			[wizytaId] [int] NOT NULL,
			[kowalId] [int] NOT NULL,
		)
	END
--Pracownik
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Pracownik'))
	PRINT ' Tabela Pracownik istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Pracownik w BD Stajnia'
		CREATE TABLE Pracownik
		(
			[pracownikId] [int] NOT NULL PRIMARY KEY,
			[imie] [varchar](15) NOT NULL,
			[nazwisko] [varchar](20) NOT NULL,
			[pensja] [int] NOT NULL,
			[numerKonta] [varchar](26) NOT NULL,
			[adres] [varchar](50) NOT NULL,
			[telefon] [varchar](11) NULL,
			[stanowiskoId] [int] NULL,
		)
	END
--PracownikStanowisko
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'PracownikStanowisko'))
	PRINT ' Tabela PracownikStanowisko istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele PracownikStanowisko w BD Stajnia'
		CREATE TABLE PracownikStanowisko
		(
			[stanowiskoId] [int] NOT NULL PRIMARY KEY,
			[stanowiskoNazwa] [varchar](40) NOT NULL
		)
	END
--Pracownik_Boks
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Pracownik_Boks'))
	PRINT ' Tabela Pracownik_Boks istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Pracownik_Boks w BD Stajnia'
		CREATE TABLE Pracownik_Boks
		(
			[pracownikId] [int] NOT NULL,
			[boksId] [int] NOT NULL,
			[odKiedy] [datetime] NOT NULL,
			[doKiedy] [datetime] NULL
		)
	END
--Trening
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Trening'))
	PRINT ' Tabela Trening istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Trening w BD Stajnia'
		CREATE TABLE Trening
		(
			[treningId] [int] NOT NULL PRIMARY KEY,
			[ujezdzalniaId] [int] NOT NULL,
			[pracownikId] [int] NOT NULL,
			[rodzajId] [int] NOT NULL,
			[data] [date] NOT NULL,
			[godzinaRozpoczecia] [time](0) NOT NULL,
			[godzinaZakonczenia] [time](0) NOT NULL,
		)
	END
--TreningRodzaj
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'TreningRodzaj'))
	PRINT ' Tabela TreningRodzaj istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele TreningRodzaj w BD Stajnia'
		CREATE TABLE TreningRodzaj
		(
			[rodzajId] [int] NOT NULL PRIMARY KEY,
			[nazwa] [varchar](25) NOT NULL,
			[cena] [decimal](6, 2) NULL,
		)
	END
--TreningUczestnik
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'TreningUczestnik'))
	PRINT ' Tabela TreningUczestnik istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele TreningUczestnik w BD Stajnia'
		CREATE TABLE TreningUczestnik
		(
			[uczestnikId] [int] NOT NULL PRIMARY KEY,
			[imie] [varchar](15) NOT NULL,
			[nazwisko] [varchar](20) NOT NULL,
			[waga] [int] NULL,
		)
	END
--Trening_TreningUczestnik
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Trening_TreningUczestnik'))
	PRINT ' Tabela Trening_TreningUczestnik istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Trening_TreningUczestnik w BD Stajnia'
		CREATE TABLE Trening_TreningUczestnik
		(
			[uczestnikId] [int] NOT NULL,
			[treningId] [int] NOT NULL,
			[konId] [int] NOT NULL,
		)
	END
--Trening_Kon
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Trening_Kon'))
	PRINT ' Tabela Trening_Kon istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Trening_Kon w BD Stajnia'
		CREATE TABLE Trening_Kon
		(
			[konId] [int] NOT NULL,
			[treningId] [int] NOT NULL,
		)
	END
--Ujezdzalnia
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Ujezdzalnia'))
	PRINT ' Tabela Ujezdzalnia istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Ujezdzalnia w BD Stajnia'
		CREATE TABLE Ujezdzalnia
		(
			[ujezdzalniaId] [int] NOT NULL PRIMARY KEY,
			[nazwa] [varchar](15) NOT NULL,
			[status] [varchar](50) NULL,
		)
	END
--Zawody
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Zawody'))
	PRINT ' Tabela Zawody istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Zawody w BD Stajnia'
		CREATE TABLE Zawody
		(
			[zawodyId] [int] NOT NULL PRIMARY KEY,
			[nazwa] [varchar](25) NOT NULL,
			[rodzajId] [int] NOT NULL,
			[data] [date] NOT NULL,
		)
	END
--ZawodyRodzaj
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'ZawodyRodzaj'))
	PRINT ' Tabela ZawodyRodzaj istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele ZawodyRodzaj w BD Stajnia'
		CREATE TABLE ZawodyRodzaj
		(
			[rodzajId] [int] NOT NULL PRIMARY KEY,
			[nazwa] [varchar](15) NOT NULL,
		)
	END
--ZawodyNagroda
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'ZawodyNagroda'))
	PRINT ' Tabela ZawodyNagroda istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele ZawodyNagroda w BD Stajnia'
		CREATE TABLE ZawodyNagroda
		(
			[nagrodaId] [int] NOT NULL PRIMARY KEY,
			[zawodyId] [int] NOT NULL,
			[nazwa] [varchar](20) NULL,
			[kwota] [decimal](8, 2) NULL,
		)
	END
--Zawody_Kon_Pracownik
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Zawody_Kon_Pracownik'))
	PRINT ' Tabela Zawody_Kon_Pracownik istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Zawody_Kon_Pracownik w BD Stajnia'
		CREATE TABLE Zawody_Kon_Pracownik
		(
			[zawodyId] [int] NOT NULL,
			[konId] [int] NOT NULL,
			[pracownikId] [int] NOT NULL,
			[miejsce] [int] NULL,
		)
	END
--Towar
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Towar'))
	PRINT ' Tabela Towar istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Towar w BD Stajnia'
		CREATE TABLE Towar
		(
			[towarId] [int] NOT NULL PRIMARY KEY,
			[nazwa] [varchar](25) NOT NULL,
			[stan] [decimal](12, 4) NOT NULL,
			[jednsotka] [varchar](5) NULL,
			[rodzajId] [int] NULL,
		)
	END
--TowarRodzaj
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'TowarRodzaj'))
	PRINT ' Tabela TowarRodzaj istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele TowarRodzaj w BD Stajnia'
		CREATE TABLE TowarRodzaj
		(
			[rodzajId] [int] NOT NULL PRIMARY KEY,
			[rodzajNazwa] [nchar](10) NOT NULL,
		)
	END
--TowarZakup
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'TowarZakup'))
	PRINT ' Tabela TowarZakup istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele TowarZakup w BD Stajnia'
		CREATE TABLE TowarZakup
		(
			[zakupId] [int] NOT NULL PRIMARY KEY,
			[data] [date] NOT NULL,
			[firmaId] [int] NOT NULL,
			[uwagi] [varchar](50) NULL,
		)
	END
--Towar_TowarZakup
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Towar_TowarZakup'))
	PRINT ' Tabela Towar_TowarZakup istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Towar_TowarZakup w BD Stajnia'
		CREATE TABLE Towar_TowarZakup
		(
			[zakupId] [int] NOT NULL,
			[towarId] [int] NOT NULL,
			[cena] [decimal](12, 2) NOT NULL,
			[iloœæ] [decimal](12, 4) NOT NULL,
			[jednostka] [varchar](5) NULL
		)
	END
--Firma
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Firma'))
	PRINT ' Tabela Firma istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Firma w BD Stajnia'
		CREATE TABLE Firma
		(
			[firmaId] [int] NOT NULL PRIMARY KEY,
			[nazwa] [varchar](20) NOT NULL,
			[nip] [varchar](10) NOT NULL,
			[numerKonta] [varchar](26) NOT NULL
		)
	END
--Komunikaty
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Komunikaty'))
	PRINT ' Tabela Komunikaty istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Komunikaty w BD Stajnia'
		CREATE TABLE Komunikaty
		(
			[komunikatId] [int] NOT NULL PRIMARY KEY,
			[tresc] [varchar](60) NOT NULL,
			[data] [date] NOT NULL
		)
	END
--Bilans
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'Bilans'))
	PRINT ' Tabela Bilans istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze tabele Bilans w BD Stajnia'
		CREATE TABLE Bilans
		(
			[bilansId] [int] NOT NULL PRIMARY KEY IDENTITY(1,1),
			[zmiana] [decimal](16,2) NOT NULL,
			[zmianaJednostkowo] [decimal](16,2) NOT NULL,
			[tresc] [varchar](60) NOT NULL,
			[data] [date] NOT NULL DEFAULT GETDATE()
		)
	END
GO

--FK_Kon_KonChoroba_Kon
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Kon_KonChoroba_Kon'))
	PRINT ' Klucz obcy FK_Kon_KonChoroba_Kon istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Kon_KonChoroba_Kon w BD Stajnia'
		ALTER TABLE Kon_KonChoroba ADD
			CONSTRAINT FK_Kon_KonChoroba_Kon FOREIGN KEY
				(konId)REFERENCES Kon(konId)
	END
--FK_Kon_KonChoroba_KonChoroba
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Kon_KonChoroba_KonChoroba'))
	PRINT ' Klucz obcy FK_Kon_KonChoroba_KonChoroba istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Kon_KonChoroba_KonChoroba w BD Stajnia'
		ALTER TABLE Kon_KonChoroba ADD
			CONSTRAINT [FK_Kon_KonChoroba_KonChoroba] FOREIGN KEY
				(chorobaId)REFERENCES KonChoroba(chorobaId)
	END
--FK_Kon_KonStatus_Kon
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Kon_KonStatus_Kon'))
	PRINT ' Klucz obcy FK_Kon_KonStatus_Kon istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Kon_KonStatus_Kon w BD Stajnia'
		ALTER TABLE Kon_KonStatus ADD
			CONSTRAINT [FK_Kon_KonStatus_Kon] FOREIGN KEY
				(konId)REFERENCES Kon(konId)
	END
--FK_Kon_KonStatus_KonStatus
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Kon_KonStatus_KonStatus'))
	PRINT ' Klucz obcy FK_Kon_KonStatus_KonStatus istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Kon_KonStatus_KonStatus w BD Stajnia'
		ALTER TABLE Kon_KonStatus ADD
			CONSTRAINT FK_Kon_KonStatus_KonStatus FOREIGN KEY
				(statusId)REFERENCES KonStatus(statusId)
	END
--FK_Kon_KonBoks_Kon
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Kon_KonBoks_Kon'))
	PRINT ' Klucz obcy FK_Kon_KonBoks_Kon istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Kon_KonBoks_Kon w BD Stajnia'
		ALTER TABLE Kon_KonBoks ADD
			CONSTRAINT [FK_Kon_KonBoks_Kon] FOREIGN KEY
				(konId)REFERENCES Kon(konId)
	END
--FK_Kon_KonBoks_KonBoks
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Kon_KonBoks_KonBoks'))
	PRINT ' Klucz obcy FK_Kon_KonBoks_KonBoks istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Kon_KonBoks_KonBoks w BD Stajnia'
		ALTER TABLE Kon_KonBoks ADD
			CONSTRAINT [FK_Kon_KonBoks_KonBoks] FOREIGN KEY
				(boksId)REFERENCES KonBoks(boksId)
	END
--FK_KonStajnia_KonDzierzawa
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_KonStajnia_KonDzierzawa'))
	PRINT ' Klucz obcy FK_KonStajnia_KonDzierzawa istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_KonStajnia_KonDzierzawa w BD Stajnia'
		ALTER TABLE KonStajnia ADD
			CONSTRAINT [FK_KonStajnia_KonDzierzawa] FOREIGN KEY
				(dzierzawaId)REFERENCES KonDzierzawa(dzierzawaId)
	END
--FK_KonStajnia_Kon
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_KonStajnia_Kon'))
	PRINT ' Klucz obcy FK_KonStajnia_Kon istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_KonStajnia_Kon w BD Stajnia'
		ALTER TABLE KonStajnia ADD
			CONSTRAINT [FK_KonStajnia_Kon] FOREIGN KEY
				(konId)REFERENCES Kon(konId)
	END
--FK_KonPrywatny_Kon
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_KonPrywatny_Kon'))
	PRINT ' Klucz obcy FK_KonPrywatny_Kon istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_KonPrywatny_Kon w BD Stajnia'
		ALTER TABLE KonPrywatny ADD
			CONSTRAINT [FK_KonPrywatny_Kon] FOREIGN KEY
				(konId)REFERENCES Kon(konId)
	END
--FK_Dieta_Kon
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Dieta_Kon'))
	PRINT ' Klucz obcy FK_Dieta_Kon istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Dieta_Kon w BD Stajnia'
		ALTER TABLE Dieta ADD
			CONSTRAINT [FK_Dieta_Kon] FOREIGN KEY
				(konId)REFERENCES Kon(konId)
	END
--FK_Dieta_DietaPosilek_Dieta
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Dieta_DietaPosilek_Dieta'))
	PRINT ' Klucz obcy FK_Dieta_DietaPosilek_Dieta istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Dieta_DietaPosilek_Dieta w BD Stajnia'
		ALTER TABLE Dieta_DietaPosilek ADD
			CONSTRAINT [FK_Dieta_DietaPosilek_Dieta] FOREIGN KEY
				(dietaId)REFERENCES Dieta(dietaId)
	END
--FK_Dieta_DietaPosilek_DietaPosilek
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Dieta_DietaPosilek_DietaPosilek'))
	PRINT ' Klucz obcy FK_Dieta_DietaPosilek_DietaPosilek istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Dieta_DietaPosilek_DietaPosilek w BD Stajnia'
		ALTER TABLE Dieta_DietaPosilek ADD
			CONSTRAINT [FK_Dieta_DietaPosilek_DietaPosilek] FOREIGN KEY
				(posilekId)REFERENCES DietaPosilek(posilekId)
	END
--FK_DietaPosilek_Towar_DietaPosilek
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_DietaPosilek_Towar_DietaPosilek'))
	PRINT ' Klucz obcy FK_DietaPosilek_Towar_DietaPosilek istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_DietaPosilek_Towar_DietaPosilek w BD Stajnia'
		ALTER TABLE DietaPosilek_Towar ADD
			CONSTRAINT [FK_DietaPosilek_Towar_DietaPosilek] FOREIGN KEY
				(posilekId)REFERENCES DietaPosilek(posilekId)
	END
--FK_DietaPosilek_Towar_Towar
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_DietaPosilek_Towar_Towar'))
	PRINT ' Klucz obcy FK_DietaPosilek_Towar_Towar istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_DietaPosilek_Towar_Towar w BD Stajnia'
		ALTER TABLE DietaPosilek_Towar ADD
			CONSTRAINT [FK_DietaPosilek_Towar_Towar] FOREIGN KEY
				(towarId)REFERENCES Towar(towarId)
	END
--FK_Wizyta_Kon
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Wizyta_Kon'))
	PRINT ' Klucz obcy FK_Wizyta_Kon istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Wizyta_Kon w BD Stajnia'
		ALTER TABLE Wizyta ADD
			CONSTRAINT [FK_Wizyta_Kon] FOREIGN KEY
				(konId)REFERENCES Kon(konId)
	END
--FK_Wizyta_WizytaKowal_Wizyta
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Wizyta_WizytaKowal_Wizyta'))
	PRINT ' Klucz obcy FK_Wizyta_WizytaKowal_Wizyta istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Wizyta_WizytaKowal_Wizyta w BD Stajnia'
		ALTER TABLE Wizyta_WizytaKowal ADD
			CONSTRAINT [FK_Wizyta_WizytaKowal_Wizyta] FOREIGN KEY
				(wizytaId)REFERENCES Wizyta(wizytaId)
	END
--FK_Wizyta_WizytaKowal_WizytaKowal
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Wizyta_WizytaKowal_WizytaKowal'))
	PRINT ' Klucz obcy FK_Wizyta_WizytaKowal_WizytaKowal istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Wizyta_WizytaKowal_WizytaKowal w BD Stajnia'
		ALTER TABLE Wizyta_WizytaKowal ADD
			CONSTRAINT [FK_Wizyta_WizytaKowal_WizytaKowal] FOREIGN KEY
				(kowalId)REFERENCES WizytaKowal(kowalId)
	END
--FK_WizytaKowal_Firma
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_WizytaKowal_Firma'))
	PRINT ' Klucz obcy FK_WizytaKowal_Firma istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_WizytaKowal_Firma w BD Stajnia'
		ALTER TABLE WizytaKowal ADD
			CONSTRAINT [FK_WizytaKowal_Firma] FOREIGN KEY
				(firmaId)REFERENCES Firma(firmaId)
	END
--FK_Wizyta_WizytaWeterynarz_Wizyta
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Wizyta_WizytaWeterynarz_Wizyta'))
	PRINT ' Klucz obcy FK_Wizyta_WizytaWeterynarz_Wizyta istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Wizyta_WizytaWeterynarz_Wizyta w BD Stajnia'
		ALTER TABLE Wizyta_WizytaWeterynarz ADD
			CONSTRAINT [FK_Wizyta_WizytaWeterynarz_Wizyta] FOREIGN KEY
				(wizytaId)REFERENCES Wizyta(wizytaId)
	END
--FK_Wizyta_WizytaWeterynarz_WizytaWeterynarz
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Wizyta_WizytaWeterynarz_WizytaWeterynarz'))
	PRINT ' Klucz obcy FK_Wizyta_WizytaWeterynarz_WizytaWeterynarz istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Wizyta_WizytaWeterynarz_WizytaWeterynarz w BD Stajnia'
		ALTER TABLE Wizyta_WizytaWeterynarz ADD
			CONSTRAINT [FK_Wizyta_WizytaWeterynarz_WizytaWeterynarz] FOREIGN KEY
				(weterynarzId)REFERENCES WizytaWeterynarz(weterynarzId)
	END
--FK_WizytaWeterynarz_Firma
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_WizytaWeterynarz_Firma'))
	PRINT ' Klucz obcy FK_WizytaWeterynarz_Firma istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_WizytaWeterynarz_Firma w BD Stajnia'
		ALTER TABLE WizytaWeterynarz ADD
			CONSTRAINT [FK_WizytaWeterynarz_Firma] FOREIGN KEY
				(firmaId)REFERENCES Firma(firmaId)
	END
--FK_Pracownik_PracownikStanowisko
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Pracownik_PracownikStanowisko'))
	PRINT ' Klucz obcy FK_Pracownik_PracownikStanowisko istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Pracownik_PracownikStanowisko w BD Stajnia'
		ALTER TABLE Pracownik ADD
			CONSTRAINT [FK_Pracownik_PracownikStanowisko] FOREIGN KEY
				(stanowiskoId)REFERENCES PracownikStanowisko(stanowiskoId)
	END
--FK_Pracownik_Boks_Pracownik
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Pracownik_Boks_Pracownik'))
	PRINT ' Klucz obcy FK_Pracownik_Boks_Pracownik istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Pracownik_Boks_Pracownik w BD Stajnia'
		ALTER TABLE Pracownik_Boks ADD
			CONSTRAINT [FK_Pracownik_Boks_Pracownik] FOREIGN KEY
				(pracownikId)REFERENCES Pracownik(pracownikId)
	END
--FK_Kon_Trening_Kon
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Kon_Trening_Kon'))
	PRINT ' Klucz obcy FK_Kon_Trening_Kon istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Kon_Trening_Kon w BD Stajnia'
		ALTER TABLE Trening_Kon ADD
			CONSTRAINT [FK_Kon_Trening_Kon] FOREIGN KEY
				(konId)REFERENCES Kon(konId)
	END
--FK_Trening_Kon_Trening
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Trening_Kon_Trening'))
	PRINT ' Klucz obcy FK_Trening_Kon_Trening istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Trening_Kon_Trening w BD Stajnia'
		ALTER TABLE Trening_Kon ADD
			CONSTRAINT [FK_Trening_Kon_Trening] FOREIGN KEY
				(treningId)REFERENCES Trening(treningId)
	END
--FK_Trening_TreningRodzaj
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Trening_TreningRodzaj'))
	PRINT ' Klucz obcy FK_Trening_TreningRodzaj istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Trening_TreningRodzaj w BD Stajnia'
		ALTER TABLE Trening ADD
			CONSTRAINT [FK_Trening_TreningRodzaj] FOREIGN KEY
				(rodzajId)REFERENCES TreningRodzaj(rodzajId)
	END
--FK_Trening_Ujezdzalnia
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Trening_Ujezdzalnia'))
	PRINT ' Klucz obcy FK_Trening_Ujezdzalnia istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Trening_Ujezdzalnia w BD Stajnia'
		ALTER TABLE Trening ADD
			CONSTRAINT [FK_Trening_Ujezdzalnia] FOREIGN KEY
				(ujezdzalniaId)REFERENCES Ujezdzalnia(ujezdzalniaId)
	END
--FK_Trening_Pracownik
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Trening_Pracownik'))
	PRINT ' Klucz obcy FK_Trening_Pracownik istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Trening_Pracownik w BD Stajnia'
		ALTER TABLE Trening ADD
			CONSTRAINT [FK_Trening_Pracownik] FOREIGN KEY
				(pracownikId)REFERENCES Pracownik(pracownikId)
	END
--FK_Trening_TreningUczestnik_Trening
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Trening_TreningUczestnik_Trening'))
	PRINT ' Klucz obcy FK_Trening_TreningUczestnik_Trening istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Trening_TreningUczestnik_Trening w BD Stajnia'
		ALTER TABLE Trening_TreningUczestnik ADD
			CONSTRAINT [FK_Trening_TreningUczestnik_Trening] FOREIGN KEY
				(treningId)REFERENCES Trening(treningId)
	END
--FK_Trening_TreningUczestnik_Kon
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Trening_TreningUczestnik_Kon'))
	PRINT ' Klucz obcy FK_Trening_TreningUczestnik_Kon istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Trening_TreningUczestnik_Kon w BD Stajnia'
		ALTER TABLE Trening_TreningUczestnik ADD
			CONSTRAINT [FK_Trening_TreningUczestnik_Kon] FOREIGN KEY
				(konId)REFERENCES Kon(konId)
	END
--FK_Trening_TreningUczestnik_TreningUczestnik
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Trening_TreningUczestnik_TreningUczestnik'))
	PRINT ' Klucz obcy FK_Trening_TreningUczestnik_TreningUczestnik istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Trening_TreningUczestnik_TreningUczestnik w BD Stajnia'
		ALTER TABLE Trening_TreningUczestnik ADD
			CONSTRAINT [FK_Trening_TreningUczestnik_TreningUczestnik] FOREIGN KEY
				(uczestnikId)REFERENCES TreningUczestnik(uczestnikId)
	END
--FK_Zawody_Kon_Pracownik_Kon
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Zawody_Kon_Pracownik_Kon'))
	PRINT ' Klucz obcy FK_Zawody_Kon_Pracownik_Kon istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Zawody_Kon_Pracownik_Kon w BD Stajnia'
		ALTER TABLE Zawody_Kon_Pracownik ADD
			CONSTRAINT [FK_Zawody_Kon_Pracownik_Kon] FOREIGN KEY
				(konId)REFERENCES Kon(konId)
	END
--FK_Zawody_Kon_Pracownik_Pracownik
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Zawody_Kon_Pracownik_Pracownik'))
	PRINT ' Klucz obcy FK_Zawody_Kon_Pracownik_Pracownik istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Zawody_Kon_Pracownik_Pracownik w BD Stajnia'
		ALTER TABLE Zawody_Kon_Pracownik ADD
			CONSTRAINT [FK_Zawody_Kon_Pracownik_Pracownik] FOREIGN KEY
				(pracownikId)REFERENCES Pracownik(pracownikId)
	END
--FK_Zawody_Kon_Pracownik_Zawody
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Zawody_Kon_Pracownik_Zawody'))
	PRINT ' Klucz obcy FK_Zawody_Kon_Pracownik_Zawody istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Zawody_Kon_Pracownik_Zawody w BD Stajnia'
		ALTER TABLE Zawody_Kon_Pracownik ADD
			CONSTRAINT [FK_Zawody_Kon_Pracownik_Zawody] FOREIGN KEY
				(zawodyId)REFERENCES Zawody(zawodyId)
	END
--FK_Zawody_ZawodyRodzaj
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Zawody_ZawodyRodzaj'))
	PRINT ' Klucz obcy FK_Zawody_ZawodyRodzaj istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Zawody_ZawodyRodzaj w BD Stajnia'
		ALTER TABLE Zawody ADD
			CONSTRAINT [FK_Zawody_ZawodyRodzaj] FOREIGN KEY
				(rodzajId)REFERENCES ZawodyRodzaj(rodzajId)
	END
--FK_ZawodyNagroda_Zawody
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_ZawodyNagroda_Zawody'))
	PRINT ' Klucz obcy FK_ZawodyNagroda_Zawody istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_ZawodyNagroda_Zawody w BD Stajnia'
		ALTER TABLE ZawodyNagroda ADD
			CONSTRAINT [FK_ZawodyNagroda_Zawody] FOREIGN KEY
				(zawodyId)REFERENCES Zawody(zawodyId)
	END
--FK_Towar_TowarRodzaj
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Towar_TowarRodzaj'))
	PRINT ' Klucz obcy FK_Towar_TowarRodzaj istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Towar_TowarRodzaj w BD Stajnia'
		ALTER TABLE Towar ADD
			CONSTRAINT [FK_Towar_TowarRodzaj] FOREIGN KEY
				(rodzajId)REFERENCES TowarRodzaj(rodzajId)
	END
--FK_Towar_TowarZakup_Towar
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Towar_TowarZakup_Towar'))
	PRINT ' Klucz obcy FK_Towar_TowarZakup_Towar istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Towar_TowarZakup_Towar w BD Stajnia'
		ALTER TABLE Towar_TowarZakup ADD
			CONSTRAINT [FK_Towar_TowarZakup_Towar] FOREIGN KEY
				(towarId)REFERENCES Towar(towarId)
	END
--FK_Towar_TowarZakup_TowarZakup
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_Towar_TowarZakup_TowarZakup'))
	PRINT ' Klucz obcy FK_Towar_TowarZakup_TowarZakup istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_Towar_TowarZakup_TowarZakup w BD Stajnia'
		ALTER TABLE Towar_TowarZakup ADD
			CONSTRAINT [FK_Towar_TowarZakup_TowarZakup] FOREIGN KEY
				(zakupId)REFERENCES TowarZakup(zakupId)
	END
--FK_TowarZakup_Firma
IF EXISTS (SELECT * FROM dbo.sysobjects where id = object_id(N'FK_TowarZakup_Firma'))
	PRINT ' Klucz obcy FK_TowarZakup_Firma istnieje w BD Stajnia'
ELSE
	BEGIN
		PRINT ' Tworze klucz obcy FK_TowarZakup_Firma w BD Stajnia'
		ALTER TABLE TowarZakup ADD
			CONSTRAINT [FK_TowarZakup_Firma] FOREIGN KEY
				(firmaId)REFERENCES Firma(firmaId)
	END
GO

-- W I D O K I

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
		SELECT dbo.Kon.imie AS kon, dbo.DietaPosilek.nazwa AS posilek, dbo.DietaPosilek.godzina AS godzina_posilku, dbo.DietaPosilek_Towar.iloœæ AS ilosc_pozywienia, dbo.TowarRodzaj.rodzajNazwa AS rodzaj_pozywienia, dbo.Dieta.dietaId
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
--Widok_TreningiJeŸdzieckie
CREATE VIEW Widok_TreningiJeŸdzieckie AS
		SELECT dbo.TreningUczestnik.imie, dbo.TreningUczestnik.nazwisko, dbo.Kon.imie AS kon, dbo.Kon.rasa AS rasaKonia, dbo.Trening.data, dbo.Trening.godzinaRozpoczecia, dbo.Trening.godzinaZakonczenia, dbo.Ujezdzalnia.nazwa AS ujezdzalnia, 
                  dbo.Pracownik.imie AS imiePracownika, dbo.Pracownik.nazwisko AS nazwiskoPracownika
		FROM     dbo.Trening INNER JOIN
                  dbo.Trening_TreningUczestnik ON dbo.Trening.treningId = dbo.Trening_TreningUczestnik.treningId INNER JOIN
                  dbo.Kon ON dbo.Trening_TreningUczestnik.konId = dbo.Kon.konId INNER JOIN
                  dbo.TreningUczestnik ON dbo.Trening_TreningUczestnik.uczestnikId = dbo.TreningUczestnik.uczestnikId INNER JOIN
                  dbo.Pracownik ON dbo.Trening.pracownikId = dbo.Pracownik.pracownikId INNER JOIN
                  dbo.Ujezdzalnia ON dbo.Trening.ujezdzalniaId = dbo.Ujezdzalnia.ujezdzalniaId
GO

-- F U N K C J E

CREATE FUNCTION Funkcja_stanTowaru (@towarId int)
RETURNS VARCHAR(70)
AS
BEGIN
DECLARE @Stan VARCHAR(70)
SELECT @Stan=CAST(stan as varchar(15))+' '+jednsotka
FROM Towar WHERE towarId=@towarId
RETURN @Stan
END
GO

CREATE FUNCTION Funkcja_daneKon (@konId int)
RETURNS VARCHAR(70)
AS
BEGIN
DECLARE @Kon VARCHAR(70)
SELECT @Kon = 'Imie: ' + imie + ' Rasa: ' + rasa + ' Ojciec: ' + ojciec + ' Matka: ' + matka
FROM Kon WHERE konId=@konId
RETURN @Kon
END
GO

CREATE FUNCTION Funkcja_chorobyKon (@konId int)
RETURNS TABLE
AS
RETURN (
	SELECT k.imie as kon, ch.nazwa as choroba
	FROM Kon AS k INNER JOIN
		Kon_KonChoroba AS kch ON k.konId=kch.konId INNER JOIN
		KonChoroba AS ch ON ch.chorobaId=kch.chorobaId
	WHERE (k.konId=@konId AND kch.doKiedy IS NULL)
)
GO

-- T R I G G E R Y

--Bilans
CREATE TRIGGER Bilans_Zakup
ON Towar_TowarZakup
AFTER INSERT
AS
BEGIN
	DECLARE
		@zmiana decimal(16,2),
		@zmianaJednostkowo decimal(16,2)
	SELECT @zmiana=cena,
	@zmianaJednostkowo=cena/iloœæ FROM INSERTED
	INSERT INTO Bilans (zmiana,zmianaJednostkowo,tresc,data)
	VALUES (@zmiana*-1,@zmianaJednostkowo,'Zakup towaru',GETDATE())
END
GO

CREATE TRIGGER Bilans_Wizyta
ON Wizyta
AFTER INSERT
AS
BEGIN
	DECLARE
		@zmiana decimal(16,2)
	SELECT @zmiana=cena FROM INSERTED
	INSERT INTO Bilans (zmiana,zmianaJednostkowo,tresc,data)
	VALUES (@zmiana*-1,@zmiana,'Wizyta specjalisty',GETDATE())
END
GO

CREATE TRIGGER Bilans_NagrodaZawody
ON ZawodyNagroda
AFTER INSERT
AS
BEGIN
	DECLARE
		@zmiana decimal(16,2)
	SELECT @zmiana=kwota FROM INSERTED
	INSERT INTO Bilans (zmiana,zmianaJednostkowo,tresc,data)
	VALUES (@zmiana,@zmiana,'Zdobycie nagrody',GETDATE())
END
GO

CREATE TRIGGER Bilans_Trening
ON Trening_TreningUczestnik
AFTER INSERT
AS
BEGIN
	DECLARE
		@zmiana decimal(16,2)
		SELECT @zmiana=cena FROM INSERTED AS i INNER JOIN
			Trening AS t ON t.treningId=i.treningId INNER JOIN
			TreningRodzaj AS tr ON t.rodzajId=tr.rodzajId
	IF @zmiana IS NOT NULL
	BEGIN
		INSERT INTO Bilans (zmiana,zmianaJednostkowo,tresc,data)
		VALUES (@zmiana,@zmiana,'Op³ata za trening',GETDATE())
	END
END
GO

-- P R O C E D U R Y  S K £ A D O W A N E

--Procedura_ZmienStatusKonia
CREATE PROCEDURE Procedura_ZmienStatusKonia
(
	@konId AS INT,
	@statusId AS INT
) AS

BEGIN
	UPDATE Kon_KonStatus SET doKiedy = GETDATE() WHERE (konId=@konId AND doKiedy IS NULL)
	INSERT INTO Kon_KonStatus(statusId,konId,odKiedy)
	VALUES (@statusId, @konId, GETDATE())
END
GO
--Procedura_PrzydzielBoksKon
CREATE PROCEDURE Procedura_PrzydzielBoksKon
(
	@konId AS INT,
	@boksId AS INT
) AS

BEGIN
	UPDATE Kon_KonBoks SET doKiedy = GETDATE() WHERE (konId=@konId AND doKiedy IS NULL)
	INSERT INTO Kon_KonBoks(boksId,konId,odKiedy)
	VALUES (@boksId, @konId, GETDATE())
END
GO
--Procedura_PrzydzielBoksStajenny
CREATE PROCEDURE Procedura_PrzydzielBoksStajenny
(
	@pracownikId AS INT,
	@boksId AS INT
) AS

BEGIN
	INSERT INTO Pracownik_Boks(boksId,pracownikId,odKiedy)
	VALUES (@boksId, @pracownikId, GETDATE())
END
GO
--Procedura_UsunBoksStajenny
CREATE PROCEDURE Procedura_UsunBoksStajenny
(
	@pracownikId AS INT,
	@boksId AS INT
) AS
BEGIN
	UPDATE Pracownik_Boks SET doKiedy = GETDATE() WHERE (pracownikId=@pracownikId AND boksId=@boksId AND doKiedy IS NULL)
END
GO

-- U Z Y T K O W N I C Y

USE MASTER
GO

CREATE LOGIN Stajenny WITH PASSWORD = 'Stajenny1', CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF;
CREATE LOGIN Trener WITH PASSWORD = 'Trener1', CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF;
CREATE LOGIN Magazyn WITH PASSWORD = 'Magazyn1', CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF;
CREATE LOGIN Administracja WITH PASSWORD = 'Administracja1', CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF;

USE Stajnia
GO

CREATE USER Stajenny;
CREATE USER Trener;
CREATE USER Magazyn;
CREATE USER Administracja;

CREATE ROLE RolaStajenny;
CREATE ROLE RolaTrener;
CREATE ROLE RolaMagazyn;

GRANT INSERT, UPDATE, SELECT ON Dieta TO Stajenny;
GRANT INSERT, UPDATE, SELECT ON Dieta_DietaPosilek TO Stajenny;
GRANT INSERT, UPDATE, SELECT ON DietaPosilek TO Stajenny;
GRANT INSERT, UPDATE, SELECT ON DietaPosilek_Towar TO Stajenny;
GRANT INSERT, UPDATE, SELECT ON Towar TO Stajenny;

GRANT INSERT, SELECT ON Kon_KonBoks TO Stajenny;
GRANT INSERT, SELECT ON Kon_KonChoroba TO Stajenny;
GRANT INSERT, SELECT ON KonChoroba TO Stajenny;
GRANT INSERT, SELECT ON Kon_KonStatus TO Stajenny;

GRANT INSERT, UPDATE, SELECT ON Kon_KonStatus TO Trener;
GRANT INSERT, UPDATE, SELECT ON Ujezdzalnia TO Trener;
GRANT INSERT, UPDATE, SELECT ON Zawody TO Trener;
GRANT INSERT, UPDATE, SELECT ON Zawody_Kon_Pracownik TO Trener;
GRANT INSERT, UPDATE, SELECT ON ZawodyNagroda TO Trener;
GRANT INSERT, UPDATE, SELECT ON ZawodyRodzaj TO Trener;
GRANT INSERT, UPDATE, SELECT ON Trening TO Trener;
GRANT INSERT, UPDATE, SELECT ON Trening_Kon TO Trener;
GRANT INSERT, UPDATE, SELECT ON Trening_TreningUczestnik TO Trener;
GRANT INSERT, UPDATE, SELECT ON TreningRodzaj TO Trener;
GRANT INSERT, UPDATE, SELECT ON TreningUczestnik TO Trener;

GRANT INSERT, UPDATE, SELECT ON Towar TO Magazyn;
GRANT INSERT, UPDATE, SELECT ON Towar_TowarZakup TO Magazyn;
GRANT INSERT, UPDATE, SELECT ON TowarRodzaj TO Magazyn;
GRANT INSERT, UPDATE, SELECT ON TowarZakup TO Magazyn;
GRANT INSERT, UPDATE, SELECT ON Firma TO Magazyn;

EXECUTE sp_addrolemember 'RolaStajenny','Stajenny';
EXECUTE sp_addrolemember 'RolaTrener','Trener';
EXECUTE sp_addrolemember 'RolaMagazyn','Magazyn';
EXECUTE sp_addrolemember 'DB_OWNER','Administracja';