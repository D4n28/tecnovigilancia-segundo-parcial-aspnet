<%@ Page Title="Instalación de Sistemas de Vigilancia y Control" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SVC.aspx.cs" Inherits="SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios.SVC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row mb-4">
        <div class="col-12">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Default.aspx">Inicio</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Sistemas de Vigilancia y Control (SVC.ASPX)</li>
                </ol>
            </nav>
            <div class="p-4 p-md-5 mb-4 rounded text-white bg-primary bg-gradient shadow-sm">
                <div class="col-md-9 px-0">
                    <h1 class="display-5 fw-bold"><i class="bi bi-cctv me-2"></i>Instalación de Sistemas de Vigilancia y Control (SVC)</h1>
                    <p class="lead my-3">Cámaras fijas, robóticas giratorias 360°, digitales, analógicas, con zoom óptico e intensificador de luz nocturna en tiempo real.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Puntos requeridos en el documento -->
    <div class="row g-4 mb-5">
        <div class="col-lg-8">
            <h3 class="fw-bold text-dark border-bottom pb-2">Capacidades de Vigilancia Avanzada</h3>
            <p class="text-muted">
                Con la ayuda de nuestros productos se puede grabar imágenes de vídeo de alta resolución en tiempo real, vigilar cualquier sitio a distancia vía internet desde un ordenador o un teléfono móvil, y visualizar hasta <strong>64 cámaras desde diferentes sitios en un sólo ordenador</strong>.
            </p>

            <div class="row g-3 my-2">
                <div class="col-md-6">
                    <div class="card h-100 border-0 shadow-sm bg-light">
                        <div class="card-body">
                            <h5 class="fw-bold text-primary"><i class="bi bi-camera-fill me-2"></i>Cámaras Fijas Antivandálicas</h5>
                            <p class="small text-muted">Óptimas para pasillos, cajas registradoras y accesos vehiculares. Lentes fijas con resolución 1080p y 4K con tecnología WDR para contraluces.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card h-100 border-0 shadow-sm bg-light">
                        <div class="card-body">
                            <h5 class="fw-bold text-primary"><i class="bi bi-arrow-repeat me-2"></i>Cámaras Giratorias PTZ (360°)</h5>
                            <p class="small text-muted">Capacidad de rotación continua sin fin, paneo vertical e inclinación automatizada con patrullas programables y autotracking.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card h-100 border-0 shadow-sm bg-light">
                        <div class="card-body">
                            <h5 class="fw-bold text-primary"><i class="bi bi-zoom-in me-2"></i>Zoom Óptico Motorizado</h5>
                            <p class="small text-muted">Enfoque y acercamiento nítido de hasta 25x o 40x sin pérdida de calidad para reconocimiento de placas y rostros a larga distancia.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card h-100 border-0 shadow-sm bg-light">
                        <div class="card-body">
                            <h5 class="fw-bold text-primary"><i class="bi bi-moon-stars-fill me-2"></i>Intensificador de Luz (Full Color)</h5>
                            <p class="small text-muted">Sensores de ultra sensibilidad lumínica que permiten capturar imágenes a todo color en completa oscuridad sin depender de luces blancas visibles.</p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="p-4 bg-white rounded border shadow-sm mt-4">
                <h4 class="fw-bold text-dark"><i class="bi bi-display me-2 text-info"></i>Centralización Multi-Sitio (Hasta 64 Cámaras)</h4>
                <p class="text-muted small mb-3">
                    Implementamos plataformas CMS/VMS que consolidan sucursales bancarias, bodegas en vía 40, locales comerciales en Parque Central y oficinas en un único centro de monitoreo.
                </p>
                <div class="progress mb-2" style="height: 25px;">
                    <div class="progress-bar bg-success progress-bar-striped progress-bar-animated" role="progressbar" style="width: 100%;">Disponibilidad 99.9% de Streaming en Vivo</div>
                </div>
            </div>
        </div>

        <div class="col-lg-4">
            <div class="card shadow-sm border-0 mb-4">
                <div class="card-header bg-dark text-white fw-bold">
                    <i class="bi bi-question-circle me-2"></i>Configurador Rápido SVC
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Tecnología Requerida:</label>
                        <asp:DropDownList ID="ddlTecnologia" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Cámaras IP Digitales (Alta Definición)" Value="IP" />
                            <asp:ListItem Text="Cámaras Analógicas HDCVI/TVI (Económico)" Value="Analogico" />
                            <asp:ListItem Text="Híbrido (Analógico + IP)" Value="Hibrido" />
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Tipo de Cámaras:</label>
                        <asp:DropDownList ID="ddlTipoCamaras" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Fijas con Visión Nocturna" Value="Fijas" />
                            <asp:ListItem Text="Giratorias PTZ 360° con Zoom" Value="PTZ" />
                            <asp:ListItem Text="Con Intensificador de Luz Nocturna" Value="ColorVu" />
                            <asp:ListItem Text="Mixtas (Fijas + PTZ)" Value="Mixtas" />
                        </asp:DropDownList>
                    </div>
                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Cantidad de Cámaras:</label>
                        <asp:TextBox ID="txtCantCamaras" runat="server" CssClass="form-control" Text="4" TextMode="Number" />
                    </div>
                    <asp:Button ID="btnCalcular" runat="server" Text="Solicitar Demostración" CssClass="btn btn-primary w-100 fw-bold" OnClick="btnCalcular_Click" />
                    <asp:Label ID="lblSvcMensaje" runat="server" CssClass="mt-2 d-block small text-center text-success fw-bold" />
                </div>
            </div>

            <div class="card border-0 bg-light p-3 shadow-sm">
                <h6 class="fw-bold"><i class="bi bi-cart-check-fill text-primary me-2"></i>¿Desea comprar cámaras directamente?</h6>
                <p class="small text-muted mb-2">Visite nuestro catálogo y añada cámaras domo, PTZ o kits DVR a su pedido online.</p>
                <a href="Catalogo.aspx" class="btn btn-outline-primary btn-sm fw-bold">Ir al Catálogo de Productos &raquo;</a>
            </div>
        </div>
    </div>
</asp:Content>
