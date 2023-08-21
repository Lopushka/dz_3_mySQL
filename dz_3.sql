-- 1. Напишите запрос, который сосчитал бы все суммы заказов, выполненных 1 января 2016 года.
SELECT dataOrder, SUM(ordersPrice) as sumSales
FROM Orders
WHERE dataOrder = '2016-01-01';

-- 2. Напишите запрос, который сосчитал бы число различных, отличных от NULL значений поля city в таблице заказчиков.
SELECT COUNT(DISTINCT city) as nnull
FROM Orders;

-- 3. Напишите запрос, который выбрал бы наименьшую сумму для каждого заказчика.
SELECT MIN(ordersPrice) as min,recipient
FROM Orders
GROUP BY recipient;

-- 4*. Напишите запрос, который бы выбирал заказчиков чьи имена начинаются с буквы Г. Используется оператор "LIKE"
SELECT recipient
FROM Orders
WHERE recipient LIKE 'Г%'
ORDER BY recipient;

-- 5. Напишите запрос, который выбрал бы высший рейтинг в каждом городе.
SELECT city, COUNT(city) AS rating
FROM Orders
GROUP BY city
HAVING rating > 0;


-- Задание 2.

create table staff (
	id int primary key auto_increment,
    name varchar (20) not null,
    surname varchar (20) not null,
    speciality varchar (20) not null,
    seniority int not null,
    salary int not null,
    age int not null
);
insert staff( name, surname, speciality, seniority, salary, age)
values
	('Вася', 'Петров', 'начальник', 40, 100000, 60),
    ('Петр', 'Власов', 'начальник', 8, 70000, 30),
    ('Катя', 'Катина', 'инженер', 2, 70000, 25),
    ('Саша', 'Сасин', 'инженер', 12, 50000, 35),
    ('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
    ('Петр', 'Петров', 'рабочий', 20, 25000, 40),
    ('Сидр', 'Сидоров', 'рабочий', 10, 20000, 35),
    ('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
    ('Юрий', 'Юрков', 'рабочий', 5, 15000, 25),
    ('Максим', 'Максимов', 'рабочий', 2, 11000, 22),
    ('Юрий', 'Галкин', 'рабочий', 3, 12000, 24),
	('Людмила', 'Маркина', 'уборщик', 10, 10000, 49);

select * from staff;

-- 1.Отсортируйте поле “сумма” в порядке убывания и возрастания

select *
from staff
order by salary;

select *
from staff
order by salary desc;

-- Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой
select *
from staff
order by salary desc
limit 5;

-- Выполните группировку всех сотрудников по специальности “рабочий”, зарплата которых превышает 20000
select count(*)
from staff
where speciality='рабочий' and salary> 20000;

