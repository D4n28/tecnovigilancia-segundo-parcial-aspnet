<%@ Page Title="Inicio - TecnoVigilancia" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Hero Banner -->
    <div class="hero-banner shadow-sm p-4 p-md-5 mb-4 text-white rounded">
        <div class="row align-items-center">
            <div class="col-lg-8">
                <span class="badge bg-warning text-dark px-3 py-2 text-uppercase fw-semibold mb-2">Parque Central - Barranquilla</span>
                <h1 class="display-5 fw-bold">Tecnología de Vanguardia y Seguridad Electrónica</h1>
                <p class="lead my-3 text-light">Soluciones integrales en venta, instalación y soporte técnico de circuitos cerrados de televisión (CCTV), alarmas inteligentes, ordenadores, impresoras y almacenamiento para empresas y hogares.</p>
                <div class="d-flex gap-2 flex-wrap mt-4">
                    <a href="Catalogo.aspx" class="btn btn-warning btn-lg fw-bold px-4 text-dark"><i class="bi bi-cart3 me-2"></i>Ver Productos</a>
                    <a href="SVC.aspx" class="btn btn-outline-light btn-lg px-4"><i class="bi bi-shield-lock me-2"></i>Sistemas de Vigilancia</a>
                </div>
            </div>
            <div class="col-lg-4 text-center d-none d-lg-block">
                <i class="bi bi-shield-shaded display-1 text-warning opacity-75"></i>
            </div>
        </div>
    </div>

    <!-- Servicios Destacados Según Requerimientos del Parcial -->
    <div class="mb-5">
        <div class="text-center mb-4">
            <h2 class="fw-bold">Nuestras Líneas de Servicio Especializadas</h2>
            <p class="text-muted">Desarrolladas para brindar protección 24/7 y continuidad tecnológica a su negocio.</p>
        </div>

        <div class="row g-4">
            <!-- Servicio 1: ALARMAS.ASPX -->
            <div class="col-md-4">
                <div class="card h-100 card-custom shadow-sm border-0">
                    <div class="card-body d-flex flex-column p-4">
                        <div class="feature-icon text-danger mb-3">
                            <i class="bi bi-bell-fill fs-1"></i>
                        </div>
                        <h4 class="card-title fw-bold">Sistemas de Alarmas</h4>
                        <p class="card-text text-muted flex-grow-1">
                            Instalación de sensores de movimiento, contactos magnéticos, sirenas de alta potencia y conexión inmediata a centrales de monitoreo o dispositivos móviles.
                        </p>
                        <a href="ALARMAS.aspx" class="btn btn-outline-danger mt-3 fw-bold">Ver Detalles (ALARMAS.ASPX) <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>

            <!-- Servicio 2: SVC.ASPX -->
            <div class="col-md-4">
                <div class="card h-100 card-custom shadow-sm border-0">
                    <div class="card-body d-flex flex-column p-4">
                        <div class="feature-icon text-primary mb-3">
                            <i class="bi bi-camera-video-fill fs-1"></i>
                        </div>
                        <h4 class="card-title fw-bold">Vigilancia y Control</h4>
                        <p class="card-text text-muted flex-grow-1">
                            Cámaras fijas, domos PTZ motorizados 360°, sensores térmicos e intensificadores de luz. Monitoreo remoto en vivo de hasta 64 cámaras simultáneas.
                        </p>
                        <a href="SVC.aspx" class="btn btn-outline-primary mt-3 fw-bold">Ver Detalles (SVC.ASPX) <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>

            <!-- Servicio 3: IMEI.ASPX -->
            <div class="col-md-4">
                <div class="card h-100 card-custom shadow-sm border-0">
                    <div class="card-body d-flex flex-column p-4">
                        <div class="feature-icon text-success mb-3">
                            <i class="bi bi-pc-display-horizontal fs-1"></i>
                        </div>
                        <h4 class="card-title fw-bold">Equipos Informáticos</h4>
                        <p class="card-text text-muted flex-grow-1">
                            Instalación, mantenimiento preventivo y correctivo de ordenadores, impresoras, servidores y sistemas de almacenamiento masivo.
                        </p>
                        <a href="IMEI.aspx" class="btn btn-outline-success mt-3 fw-bold">Ver Detalles (IMEI.ASPX) <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Sección de Productos Destacados -->
    <div class="bg-light p-4 rounded-3 border mb-5">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <div>
                <h3 class="fw-bold mb-0">Catálogo Tecnológico y Vigilancia</h3>
                <small class="text-muted">Equipos disponibles en nuestro punto de atención en Parque Central</small>
            </div>
            <a href="Catalogo.aspx" class="btn btn-sm btn-primary">Ver Catálogo Completo &raquo;</a>
        </div>
        <div class="row row-cols-1 row-cols-md-3 g-3">
            <div class="col">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body">
                        <span class="badge bg-primary mb-2">Vigilancia</span>
                        <h5 class="card-title fw-bold">Cámaras Fijas y Giratorias 360°</h5>
                        <p class="card-text text-muted small">Cámaras analógicas y digitales equipadas con zoom óptico e intensificador de luz nocturna en tiempo real.</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body">
                        <span class="badge bg-success mb-2">Tecnología</span>
                        <h5 class="card-title fw-bold">Ordenadores y Servidores</h5>
                        <p class="card-text text-muted small">Equipos de escritorio configurados para estaciones de trabajo y centros de grabación continua de vídeo.</p>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100 border-0 shadow-sm">
                    <div class="card-body">
                        <span class="badge bg-secondary mb-2">Almacenamiento</span>
                        <h5 class="card-title fw-bold">Discos Duros e Impresoras</h5>
                        <p class="card-text text-muted small">Discos de alta resistencia preparados para grabación 24/7 e impresoras multifuncionales de alto rendimiento.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
