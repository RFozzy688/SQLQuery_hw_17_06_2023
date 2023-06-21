-- 1 показать горизонтальную линию из звёздочек длиной @L
DECLARE @lenght int = 10
DECLARE @current int = 1
DECLARE @res nvarchar(500) = ''

WHILE @current <= @lenght
BEGIN
	SET @res += '*'
	SET @current += 1
END
PRINT @res

-- 2 скрипт проверяет, какое сейчас время суток
DECLARE @currentTime time(0) = GETDATE()
IF @currentTime >= '00:00:00' AND @currentTime < '06:00:00'
BEGIN
	PRINT 'ночь'
END
ELSE IF @currentTime >= '06:00:00' AND @currentTime < '12:00:00'
BEGIN
	PRINT 'утро'
END
ELSE IF @currentTime >= '12:00:00' AND @currentTime < '18:00:00'
BEGIN
	PRINT 'день'
END
ELSE IF @currentTime >= '18:00:00' AND @currentTime < '00:00:00'
BEGIN
	PRINT 'вечер'
END

-- 3 скрипт генерирует случайный сложный пароль длиной @N
DECLARE @len int = 10
DECLARE @password nvarchar(200) = ''
DECLARE @num int = 0

WHILE @len > 0
BEGIN
	SET @num = RAND()*(127-33)+33
	SET @password += CHAR(@num)
	SET @len -= 1
END

PRINT @password

-- 4 показать факториалы всех чисел от 0 до 25
DECLARE @factorial int = 1
DECLARE @res Numeric(38, 0) = 1
DECLARE @tempCount int = 1

PRINT 'факториал 0 = 1'

WHILE @factorial <= 25
BEGIN
	WHILE @tempCount <= @factorial
	BEGIN
		SET @res *= @tempCount
		SET @tempCount += 1
	END
	PRINT 'факториал ' + CAST(@factorial AS nvarchar) + ' = ' + CAST(@res AS nvarchar)
	SET @factorial += 1
END

-- 5 показать все простые числа от 3 до 1 000 000
DECLARE @num int = 3
DECLARE @i int = 2
DECLARE @flag bit = 1

WHILE @num <= 1000
BEGIN
	WHILE @i < @num
	BEGIN
		IF @num % @i = 0
		BEGIN
			SET @flag = 0
			BREAK
		END
		SET @i += 1
	END
	IF @flag = 1
	BEGIN
		PRINT @num
	END
	SET @num += 1
	SET @i = 2
	SET @flag += 1
END

-- 6 показать номера всех счастливых трамвайных билетов
DECLARE @num1 int, @num2 int, @num3 int, @num4 int, @num5 int, @num6 int
DECLARE @sum1 int, @sum2 int
DECLARE @number int
DECLARE @count int = 100000

WHILE @count < 1000000
BEGIN
	SET @number = @count

	SET @num6 = @number % 10
	SET @number /= 10

	SET @num5 = @number % 10
	SET @number /= 10

	SET @num4 = @number % 10
	SET @number /= 10

	SET @num3 = @number % 10
	SET @number /= 10

	SET @num2 = @number % 10

	SET @num1 = @number / 10

	SET @sum1 = @num1 + @num2 + @num3
	SET @sum2 = @num4 + @num5 + @num6

	IF @sum1 = @sum2
	BEGIN
		PRINT @count
	END

	SET @count += 1
END
