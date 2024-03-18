-- Active: 1707252918369@@127.0.0.1@5432@db2024_Lab1
-- Функція обчислення середнього значення бюджету проєкту:
CREATE FUNCTION calculate_avg_project_budget() 
RETURNS MONEY 
AS $$
DECLARE
    avg_budget MONEY;
BEGIN
    SELECT AVG(p.budget::NUMERIC) INTO avg_budget FROM Projects p;
    RETURN avg_budget;
END;
$$ 
LANGUAGE plpgsql;

SELECT calculate_avg_project_budget();



-- Функція виведення всіх учасників, які входять до конкретного проєкту з відповідною роллю:
CREATE FUNCTION get_team_members_by_role(project_id INT, role_name VARCHAR(18)) 
RETURNS TABLE (
    member_name VARCHAR(50),
    role VARCHAR(18),
    phone_number TEXT
) 
AS $$
BEGIN
    RETURN QUERY
    SELECT m.name, m.role, m.phone_number
    FROM Members m
    JOIN Teams t ON m.team_id = t.id
    JOIN Projects p ON t.project_id = p.id
    WHERE p.id = get_team_members_by_role.project_id AND m.role = role_name;
END;
$$ 
LANGUAGE plpgsql;

SELECT * FROM get_team_members_by_role(1, 'support specialist');
SELECT * FROM get_team_members_by_role(3, 'analyst');



-- Процедура оновлення статусу конкретного завдання:
CREATE OR REPLACE PROCEDURE update_task_status(task_id INT, new_status VARCHAR(11))
AS $$
BEGIN
    UPDATE Tasks 
    SET status = new_status 
    WHERE id = task_id;
    RAISE NOTICE 'Task with ID % has been updated to status %', task_id, new_status;
END;
$$ LANGUAGE plpgsql;

CALL update_task_status(44, 'initiated');
SELECT * FROM Tasks WHERE id = 44;



-- Процедура подовження дедлайну для вказаної задачі:
CREATE OR REPLACE PROCEDURE modify_deadline(task_id INT, days_amount INT)
AS $$
DECLARE
    new_deadline DATE;
BEGIN
    -- Отримання поточного дедлайну
    SELECT deadline + days_amount INTO new_deadline
    FROM Tasks
    WHERE id = task_id;
    
    -- Оновлення дедлайну для вказаної задачі
    UPDATE Tasks
    SET deadline = new_deadline
    WHERE id = task_id;
    
    IF days_amount > 0 THEN
        RAISE NOTICE 'Deadline for task % has been extended by % days. New deadline: %', task_id, days_amount, new_deadline;
    ELSIF days_amount < 0 THEN
        RAISE NOTICE 'Deadline for task % has been shortened by % days. New deadline: %', task_id, -days_amount, new_deadline;
    ELSE
        RAISE NOTICE 'Deadline for task % remains unchanged.', task_id;
    END IF;
END;
$$ 
LANGUAGE plpgsql;

CALL modify_deadline(158, 15);
SELECT * FROM Tasks where id=158;

CALL modify_deadline(389, -30);
SELECT * FROM Tasks where id=389;



-- Тригерна функція перевірки призначення коректного дедлайну задачі:
CREATE OR REPLACE FUNCTION check_task_deadline()
RETURNS TRIGGER 
AS $$
BEGIN
    IF NEW.deadline < CURRENT_DATE THEN
        RAISE EXCEPTION 'Cannot assign deadline earlier than current date.';
    END IF;
    RETURN NEW;
END;
$$ 
LANGUAGE plpgsql;

-- Власне тригер:
CREATE TRIGGER check_deadline_trigger
BEFORE INSERT ON Tasks
FOR EACH ROW
EXECUTE FUNCTION check_task_deadline();

INSERT INTO Tasks (description, deadline, status, project_id) values ('Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', '20/09/2023', 'pending', 7);



-- Створення колонки last_updated у таблиці Projects, яка містить час останньої зміни даних проєкту:
ALTER TABLE Projects
ADD COLUMN last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

SELECT * FROM Projects;

-- Тригерна функція встановлення поточного часу в ролі часу останнього оновлення рядка таблиці Projects:
CREATE OR REPLACE FUNCTION update_last_updated_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.last_updated := CURRENT_TIMESTAMP;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Власне тригер:
CREATE TRIGGER update_last_updated_trigger
BEFORE UPDATE ON Projects
FOR EACH ROW
EXECUTE FUNCTION update_last_updated_column();

-- Оновлення даних про проєкт для перевірки роботи тригера:
UPDATE Projects
SET budget = 30000
WHERE id = 9;

SELECT * FROM Projects;

-- Вибрати всі наявні тригери
SELECT trigger_name, event_object_table, action_statement
FROM information_schema.triggers;



-- Транзакція додавання нового учасника в команду та оновлення бюджету проєкту:
BEGIN;
    INSERT INTO Members (name, role, phone_number, team_id)
    VALUES ('James Bond', 'developer', '+380987654321', 1);
    SELECT * FROM Members;
    UPDATE Projects SET budget = budget::NUMERIC + 3000 WHERE id=9;
    SELECT * FROM Projects WHERE id=9;
ROLLBACK;



-- Транзакція оновлення статусу одного проєкту (виконається) та видалення іншого з таблиці Projects (відкотиться):
BEGIN;
    UPDATE Projects SET status='finished' WHERE id=4;
    SAVEPOINT proj_4;
    DELETE FROM Projects WHERE id=3;
    ROLLBACK TO SAVEPOINT proj_4;
    SELECT * FROM Projects;
COMMIT;



-- Індекс для швидкого пошуку всіх членів команди з id = 19:
CREATE INDEX idx_team_id ON Members (team_id);
SELECT * FROM Members
WHERE team_id = 19
ORDER BY name;



-- Індекс для швидкого пошуку проєктів з бюджетом понад $10000:
CREATE INDEX idx_project_budget ON Projects (budget);
SELECT * FROM Projects
WHERE budget::NUMERIC > 10000;



-- Висновок: в ході виконання лабораторної роботи я ознайомився з поняттями функцій, процедур, тригерних функцій, тригерів, транзакцій та індексів у PostgreSQL, а також на практиці реалізував їх для своєї бази даних.