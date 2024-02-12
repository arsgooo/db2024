-- Active: 1707252918369@@127.0.0.1@5432@db2024_Lab1
-- Лабораторна робота №2
-- З дисципліни «Бази даних та інформаційні системи»
-- Студента групи МІТ-31 Добровольського Арсенія Михайловича

-- 1. Отримати всі дані з таблиці Projects:
SELECT * FROM Projects;

-- 2. Отримати ім'я та дату початку проєкту з таблиці Projects:
SELECT name, start_date FROM Projects;

-- 3. Отримати проєкти, які розпочалися пізніше 1 січня 2023 року:
SELECT * FROM Projects WHERE start_date > '2023-01-01';

-- 4. Отримати унікальний статус проєкту:
SELECT DISTINCT status FROM Projects;

-- 5. Отримати кількість схвалених проєктів та бюджет яких становить більше $50000:
SELECT COUNT(*) FROM Projects WHERE status = 'approved' AND budget > '$50000';

-- 6. Вибрати проєкти, які мають у своєму описі слово 'libero':
SELECT * FROM Projects WHERE description LIKE '%libero%';

-- 7. Вивести перші 5 проєктів за назвами в алфавітному порядку:
SELECT * FROM Projects ORDER BY name LIMIT 5;

-- 8. Отримати проєкти, які не знаходяться в статусі 'archived':
SELECT * FROM Projects WHERE status != 'archived';

-- 9. Вибрати проєкти, які розпочалися до 1 квітня 2023 року або бюджет яких становить менше $10000:
SELECT * FROM Projects WHERE start_date < '2023-04-01' OR budget < '$10000';

-- 10. Підрахувати загальний бюджет всіх проєктів:
SELECT SUM(budget) FROM Projects;

-- 11. Вивести проєкти, назви яких закінчуються на літеру 'y':
SELECT * FROM Projects WHERE name LIKE '%y';

-- 12. Отримати проєкти, які мають статус 'in progress' або 'approved':
SELECT * FROM Projects WHERE status IN ('in progress', 'approved');

-- 13. Вибрати проєкти, які розпочалися у листопаді 2023 року:
SELECT * FROM Projects WHERE EXTRACT(MONTH FROM start_date) = 11 AND EXTRACT(YEAR FROM start_date) = 2023;

-- 14. Отримати проєкти, які мають бюджети в діапазоні від $10000 до $30000:
SELECT * FROM Projects WHERE budget::DECIMAL BETWEEN 10000 AND 30000;

-- 15. Вибрати проєкти, які мають назви коротше 6 символів:
SELECT * FROM Projects WHERE LENGTH(name) < 6;

-- 16. Отримати список проєктів в порядку спадання бюджету:
SELECT * FROM Projects ORDER BY budget DESC;

-- 17. Вивести проєкти, які мають статус 'delayed' та мають слова 'justo' або 'erat' у описі:
SELECT * FROM Projects WHERE status = 'delayed' AND (description LIKE '%justo%' OR description LIKE '%erat%');

-- 18. Отримати проєкти, статус яких починається на літеру 'a':
SELECT * FROM Projects WHERE status LIKE 'a%';

-- 19. Вибрати проєкти, які мають статус 'cancelled' та мають бюджет менше $10,000:
SELECT * FROM Projects WHERE status = 'cancelled' AND budget::DECIMAL < 10000;

-- 20. Отримати назви та описи проєктів, які мають статус 'in progress':
SELECT name, description FROM Projects WHERE status = 'in progress';

-- 21. Отримати назви та бюджети проєктів, які мають в описі слова 'rutrum' або 'convallis':
SELECT name, budget FROM Projects WHERE description LIKE '%rutrum%' OR description LIKE '%convallis%';

-- 22. Вибрати проєкти, які мають статус 'on hold' і не мають слова 'justo' в описі:
SELECT * FROM Projects WHERE status = 'on hold' AND description NOT LIKE '%justo%';

-- 23. Отримати проєкти, які мають бюджет менше $80000 та починаються з літери 'S':
SELECT * FROM Projects WHERE budget::DECIMAL < 80000 AND name LIKE 'S%';

-- 24. Вивести проєкти, які мають статус 'rejected' і дату початку після 1 квітня 2023 року:
SELECT * FROM Projects WHERE status = 'rejected' AND start_date > '2023-04-01';

-- 25. Отримати назви проєктів, які розпочалися в червні будь-якого року:
SELECT name, start_date FROM Projects WHERE EXTRACT(MONTH FROM start_date) = 6;

-- 26. Отримати всі дані з таблиці Members:
SELECT * FROM Members;

-- 27. Отримати ім'я та посаду кожного учасника:
SELECT name, role FROM Members;

-- 28. Отримати всіх учасників команди з ідентифікатором 11:
SELECT * FROM Members WHERE team_id = 11;

-- 29. Отримати унікальні ролі учасників:
SELECT DISTINCT role FROM Members;

-- 30. Отримати кількість учасників команди з ідентифікатором 19:
SELECT COUNT(*) FROM Members WHERE team_id = 19;

-- 31. Вибрати учасників з номерами телефонів, що починаються на +62:
SELECT * FROM Members WHERE phone_number LIKE '+62%';

-- 32. Отримати ім'я, посаду та ідентифікатор команди для кожного учасника:
SELECT name, role, team_id FROM Members;

-- 33. Отримати учасників, які займають посаду розробника (developer):
SELECT * FROM Members WHERE role = 'developer';

-- 34. Отримати учасників, які є аналітиками або тестерами:
SELECT * FROM Members WHERE role IN ('analyst', 'tester');

-- 35. Отримати всіх учасників та номери їхніх команд в алфавітному порядку за іменем:
SELECT name, team_id FROM Members ORDER BY name;

-- 36. Отримати учасників з посадою support specialist, імена яких починаються на літеру 'E':
SELECT * FROM Members WHERE role = 'support specialist' AND name LIKE 'E%';

-- 37. Отримати всіх учасників та інформацію про їхні команди:
SELECT m.*, t.name AS team_name 
FROM Members m 
JOIN Teams t ON m.team_id = t.id;

-- 38. Отримати учасників, які мають номери телефонів, що закінчуються на '2370':
SELECT * FROM Members WHERE phone_number LIKE '%2370';

-- 39. Отримати учасників, які є власниками продукту (product owner) та назви їхніх команд:
SELECT m.name AS member_name, t.name AS team_name 
FROM Members m 
JOIN Teams t ON m.team_id = t.id 
WHERE m.role = 'product owner';

-- 40. Отримати усіх учасників та їхні номери телефонів в порядку спадання номерів телефонів:
SELECT name, phone_number FROM Members ORDER BY phone_number DESC;

-- 41. Отримати учасників, які працюють в командах, назви яких починаються на літеру 'T':
SELECT m.*, t.name AS team_name 
FROM Members m 
JOIN Teams t ON m.team_id = t.id 
WHERE t.name LIKE 'T%';

-- 42. Отримати учасників, які є керівниками команд (team leader) та мають номери телефонів, що починаються на '+63':
SELECT * FROM Members WHERE role = 'team leader' AND phone_number LIKE '+63%';

-- 43. Отримати учасників, які займають посаду розробника (developer) та відповідні їм команди:
SELECT m.*, t.name AS team_name 
FROM Members m 
JOIN Teams t ON m.team_id = t.id 
WHERE m.role = 'developer';

-- 44. Отримати учасників, які мають номери телефонів, що не починаються на +86 та яких не звати Erik:
SELECT * FROM Members WHERE phone_number NOT LIKE '+86%' AND name NOT LIKE 'Erik%';

-- 45. Отримати учасників, які обіймають посаду 'project manager' та назви їхніх команд:
SELECT m.name, m.role, t.name AS team_name
FROM Members m
JOIN Teams t ON m.team_id = t.id
WHERE m.role = 'project manager';

-- 46. Отримати учасників, які не обіймають посаду 'support specialist' та назви їхніх команд:
SELECT m.*, t.name AS team_name 
FROM Members m 
JOIN Teams t ON m.team_id = t.id 
WHERE m.role != 'support specialist';

-- 47. Отримати дані про учасників, які знаходяться у командах з ідентифікаторами 1, 3 та 5:
SELECT m.*, t.name AS team_name 
FROM Members m 
JOIN Teams t ON m.team_id = t.id
WHERE m.team_id IN (1, 3, 5)
ORDER BY m.team_id;

-- 48. Отримати всіх учасників з команди 'Dolphins' в алфавітному порядку:
SELECT m.*, t.name AS team_name 
FROM Members m 
JOIN Teams t ON m.team_id = t.id
WHERE t.name = 'Dolphins'
ORDER BY m.name;

-- 49. Отримати унікальні ролі учасників:
SELECT DISTINCT role FROM Members;

-- 50. Підрахувати кількість учасників у кожній команді:
SELECT t.name AS team_name, COUNT(m.id) AS member_count
FROM Teams t
JOIN Members m ON t.id = m.team_id
GROUP BY t.name;

-- 51. Отримати всі дані про команди:
SELECT * FROM Teams;

-- 52. Отримати назви та проєкти, над якими працюють команди:
SELECT t.name AS team_name, p.name AS project_name
FROM Teams t
JOIN Projects p ON t.project_id = p.id;

-- 53. Отримати кількість учасників в кожній команді:
SELECT t.name AS team_name, COUNT(*) AS member_count
FROM Teams t
JOIN Members m ON t.id = m.team_id
GROUP BY t.name
ORDER BY team_name;

-- 54. Отримати список команд, які працюють над проєктом з назвою 'Serenity':
SELECT t.name AS team_name, p.name AS project_name
FROM Teams t
JOIN Projects p ON t.project_id = p.id
WHERE p.name = 'Serenity';

-- 55. Отримати кількість учасників в кожній команді:
SELECT t.name AS team_name, COUNT(*) AS member_count
FROM Members m
JOIN Teams t ON m.team_id = t.id
GROUP BY t.name
ORDER BY team_name;

-- 56. Отримати середню кількість учасників у команді:
SELECT ROUND(AVG(member_count), 2) AS avg_member_count
FROM (
    SELECT COUNT(*) AS member_count
    FROM Members
    GROUP BY team_id
) AS subquery;

-- 57. Отримати список команд, які працюють над проєктами, що не мають статусу 'delayed':
SELECT t.name AS team_name
FROM Teams t
JOIN Projects p ON t.project_id = p.id
WHERE p.status <> 'delayed';

-- 58. Отримати список команд, які працюють над проєктами з бюджетом менше $20000:
SELECT t.name AS team_name, p.name AS project_name
FROM Teams t
JOIN Projects p ON t.project_id = p.id
WHERE p.budget > '$50000';

-- 59. Отримати список команд, які працюють над проєктами, які мають статус 'approved' або 'in progress':
SELECT t.name AS team_name, p.name AS project_name
FROM Teams t
JOIN Projects p ON t.project_id = p.id
WHERE p.status IN ('approved', 'in progress');

-- 60. Отримати список команд, які мають більше 10 учасників:
SELECT t.name AS team_name, COUNT(*) AS member_count
FROM Teams t
JOIN Members m ON t.id = m.team_id
GROUP BY t.name
HAVING COUNT(*) > 10;

-- 61. Отримати список команд та кількість проєктів, над якими вони працюють:
SELECT t.name AS team_name, COUNT(*) AS project_count
FROM Teams t
GROUP BY t.name
ORDER BY project_count;

-- 62. Отримати список команд, які працюють над проєктами, що мають слово 'libero' у описі:
SELECT t.name AS team_name, p.name AS project_name, p.description AS project_description
FROM Teams t
JOIN Projects p ON t.project_id = p.id
WHERE p.description LIKE '%libero%';

-- 63. Отримати список команд та середній бюджет їх проєктів:
SELECT t.name AS team_name, ROUND(AVG(p.budget::DECIMAL), 2) AS avg_budget
FROM Teams t
JOIN Projects p ON t.project_id = p.id
GROUP BY t.name;

-- 64. Отримати список команд, які працюють над проєктами з бюджетом більше середнього значення бюджету:
SELECT 
    t.name AS team_name, 
    p.name AS project_name, 
    p.budget AS project_budget,
    avg_budget.avg_budget AS average_budget
FROM 
    Teams t
JOIN 
    Projects p ON t.project_id = p.id
JOIN
    (SELECT ROUND(AVG(budget::DECIMAL), 2) AS avg_budget FROM Projects) AS avg_budget ON TRUE
WHERE 
    p.budget::DECIMAL > avg_budget.avg_budget;

-- 65. Отримати список команд, які працюють над проєктами з бюджетом, що не перевищує $60000 та мають статус 'in progress':
SELECT t.name AS team_name, p.name AS project_name
FROM Teams t
JOIN Projects p ON t.project_id = p.id
WHERE p.budget::DECIMAL < 60000 AND p.status = 'in progress';

-- 66. Отримати список команд, які працюють над проєктами, які мають більше 2 учасників та статус 'approved':
SELECT t.name AS team_name, p.name AS project_name, COUNT(*) AS member_count
FROM Teams t
JOIN Projects p ON t.project_id = p.id
JOIN Members m ON t.id = m.team_id
WHERE p.status = 'approved'
GROUP BY t.name, p.name
HAVING COUNT(*) > 2;

-- 67. Отримати список команд, які працюють над проєктами, які розпочалися після 10 січня:
SELECT t.name AS team_nameF
FROM Teams t
JOIN Projects p ON t.project_id = p.id
WHERE EXTRACT(MONTH FROM p.start_date) = 6 AND EXTRACT(DAY FROM p.start_date) > 5;

-- 68. Отримати список команд, які працюють над проєктами з назвами, які починаються на літеру 'H':
SELECT t.name AS team_name
FROM Teams t
JOIN Projects p ON t.project_id = p.id
WHERE p.name LIKE 'H%';

-- 69. Отримати список команд, які працюють над проєктами, які мають назви менше 6 символів:
SELECT t.name AS team_name, p.name AS project_name
FROM Teams t
JOIN Projects p ON t.project_id = p.id
WHERE LENGTH(p.name) < 6;

-- 70. Отримати список команд, які працюють над проєктами, які мають бюджет в діапазоні від $50000 до $70000:
SELECT t.name AS team_name, p.name AS project_name, p.budget AS project_budget
FROM Teams t
JOIN Projects p ON t.project_id = p.id
WHERE p.budget::DECIMAL BETWEEN 50000 AND 70000
ORDER BY p.budget::DECIMAL;

-- 71. Отримати імена учасників та назви їхніх команд:
SELECT m.name AS member_name, t.name AS team_name
FROM Members m
JOIN Teams t ON m.team_id = t.id;

-- 72. Підрахувати кількість учасників кожної ролі в кожній команді:
SELECT t.name AS team_name, m.role, COUNT(*) AS role_count
FROM Teams t
JOIN Members m ON t.id = m.team_id
GROUP BY t.name, m.role
ORDER BY t.name;

-- 73. Дізнатися кількість учасників, які не належать жодній команді:
SELECT COUNT(*) AS count_of_members_without_team
FROM Members m
LEFT JOIN Teams t ON m.team_id = t.id
WHERE t.id IS NULL;

-- 74. Отримати список команд за кількістю учасників від найбільної до найменшої:
SELECT t.name AS team_name, COUNT(m.id) AS member_count
FROM Teams t
LEFT JOIN Members m ON t.id = m.team_id
GROUP BY t.id, t.name
ORDER BY member_count DESC;

-- 75. Отримати список всіх завдань разом з назвами проєктів, до яких вони належать:
SELECT t.*, p.name AS project_name
FROM Tasks t
JOIN Projects p ON t.project_id = p.id;

-- 76. Отримати кількість завдань, статус яких 'failed', у кожному проєкті:
SELECT p.name AS project_name, COUNT(*) AS failed_tasks_count
FROM Tasks t
JOIN Projects p ON t.project_id = p.id
WHERE t.status = 'failed'
GROUP BY p.name
ORDER BY p.name;

-- 77. Отримати список завдань, статус яких 'in progress', з відсортуванням за дедлайном у зростаючому порядку:
SELECT *
FROM Tasks
WHERE status = 'in progress'
ORDER BY deadline;

-- 78. Отримати список завдань, для яких дедлайн минув, та їхній статус не 'completed':
SELECT *
FROM Tasks
WHERE deadline < CURRENT_DATE AND status != 'completed';

-- 79. Отримати кількість завдань у кожному статусі для кожного проєкту:
SELECT p.name AS project_name, t.status, COUNT(*) AS task_count
FROM Tasks t
JOIN Projects p ON t.project_id = p.id
GROUP BY p.name, t.status
ORDER BY p.name;

-- 80. Отримати список проєктів, в яких є завдання зі статусом 'cancelled':
SELECT DISTINCT p.name AS project_name
FROM Tasks t
JOIN Projects p ON t.project_id = p.id
WHERE t.status = 'cancelled';

-- 81. Отримати список проєктів, які мають завдання зі статусом 'in progress' та кількість таких завдань:
SELECT p.name AS project_name, COUNT(*) AS in_progress_tasks_count
FROM Tasks t
JOIN Projects p ON t.project_id = p.id
WHERE t.status = 'in progress'
GROUP BY p.name;

-- 82. Отримати список проєктів, в яких є завдання зі статусом 'failed' та кількість таких завдань:
SELECT p.name AS project_name, COUNT(*) AS failed_tasks_count
FROM Tasks t
JOIN Projects p ON t.project_id = p.id
WHERE t.status = 'failed'
GROUP BY p.name;

-- 83. Отримати список завдань, виконання яких заплановано на цей тиждень:
SELECT *
FROM Tasks
WHERE deadline BETWEEN CURRENT_DATE AND CURRENT_DATE + INTERVAL '7 days';

-- 84. Отримати список проєктів, які мають завдання з найбільшим та найменшим терміном виконання:
SELECT p.name AS project_name, MIN(t.deadline) AS min_deadline, MAX(t.deadline) AS max_deadline
FROM Tasks t
JOIN Projects p ON t.project_id = p.id
GROUP BY p.name;

-- 85. Отримати список завдань, які є у проєктах з бюджетом більше $60000:
SELECT t.*
FROM Tasks t
JOIN Projects p ON t.project_id = p.id
WHERE p.budget::DECIMAL > 60000;

-- 86. Отримати список проєктів за кількістю завдань в порядку спадання:
SELECT p.name AS project_name, COUNT(*) AS task_count
FROM Tasks t
JOIN Projects p ON t.project_id = p.id
GROUP BY p.name
ORDER BY task_count DESC;

-- 87. Отримати список завдань, які створені після 1 січня 2024 року:
SELECT *
FROM Tasks
WHERE deadline > '2024-01-01';

-- 88. Отримати список проєктів, в яких немає завдань зі статусом 'in progress':
SELECT p.name AS project_name
FROM Projects p
LEFT JOIN Tasks t ON p.id = t.project_id AND t.status = 'in progress'
WHERE t.id IS NULL;

-- 89. Отримати список завдань, які є у проєкті 'Euphoria':
SELECT t.*
FROM Tasks t
JOIN Projects p ON t.project_id = p.id
WHERE p.name = 'Euphoria';

-- 90. Отримати кількість завдань, які має кожна команда:
SELECT tm.name AS team_name, COUNT(*) AS task_count
FROM Tasks t
JOIN Teams tm ON t.project_id = tm.project_id
GROUP BY tm.name;

-- 91. Отримати список проєктів, в яких є завдання зі статусом 'completed', та їх бюджет більше $50000:
SELECT DISTINCT p.name AS project_name, p.budget AS project_budget
FROM Tasks t
JOIN Projects p ON t.project_id = p.id
WHERE t.status = 'completed'
AND p.budget::DECIMAL > 50000;

-- 92. Отримати список учасників та їхніх команд, які мають завдання зі статусом 'failed':
SELECT m.name AS member_name, tm.name AS team_name
FROM Members m
JOIN Teams tm ON m.team_id = tm.id
JOIN Tasks t ON tm.project_id = t.project_id
WHERE t.status = 'failed';

-- 93. Отримати кількість завдань у кожному проєкті, де є хоча б одне завдання зі статусом 'cancelled':
SELECT p.name AS project_name, COUNT(t.id) AS task_count
FROM Projects p
JOIN Tasks t ON p.id = t.project_id
WHERE EXISTS (
    SELECT 1
    FROM Tasks
    WHERE project_id = p.id AND status = 'cancelled'
)
GROUP BY p.name;

-- 94. Отримати список команд, які працюють над проєктами з назвами, що починаються на літеру 'B':
SELECT tm.name AS team_name, p.name AS project_name
FROM Teams tm
JOIN Projects p ON tm.project_id = p.id
WHERE p.name LIKE 'B%';

-- 95. Порахувати загальну кількість завдань в кожній команді, де є хоча б одне завдання зі статусом 'completed':
SELECT tm.name AS team_name, COUNT(t.id) AS task_count
FROM Teams tm
JOIN Tasks t ON tm.project_id = t.project_id
WHERE EXISTS (
    SELECT 1
    FROM Tasks
    WHERE project_id = tm.project_id AND status = 'completed'
)
GROUP BY tm.name
ORDER BY tm.name;

-- 96. Отримати список команд, в яких є учасники з іменами, що починаються на літеру 'N', та кількість таких учасників:
SELECT tm.name AS team_name, COUNT(m.id) AS member_count
FROM Teams tm
JOIN Members m ON tm.id = m.team_id
WHERE m.name LIKE 'N%'
GROUP BY tm.name
ORDER BY tm.name;

-- 97. Отримати список команд, які працюють над проєктами з бюджетом менше середнього значення бюджету, та загальну кількість завдань у кожній такій команді:
SELECT tm.name AS team_name, COUNT(t.id) AS task_count
FROM Teams tm
JOIN Projects p ON tm.project_id = p.id
JOIN Tasks t ON p.id = t.project_id
WHERE p.budget::DECIMAL < (
    SELECT ROUND(AVG(budget::DECIMAL), 2)
    FROM Projects
)
GROUP BY tm.name;

-- 98. Вибрати ім'я учасника, його роль та назву команди, до якої він належить:
SELECT m.name, m.role, t.name AS team_name
FROM Members m
JOIN Teams t ON m.team_id = t.id
ORDER BY m.name;

-- 99. Показати кількість завдань для кожного статусу в кожній команді:
SELECT t.name AS team_name, ts.status, COUNT(*) AS task_count
FROM Teams t
JOIN Projects p ON t.project_id = p.id
JOIN Tasks ts ON p.id = ts.project_id
GROUP BY t.name, ts.status
ORDER BY t.name;

-- 100. Показати список проєктів, команду, що працює над кожним проєктом, та кількість учасників у цій команді:
SELECT p.name AS project_name, t.name AS team_name, COUNT(m.id) AS member_count
FROM Projects p
INNER JOIN Teams t ON p.id = t.project_id
LEFT JOIN Members m ON t.id = m.team_id
GROUP BY p.name, t.name;

-- Висновок: в ході виконання лабораторної роботи було детально вивчено роботу запиту SELECT, а також операторів WHERE, HAVING, JOIN, GROUP BY та ORDER BY, за допомогою яких надалі було реалізовано 100 SQL запитів в оригінальну базу даних.