USE Stajnia
GO


-- W I D O K I
DROP VIEW Widok_Stajenni
DROP VIEW Widok_PrzydzialBoksy
DROP VIEW Widok_NagrodyKoni
DROP VIEW Widok_TreningiKoni
DROP VIEW Widok_ZapotrzebowanieKonia
DROP VIEW Widok_ChorobyKonia
DROP VIEW Widok_WizytyKonia
DROP VIEW Widok_TreningiJeüdzieckie
GO

-- F U N K C J E
DROP FUNCTION Funkcja_stanTowaru
DROP FUNCTION Funkcja_daneKon
DROP FUNCTION Funkcja_chorobyKon
GO

-- T R I G G E R Y
DROP TRIGGER Bilans_Zakup
DROP TRIGGER Bilans_NagrodaZawody
DROP TRIGGER Bilans_Wizyta
DROP TRIGGER Bilans_Trening
GO

-- P R O C E D U R Y  S K £ A D O W A N E
DROP PROCEDURE Procedura_ZmienStatusKonia
DROP PROCEDURE Procedura_PrzydzielBoksKon
DROP PROCEDURE Procedura_PrzydzielBoksStajenny
DROP PROCEDURE Procedura_UsunBoksStajenny
GO

-- K L U C Z E  O B C E

ALTER TABLE Kon_KonChoroba DROP CONSTRAINT FK_Kon_KonChoroba_Kon
ALTER TABLE Kon_KonChoroba DROP CONSTRAINT FK_Kon_KonChoroba_KonChoroba
ALTER TABLE Kon_KonStatus DROP CONSTRAINT FK_Kon_KonStatus_Kon
ALTER TABLE Kon_KonStatus DROP CONSTRAINT FK_Kon_KonStatus_KonStatus
ALTER TABLE Kon_KonBoks DROP CONSTRAINT FK_Kon_KonBoks_Kon
ALTER TABLE Kon_KonBoks DROP CONSTRAINT FK_Kon_KonBoks_KonBoks
ALTER TABLE KonStajnia DROP CONSTRAINT FK_KonStajnia_KonDzierzawa
ALTER TABLE KonStajnia DROP CONSTRAINT FK_KonStajnia_Kon
ALTER TABLE KonPrywatny DROP CONSTRAINT FK_KonPrywatny_Kon
ALTER TABLE Dieta DROP CONSTRAINT FK_Dieta_Kon
ALTER TABLE Dieta_DietaPosilek DROP CONSTRAINT FK_Dieta_DietaPosilek_Dieta
ALTER TABLE Dieta_DietaPosilek DROP CONSTRAINT FK_Dieta_DietaPosilek_DietaPosilek
ALTER TABLE DietaPosilek_Towar DROP CONSTRAINT FK_DietaPosilek_Towar_DietaPosilek
ALTER TABLE DietaPosilek_Towar DROP CONSTRAINT FK_DietaPosilek_Towar_Towar
ALTER TABLE Wizyta DROP CONSTRAINT FK_Wizyta_Kon
ALTER TABLE Wizyta_WizytaKowal DROP CONSTRAINT FK_Wizyta_WizytaKowal_Wizyta
ALTER TABLE Wizyta_WizytaKowal DROP CONSTRAINT FK_Wizyta_WizytaKowal_WizytaKowal
ALTER TABLE WizytaKowal DROP CONSTRAINT FK_WizytaKowal_Firma
ALTER TABLE Wizyta_WizytaWeterynarz DROP CONSTRAINT FK_Wizyta_WizytaWeterynarz_Wizyta
ALTER TABLE Wizyta_WizytaWeterynarz DROP CONSTRAINT FK_Wizyta_WizytaWeterynarz_WizytaWeterynarz
ALTER TABLE WizytaWeterynarz DROP CONSTRAINT FK_WizytaWeterynarz_Firma
ALTER TABLE Pracownik DROP CONSTRAINT FK_Pracownik_PracownikStanowisko
ALTER TABLE Pracownik_Boks DROP CONSTRAINT FK_Pracownik_Boks_Pracownik
ALTER TABLE Trening_Kon DROP CONSTRAINT FK_Kon_Trening_Kon
ALTER TABLE Trening_Kon DROP CONSTRAINT FK_Trening_Kon_Trening
ALTER TABLE Trening DROP CONSTRAINT FK_Trening_TreningRodzaj
ALTER TABLE Trening DROP CONSTRAINT FK_Trening_Ujezdzalnia
ALTER TABLE Trening DROP CONSTRAINT FK_Trening_Pracownik
ALTER TABLE Trening_TreningUczestnik DROP CONSTRAINT FK_Trening_TreningUczestnik_Trening
ALTER TABLE Trening_TreningUczestnik DROP CONSTRAINT FK_Trening_TreningUczestnik_Kon
ALTER TABLE Trening_TreningUczestnik DROP CONSTRAINT FK_Trening_TreningUczestnik_TreningUczestnik
ALTER TABLE Zawody_Kon_Pracownik DROP CONSTRAINT FK_Zawody_Kon_Pracownik_Kon
ALTER TABLE Zawody_Kon_Pracownik DROP CONSTRAINT FK_Zawody_Kon_Pracownik_Pracownik
ALTER TABLE Zawody_Kon_Pracownik DROP CONSTRAINT FK_Zawody_Kon_Pracownik_Zawody
ALTER TABLE Zawody DROP CONSTRAINT FK_Zawody_ZawodyRodzaj
ALTER TABLE ZawodyNagroda DROP CONSTRAINT FK_ZawodyNagroda_Zawody
ALTER TABLE Towar DROP CONSTRAINT FK_Towar_TowarRodzaj
ALTER TABLE Towar_TowarZakup DROP CONSTRAINT FK_Towar_TowarZakup_Towar
ALTER TABLE Towar_TowarZakup DROP CONSTRAINT FK_Towar_TowarZakup_TowarZakup
ALTER TABLE TowarZakup DROP CONSTRAINT FK_TowarZakup_Firma

-- T A B E L E

DROP TABLE Kon
DROP TABLE KonStatus
DROP TABLE Kon_KonStatus
DROP TABLE KonBoks
DROP TABLE Kon_KonBoks
DROP TABLE KonChoroba
DROP TABLE Kon_KonChoroba
DROP TABLE KonStajnia
DROP TABLE KonDzierzawa
DROP TABLE KonPrywatny
DROP TABLE Dieta
DROP TABLE DietaPosilek
DROP TABLE Dieta_DietaPosilek
DROP TABLE DietaPosilek_Towar
DROP TABLE Wizyta
DROP TABLE WizytaWeterynarz
DROP TABLE Wizyta_WizytaWeterynarz
DROP TABLE WizytaKowal
DROP TABLE Wizyta_WizytaKowal
DROP TABLE Pracownik
DROP TABLE PracownikStanowisko
DROP TABLE Pracownik_Boks
DROP TABLE Trening
DROP TABLE TreningRodzaj
DROP TABLE TreningUczestnik
DROP TABLE Trening_TreningUczestnik
DROP TABLE Trening_Kon
DROP TABLE Ujezdzalnia
DROP TABLE Zawody
DROP TABLE ZawodyRodzaj
DROP TABLE ZawodyNagroda
DROP TABLE Zawody_Kon_Pracownik
DROP TABLE Towar
DROP TABLE TowarRodzaj
DROP TABLE TowarZakup
DROP TABLE Towar_TowarZakup
DROP TABLE Firma
DROP TABLE Komunikaty
DROP TABLE Bilans
GO

-- U Z Y T K O W N I C Y

EXECUTE sp_droprolemember 'RolaStajenny','Stajenny';
EXECUTE sp_droprolemember 'RolaTrener','Trener';
EXECUTE sp_droprolemember 'RolaMagazyn','Magazyn';
EXECUTE sp_droprolemember 'DB_OWNER','Administracja';

DROP ROLE RolaStajenny;
DROP ROLE RolaTrener;
DROP ROLE RolaMagazyn;

DROP USER Stajenny;
DROP USER Trener;
DROP USER Magazyn;
DROP USER Administracja;

USE MASTER
GO

DROP LOGIN Stajenny;
DROP LOGIN Trener;
DROP LOGIN Magazyn;
DROP LOGIN Administracja;

DROP DATABASE Stajnia