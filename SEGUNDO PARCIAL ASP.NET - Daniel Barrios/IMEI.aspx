<%@ Page Title="Instalación y Mantenimiento de Equipos Informáticos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IMEI.aspx.cs" Inherits="SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios.IMEI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row mb-4">
        <div class="col-12">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Default.aspx">Inicio</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Instalación y Mantenimiento de Equipos Informáticos (IMEI.ASPX)</li>
                </ol>
            </nav>
            <div class="p-4 p-md-5 mb-4 rounded text-white bg-success bg-gradient shadow-sm">
                <div class="col-md-9 px-0">
                    <h1 class="display-5 fw-bold"><i class="bi bi-laptop me-2"></i>Instalación y Mantenimiento de Equipos Informáticos (IMEI)</h1>
                    <p class="lead my-3">Soporte técnico profesional, ensamble de computadores, reparación de impresoras, configuración de discos duros y servidores en Parque Central - Barranquilla.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <div class="col-lg-8">
            <h3 class="fw-bold text-dark border-bottom pb-2">Servicios Técnicos Especializados</h3>
            <p class="text-muted">
                Brindamos soporte preventivo y correctivo para mantener la infraestructura tecnológica de su empresa funcionando al máximo rendimiento. Contamos con técnicos de planta en nuestra sede de Parque Central.
            </p>

            <div class="row g-3 my-2">
                <div class="col-md-6">
                    <div class="card h-100 border-0 shadow-sm bg-light">
                        <div class="card-body">
                            <h5 class="fw-bold text-success"><i class="bi bi-pc-display me-2"></i>Mantenimiento de Ordenadores</h5>
                            <p class="small text-muted mb-0">Limpieza profunda de componentes, cambio de pasta térmica, optimización de sistema operativo, eliminación de virus y actualización de hardware (memorias RAM y discos SSD).</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card h-100 border-0 shadow-sm bg-light">
                        <div class="card-body">
                            <h5 class="fw-bold text-success"><i class="bi bi-printer-fill me-2"></i>Servicio Técnico de Impresoras</h5>
                            <p class="small text-muted mb-0">Mantenimiento de sistemas continuos de tinta, recargas, cambio de cabezales y rodillos de arrastre en marcas líderes como Epson, Canon y HP.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card h-100 border-0 shadow-sm bg-light">
                        <div class="card-body">
                            <h5 class="fw-bold text-success"><i class="bi bi-hdd-network me-2"></i>Discos Duros y Recuperación</h5>
                            <p class="small text-muted mb-0">Instalación de unidades de almacenamiento de alta gama para servidores y sistemas de CCTV, configuración de arreglos RAID y respaldo en la nube.</p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="card h-100 border-0 shadow-sm bg-light">
                        <div class="card-body">
                            <h5 class="fw-bold text-success"><i class="bi bi-diagram-3-fill me-2"></i>Redes y Cableado Estructurado</h5>
                            <p class="small text-muted mb-0">Cableado categoría 6A/7 para interconectar ordenadores y cámaras de seguridad con switches Gigabit y puntos de acceso Wi-Fi empresariales.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card border-success mt-4">
                <div class="card-header bg-success text-white fw-bold">
                    Planes de Póliza de Mantenimiento para Empresas
                </div>
                <div class="card-body">
                    <p class="card-text text-muted">Asegure la operación continua de sus ordenadores y centros de grabación mediante visitas programadas mensuales y respuesta prioritaria ante emergencias.</p>
                    <ul class="small text-muted">
                        <li>Visitas mensuales de mantenimiento preventivo.</li>
                        <li>Soporte remoto ilimitado de lunes a sábado.</li>
                        <li>Equipos de respaldo en caso de fallas críticas.</li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-dark text-white fw-bold">
                    <i class="bi bi-wrench me-2"></i>Agendar Servicio Técnico
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Tipo de Equipo:</label>
                        <asp:DropDownList ID="ddlTipoEquipo" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Ordenador / PC de Escritorio" Value="PC" />
                            <asp:ListItem Text="Portátil / Laptop" Value="Laptop" />
                            <asp:ListItem Text="Impresora / Multifuncional" Value="Impresora" />
                            <asp:ListItem Text="Servidor o Unidad de Almacenamiento" Value="Servidor" />
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Tipo de Mantenimiento:</label>
                        <asp:DropDownList ID="ddlMantenimiento" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Preventivo (Limpieza y Ajustes)" Value="Preventivo" />
                            <asp:ListItem Text="Correctivo (Reparación de Falla)" Value="Correctivo" />
                            <asp:ListItem Text="Instalación y Configuración Nueva" Value="Instalacion" />
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Detalle de la Falla / Requerimiento:</label>
                        <asp:TextBox ID="txtDetalle" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" placeholder="Describe brevemente el problema..." />
                    </div>
                    <asp:Button ID="btnAgendar" runat="server" Text="Agendar Turno" CssClass="btn btn-success w-100 fw-bold" OnClick="btnAgendar_Click" />
                    <asp:Label ID="lblImeiMensaje" runat="server" CssClass="mt-2 d-block small text-center text-success fw-bold" />
                </div>
            </div>

            <div class="alert alert-secondary border-0 shadow-sm mt-4">
                <h6 class="fw-bold mb-1"><i class="bi bi-geo-alt-fill text-danger me-1"></i>Taller en Parque Central</h6>
                <p class="small mb-0 text-muted">Puede traer sus ordenadores o impresoras a nuestro laboratorio técnico en Barranquilla o solicitar recogida a domicilio.</p>
            </div>
        </div>
    </div>
</asp:Content>
