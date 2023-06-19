create schema caja_hc;
use caja_hc;

create table cajero (
Id_cajero int primary key not null ,
Nombre Varchar(50) not null,
Apellido Varchar(50) not null,
Turno int,
Rut varchar(10) not null
);

create table caja (
Id_caja int primary key not null,
Estado varchar (15) not null
);

create table cliente (
Id_cliente int primary key not null,
Nombre Varchar (30) not null,
Apellido varchar (30) not null,
Rut varchar (10) not null,
Telefono varchar (10) not null
);

create table Metodos_de_pago(
Id_metodo_de_pago int primary key not null,
Nombre Varchar(20) not null
);

create table producto(
Id_producto int primary key not null,
Nombre varchar (60) not null,
Descripcion varchar(130) not null,
precio decimal,
stock int
);

create table venta (
Id_venta int primary key not null,
Id_cajero int not null,
Id_caja int not null,
Id_cliente int not null,
Id_metodo_de_pago int not null,
fecha date not null,
monto_total decimal (10,2),
foreign key (Id_cajero) references cajero (Id_cajero),
foreign key (Id_caja) references caja (Id_caja),
foreign key (Id_cliente) references cliente (Id_cliente),
foreign key (Id_metodo_de_pago) references metodos_de_pago (Id_metodo_de_pago)
);

create table detalle_de_venta(
Id_venta int not null,
Id_producto int not null,
cant_producto decimal not null,
Valor_total_producto decimal not null,
primary key( Id_venta,Id_producto)
);

create table departamento(
Id_departamento int primary key not null,
Nombre Varchar (20)
);

create table metas(
Id_metas int primary key not null,
mes int,
año int,
monto_meta decimal (10,2),
monto_alcanzado decimal (10,2),
porcentaje_alcanzado decimal (5,2),
Id_cajero int not null,
Id_departamento int not null,
foreign key (id_cajero) references cajero (id_cajero),
foreign key (id_departamento) references departamento (id_departamento)
);

alter table detalle_de_venta
add constraint Id_venta foreign key (id_venta) references venta(Id_venta),
add constraint Id_producto foreign key (Id_producto) references producto(Id_producto);

CREATE TABLE acumulacion_puntos (
	id_acumpuntos int primary key not null,
    id_cliente INT NOT NULL,
    fecha DATE NOT NULL,
    monto_total DECIMAL(10,2) NOT NULL,
    puntos_acumulados INT NOT NULL,
    foreign key (id_cliente) references cliente (id_cliente)
    );
    


----------------------------------------------

INSERT INTO caja (ID_caja, Estado)
VALUES (1, 'operativa'),
       (2, 'no operativa'),
       (3, 'operativa'),
       (4, 'operativa'),
       (5, 'operativa'),
       (6, 'operativa'),
       (7, 'operativa'),
       (8, 'no operativa'),
       (9, 'operativa'),
       (10, 'no operativa'),
       (11, 'operativa'),
       (12, 'no operativa'),
       (13, 'operativa'),
       (14, 'operativa'),
       (15, 'operativa'),
       (16, 'operativa'),
       (17, 'operativa'),
       (18, 'operativa'),
       (19, 'operativa'),
       (20, 'operativa');
----------------------------------------------
INSERT INTO cajero (Id_cajero, Nombre, Apellido, Turno, Rut)
VALUES (1, 'Catherin', 'Bernardeau', 2, '175633246'),
       (2, 'Arlen', 'McCallion', 3, '185633251'),
       (3, 'Arny', 'Gyenes', 1, '158975694'),
       (4, 'Vale', 'McBrearty', 2, '123656985'),
       (5, 'Giuseppe', 'Dilger', 3, '95632142'),
       (6, 'Salim', 'Bowyer', 1, '185246214'),
       (7, 'Candi', 'Eilhersen', 3, '215369856'),
       (8, 'Heywood', 'Gounel', 2, '152895473'),
       (9, 'Van', 'Illwell', 2, '142896563'),
       (10, 'Bord', 'Niess', 1, '79308509'),
       (11, 'Romeo', 'Pavelin', 2, '154862472'),
       (12, 'Lila', 'Castri', 1, '157458944'),
       (13, 'Maddalena', 'Storks', 2, '42225554'),
       (14, 'Flor', 'Shimon', 3, '36547413'),
       (15, 'Welbie', 'McGahy', 3, '182036484'),
       (16, 'Zechariah', 'Danilovic', 2, '123225520'),
       (17, 'Charlotta', 'Stair', 3, '145236255'),
       (18, 'Cara', 'Aukland', 2, '74562243'),
       (19, 'Candida', 'Symons', 1, '148741263'),
       (20, 'Leticia', 'Weatherall', 3, '156322369');
       
-----------------------------------------------------------
INSERT INTO cliente (ID_Cliente, Nombre, Apellido, Rut, Telefono)
VALUES (1, 'Noah', 'Smith', '10456782-4', '85740231'),
       (2, 'Emma', 'Davis', '03219487-6', '91876549'),
       (3, 'Ethan', 'Taylor', '09467853-8', '67432085'),
       (4, 'Chloe', 'Clark', '05234698-1', '26489750'),
       (5, 'William', 'Lewis', '08639571-9', '57394016'),
       (6, 'Harper', 'Garcia', '01948763-2', '84571239'),
       (7, 'James', 'Hernandez', '07691234-5', '10928376'),
       (8, 'Amelia', 'Johnson', '02938465-7', '56289047'),
       (9, 'Benjamin', 'Anderson', '04387521-3', '40125768'),
       (10, 'Olivia', 'Thompson', '01375892-6', '32876490'),
       (11, 'Daniel', 'Martin', '06129384-0', '95723468'),
       (12, 'Sophia', 'Martinez', '05236718-4', '63078425'),
       (13, 'Alexander', 'Davis', '09846327-5', '28507139'),
       (14, 'Mia', 'Wilson', '04156798-3', '70498325'),
       (15, 'Lucas', 'Anderson', '07369254-6', '17869034'),
       (16, 'Emily', 'Lee', '01234587-1', '40238765'),
       (17, 'Jacob', 'Hernandez', '03874259-6', '75602481'),
       (18, 'Grace', 'Walker', '06875429-8', '83961725'),
       (19, 'Michael', 'Brown', '02687453-2', '56290148'),
       (20, 'Isabella', 'Hall', '09346827-0', '94017863'),
       (21, 'Elijah', 'Scott', '04876532-1', '30174589'),
       (22, 'Charlotte', 'White', '01983756-9', '48709561'),
       (23, 'Aiden', 'Baker', '06392741-2', '21986375'),
       (24, 'Elizabeth', 'Taylor', '08972456-8', '90721346'),
       (25, 'Jackson', 'Martin', '05789634-3', '43890761'),
       (26, 'Lily', 'Flores', '01789263-9', '86517420'),
       (27, 'Gabriel', 'Perez', '02176498-6', '54289016'),
       (28, 'Ava', 'Martinez', '06784321-5', '73084591'),
       (29, 'Carter', 'Perez', '01293857-4', '10978354'),
       (30, 'Natalie', 'Adams', '04378592-1', '21587406'),
	   (31, 'Samuel', 'Clark', '05283674-3', '78906123'),
       (32, 'Addison', 'Wilson', '08174926-8', '35769084'),
       (33, 'David', 'Davis', '04326759-0', '62498103'),
       (34, 'Scarlett', 'Clark', '01928374-6', '87604329'),
       (35, 'Noah', 'Davis', '09637482-1', '54981207'),
       (36, 'Penelope', 'Lee', '08639217-4', '92750314'),
       (37, 'William', 'Anderson', '01234589-7', '36429875'),
       (38, 'Victoria', 'Martinez', '06123987-5', '79501348'),
       (39, 'Matthew', 'Lee', '02347568-2', '21385947'),
       (40, 'Zoe', 'Davis', '01386745-9', '46903128'),
       (41, 'Christopher', 'Anderson', '08347562-4', '53091784'),
       (42, 'Ava', 'Johnson', '01793856-1', '70189634'),
       (43, 'Julian', 'Martinez', '08735629-4', '15097238'),
       (44, 'Ellie', 'Smith', '09487123-8', '68519034'),
       (45, 'Isaac', 'Clark', '01293856-3', '37281905'),
       (46, 'Audrey', 'Garcia', '04378652-1', '81347529'),
       (47, 'Ryan', 'Johnson', '07234856-0', '96530124'),
       (48, 'Lu', 'Blanc', '09237856-4', '42891635'),
       (49, 'Oscar', 'Perez', '03196785-1', '79102386');
       
	-------------------------------------------------------

INSERT INTO departamento (Id_departamento, Nombre)
VALUES (1, 'Temporada'),
       (2, 'Puertas'),
       (3, 'Pinturas'),
       (4, 'Patio Constructor'),
       (5, 'Muebles'),
       (6, 'Menaje'),
       (7, 'Linea Blanca'),
       (8, 'Iluminación'),
       (9, 'Gasfiteria'),
       (10, 'Fijaciones'),
       (11, 'Embalaje'),
       (12, 'Electricidad'),
       (13, 'Ceramicos'),
       (14, 'Cajas'),
       (15, 'Botanica'),
       (16, 'Baño'),
       (17, 'Automovil'),
       (18, 'Alfombras');
----------------------------------

INSERT INTO metas (ID_metas, Mes, Año, Monto_meta, Monto_alcanzado, Porcentaje_alcanzado, ID_cajero, ID_departamento)
VALUES
(1, 1, 2023, 500000, 766324, 100, 1, 14),
(2, 1, 2023, 500000, 411870, 82, 2, 14),
(3, 1, 2023, 500000, 1482164, 100, 3, 14),
(4, 1, 2023, 500000, 748774, 100, 4, 14),
(5, 1, 2023, 500000, 1961291, 100, 5, 14),
(6, 1, 2023, 500000, 911415, 100, 6, 14),
(7, 1, 2023, 500000, 761271, 100, 7, 14),
(8, 1, 2023, 500000, 824386, 100, 8, 14),
(9, 1, 2023, 500000, 412873, 83, 9, 14),
(10, 1, 2023, 500000, 908947, 100, 10, 14),
(11, 1, 2023, 500000, 1456579, 100, 11, 14),
(12, 1, 2023, 500000, 457289, 91, 12, 14),
(13, 1, 2023, 500000, 817910, 100, 13, 14),
(14, 1, 2023, 500000, 683192, 100, 14, 14),
(15, 1, 2023, 500000, 670231, 100, 15, 14),
(16, 1, 2023, 500000, 975463, 100, 16, 14),
(17, 1, 2023, 500000, 718380, 100, 17, 14),
(18, 1, 2023, 500000, 1575925, 100, 18, 14),
(19, 2, 2023, 500000, 1485619, 100, 19, 14),
(20, 2, 2023, 500000, 50207, 10, 1, 14),
(21, 2, 2023, 500000, 944330, 100, 2, 14),
(22, 2, 2023, 500000, 274715, 55, 3, 14),
(23, 2, 2023, 500000, 1347720, 100, 4, 14),
(24, 2, 2023, 500000, 48097, 10, 5, 14),
(25, 2, 2023, 500000, 707616, 100, 6, 14),
(26, 2, 2023, 500000, 1088394, 100, 7, 14),
(27, 2, 2023, 500000, 676046, 100, 8, 14),
(28, 2, 2023, 500000, 448190, 90, 9, 14),
(29, 2, 2023, 500000, 521610, 100, 10, 14),
(30, 2, 2023, 500000, 1239909, 100, 11, 14),
(31, 2, 2023, 500000, 1059208, 100, 12, 14),
(32, 2, 2023, 500000, 800826, 100, 13, 14),
(33, 2, 2023, 500000, 1206945, 100, 14, 14),
(34, 2, 2023, 500000, 1097687, 100, 15, 14),
(35, 2, 2023, 500000, 923933, 100, 16, 14),
(36, 2, 2023, 500000, 1336162, 100, 17, 14),
(37, 2, 2023, 500000, 1024728, 100, 18, 14),
(38, 2, 2023, 500000, 1074294, 100, 19, 14),
(39, 3, 2023, 500000, 1265990, 100, 1, 14),
(40, 3, 2023, 500000, 1090625, 100, 2, 14),
(41, 3, 2023, 500000, 685568, 100, 3, 14),
(42, 3, 2023, 500000, 408355, 82, 4, 14),
(43, 3, 2023, 500000, 671767, 100, 5, 14),
(44, 3, 2023, 500000, 1180731, 100, 6, 14),
(45, 3, 2023, 500000, 644147, 100, 7, 14),
(46, 3, 2023, 500000, 581742, 100, 8, 14),
(47, 3, 2023, 500000, 1631644, 100, 9, 14),
(48, 3, 2023, 500000, 821152, 100, 10, 14),
(49, 3, 2023, 500000, 95846, 19, 11, 14),
(50, 3, 2023, 500000, 806243, 100, 12, 14),
(51, 3, 2023, 500000, 785616, 100, 13, 14),
(52, 3, 2023, 500000, 1031284, 100, 14, 14),
(53, 3, 2023, 500000, 1041336, 100, 15, 14),
(54, 3, 2023, 500000, 271824, 54, 16, 14),
(55, 3, 2023, 500000, 322641, 65, 17, 14),
(56, 3, 2023, 500000, 946023, 100, 18, 14),
(57, 3, 2023, 500000, 0, 0, 19, 14);

----------------------------------------------
INSERT INTO metodos_de_pago (ID_metodo_de_pago, Nombre)
VALUES
(1, 'Efectivo'),
(2, 'Credito'),
(3, 'Debito'),
(4, 'CMR'),
(5, 'Fpay'),
(6, 'Cheque'),
(7, 'Nota de credito'),
(8, 'Gifcard'),
(9, 'Puntos'),
(10, 'OC');

---------------------------------------------------------

INSERT INTO producto (ID_Producto, Nombre, Descripcion, Precio, Stock)
VALUES
(1, 'Martillo', 'Herramienta para golpear', 8792, 100),
(2, 'Destornillador', 'Herramienta para apretar o aflojar tornillos', 47992, 150),
(3, 'Sierra eléctrica', 'Herramienta para cortar madera u otros materiales', 71992, 20),
(4, 'Llave ajustable', 'Herramienta para ajustar tuercas y pernos', 7192, 80),
(5, 'Cinta métrica', 'Herramienta para medir distancias', 3192, 200),
(6, 'Clavos', 'Tornillos de metal para fijar madera u otros materiales', 792, 500),
(7, 'Tornillos', 'Tornillos de metal para fijar madera u otros materiales', 792, 500),
(8, 'Lija', 'Papel de lija para lijar madera y otros materiales', 1592, 300),
(9, 'Brocas', 'Conjunto de brocas para taladrar agujeros en madera y otros materiales', 12792, 50),
(10, 'Pintura', 'Pintura para madera, metal, paredes y otros materiales', 23992, 50),
(11, 'Pincel', 'Pincel para aplicar pintura u otros líquidos', 2392, 100),
(12, 'Rodillo de pintura', 'Rodillo para aplicar pintura a grandes superficies', 7992, 50),
(13, 'Escalera', 'Escalera para alcanzar lugares altos', 31992, 30),
(14, 'Caja de herramientas', 'Caja para almacenar herramientas y accesorios', 19992, 40),
(15, 'Cinta adhesiva', 'Cinta para fijar objetos y materiales', 2392, 200),
(16, 'Pegamento para madera', 'Pegamento para fijar madera y otros materiales', 4792, 100),
(17, 'Cepillo de alambre', 'Cepillo de alambre para limpiar superficies metálicas', 3992, 80),
(18, 'Tijeras', 'Tijeras para cortar papel, tela y otros materiales', 1592, 150),
(19, 'Pinzas', 'Pinzas para sujetar objetos pequeños', 3192, 100),
(20, 'Linterna', 'Linterna para iluminar lugares oscuros', 6392, 50),
(21, 'Bombilla', 'Bombilla para iluminar lámparas y otros dispositivos', 2392, 300),
(22, 'Interruptor de luz', 'Interruptor para encender y apagar luces', 1592, 100),
(23, 'Enchufe eléctrico', 'Enchufe para conectar dispositivos eléctricos', 2392, 150),
(24, 'Regleta de enchufes', 'Regleta para conectar varios dispositivos eléctricos a una sola toma de corriente', 7192, 50),
(25, 'Adaptador de enchufe', 'Adaptador para enchufes de diferentes formas y tamaños', 3192, 100),
(26, 'Destornillador eléctrico', 'Herramienta para apretar o aflojar tornillos de forma automática', 39992, 30),
(27, 'Martillo', 'Martillo de carpintero', 8792, 100),
(28, 'Taladro inalámbrico', 'Taladro inalámbrico de 12V con batería recargable', 39992, 50),
(29, 'Sierra circular', 'Sierra circular con hoja de 7 1/4 pulgadas', 55992, 25),
(30, 'Juego de llaves inglesas', 'Juego de 5 llaves inglesas de diferentes tamaños', 15992, 75),
(31, 'Destornillador eléctrico', 'Destornillador eléctrico recargable con 6 bits intercambiables', 23992, 50),
(32, 'Set de brocas', 'Set de 30 brocas de titanio para taladro', 19992, 100),
(33, 'Pistola de pegamento caliente', 'Pistola de pegamento caliente con 10 barras de pegamento', 11992, 50),
(34, 'Clavos para carpintería', 'Caja de 500 clavos de 2 pulgadas para carpintería', 6392, 200),
(35, 'Tornillos para madera', 'Caja de 200 tornillos de 2 1/2 pulgadas para madera', 7992, 150),
(36, 'Cinta métrica', 'Cinta métrica de 25 pies con clip para cinturón', 7192, 100),
(37, 'Pintura en spray', 'Pintura en spray para múltiples superficies, color negro mate', 5592, 50),
(38, 'Papel de lija', 'Paquete de 10 hojas de papel de lija de grano medio', 3992, 100),
(39, 'Lijadora de banda', 'Lijadora de banda con velocidad ajustable', 79992, 20),
(40, 'Mascarilla de seguridad', 'Mascarilla de seguridad para polvo y partículas, paquete de 10 unidades', 11992, 50),
(41, 'Guantes de trabajo', 'Guantes de trabajo de cuero con forro de algodón, talla L', 10392, 75),
(42, 'Nivel láser', 'Nivel láser con trípode y estuche de transporte', 63992, 30),
(43, 'Regla de aluminio', 'Regla de aluminio de 24 pulgadas con marcas métricas e imperiales', 7992, 75),
(44, 'Lápiz de carpintero', 'Lápiz de carpintero con mina de grafito gruesa', 1592, 200),
(45, 'Sargentos de carpintero', 'Juego de 4 sargentos de carpintero de 6 pulgadas', 23992, 50),
(46, 'Grapadora eléctrica', 'Grapadora eléctrica con capacidad para grapas de 1/4 y 3/8 pulgadas', 31992, 40),
(47, 'Cepillo eléctrico', 'Cepillo eléctrico para madera con 2 cuchillas intercambiables', 63992, 25),
(48, 'Gafas de seguridad', 'Gafas de seguridad con lentes de policarbonato y marco ajustable', 7992, 100),
(49, 'Juego de cuchillos de cocina', 'Incluye 5 cuchillos diferentes para todas tus necesidades de corte', 45000, 10),
(50, 'Batería de cocina antiadherente', 'Set de 10 piezas con revestimiento antiadherente para facilitar la limpieza', 108000, 5),
(51, 'Cafetera francesa', 'Capacidad para 8 tazas de café, con filtro de acero inoxidable', 22500, 15),
(52, 'Batidora de mano', 'Potente motor de 500 vatios con accesorios para batir y amasar', 31500, 8),
(53, 'Juego de cacerolas de acero inoxidable', 'Set de 3 piezas con tapas de vidrio templado y asas de silicona', 72000, 6),
(54, 'Tabla de cortar de bambú', 'Resistente y duradera, fácil de limpiar y respetuosa con el medio ambiente', 13500, 20),
(55, 'Hervidor eléctrico de agua', 'Capacidad para 1,7 litros de agua con apagado automático y protección contra la ebullición en seco', 27000, 12),
(56, 'Olla a presión', 'Capacidad para 6 litros, con sistema de seguridad y control de presión', 63000, 4),
(57, 'Tostadora', 'Con capacidad para 4 rebanadas de pan y ajustes de tostado personalizables', 36000, 10),
(58, 'Espumador de leche eléctrico', 'Crea espuma de leche para tus bebidas favoritas, con diferentes opciones de velocidad', 18000, 18),
(59, 'Juego de utensilios de cocina de silicona', 'Incluye espátulas, cucharas y pinzas para cocinar sin rayar tus sartenes', 22500, 15),
(60, 'Horno eléctrico', 'Capacidad para 6 rebanadas de pan y diferentes ajustes de cocción', 90000, 5),
(61, 'Báscula de cocina digital', 'Precisa y fácil de usar, con pantalla LCD y diferentes unidades de medida', 18000, 18),
(62, 'Juego de moldes para hornear', 'Incluye moldes para muffins, brownies y pasteles, con revestimiento antiadherente', 27000, 12),
(63, 'Licuadora de alta velocidad', 'Potente motor de 1000 vatios con diferentes velocidades y opciones de pulso', 72000, 6),
(64, 'Juego de tazones de mezcla de acero inoxidable', 'Set de 3 piezas con tamaños diferentes para mezclar y preparar alimentos', 22500, 15),
(65, 'Máquina para hacer pasta', 'Incluye diferentes accesorios para hacer pasta fresca en casa', 45000, 10),
(66, 'Exprimidor eléctrico', 'Potente motor de 100 vatios para extraer todo el jugo de tus frutas favoritas', 31500, 8),
(67, 'Molinillo de café eléctrico', 'Muele café fresco en segundos con diferentes ajustes de molido', 40000, 10),
(68, 'Juego de sartenes antiadherentes', 'Set de 2 piezas con diferentes tamaños y revestimiento antiadherente', 50000, 10),
(69, 'Llave grifa', 'Llave ajustable para tuberías y conexiones', 10000, 25),
(70, 'Tubería de cobre', 'Tubería de cobre para instalaciones de gas y agua', 15000, 20),
(71, 'Cinta de teflón', 'Cinta de sellado para tuberías y accesorios', 2000, 50),
(72, 'Conector de cobre', 'Conector de cobre para tuberías de gas y agua', 5000, 30),
(73, 'Válvula de corte', 'Válvula para cortar el flujo de gas o agua en una tubería', 7000, 35),
(74, 'Sifón de PVC', 'Sifón de PVC para desagües de lavamanos y duchas', 3000, 40),
(75, 'Grifo de agua', 'Grifo de agua para instalaciones de cocina o baño', 12000, 15),
(76, 'Tubería de gas', 'Tubería de gas para instalaciones de gas natural o propano', 20000, 10),
(77, 'Adaptador de gas', 'Adaptador para conectar tuberías de gas', 6000, 25),
(78, 'Junta de goma', 'Junta de goma para sellar tuberías y accesorios', 1500, 60),
(79, 'Llave de paso', 'Llave para abrir o cerrar el flujo de gas o agua en una tubería', 8000, 30),
(80, 'Tuerca de cobre', 'Tuerca de cobre para fijar tuberías y accesorios', 2000, 50),
(81, 'Reductor de presión', 'Reductor de presión para regular la presión del gas o agua', 15000, 20),
(82, 'Tubería de PVC', 'Tubería de PVC para instalaciones de agua y desagüe', 8000, 40),
(83, 'Codo de cobre', 'Codo de cobre para tuberías de gas y agua', 4000, 35),
(84, 'Tapón de PVC', 'Tapón de PVC para sellar tuberías y accesorios', 1500, 60),
(85, 'Llave de tubo', 'Llave para tuberías y conexiones de tamaño grande', 18000, 15),
(86, 'Válvula de retención', 'Válvula para evitar el retorno del agua o gas en una tubería', 10000, 25),
(87, 'Tubería corrugada', 'Tubería corrugada para desagües de lavadoras y lavaplatos', 5000, 30),
(88, 'Adaptador de PVC', 'Adaptador para conectar tuberías de PVC', 3000, 45),
(89, 'Abrazadera de metal', 'Abrazadera para fijar tuberías y accesorios', 1500, 60),
(90, 'Tapón de cobre', 'Tapón de cobre para sellar tuberías y accesorios', 3000, 40),
(91, 'Válvula de bola', 'Válvula de bola para controlar el flujo de gas o agua', 12000, 20),
(92, 'Codo de PVC', 'Codo de PVC para tuberías de agua y desagüe', 2500, 50);

---------------------------------------------------------------------------------------------------------

INSERT INTO venta (ID_venta, ID_cajero, ID_caja, ID_cliente, ID_metodo_de_pago, Fecha, Monto_total)
VALUES
(1, 1, 2, 38, 7, '2023-03-19', 266667),
(2, 1, 2, 8, 3, '2023-01-13', 470480),
(3, 1, 2, 39, 2, '2023-03-30', 233756),
(4, 1, 2, 38, 4, '2023-01-05', 31041),
(5, 1, 2, 46, 3, '2023-03-16', 445582),
(6, 1, 2, 44, 9, '2023-02-01', 50207),
(7, 1, 2, 7, 8, '2023-03-30', 319985),
(8, 1, 2, 2, 2, '2023-01-08', 237739),
(9, 1, 2, 3, 7, '2023-01-17', 27064),
(10, 2, 4, 42, 9, '2023-02-10', 458265),
(11, 2, 4, 49, 3, '2023-03-16', 218660),
(12, 2, 4, 15, 7, '2023-03-11', 29607),
(13, 2, 4, 49, 4, '2023-02-13', 430388),
(14, 2, 4, 10, 7, '2023-01-13', 118522),
(15, 2, 4, 27, 7, '2023-03-22', 386054),
(16, 2, 4, 1, 5, '2023-02-18', 55677),
(17, 2, 4, 13, 6, '2023-01-19', 293348),
(18, 2, 4, 3, 9, '2023-03-09', 456304),
(19, 3, 7, 39, 1, '2023-03-01', 105763),
(20, 3, 7, 38, 2, '2023-01-26', 477695),
(21, 3, 7, 25, 4, '2023-03-01', 458941),
(22, 3, 7, 47, 4, '2023-02-09', 7558),
(23, 3, 7, 42, 5, '2023-02-26', 101288),
(24, 3, 7, 29, 6, '2023-02-24', 165869),
(25, 3, 7, 25, 9, '2023-01-05', 338515),
(26, 3, 7, 10, 2, '2023-03-13', 120864),
(27, 3, 7, 5, 5, '2023-01-16', 267426),
(28, 3, 7, 8, 3, '2023-01-13', 199931),
(29, 3, 7, 35, 3, '2023-01-07', 198597),
(30, 4, 10, 39, 4, '2023-01-19', 116093),
(31, 4, 10, 37, 3, '2023-03-24', 129102),
(32, 4, 10, 37, 8, '2023-01-07', 339437),
(33, 4, 10, 8, 6, '2023-03-26', 279253),
(34, 4, 10, 12, 10, '2023-01-06', 293244),
(35, 4, 10, 21, 3, '2023-02-23', 155957),
(36, 4, 10, 44, 3, '2023-02-08', 251155),
(37, 4, 10, 20, 5, '2023-02-18', 38924),
(38, 4, 10, 2, 5, '2023-02-12', 262889),
(39, 4, 10, 14, 7, '2023-02-25', 470924),
(40, 4, 10, 18, 8, '2023-02-19', 167871),
(41, 5, 15, 37, 3, '2023-01-02', 83412),
(42, 5, 15, 28, 5, '2023-01-12', 440448),
(43, 5, 15, 33, 8, '2023-01-02', 290376),
(44, 5, 15, 49, 4, '2023-01-19', 47977),
(45, 5, 15, 20, 10, '2023-02-15', 48097),
(46, 5, 15, 23, 7, '2023-01-15', 383759),
(47, 5, 15, 28, 7, '2023-01-05', 307553),
(48, 5, 15, 15, 8, '2023-03-15', 398922),
(49, 5, 15, 46, 8, '2023-01-12', 407766),
(50, 5, 15, 25, 4, '2023-03-02', 272845),
(51, 6, 13, 23, 2, '2023-03-10', 374194),
(52, 6, 13, 27, 8, '2023-03-22', 473753),
(53, 6, 13, 15, 4, '2023-01-15', 482794),
(54, 6, 13, 40, 5, '2023-02-28', 158725),
(55, 6, 13, 34, 6, '2023-01-29', 428621),
(56, 6, 13, 10, 8, '2023-02-18', 237552),
(57, 6, 13, 23, 5, '2023-02-03', 311339),
(58, 6, 13, 31, 6, '2023-03-25', 287907),
(59, 6, 13, 48, 10, '2023-03-19', 44877),
(60, 7, 14, 16, 4, '2023-03-07', 174989),
(61, 7, 14, 24, 2, '2023-02-05', 485192),
(62, 7, 14, 20, 1, '2023-02-25', 169906),
(63, 7, 14, 24, 1, '2023-03-02', 58219),
(64, 7, 14, 9, 8, '2023-01-03', 346408),
(65, 7, 14, 2, 8, '2023-01-21', 42253),
(66, 7, 14, 3, 3, '2023-02-05', 164917),
(67, 7, 14, 33, 6, '2023-02-20', 268379),
(68, 7, 14, 7, 1, '2023-03-14', 245579),
(69, 7, 14, 35, 2, '2023-03-18', 165360),
(70, 7, 14, 21, 10, '2023-01-25', 372610),
(71, 8, 16, 8, 4, '2023-01-29', 129273),
(72, 8, 16, 34, 9, '2023-03-24', 290546),
(73, 8, 16, 9, 7, '2023-02-04', 355256),
(74, 8, 16, 27, 7, '2023-03-24', 37820),
(75, 8, 16, 38, 6, '2023-01-29', 348360),
(76, 8, 16, 17, 5, '2023-02-03', 163280),
(77, 8, 16, 6, 10, '2023-03-01', 253376),
(78, 8, 16, 44, 9, '2023-02-28', 157510),
(79, 8, 16, 22, 6, '2023-01-05', 346753),
(80, 9, 19, 48, 2, '2023-03-14', 91602),
(81, 9, 19, 28, 8, '2023-03-20', 335481),
(82, 9, 19, 40, 9, '2023-03-29', 221455),
(83, 9, 19, 28, 10, '2023-03-19', 139488),
(84, 9, 19, 4, 9, '2023-03-21', 186468),
(85, 9, 19, 6, 4, '2023-03-19', 406401),
(86, 9, 19, 21, 4, '2023-02-02', 370509),
(87, 9, 19, 27, 5, '2023-03-26', 60802),
(88, 9, 19, 19, 1, '2023-02-12', 77681),
(89, 9, 19, 23, 10, '2023-03-24', 189947),
(90, 9, 19, 46, 2, '2023-01-05', 412873),
(91, 10, 8, 15, 3, '2023-01-30', 15375),
(92, 10, 8, 1, 3, '2023-01-13', 499613),
(93, 10, 8, 20, 8, '2023-01-29', 97198),
(94, 10, 8, 42, 8, '2023-03-23', 384651),
(95, 10, 8, 32, 4, '2023-03-21', 334622),
(96, 10, 8, 40, 10, '2023-02-11', 126503),
(97, 10, 8, 36, 2, '2023-02-13', 395107),
(98, 10, 8, 45, 6, '2023-01-12', 296761),
(99, 10, 11, 43, 4, '2023-03-07', 101879),
(100, 11, 11, 23, 2, '2023-01-07', 27195),
(101, 11, 11, 27, 5, '2023-02-03', 81477),
(102, 11, 11, 37, 9, '2023-02-05', 433603),
(103, 11, 11, 38, 10, '2023-01-21', 497079),
(104, 11, 11, 20, 2, '2023-01-04', 411201),
(105, 11, 11, 38, 7, '2023-01-16', 357725),
(106, 11, 11, 26, 10, '2023-02-20', 287360),
(107, 11, 11, 44, 7, '2023-01-17', 163379),
(108, 11, 11, 32, 1, '2023-03-02', 95846),
(109, 11, 11, 17, 9, '2023-02-20', 437469),
(110, 12, 3, 34, 8, '2023-03-23', 273163),
(111, 12, 3, 16, 7, '2023-02-03', 266549),
(112, 12, 3, 40, 5, '2023-02-27', 288551),
(113, 12, 3, 22, 1, '2023-01-15', 146957),
(114, 12, 3, 17, 9, '2023-03-02', 307854),
(115, 12, 3, 43, 8, '2023-03-10', 64599),
(116, 12, 3, 13, 4, '2023-02-11', 405539),
(117, 12, 3, 48, 1, '2023-01-14', 310332),
(118, 12, 3, 43, 1, '2023-02-04', 98569),
(119, 12, 3, 20, 10, '2023-03-10', 160627),
(120, 13, 6, 20, 1, '2023-03-13', 329187),
(121, 13, 6, 42, 4, '2023-01-08', 321432),
(122, 13, 6, 36, 10, '2023-02-26', 110936),
(123, 13, 6, 13, 3, '2023-02-17', 409158),
(124, 13, 6, 46, 10, '2023-01-19', 223560),
(125, 13, 6, 7, 6, '2023-03-18', 441741),
(126, 13, 6, 41, 2, '2023-01-30', 106276),
(127, 13, 6, 5, 5, '2023-03-02', 14688),
(128, 13, 6, 1, 5, '2023-01-10', 166642),
(129, 13, 6, 5, 6, '2023-02-12', 280732),
(130, 14, 9, 28, 1, '2023-02-28', 24210),
(131, 14, 9, 8, 1, '2023-02-27', 286940),
(132, 14, 9, 24, 3, '2023-03-10', 364822),
(133, 14, 9, 40, 9, '2023-01-16', 200229),
(134, 14, 9, 9, 5, '2023-02-22', 492179),
(135, 14, 9, 26, 4, '2023-01-27', 482963),
(136, 14, 9, 20, 7, '2023-02-16', 403616),
(137, 14, 9, 31, 1, '2023-03-02', 448704),
(138, 14, 9, 33, 6, '2023-03-26', 15192),
(139, 14, 9, 25, 9, '2023-03-01', 202566),
(140, 15, 16, 9, 7, '2023-01-08', 317485),
(141, 15, 16, 20, 4, '2023-03-11', 91291),
(142, 15, 16, 26, 6, '2023-02-16', 143556),
(143, 15, 16, 46, 1, '2023-01-07', 352746),
(144, 15, 16, 5, 3, '2023-02-27', 161382),
(145, 15, 16, 7, 2, '2023-03-06', 360126),
(146, 15, 16, 37, 5, '2023-03-21', 312834),
(147, 15, 16, 45, 1, '2023-03-29', 277085),
(148, 15, 16, 15, 10, '2023-02-25', 355601),
(149, 15, 16, 19, 4, '2023-02-07', 437148),
(150, 16, 17, 17, 10, '2023-01-24', 161903),
(151, 16, 17, 37, 7, '2023-01-21', 386778),
(152, 16, 17, 29, 7, '2023-02-26', 13724),
(153, 16, 17, 19, 8, '2023-01-22', 180182),
(154, 16, 17, 29, 10, '2023-03-02', 271824),
(155, 16, 17, 4, 1, '2023-02-28', 312908),
(156, 16, 17, 49, 4, '2023-02-23', 169729),
(157, 16, 17, 37, 1, '2023-01-06', 246600),
(158, 16, 17, 48, 9, '2023-02-22', 22337),
(159, 16, 17, 24, 1, '2023-02-28', 405235),
(160, 17, 5, 29, 10, '2023-02-20', 425388),
(161, 17, 5, 20, 8, '2023-01-05', 439969),
(162, 17, 5, 1, 8, '2023-02-24', 339234),
(163, 17, 5, 26, 7, '2023-01-17', 179726),
(164, 17, 5, 12, 9, '2023-03-14', 124706),
(165, 17, 5, 26, 8, '2023-02-11', 219579),
(166, 17, 5, 29, 9, '2023-03-01', 106152),
(167, 17, 5, 48, 10, '2023-02-27', 351961),
(168, 17, 5, 2, 9, '2023-03-26', 91783),
(169, 17, 5, 27, 3, '2023-01-05', 98685),
(170, 18, 8, 41, 5, '2023-01-27', 405776),
(171, 18, 8, 1, 8, '2023-02-13', 485205),
(172, 18, 8, 12, 9, '2023-01-05', 492238),
(173, 18, 8, 25, 8, '2023-02-27', 131451),
(174, 18, 8, 49, 4, '2023-01-24', 292153),
(175, 18, 8, 35, 6, '2023-03-05', 469653),
(176, 18, 8, 13, 8, '2023-03-18', 476370),
(177, 18, 8, 19, 3, '2023-02-21', 408072),
(178, 18, 8, 39, 4, '2023-01-24', 103505),
(179, 18, 8, 35, 7, '2023-01-18', 282253),
(180, 19, 9, 11, 8, '2023-01-09', 57816),
(181, 19, 9, 25, 9, '2023-01-14', 85364),
(182, 19, 9, 6, 10, '2023-01-03', 463595),
(183, 19, 9, 14, 10, '2023-02-17', 182964),
(184, 19, 9, 32, 2, '2023-02-23', 228962),
(185, 19, 9, 7, 3, '2023-01-17', 437037),
(186, 19, 9, 19, 2, '2023-02-18', 355533),
(187, 19, 9, 48, 5, '2023-02-14', 214654),
(188, 19, 9, 16, 2, '2023-02-20', 92181),
(189, 19, 9, 3, 1, '2023-01-01', 441807);

----------------------------------------------------

INSERT INTO detalle_de_venta (id_venta, id_producto, Cant_producto, Valor_total_producto)
VALUES (1, 15, 7, 129660),
       (2, 87, 5, 141769),
       (3, 91, 1, 52264),
       (4, 21, 6, 109112),
       (5, 67, 7, 44676),
       (6, 7, 1, 34177),
       (7, 39, 3, 96329),
       (8, 49, 4, 145499),
       (9, 82, 1, 137846),
       (10, 84, 6, 49223),
       (11, 5, 5, 71415),
       (12, 60, 2, 66474),
       (13, 78, 6, 64732),
       (14, 23, 6, 64162),
       (15, 9, 5, 17779),
       (16, 46, 5, 149602),
       (17, 23, 3, 65107),
       (18, 43, 1, 112290),
       (19, 49, 3, 39834),
       (20, 31, 1, 99686),
       (21, 41, 3, 58242),
       (22, 12, 7, 22432),
       (23, 83, 7, 113699),
       (24, 6, 3, 11217),
       (25, 86, 6, 31208),
       (26, 84, 5, 33603),
       (27, 44, 2, 29336),
       (28, 28, 1, 92805),
       (29, 92, 3, 28328),
       (30, 33, 1, 70314),
       (31, 87, 5, 17556),
       (32, 33, 3, 120415),
       (33, 38, 7, 116921),
       (34, 4, 7, 88745),
       (35, 29, 4, 118995),
       (36, 57, 7, 139819),
       (37, 42, 2, 147915),
       (38, 54, 3, 95440),
       (39, 56, 3, 120574),
       (40, 45, 7, 127700),
       (41, 12, 1, 89697),
       (42, 77, 2, 29678),
       (43, 29, 2, 38613),
       (44, 71, 1, 70283),
       (45, 59, 6, 148531),
       (46, 68, 1, 98614),
       (47, 2, 2, 95835),
       (48, 32, 2, 93963),
       (49, 50, 6, 54697),
       (50, 35, 6, 144924),
	   (51, 69, 6, 52586),
	   (52, 64, 1, 6105),
       (53, 65, 2, 8105),
       (54, 89, 7, 20350),
       (55, 23, 4, 10328),
       (56, 40, 6, 108375),
        (57, 69, 4, 71734),
   (58, 61, 7, 108991),
   (59, 22, 5, 92293),
   (60, 10, 5, 77299),
   (61, 49, 3, 77315),
   (62, 42, 7, 15475),
   (63, 40, 6, 80484),
   (64, 91, 5, 90774),
   (65, 49, 1, 126827),
   (66, 2, 4, 50617),
   (67, 66, 1, 142841),
   (68, 11, 4, 56522),
   (69, 1, 6, 23585),
   (70, 52, 5, 130926),
   (71, 32, 6, 88695),
   (72, 61, 4, 48476),
   (73, 18, 4, 109080),
   (74, 88, 2, 13838),
   (75, 16, 4, 122791),
   (76, 62, 4, 55451),
   (77, 44, 4, 31153),
   (78, 90, 6, 113659),
   (79, 61, 2, 71975),
   (80, 72, 4, 88308),
   (81, 23, 6, 99237),
   (82, 26, 2, 89608),
   (83, 63, 6, 36182),
   (84, 55, 5, 111307),
   (85, 56, 6, 49690),
   (86, 51, 1, 38703),
   (87, 13, 3, 141699),
   (88, 14, 4, 70558),
   (89, 39, 5, 55561),
   (90, 34, 2, 86222),
   (91, 61, 3, 112892),
   (92, 1, 1, 128863),
   (93, 46, 3, 27262),
   (94, 69, 6, 10586),
   (95, 18, 1, 18594),
   (96, 88, 1, 58243),
   (97, 75, 3, 124227),
   (98, 65, 3, 52588),
   (99, 85, 7, 112663),
   (100, 88, 5, 39335),
   (101, 86, 3, 87017),
   (102, 35, 3, 93253),
   (103, 53, 2, 62490),
   (104, 22, 7, 23405),
   (105, 54, 6, 28282),
   (106, 10, 3, 105102),
   (107, 12, 7, 12357),
   (108, 32, 2, 73171),
   (109, 61, 5, 81996),
   (110, 82, 6, 11075),
   (111, 50, 3, 63354),
   (112, 73, 1, 121607),
   (113, 27, 1, 12169),
   (114, 58, 6, 126759),
   (115, 43, 4, 147943),
   (116, 68, 1, 57784),
   (117, 90, 2, 149622),
   (118, 45, 1, 57882),
   (119, 35, 5, 102704),
   (120, 2, 6, 44293),
   (121, 10, 7, 120147),
   (122, 44, 3, 33744),
   (123, 2, 7, 83780),
   (124, 56, 3, 125496),
   (125, 53, 5, 74880),
   (126, 66, 6, 88079),
   (127, 53, 5, 141350),
   (128, 88, 5, 36083),
   (129, 17, 4, 107988),
   (130, 51, 7, 137459),
   (131, 51, 4, 115890),
   (132, 27, 5, 111446),
   (133, 19, 5, 137762),
   (134, 29, 6, 27842),
   (135, 31, 2, 113397),
   (136, 87, 4, 33128),
   (137, 19, 4, 18648),
   (138, 80, 7, 32044),
   (139, 30, 7, 131372),
   (140, 81, 6, 52350),
   (141, 77, 2, 50117),
   (142, 66, 5, 58901),
   (143, 33, 4, 89715),
   (144, 87, 3, 7884),
   (145, 84, 6, 101828),
   (146, 6, 3, 59133),
   (147, 90, 3, 147614),
   (148, 30, 6, 136786),
   (149, 24, 1, 64086),
   (150, 17, 7, 138811),
   (151, 25, 5, 128533),
   (152, 45, 5, 114254),
   (153, 8, 5, 88003),
   (154, 24, 3, 42393),
   (155, 23, 2, 54141),
   (156, 88, 4, 121489),
   (157, 14, 2, 57957),
   (158, 53, 5, 30815),
   (159, 13, 2, 90712),
   (160, 79, 1, 63201),
   (161, 39, 7, 118499),
   (162, 27, 2, 111816),
   (163, 15, 1, 122622),
   (164, 34, 4, 124866),
   (165, 61, 1, 118174),
   (166, 16, 5, 48324),
   (167, 9, 5, 119600),
   (168, 1, 1, 111084),
   (169, 8, 6, 77236),
   (170, 39, 6, 38660),
   (171, 31, 7, 121808),
   (172, 41, 2, 81535),
   (173, 79, 4, 126610),
   (174, 15, 1, 61153),
   (175, 39, 2, 146398),
   (176, 72, 4, 12889),
   (177, 17, 6, 8920),
   (178, 86, 6, 108700),
   (179, 53, 5, 49529),
   (180, 22, 3, 9560),
   (181, 66, 3, 11312),
   (182, 55, 4, 30346),
   (183, 75, 4, 76223),
   (184, 46, 4, 6411),
   (185, 18, 4, 114392),
   (186, 80, 3, 27707),
   (187, 27, 6, 79961),
   (188, 9, 7, 22447),
   (189, 85, 7, 133911);

--------------------------------

INSERT INTO acumulacion_puntos (id_acumpuntos, id_cliente, fecha, monto_total, puntos_acumulados)
VALUES 
(1,1, '2023-05-01', 100000.00, 669),
(2,2, '2023-05-02', 150000, 680),
(3,3, '2023-05-03', 200000, 700),
(4,4, '2023-05-04', 80000, 150),
(5,5, '2023-05-05', 25000, 42),
(6,6, '2023-05-06', 90000, 400),
(7,7, '2023-05-07', 120000, 250),
(8,8, '2023-05-08', 15000, 100),
(9,9, '2023-05-09', 145000, 690),
(10,10, '2023-05-12', 1500000, 1000),
(11,11, '2023-05-15', 2500000, 2000),
(12,12, '2023-05-20', 35000, 350),
(13,13, '2023-05-21', 8900, 80),
(14,14, '2023-05-22', 360000, 760),
(15,15, '2023-05-24', 45000, 290);

-- vistas -- 

CREATE VIEW cantidad_producto_vendidos AS
    SELECT  `detalle_de_venta`.`Id_producto` AS `id_producto`,
        SUM(`detalle_de_venta`.`cant_producto`) AS `cantidad_vendida`
    FROM
        `detalle_de_venta`
    GROUP BY `detalle_de_venta`.`Id_producto`;
 ---------------------------------------------------------
CREATE VIEW clientes_frecuentes AS
    SELECT 
        `venta`.`Id_cliente` AS `id_cliente`,
        COUNT(0) AS `cantidad_compras`,
        SUM(`venta`.`monto_total`) AS `monto_total_gastado`
    FROM
        `venta`
    GROUP BY `venta`.`Id_cliente`
    HAVING (COUNT(0) > 1);
    

        
----------------------------------------------------------------------

CREATE VIEW venta_mensual AS
    SELECT 
        MONTH(`venta`.`fecha`) AS `mes`,
        SUM(`venta`.`monto_total`) AS `total_ventas`
    FROM
        `venta`
    GROUP BY `mes`
    ORDER BY `mes`;
-------------------------------------------------------------------

CREATE VIEW venta_mensual_cajero AS
    SELECT 
        `venta`.`Id_cajero` AS `id_cajero`,
        MONTH(`venta`.`fecha`) AS `mes`,
        SUM(`venta`.`monto_total`) AS `total_venta`
    FROM venta
    GROUP BY `venta`.`Id_cajero` , MONTH(`venta`.`fecha`)
    ORDER BY `venta`.`Id_cajero`;
-----------------------------------------------------------------
-- funciones

DELIMITER $$
CREATE FUNCTION total_ventas_cajero(id_cajero INT, mes INT) RETURNS FLOAT
DETERMINISTIC
BEGIN
  DECLARE total FLOAT;
  SET total = 0;
  
  SELECT SUM(dv.valor_total_producto)
  INTO total
  FROM venta v
  INNER JOIN detalle_de_venta dv ON v.id_venta = dv.id_venta
  WHERE v.id_cajero = id_cajero AND MONTH(v.fecha) = mes;
  
  RETURN total;
END$$
DELIMITER ;

DELIMITER $$
CREATE FUNCTION unidades_vendidas_producto(id_producto INT) RETURNS VARCHAR(255) DETERMINISTIC
BEGIN
  DECLARE descripcion_producto VARCHAR(255);
  DECLARE unidades_vendidas INT;
  
  SELECT p.descripcion, dv.unidades_vendidas
  INTO descripcion_producto, unidades_vendidas
  FROM producto p
  INNER JOIN (
    SELECT id_producto, SUM(cant_producto) AS unidades_vendidas
    FROM detalle_de_venta
    GROUP BY id_producto
  ) dv ON p.id_producto = dv.id_producto
  WHERE p.id_producto = id_producto;
  
  IF descripcion_producto IS NULL THEN
    SET descripcion_producto = 'No existe un producto con el id especificado.';
  END IF;
  
  RETURN CONCAT('Descripción: ', descripcion_producto, ', unidades vendidas: ', unidades_vendidas);
END$$
DELIMITER ;

--sp-----------------------------------------------------------------------------------------------

DELIMITER //

CREATE PROCEDURE agregar_nuevo_cliente(
    IN nombre VARCHAR(30),
    IN apellido VARCHAR(30),
    IN rut VARCHAR(10),
    IN telefono VARCHAR(10)
)
BEGIN
    DECLARE last_id INT;
    
    SELECT MAX(id_cliente) INTO last_id FROM cliente;
    
    IF last_id < 50 THEN
        SET last_id = 50;
    END IF;
    
    INSERT INTO cliente(id_cliente, nombre, apellido, rut, telefono)
    VALUES(last_id + 1, nombre, apellido, rut, telefono);
END//

DELIMITER ;
-----------------------------------------------------------------------

DELIMITER $$
CREATE PROCEDURE buscar_ventas_por_cliente(IN cliente_id INT)
BEGIN
    SELECT v.id_venta, v.fecha, v.monto_total
    FROM venta v
    WHERE v.id_cliente = cliente_id
    ORDER BY YEAR(v.fecha), MONTH(v.fecha);
END $$
DELIMITER ;


CREATE VIEW cumplimiento_metas AS
    SELECT 
        `venta_mensual_cajero`.`id_cajero` AS `id_cajero`,
        `venta_mensual_cajero`.`mes` AS `mes`,
        (CASE
            WHEN (`venta_mensual_cajero`.`total_venta` >= 500000) THEN 'Cumplió'
            ELSE 'No cumplió'
        END) AS cumplimiento,
        CONCAT(ROUND(((caja_hc.venta_mensual_cajero.total_venta / 500000) * 100), 0), '%') AS porcentaje_cumplimiento
    FROM
        caja_hc.venta_mensual_cajero;

DELIMITER //

CREATE TRIGGER acumular_puntos
AFTER INSERT ON venta
FOR EACH ROW
BEGIN
    DECLARE puntos INT;
    SET puntos = FLOOR(NEW.monto_total / 150);
    INSERT INTO acumulacion_puntos (id_acumpuntos, id_cliente, fecha, monto_total, puntos_acumulados)
    VALUES (NEW.id_cliente, NOW(), NEW.monto_total, puntos);
END //

DELIMITER ;

DELIMITER //
CREATE TRIGGER validar_campos_obligatorios
BEFORE INSERT ON cliente
FOR EACH ROW
BEGIN
  IF NEW.nombre = '' OR NEW.apellido = '' OR NEW.rut = '' OR NEW.telefono = '' THEN
    SIGNAL SQLSTATE '45000' 
      SET MESSAGE_TEXT = 'Error: no se pueden dejar campos obligatorios vacíos';
  END IF;
END//





