<%@ Page Title="Panel de Administración" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h2 class="fw-bold mb-0"><i class="bi bi-speedometer2 text-warning me-2"></i>Panel de Administración</h2>
            <small class="text-muted">Control centralizado del sistema TecnoVigilancia Parque Central</small>
        </div>
        <span class="badge bg-danger fs-6 px-3 py-2">Rol: Administrador</span>
    </div>

    <!-- Tarjetas de Estadísticas / Resumen -->
    <div class="row g-4 mb-5">
        <div class="col-md-3">
            <div class="card border-0 shadow-sm bg-primary text-white p-3">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <small class="text-uppercase fw-semibold opacity-75">Empleados</small>
                        <h2 class="fw-bold mb-0"><asp:Label ID="lblTotalEmpleados" runat="server" Text="0" /></h2>
                    </div>
                    <i class="bi bi-person-badge display-5 opacity-50"></i>
                </div>
                <a href="AdminEmpleados.aspx" class="text-white text-decoration-none small mt-3 d-block">Gestionar Empleados &raquo;</a>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card border-0 shadow-sm bg-success text-white p-3">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <small class="text-uppercase fw-semibold opacity-75">Clientes Registrados</small>
                        <h2 class="fw-bold mb-0"><asp:Label ID="lblTotalClientes" runat="server" Text="0" /></h2>
                    </div>
                    <i class="bi bi-people display-5 opacity-50"></i>
                </div>
                <a href="AdminClientes.aspx" class="text-white text-decoration-none small mt-3 d-block">Gestionar Clientes &raquo;</a>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card border-0 shadow-sm bg-info text-white p-3">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <small class="text-uppercase fw-semibold opacity-75">Productos Catálogo</small>
                        <h2 class="fw-bold mb-0"><asp:Label ID="lblTotalProductos" runat="server" Text="0" /></h2>
                    </div>
                    <i class="bi bi-box-seam display-5 opacity-50"></i>
                </div>
                <a href="AdminProductos.aspx" class="text-white text-decoration-none small mt-3 d-block">Gestionar Catálogo &raquo;</a>
            </div>
        </div>

        <div class="col-md-3">
            <div class="card border-0 shadow-sm bg-warning text-dark p-3">
                <div class="d-flex justify-content-between align-items-center">
                    <div>
                        <small class="text-uppercase fw-semibold opacity-75">Pedidos Totales</small>
                        <h2 class="fw-bold mb-0"><asp:Label ID="lblTotalPedidos" runat="server" Text="0" /></h2>
                    </div>
                    <i class="bi bi-receipt display-5 opacity-50"></i>
                </div>
                <a href="AdminPedidos.aspx" class="text-dark fw-bold text-decoration-none small mt-3 d-block">Gestionar Pedidos &raquo;</a>
            </div>
        </div>
    </div>

    <!-- Accesos Rápidos a Módulos CRUD -->
    <h4 class="fw-bold mb-3"><i class="bi bi-ui-checks-grid me-2"></i>Módulos de Mantenimiento CRUD</h4>
    <div class="row g-4">
        <div class="col-md-6 col-lg-3">
            <div class="card h-100 border-0 shadow-sm card-custom text-center p-3">
                <div class="card-body">
                    <i class="bi bi-person-vcard text-primary display-4 mb-3 d-block"></i>
                    <h5 class="fw-bold">CRUD Empleados</h5>
                    <p class="small text-muted">Registrar, actualizar, listar y retirar personal técnico y comercial.</p>
                    <a href="AdminEmpleados.aspx" class="btn btn-outline-primary btn-sm w-100 fw-bold">Abrir Módulo</a>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-3">
            <div class="card h-100 border-0 shadow-sm card-custom text-center p-3">
                <div class="card-body">
                    <i class="bi bi-people-fill text-success display-4 mb-3 d-block"></i>
                    <h5 class="fw-bold">CRUD Clientes</h5>
                    <p class="small text-muted">Control de clientes de Barranquilla, actualización de direcciones y contactos.</p>
                    <a href="AdminClientes.aspx" class="btn btn-outline-success btn-sm w-100 fw-bold">Abrir Módulo</a>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-3">
            <div class="card h-100 border-0 shadow-sm card-custom text-center p-3">
                <div class="card-body">
                    <i class="bi bi-camera-video text-info display-4 mb-3 d-block"></i>
                    <h5 class="fw-bold">CRUD Productos</h5>
                    <p class="small text-muted">Añadir cámaras fijas, giratorias, kits DVR, ordenadores y actualizar stock/precios.</p>
                    <a href="AdminProductos.aspx" class="btn btn-outline-info btn-sm w-100 fw-bold">Abrir Módulo</a>
                </div>
            </div>
        </div>

        <div class="col-md-6 col-lg-3">
            <div class="card h-100 border-0 shadow-sm card-custom text-center p-3">
                <div class="card-body">
                    <i class="bi bi-file-earmark-spreadsheet text-warning display-4 mb-3 d-block"></i>
                    <h5 class="fw-bold">Pedidos & Facturación</h5>
                    <p class="small text-muted">Revisar pedidos entrantes, cambiar estados, consultar detalle y generar facturas.</p>
                    <a href="AdminPedidos.aspx" class="btn btn-outline-warning text-dark btn-sm w-100 fw-bold">Abrir Módulo</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
