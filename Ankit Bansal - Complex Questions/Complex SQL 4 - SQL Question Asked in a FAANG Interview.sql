-- Write a QUery to provide the date for nth occurrence of Sunday in future from given date
--datepart
--sunday-1
--monday-2
--friday-6
--saturday-7


declare @today_date date, @n int
set @today_date = '2022-01-01' --saturday
set @n = 3

select dateadd(week, @n-1, dateadd(day, 8-DATEPART(weekday, @today_date), @today_date))
