USE Stajnia
GO

DROP TRIGGER Bilans_Zakup
DROP TRIGGER Bilans_NagrodaZawody
DROP TRIGGER Bilans_Wizyta
DROP TRIGGER Bilans_Trening
GO
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