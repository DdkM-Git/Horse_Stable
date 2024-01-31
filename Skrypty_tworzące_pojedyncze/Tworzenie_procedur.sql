USE Stajnia
GO

DROP PROCEDURE Procedura_ZmienStatusKonia
DROP PROCEDURE Procedura_PrzydzielBoksKon
DROP PROCEDURE Procedura_PrzydzielBoksStajenny
DROP PROCEDURE Procedura_UsunBoksStajenny
GO

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