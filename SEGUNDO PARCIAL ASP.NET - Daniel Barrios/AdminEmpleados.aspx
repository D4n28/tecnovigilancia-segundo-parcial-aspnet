<%@ Page Title="Gestión de Empleados" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminEmpleados.aspx.cs" Inherits="SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios.AdminEmpleados" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
        <div>
            <h2 class="fw-bold mb-0"><i class="bi bi-person-badge-fill text-primary me-2"></i>Gestión de Empleados (CRUD)</h2>
            <small class="text-muted">Crear, Consultar, Actualizar y Eliminar Empleados de TecnoVigilancia</small>
        </div>
        <a href="AdminDashboard.aspx" class="btn btn-outline-secondary btn-sm"><i class="bi bi-arrow-left"></i> Volver al Dashboard</a>
    </div>

    <asp:Panel ID="pnlMensaje" runat="server" Visible="false" CssClass="alert alert-info">
        <asp:Label ID="lblMensaje" runat="server" />
    </asp:Panel>

    <div class="row g-4">
        <!-- Formulario CRUD -->
        <div class="col-lg-4">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-dark text-white fw-bold">
                    <asp:Label ID="lblTituloForm" runat="server" Text="Registrar Nuevo Empleado" />
                </div>
                <div class="card-body">
                    <asp:HiddenField ID="hfIdEmpleado" runat="server" Value="0" />

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Cédula:</label>
                        <asp:TextBox ID="txtCedula" runat="server" CssClass="form-control form-control-sm" required="required" placeholder="Ej: 72154890" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Nombres:</label>
                        <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control form-control-sm" required="required" placeholder="Nombres del empleado" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Apellidos:</label>
                        <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control form-control-sm" required="required" placeholder="Apellidos del empleado" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Cargo / Especialidad:</label>
                        <asp:DropDownList ID="ddlCargo" runat="server" CssClass="form-select form-select-sm">
                            <asp:ListItem Text="Técnico Especialista en CCTV y Vigilancia" Value="Técnico Especialista en CCTV y Vigilancia" />
                            <asp:ListItem Text="Instalador de Sistemas de Alarmas" Value="Instalador de Sistemas de Alarmas" />
                            <asp:ListItem Text="Ingeniero de Soporte e Infraestructura" Value="Ingeniero de Soporte e Infraestructura" />
                            <asp:ListItem Text="Técnico de Laboratorio Informático" Value="Técnico de Laboratorio Informático" />
                            <asp:ListItem Text="Asesor Comercial de Parque Central" Value="Asesor Comercial de Parque Central" />
                        </asp:DropDownList>
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Teléfono:</label>
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control form-control-sm" placeholder="Ej: 3001234567" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Correo Electrónico:</label>
                        <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control form-control-sm" TextMode="Email" placeholder="empleado@tecnovigilancia.com" />
                    </div>

                    <div class="d-flex gap-2">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar Empleado" CssClass="btn btn-primary btn-sm flex-grow-1 fw-bold" OnClick="btnGuardar_Click" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-outline-secondary btn-sm" OnClick="btnCancelar_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Tabla GridView -->
        <div class="col-lg-8">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-light fw-bold d-flex justify-content-between align-items-center">
                    <span><i class="bi bi-list-task me-2"></i>Nómina y Técnicos Activos</span>
                    <div class="d-flex gap-2">
                        <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control form-control-sm" placeholder="Buscar por nombre o cédula..." />
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-sm btn-outline-primary" OnClick="btnBuscar_Click" />
                    </div>
                </div>
                <div class="card-body p-0">
                    <asp:GridView ID="gvEmpleados" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover mb-0" GridLines="None" OnRowCommand="gvEmpleados_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Cedula" HeaderText="Cédula" />
                            <asp:BoundField DataField="Nombres" HeaderText="Nombres" />
                            <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" />
                            <asp:BoundField DataField="Cargo" HeaderText="Cargo" />
                            <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                            <asp:TemplateField HeaderText="Acciones">
                                <ItemTemplate>
                                    <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-sm btn-warning me-1" CommandName="EditarEmpleado" CommandArgument='<%# Eval("IdEmpleado") %>' />
                                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-sm btn-danger" CommandName="EliminarEmpleado" CommandArgument='<%# Eval("IdEmpleado") %>' OnClientClick="return confirm('¿Seguro que desea eliminar a este empleado?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="p-4 text-center text-muted">No hay empleados registrados.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
