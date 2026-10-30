<%@ Page Title="Realizar Pedido" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CrearPedido.aspx.cs" Inherits="SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios.CrearPedido" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row mb-4">
        <div class="col-12">
            <h2 class="fw-bold"><i class="bi bi-cart-check-fill text-warning me-2"></i>Gestión de Pedidos - Realizar Compra</h2>
            <p class="text-muted">Seleccione los productos de tecnología y vigilancia para su orden en Parque Central - Barranquilla</p>
        </div>
    </div>

    <asp:Panel ID="pnlMensaje" runat="server" Visible="false" CssClass="alert alert-info">
        <asp:Label ID="lblMensaje" runat="server" />
    </asp:Panel>

    <div class="row g-4">
        <!-- Formulario para agregar producto al pedido -->
        <div class="col-lg-5">
            <div class="card shadow-sm border-0">
                <div class="card-header bg-dark text-white fw-bold">
                    <i class="bi bi-plus-circle me-2"></i>Añadir Producto a la Orden
                </div>
                <div class="card-body p-4">
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Seleccionar Producto:</label>
                        <asp:DropDownList ID="ddlProductos" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlProductos_SelectedIndexChanged" />
                    </div>

                    <div class="p-3 bg-light rounded border mb-3">
                        <div class="d-flex justify-content-between mb-1">
                            <span class="text-muted small">Precio Unitario:</span>
                            <asp:Label ID="lblPrecioUnitario" runat="server" CssClass="fw-bold text-primary" Text="$0 COP" />
                        </div>
                        <div class="d-flex justify-content-between">
                            <span class="text-muted small">Stock Disponible:</span>
                            <asp:Label ID="lblStock" runat="server" CssClass="badge bg-secondary" Text="0" />
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Cantidad a solicitar:</label>
                        <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" Text="1" TextMode="Number" />
                    </div>

                    <asp:Button ID="btnAgregarProducto" runat="server" Text="Añadir a la Lista del Pedido" CssClass="btn btn-primary w-100 fw-bold" OnClick="btnAgregarProducto_Click" />
                </div>
            </div>

            <!-- Resumen del Cliente y Método de Pago -->
            <div class="card shadow-sm border-0 mt-4">
                <div class="card-header bg-secondary text-white fw-bold">
                    <i class="bi bi-person-lines-fill me-2"></i>Datos de Entrega y Pago
                </div>
                <div class="card-body">
                    <p class="small text-muted mb-2"><strong>Cliente:</strong> <asp:Label ID="lblNombreCliente" runat="server" /></p>
                    <p class="small text-muted mb-3"><strong>Dirección:</strong> <asp:Label ID="lblDireccionCliente" runat="server" /></p>

                    <div class="mb-3">
                        <label class="form-label small fw-semibold">Método de Pago:</label>
                        <asp:DropDownList ID="ddlMetodoPago" runat="server" CssClass="form-select">
                            <asp:ListItem Text="Pago Contra Entrega en Barranquilla" Value="Contra Entrega" />
                            <asp:ListItem Text="Transferencia Bancaria / PSE" Value="Transferencia Bancaria" />
                            <asp:ListItem Text="Tarjeta de Crédito / Débito" Value="Tarjeta de Crédito" />
                        </asp:DropDownList>
                    </div>
                </div>
            </div>
        </div>

        <!-- Lista de productos añadidos al pedido actual -->
        <div class="col-lg-7">
            <div class="card shadow-sm border-0 h-100">
                <div class="card-header bg-light fw-bold d-flex justify-content-between align-items-center">
                    <span><i class="bi bi-list-check me-2"></i>Resumen de Productos en el Pedido</span>
                    <asp:Button ID="btnLimpiarCarrito" runat="server" Text="Limpiar Lista" CssClass="btn btn-outline-danger btn-sm" OnClick="btnLimpiarCarrito_Click" />
                </div>
                <div class="card-body p-0">
                    <asp:GridView ID="gvCarrito" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover mb-0" GridLines="None" OnRowCommand="gvCarrito_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Nombre" HeaderText="Producto" />
                            <asp:BoundField DataField="Precio" HeaderText="Precio" DataFormatString="{0:C0}" />
                            <asp:BoundField DataField="Cantidad" HeaderText="Cant." />
                            <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" DataFormatString="{0:C0}" />
                            <asp:TemplateField HeaderText="Acción">
                                <ItemTemplate>
                                    <asp:Button ID="btnEliminarItem" runat="server" Text="Quitar" CssClass="btn btn-sm btn-outline-danger" CommandName="QuitarItem" CommandArgument='<%# Container.DataItemIndex %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <EmptyDataTemplate>
                            <div class="text-center p-4 text-muted">
                                <i class="bi bi-cart-x fs-1 d-block mb-2"></i>
                                No hay productos en su orden todavía. Seleccione un producto del panel izquierdo.
                            </div>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
                <div class="card-footer bg-light p-3">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <span class="fs-5 fw-bold">Total a Pagar:</span>
                        <asp:Label ID="lblTotalPedido" runat="server" CssClass="fs-4 fw-bold text-success" Text="$0 COP" />
                    </div>
                    <asp:Button ID="btnConfirmarPedido" runat="server" Text="Confirmar y Guardar Pedido" CssClass="btn btn-success btn-lg w-100 fw-bold" OnClick="btnConfirmarPedido_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
