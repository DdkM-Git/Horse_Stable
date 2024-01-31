USE Stajnia
GO

DROP FUNCTION Funkcja_stanTowaru
DROP FUNCTION Funkcja_daneKon
DROP FUNCTION Funkcja_chorobyKon
GO

CREATE FUNCTION Funkcja_stanTowaru (@towarId int)
RETURNS VARCHAR(70)
AS
BEGIN
DECLARE @Stan VARCHAR(70)
SELECT @Stan=stan+' '+jednsotka
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