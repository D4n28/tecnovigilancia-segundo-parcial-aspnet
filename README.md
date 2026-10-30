# TecnoVigilancia - Sistema Web CRUD (ASP.NET WebForms)

**Examen Parcial Nº 2 - Electiva ASP.NET**  
**Facultad de Ingeniería - Programa de Ingeniería de Sistemas**  
**Universidad Autónoma del Caribe**  
**Estudiante:** Daniel Barrios  
**Ubicación de la Empresa:** Parque Central, Barranquilla - Atlántico  

---

## 📌 Descripción del Proyecto
Aplicación Web desarrollada en **ASP.NET WebForms (.NET Framework 4.7.2)** con persistencia en **Microsoft SQL Server / LocalDB** y diseño responsivo mediante **Bootstrap 5**. El sistema gestiona la venta e instalación de productos tecnológicos (ordenadores, impresoras, discos duros) y sistemas de seguridad electrónica y vigilancia (cámaras fijas, domos motorizados 360°, intensificadores de luz, kits DVR).

---

## 🚀 Zonas y Módulos Implementados

### 1. Zona de Visitantes (Pública)
- **Inicio (`Default.aspx`)**: Portal corporativo de la sede Parque Central - Barranquilla.
- **Catálogo (`Catalogo.aspx`)**: Listado con filtros por categorías, búsqueda de productos y verificación de inventario.
- **Páginas de Servicios Solicitadas en la Guía:**
  - `ALARMAS.aspx`: Instalación y configuración de alarmas con cotizador de zonas.
  - `SVC.aspx`: Sistemas de Vigilancia y Control (cámaras fijas, giratorias con zoom óptico, intensificador de luz y monitoreo de hasta 64 cámaras en vivo).
  - `IMEI.aspx`: Instalación y mantenimiento de equipos informáticos (ordenadores, impresoras y servidores).

### 2. Zona de Clientes Registrados
- **Registro (`Registro.aspx`)** y **Login (`Login.aspx`)**: Control de acceso con derivación automática por rol.
- **Hacer Pedido (`CrearPedido.aspx`)**: Carrito de compras con cálculo de subtotales, método de pago y descuento de stock.
- **Mis Pedidos (`MisPedidos.aspx`)**: Historial de órdenes con opción de pago directo.
- **Facturación (`Factura.aspx`)**: Factura de venta electrónica con datos fiscales, detalle de productos, IVA del 19% y vista para imprimir.

### 3. Zona de Administración (CRUDs)
- **Dashboard (`AdminDashboard.aspx`)**: Panel con estadísticas en tiempo real.
- **CRUD Empleados (`AdminEmpleados.aspx`)**: Crear, Leer, Actualizar y Eliminar personal técnico.
- **CRUD Clientes (`AdminClientes.aspx`)**: Administración de clientes de Barranquilla.
- **CRUD Productos (`AdminProductos.aspx`)**: Gestión de inventario de equipos tecnológicos y vigilancia.
- **Gestión de Pedidos (`AdminPedidos.aspx`)**: Supervisión general de compras y cambio de estados.

---

## 🔑 Credenciales de Prueba

| Perfil / Rol | Correo Electrónico | Contraseña |
| :--- | :--- | :--- |
| **Administrador** | `admin@tecnovigilancia.com` | `admin123` |
| **Cliente Registrado** | `daniel@correo.com` | `123456` |

---

## 🛠️ Instalación y Ejecución Local
1. Clonar el repositorio:
   ```bash
   git clone https://github.com/D4n28/tecnovigilancia-segundo_parcial_ASP.Net.git
   ```
2. Ejecutar el script `Database.sql` en SQL Server Management Studio o mediante LocalDB:
   ```bash
   sqlcmd -S "(localdb)\MSSQLLocalDB" -i "SEGUNDO PARCIAL ASP.NET - Daniel Barrios\Database.sql"
   ```
3. Abrir la solución `.slnx` en **Visual Studio 2022 Community** y presionar `Ctrl + F5` para iniciar en Localhost / IIS Express.
