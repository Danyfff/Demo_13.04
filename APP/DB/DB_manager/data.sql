CREATE TABLE statuses (
    id_status INT PRIMARY KEY,
    name_status VARCHAR(50)
);

CREATE TABLE clients (
    client_id INT PRIMARY KEY,
    name_client VARCHAR(255),
    inform TEXT,
    phone VARCHAR(20),
    addres VARCHAR(255)
);

CREATE TABLE equipment (
    id_equipment INT PRIMARY KEY,
    name_equipm VARCHAR(255),
    comment TEXT
);

CREATE TABLE types_faults (
    tip_faults_id INT PRIMARY KEY,
    name_types_of_faults VARCHAR(255)
);

CREATE TABLE users (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    addres VARCHAR(255),
    login VARCHAR(50),
    password VARCHAR(50)
);

CREATE TABLE applications (
    id INT PRIMARY KEY,
    comment TEXT,
    data_comti DATE,
    data_create DATE,
    FOREIGN KEY (id_status) REFERENCES statuses(id_status),
    FOREIGN KEY (id_equipment) REFERENCES equipment(id_equipment),
    FOREIGN KEY (id_types_faults) REFERENCES types_faults(tip_faults_id),
    FOREIGN KEY (id_user) REFERENCES users(id),
    FOREIGN KEY (id_client) REFERENCES clients(client_id)
);



INSERT INTO statuses (id_status, name_status)
VALUES
(1, 'В обработке'),
(2, 'Ожидает запчасти'),
(3, 'В ремонте');

INSERT INTO clients (client_id, name_client, inform, phone, addres)
VALUES
(1, 'Иванов Иван', 'Оптовый клиент', '123-456-7890', 'ул. Пушкина, д.10'),
(2, 'Петров Петр', 'Розничный клиент', '987-654-3210', 'пр. Ленина, д.5'),
(3, 'Сидорова Елена', 'Физическое лицо', '111-222-3333', 'пер. Строителей, д.3');

INSERT INTO equipment (id_equipment, name_equipm, comment)
VALUES
(101, 'Компьютер', 'Системный блок'),
(102, 'Принтер', 'Цветной лазерный'),
(103, 'Ноутбук', '15.6" Full HD');

INSERT INTO types_faults (tip_faults_id, name_types_of_faults)
VALUES
(201, 'Не включается'),
(202, 'Испорчен дисплей'),
(203, 'Принтер не печатает');

INSERT INTO users (id, name, addres, login, password)
VALUES
(1, 'John Doe', '123 Main St', 'jdoe123', 'password123'),
(2, 'Alice Smith', '456 Elm St', 'asmith456', 'abcd1234'),
(3, 'Bob Johnson', '789 Oak St', 'bjohn789', 'passw0rd');

INSERT INTO applications (id, comment, data_comti, data_create, id_status, id_equipment, id_types_faults, id_user, id_client)
VALUES
(1, 'Компьютер не включается', '2024-04-10', '2024-04-01', 1, 101, 201, 1, 1),
(2, 'Принтер печатает черные полосы', '2024-04-05', '2024-04-03', 2, 102, 203, 2, 2),
(3, 'Ноутбук перегревается', '2024-04-20', '2024-04-15', 3, 103, 202, 3, 3);
