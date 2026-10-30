<%@ Page Title="Instalación de Sistemas de Alarmas" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ALARMAS.aspx.cs" Inherits="SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios.ALARMAS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row mb-4">
        <div class="col-12">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="Default.aspx">Inicio</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Instalación de Sistemas de Alarmas (ALARMAS.ASPX)</li>
                </ol>
            </nav>
            <div class="p-4 p-md-5 mb-4 rounded text-white bg-danger bg-gradient shadow-sm">
                <div class="col-md-9 px-0">
                    <h1 class="display-5 fw-bold"><i class="bi bi-shield-exclamation me-2"></i>Instalación de Sistemas de Alarmas</h1>
                    <p class="lead my-3">Protección perimetral y contra intrusión con tecnología inalámbrica e híbrida para residencias, almacenes e industrias en Parque Central - Barranquilla.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <div class="col-md-8">
            <h3 class="fw-bold border-bottom pb-2 mb-3 text-secondary">¿En qué consiste nuestro servicio de Alarmas?</h3>
            <p class="text-muted">
                Diseñamos e instalamos sistemas de seguridad electrónica avanzados capaces de detectar con total precisión cualquier intento de acceso no autorizado, sabotaje o emergencia dentro de su inmueble. Todos nuestros sistemas están enlazados a comunicadores GSM/GPRS y red IP.
            </p>

            <div class="row row-cols-1 row-cols-md-2 g-3 my-3">
                <div class="col">
                    <div class="p-3 border rounded bg-white shadow-sm h-100">
                        <h5 class="fw-bold text-danger"><i class="bi bi-activity me-2"></i>Detectores de Movimiento PIR</h5>
                        <p class="small text-muted mb-0">Sensores infrarrojos pasivos con inmunidad para mascotas hasta 25 kg y cobertura de 12 metros a 90 grados.</p>
                    </div>
                </div>
                <div class="col">
                    <div class="p-3 border rounded bg-white shadow-sm h-100">
                        <h5 class="fw-bold text-danger"><i class="bi bi-door-open me-2"></i>Contactos Magnéticos</h5>
                        <p class="small text-muted mb-0">Sensores para puertas, persianas de locales comerciales y ventanas con activación inmediata ante apertura.</p>
                    </div>
                </div>
                <div class="col">
                    <div class="p-3 border rounded bg-white shadow-sm h-100">
                        <h5 class="fw-bold text-danger"><i class="bi bi-volume-up me-2"></i>Sirenas de Alta Potencia</h5>
                        <p class="small text-muted mb-0">Alertas acústicas de 115 dB con luz estroboscópica disuasiva, aptas para intemperie.</p>
                    </div>
                </div>
                <div class="col">
                    <div class="p-3 border rounded bg-white shadow-sm h-100">
                        <h5 class="fw-bold text-danger"><i class="bi bi-phone me-2"></i>Monitoreo desde el Móvil</h5>
                        <p class="small text-muted mb-0">Armado y desarmado remoto desde su smartphone, notificaciones push en tiempo real y registro histórico de eventos.</p>
                    </div>
                </div>
            </div>

            <div class="alert alert-info border-0 shadow-sm mt-4">
                <h5 class="alert-heading fw-bold"><i class="bi bi-info-circle-fill me-2"></i>Asesoría técnica y levantamiento de planos</h5>
                <p class="mb-0">Nuestros técnicos e ingenieros certificados realizan una visita previa sin costo adicional en el sector de Barranquilla para determinar los puntos ciegos y diseñar la cobertura ideal de su sistema.</p>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card shadow-sm border-0 bg-light p-3">
                <h4 class="fw-bold text-dark mb-3">Solicitar Cotización</h4>
                <div class="mb-3">
                    <label class="form-label small fw-semibold">Tipo de Inmueble</label>
                    <asp:DropDownList ID="ddlTipoInmueble" runat="server" CssClass="form-select">
                        <asp:ListItem Text="Casa Residencial" Value="Casa" />
                        <asp:ListItem Text="Local Comercial / Negocio" Value="Comercial" />
                        <asp:ListItem Text="Bodega / Empresa" Value="Industrial" />
                    </asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label class="form-label small fw-semibold">Número de Puntos / Accesos</label>
                    <asp:TextBox ID="txtPuntos" runat="server" CssClass="form-control" Text="4" TextMode="Number" />
                </div>
                <div class="mb-3">
                    <label class="form-label small fw-semibold">Teléfono de Contacto</label>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" placeholder="Ej: 3001234567" />
                </div>
                <asp:Button ID="btnCotizar" runat="server" Text="Solicitar Asesoría" CssClass="btn btn-danger w-100 fw-bold" OnClick="btnCotizar_Click" />
                <asp:Label ID="lblMensaje" runat="server" CssClass="mt-2 d-block small text-center fw-bold text-success" />
            </div>

            <div class="card border-0 shadow-sm mt-4">
                <div class="card-body">
                    <h5 class="fw-bold"><i class="bi bi-clock-history text-secondary me-2"></i>Tiempos de Respuesta</h5>
                    <p class="small text-muted mb-2">Instalación y puesta en marcha en menos de 24 a 48 horas en el área metropolitana de Barranquilla.</p>
                    <span class="badge bg-success">Garantía de 1 año en equipos y mano de obra</span>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
