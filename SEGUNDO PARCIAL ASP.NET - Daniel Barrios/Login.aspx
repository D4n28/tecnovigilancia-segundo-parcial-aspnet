<%@ Page Title="Iniciar Sesión" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row justify-content-center my-5">
        <div class="col-md-5">
            <div class="card shadow border-0">
                <div class="card-header bg-dark text-white text-center py-3">
                    <h4 class="fw-bold mb-0"><i class="bi bi-shield-lock-fill text-warning me-2"></i>Acceso al Sistema</h4>
                    <small class="text-muted">TecnoVigilancia Parque Central</small>
                </div>
                <div class="card-body p-4">
                    <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="alert alert-danger small py-2 mb-3">
                        <asp:Label ID="lblError" runat="server" />
                    </asp:Panel>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Correo Electrónico:</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                            <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" TextMode="Email" placeholder="usuario@correo.com" required="required" />
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Contraseña:</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-key"></i></span>
                            <asp:TextBox ID="txtClave" runat="server" CssClass="form-control" TextMode="Password" placeholder="******" required="required" />
                        </div>
                    </div>

                    <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" CssClass="btn btn-primary w-100 fw-bold py-2" OnClick="btnLogin_Click" />

                    <hr />

                    <div class="text-center small">
                        ¿No tienes una cuenta aún? <a href="Registro.aspx" class="fw-bold text-decoration-none">Regístrate como Cliente</a>
                    </div>
                </div>
                <div class="card-footer bg-light p-3">
                    <div class="small text-muted">
                        <strong>Cuentas de prueba para el evaluador:</strong><br />
                        <span class="badge bg-danger">Admin:</span> admin@tecnovigilancia.com / admin123<br />
                        <span class="badge bg-primary">Cliente:</span> daniel@correo.com / 123456
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
