<%@ Page Title="Gestión de Clientes" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminClientes.aspx.cs" Inherits="SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios.AdminClientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
        <div>
            <h2 class="fw-bold mb-0"><i class="bi bi-people-fill text-success me-2"></i>Gestión de Clientes (CRUD)</h2>
            <small class="text-muted">Crear, Consultar, Actualizar y Eliminar Clientes registrados en el sistema</small>
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
                    <asp:Label ID="lblTituloForm" runat="server" Text="Registrar / Editar Cliente" />
                </div>
                <div class="card-body">
                    <asp:HiddenField ID="hfIdCliente" runat="server" Value="0" />

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Cédula / Documento:</label>
                        <asp:TextBox ID="txtCedula" runat="server" CssClass="form-control form-control-sm" required="required" placeholder="Ej: 1042456789" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Nombres:</label>
                        <asp:TextBox ID="txtNombres" runat="server" CssClass="form-control form-control-sm" required="required" placeholder="Nombres" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Apellidos:</label>
                        <asp:TextBox ID="txtApellidos" runat="server" CssClass="form-control form-control-sm" required="required" placeholder="Apellidos" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Teléfono:</label>
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control form-control-sm" placeholder="Ej: 3001234567" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Dirección:</label>
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control form-control-sm" placeholder="Dirección en Barranquilla" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Ciudad:</label>
                        <asp:TextBox ID="txtCiudad" runat="server" CssClass="form-control form-control-sm" Text="Barranquilla" />
                    </div>

                    <div class="d-flex gap-2">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar Cliente" CssClass="btn btn-success btn-sm flex-grow-1 fw-bold" OnClick="btnGuardar_Click" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-outline-secondary btn-sm" OnClick="btnCancelar_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Tabla Clientes -->
        <div class="col-lg-8">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-light fw-bold d-flex justify-content-between align-items-center">
                    <span><i class="bi bi-person-lines-fill me-2"></i>Clientes Registrados</span>
                    <div class="d-flex gap-2">
                        <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control form-control-sm" placeholder="Buscar cliente..." />
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-sm btn-outline-success" OnClick="btnBuscar_Click" />
                    </div>
                </div>
                <div class="card-body p-0">
                    <asp:GridView ID="gvClientes" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover mb-0" GridLines="None" OnRowCommand="gvClientes_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Cedula" HeaderText="Cédula" />
                            <asp:BoundField DataField="Nombres" HeaderText="Nombres" />
                            <asp:BoundField DataField="Apellidos" HeaderText="Apellidos" />
                            <asp:BoundField DataField="Telefono" HeaderText="Teléfono" />
                            <asp:BoundField DataField="Direccion" HeaderText="Dirección" />
                            <asp:BoundField DataField="Ciudad" HeaderText="Ciudad" />
                            <asp:TemplateField HeaderText="Acciones">
                                <ItemTemplate>
                                    <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-sm btn-warning me-1" CommandName="EditarCliente" CommandArgument='<%# Eval("IdCliente") %>' />
                                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-sm btn-danger" CommandName="EliminarCliente" CommandArgument='<%# Eval("IdCliente") %>' OnClientClick="return confirm('¿Seguro que desea eliminar a este cliente?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="p-4 text-center text-muted">No hay clientes registrados.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
