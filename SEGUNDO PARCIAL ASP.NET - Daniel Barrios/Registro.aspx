<%@ Page Title="Registro de Cliente" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios.Registro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row justify-content-center my-4">
        <div class="col-md-7">
            <div class="card shadow border-0">
                <div class="card-header bg-warning text-dark py-3">
                    <h4 class="fw-bold mb-0"><i class="bi bi-person-plus-fill me-2"></i>Registro de Nuevo Cliente</h4>
                    <small>Crea tu cuenta para realizar pedidos de productos y servicios</small>
                </div>
                <div class="card-body p-4">
                    <asp:Panel ID="pnlAlerta" runat="server" Visible="false" CssClass="alert small mb-3">
                        <asp:Label ID="lblAlerta" runat="server" />
                    </asp:Panel>

                    <h6 class="fw-bold text-muted border-bottom pb-2 mb-3">1. Datos Personales</h6>
                    <div class="row g-3 mb-3">
                        <div class="col-md-6">
                            <label class="form-label small fw-semibold">Cédula / Documento:</label>
                            <asp:TextBox ID="txtCedula" runat="server" CssClass="form-control" required="required" placeholder="Ej: 1045123456" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-semibold">Teléfono / Celular:</label>
                            <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" required="required" placeholder="Ej: 3001234567" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-semibold">Nombres:</label>
                            <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control" required="required" placeholder="Tus nombres" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-semibold">Apellidos:</label>
                            <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control" required="required" placeholder="Tus apellidos" />
                        </div>
                        <div class="col-md-8">
                            <label class="form-label small fw-semibold">Dirección de Entrega:</label>
                            <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" placeholder="Ej: Calle 50 # 45-20" />
                        </div>
                        <div class="col-md-4">
                            <label class="form-label small fw-semibold">Ciudad:</label>
                            <asp:TextBox ID="txtCiudad" runat="server" CssClass="form-control" Text="Barranquilla" />
                        </div>
                    </div>

                    <h6 class="fw-bold text-muted border-bottom pb-2 mb-3">2. Datos de Acceso</h6>
                    <div class="row g-3 mb-4">
                        <div class="col-md-6">
                            <label class="form-label small fw-semibold">Correo Electrónico:</label>
                            <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" TextMode="Email" required="required" placeholder="usuario@correo.com" />
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-semibold">Contraseña:</label>
                            <asp:TextBox ID="txtClave" runat="server" CssClass="form-control" TextMode="Password" required="required" placeholder="Mínimo 6 caracteres" />
                        </div>
                    </div>

                    <asp:Button ID="btnRegistrar" runat="server" Text="Crear Cuenta y Continuar" CssClass="btn btn-warning text-dark w-100 fw-bold py-2" OnClick="btnRegistrar_Click" />

                    <div class="text-center mt-3 small">
                        ¿Ya tienes cuenta? <a href="Login.aspx" class="fw-bold text-decoration-none">Inicia Sesión aquí</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
