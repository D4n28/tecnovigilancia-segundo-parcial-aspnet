<%@ Page Title="Gestión de Productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminProductos.aspx.cs" Inherits="SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios.AdminProductos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
        <div>
            <h2 class="fw-bold mb-0"><i class="bi bi-box-seam-fill text-info me-2"></i>Gestión de Productos (CRUD)</h2>
            <small class="text-muted">Cámaras fijas, giratorias con zoom, ordenadores, discos duros e impresoras</small>
        </div>
        <a href="AdminDashboard.aspx" class="btn btn-outline-secondary btn-sm"><i class="bi bi-arrow-left"></i> Volver al Dashboard</a>
    </div>

    <asp:Panel ID="pnlMensaje" runat="server" Visible="false" CssClass="alert alert-info">
        <asp:Label ID="lblMensaje" runat="server" />
    </asp:Panel>

    <div class="row g-4">
        <!-- Formulario CRUD de Productos -->
        <div class="col-lg-4">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-dark text-white fw-bold">
                    <asp:Label ID="lblTituloForm" runat="server" Text="Registrar Nuevo Producto" />
                </div>
                <div class="card-body">
                    <asp:HiddenField ID="hfIdProducto" runat="server" Value="0" />

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Nombre del Producto:</label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control form-control-sm" required="required" placeholder="Ej: Cámara Domo IP Full Color" />
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Categoría:</label>
                        <asp:DropDownList ID="ddlCategoria" runat="server" CssClass="form-select form-select-sm">
                            <asp:ListItem Text="Vigilancia (CCTV)" Value="Vigilancia" />
                            <asp:ListItem Text="Tecnología (PCs / Equipos)" Value="Tecnología" />
                        </asp:DropDownList>
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Tipo de Equipo:</label>
                        <asp:TextBox ID="txtTipo" runat="server" CssClass="form-control form-control-sm" required="required" placeholder="Ej: Cámara Fija, Giratoria PTZ, Ordenador..." />
                    </div>

                    <div class="row g-2 mb-3">
                        <div class="col-6">
                            <label class="form-label small fw-semibold">Precio (COP):</label>
                            <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control form-control-sm" required="required" TextMode="Number" step="1000" placeholder="150000" />
                        </div>
                        <div class="col-6">
                            <label class="form-label small fw-semibold">Stock Inicial:</label>
                            <asp:TextBox ID="txtStock" runat="server" CssClass="form-control form-control-sm" required="required" TextMode="Number" Text="10" />
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Descripción del Producto:</label>
                        <asp:TextBox ID="txtDescripcion" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control form-control-sm" placeholder="Detalles de resolución, zoom, intensificador de luz, etc." />
                    </div>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">URL de Imagen:</label>
                        <asp:TextBox ID="txtImagenUrl" runat="server" CssClass="form-control form-control-sm" placeholder="https://..." />
                    </div>

                    <div class="d-flex gap-2">
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar Producto" CssClass="btn btn-info text-white btn-sm flex-grow-1 fw-bold" OnClick="btnGuardar_Click" />
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-outline-secondary btn-sm" OnClick="btnCancelar_Click" />
                    </div>
                </div>
            </div>
        </div>

        <!-- Tabla Productos -->
        <div class="col-lg-8">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-light fw-bold d-flex justify-content-between align-items-center">
                    <span><i class="bi bi-boxes me-2"></i>Inventario y Productos Disponibles</span>
                    <div class="d-flex gap-2">
                        <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control form-control-sm" placeholder="Buscar por nombre o tipo..." />
                        <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-sm btn-outline-info" OnClick="btnBuscar_Click" />
                    </div>
                </div>
                <div class="card-body p-0">
                    <asp:GridView ID="gvProductos" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover mb-0" GridLines="None" OnRowCommand="gvProductos_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Nombre" HeaderText="Producto" />
                            <asp:BoundField DataField="Categoria" HeaderText="Categoría" />
                            <asp:BoundField DataField="Tipo" HeaderText="Tipo" />
                            <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C0}" />
                            <asp:BoundField DataField="Stock" HeaderText="Stock" />
                            <asp:TemplateField HeaderText="Acciones">
                                <ItemTemplate>
                                    <asp:Button ID="btnEditar" runat="server" Text="Editar" CssClass="btn btn-sm btn-warning me-1" CommandName="EditarProducto" CommandArgument='<%# Eval("IdProducto") %>' />
                                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-sm btn-danger" CommandName="EliminarProducto" CommandArgument='<%# Eval("IdProducto") %>' OnClientClick="return confirm('¿Seguro que desea eliminar este producto?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="p-4 text-center text-muted">No hay productos en inventario.</div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
