USE Stajnia
GO

PRINT 'W Y D A T K I'
DECLARE BilansKursor CURSOR FOR
SELECT zmiana, tresc, data FROM Bilans
DECLARE @zmiana decimal(16,2), @tresc varchar(60), @data date
OPEN BilansKursor
FETCH NEXT FROM BilansKursor INTO @zmiana, @tresc, @data
WHILE @@FETCH_STATUS = 0
BEGIN
	IF @zmiana<0
  	PRINT @tresc+' '+CAST(@zmiana AS varchar(10))+' ('+CAST(@data AS varchar(14))+')'
  	FETCH NEXT FROM BilansKursor INTO @zmiana, @tresc, @data
END
CLOSE BilansKursor
DEALLOCATE BilansKursor

PRINT 'K O N I E  A R A B S K I E'
DECLARE BilansKursor CURSOR FOR
SELECT imie, rasa, numerPaszportu FROM Kon
DECLARE @imie varchar(20), @rasa varchar(15), @numerPaszportu varchar(20)
OPEN BilansKursor
FETCH NEXT FROM BilansKursor INTO @imie, @rasa, @numerPaszportu
WHILE @@FETCH_STATUS = 0
BEGIN
	IF @rasa='arab'
  	PRINT @numerPaszportu+' '+@imie
  	FETCH NEXT FROM BilansKursor INTO @imie, @rasa, @numerPaszportu
END
CLOSE BilansKursor
DEALLOCATE BilansKursor

