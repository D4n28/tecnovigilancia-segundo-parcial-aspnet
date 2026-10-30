-- ====================================================================
-- Script de Base de Datos para el Parcial ASP.NET WebForms
-- Empresa: TecnoVigilancia Parque Central - Barranquilla
-- ====================================================================

IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = 'TecnoVigilanciaDB')
BEGIN
    CREATE DATABASE TecnoVigilanciaDB;
END
GO

USE TecnoVigilanciaDB;
GO

IF OBJECT_ID('DetallePedidos', 'U') IS NOT NULL DROP TABLE DetallePedidos;
IF OBJECT_ID('Pedidos', 'U') IS NOT NULL DROP TABLE Pedidos;
IF OBJECT_ID('Clientes', 'U') IS NOT NULL DROP TABLE Clientes;
IF OBJECT_ID('Empleados', 'U') IS NOT NULL DROP TABLE Empleados;
IF OBJECT_ID('Productos', 'U') IS NOT NULL DROP TABLE Productos;
IF OBJECT_ID('Usuarios', 'U') IS NOT NULL DROP TABLE Usuarios;
GO

CREATE TABLE Usuarios (
    IdUsuario INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(100) NOT NULL,
    Correo NVARCHAR(100) UNIQUE NOT NULL,
    Clave NVARCHAR(100) NOT NULL,
    Rol NVARCHAR(20) NOT NULL DEFAULT 'Cliente'
);
GO

CREATE TABLE Clientes (
    IdCliente INT IDENTITY(1,1) PRIMARY KEY,
    IdUsuario INT NULL FOREIGN KEY REFERENCES Usuarios(IdUsuario) ON DELETE SET NULL,
    Cedula NVARCHAR(20) UNIQUE NOT NULL,
    Nombres NVARCHAR(100) NOT NULL,
    Apellidos NVARCHAR(100) NOT NULL,
    Telefono NVARCHAR(20) NULL,
    Direccion NVARCHAR(200) NULL,
    Ciudad NVARCHAR(50) DEFAULT 'Barranquilla'
);
GO

CREATE TABLE Empleados (
    IdEmpleado INT IDENTITY(1,1) PRIMARY KEY,
    Cedula NVARCHAR(20) UNIQUE NOT NULL,
    Nombres NVARCHAR(100) NOT NULL,
    Apellidos NVARCHAR(100) NOT NULL,
    Cargo NVARCHAR(100) NOT NULL,
    Telefono NVARCHAR(20) NULL,
    Correo NVARCHAR(100) NULL
);
GO

CREATE TABLE Productos (
    IdProducto INT IDENTITY(1,1) PRIMARY KEY,
    Nombre NVARCHAR(150) NOT NULL,
    Categoria NVARCHAR(50) NOT NULL,
    Tipo NVARCHAR(100) NOT NULL,
    Descripcion NVARCHAR(500) NULL,
    Precio DECIMAL(18,2) NOT NULL,
    Stock INT NOT NULL DEFAULT 10,
    ImagenUrl NVARCHAR(250) NULL
);
GO

CREATE TABLE Pedidos (
    IdPedido INT IDENTITY(1001,1) PRIMARY KEY,
    IdCliente INT NOT NULL FOREIGN KEY REFERENCES Clientes(IdCliente) ON DELETE CASCADE,
    Fecha DATETIME DEFAULT GETDATE(),
    Total DECIMAL(18,2) NOT NULL DEFAULT 0,
    Estado NVARCHAR(30) NOT NULL DEFAULT 'Pendiente',
    MetodoPago NVARCHAR(50) NULL
);
GO

CREATE TABLE DetallePedidos (
    IdDetalle INT IDENTITY(1,1) PRIMARY KEY,
    IdPedido INT NOT NULL FOREIGN KEY REFERENCES Pedidos(IdPedido) ON DELETE CASCADE,
    IdProducto INT NOT NULL FOREIGN KEY REFERENCES Productos(IdProducto),
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(18,2) NOT NULL,
    Subtotal AS (Cantidad * PrecioUnitario)
);
GO

INSERT INTO Usuarios (Nombre, Correo, Clave, Rol) VALUES 
('Administrador Parque Central', 'admin@tecnovigilancia.com', 'admin123', 'Admin'),
('Daniel Barrios', 'daniel@correo.com', '123456', 'Cliente'),
('Carlos Mendoza', 'carlos@correo.com', '123456', 'Cliente');

INSERT INTO Clientes (IdUsuario, Cedula, Nombres, Apellidos, Telefono, Direccion, Ciudad) VALUES
(2, '1042456789', 'Daniel', 'Barrios', '3001234567', 'Cra 44 # 50-20 Parque Central', 'Barranquilla'),
(3, '1143876543', 'Carlos', 'Mendoza', '3159876543', 'Calle 72 # 43-15', 'Barranquilla');

INSERT INTO Empleados (Cedula, Nombres, Apellidos, Cargo, Telefono, Correo) VALUES
('72154890', 'Andrés', 'Gómez', 'Técnico Especialista en CCTV y Vigilancia', '3015551234', 'andres.g@tecnovigilancia.com'),
('10459871', 'Laura', 'Vargas', 'Ingeniera de Soporte e Infraestructura', '3104445678', 'laura.v@tecnovigilancia.com'),
('8541236', 'Roberto', 'Mejía', 'Instalador de Sistemas de Alarmas', '3203339876', 'roberto.m@tecnovigilancia.com');

INSERT INTO Productos (Nombre, Categoria, Tipo, Descripcion, Precio, Stock, ImagenUrl) VALUES
('Cámara Domo Fija Full HD 1080p', 'Vigilancia', 'Cámara Fija', 'Cámara fija de alta resolución con visión nocturna infrarroja, lente gran angular de 2.8mm y carcasa antivandálica.', 185000.00, 25, 'https://images.unsplash.com/photo-1557597774-9d273605dfa9?w=500&auto=format&fit=crop&q=60'),
('Cámara PTZ Giratoria 360° Zoom Óptico 25x', 'Vigilancia', 'Cámara Giratoria', 'Cámara robótica giratoria motorizada con zoom óptico 25x, seguimiento inteligente y alcance infrarrojo de 100m.', 780000.00, 12, 'https://images.unsplash.com/photo-1582139329536-e7284fece509?w=500&auto=format&fit=crop&q=60'),
('Cámara Digital IP 4K con Intensificador de Luz', 'Vigilancia', 'Digital / Luz Ultra', 'Tecnología Starlight con intensificador de luz en color para ultra baja iluminación nocturna y transmisión en vivo por red IP.', 420000.00, 15, 'Images/camara_ip.png'),
('Cámara Bullet Analógica HDCVI 5MP', 'Vigilancia', 'Cámara Analógica', 'Cámara analógica para exteriores con protección IP67 contra lluvia, sensor CMOS de 5 Megapíxeles y filtro IR-cut.', 160000.00, 30, 'Images/camara_bullet.png'),
('Kit DVR 8 Canales + Disco Duro 2TB Vigilancia', 'Vigilancia', 'Grabador DVR/NVR', 'Permite monitoreo remoto de hasta 64 cámaras desde ordenador o móvil en tiempo real con compresión H.265+.', 690000.00, 8, 'Images/kit_dvr.png');

INSERT INTO Productos (Nombre, Categoria, Tipo, Descripcion, Precio, Stock, ImagenUrl) VALUES
('Ordenador de Escritorio Core i5 16GB SSD 512GB', 'Tecnología', 'Ordenador', 'Computador de alto rendimiento para centros de monitoreo y estaciones de trabajo de oficina.', 2350000.00, 10, 'https://images.unsplash.com/photo-1587831990711-23ca6441447b?w=500&auto=format&fit=crop&q=60'),
('Impresora Multifuncional Epson EcoTank L3250', 'Tecnología', 'Impresora', 'Sistema de tanque de tinta continuo, conectividad Wi-Fi Direct y alta velocidad de impresión.', 890000.00, 14, 'https://images.unsplash.com/photo-1612815154858-60aa4c59eaa6?w=500&auto=format&fit=crop&q=60'),
('Disco Duro Seagate SkyHawk 4TB Especial Vigilancia', 'Tecnología', 'Disco Duro', 'Optimizado para sistemas CCTV que operan 24/7, soporte hasta 64 cámaras HD simultáneas.', 450000.00, 20, 'https://images.unsplash.com/photo-1531492746076-161ca9bcad58?w=500&auto=format&fit=crop&q=60'),
('Monitor Profesional 27" Full HD IPS 75Hz', 'Tecnología', 'Monitor', 'Pantalla ultrafina con filtro de luz azul especial para visualización prolongada de cámaras de seguridad.', 620000.00, 18, 'Images/monitor_profesional.png');

INSERT INTO Pedidos (IdCliente, Fecha, Total, Estado, MetodoPago) VALUES
(1, DATEADD(DAY, -2, GETDATE()), 965000.00, 'Pagado', 'Transferencia Bancaria');

INSERT INTO DetallePedidos (IdPedido, IdProducto, Cantidad, PrecioUnitario) VALUES
(1001, 1, 1, 185000.00),
(1001, 2, 1, 780000.00);
GO
