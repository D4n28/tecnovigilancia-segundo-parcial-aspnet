<%@ Page Title="Gestión de Pedidos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminPedidos.aspx.cs" Inherits="SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios.AdminPedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
        <div>
            <h2 class="fw-bold mb-0"><i class="bi bi-receipt text-warning me-2"></i>Gestión de Pedidos & Facturación</h2>
            <small class="text-muted">Control global de órdenes realizadas por clientes, estados de pago y generación de facturas</small>
        </div>
        <a href="AdminDashboard.aspx" class="btn btn-outline-secondary btn-sm"><i class="bi bi-arrow-left"></i> Volver al Dashboard</a>
    </div>

    <asp:Panel ID="pnlMensaje" runat="server" Visible="false" CssClass="alert alert-info">
        <asp:Label ID="lblMensaje" runat="server" />
    </asp:Panel>

    <div class="card shadow-sm border-0 mb-4">
        <div class="card-header bg-light fw-bold d-flex justify-content-between align-items-center flex-wrap gap-2">
            <span><i class="bi bi-funnel-fill me-1"></i>Filtro de Pedidos</span>
            <div class="d-flex gap-2">
                <asp:DropDownList ID="ddlFiltroEstado" runat="server" CssClass="form-select form-select-sm" AutoPostBack="true" OnSelectedIndexChanged="ddlFiltroEstado_SelectedIndexChanged">
                    <asp:ListItem Text="-- Todos los Estados --" Value="" />
                    <asp:ListItem Text="Pendiente" Value="Pendiente" />
                    <asp:ListItem Text="Pagado" Value="Pagado" />
                    <asp:ListItem Text="Entregado" Value="Entregado" />
                </asp:DropDownList>
                <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control form-control-sm" placeholder="Buscar por cliente o # pedido..." />
                <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-sm btn-primary" OnClick="btnBuscar_Click" />
            </div>
        </div>
        <div class="card-body p-0">
            <asp:GridView ID="gvPedidos" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover mb-0" GridLines="None" OnRowCommand="gvPedidos_RowCommand">
                <Columns>
                    <asp:BoundField DataField="IdPedido" HeaderText="# Pedido" />
                    <asp:BoundField DataField="Cliente" HeaderText="Cliente" />
                    <asp:BoundField DataField="Cedula" HeaderText="Cédula" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                    <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="{0:C0}" />
                    <asp:BoundField DataField="MetodoPago" HeaderText="Método Pago" />
                    <asp:TemplateField HeaderText="Estado">
                        <ItemTemplate>
                            <span class='badge <%# Eval("Estado").ToString() == "Pagado" ? "bg-success" : (Eval("Estado").ToString() == "Pendiente" ? "bg-warning text-dark" : "bg-info") %>'>
                                <%# Eval("Estado") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <a href='Factura.aspx?idPedido=<%# Eval("IdPedido") %>' class="btn btn-sm btn-outline-primary me-1" target="_blank">
                                <i class="bi bi-printer"></i> Factura
                            </a>
                            <asp:Button ID="btnMarcarPagado" runat="server" Text="Marcar Pagado" CssClass="btn btn-sm btn-success me-1" CommandName="MarcarPagado" CommandArgument='<%# Eval("IdPedido") %>' Visible='<%# Eval("Estado").ToString() == "Pendiente" %>' />
                            <asp:Button ID="btnMarcarEntregado" runat="server" Text="Entregar" CssClass="btn btn-sm btn-info text-white me-1" CommandName="MarcarEntregado" CommandArgument='<%# Eval("IdPedido") %>' Visible='<%# Eval("Estado").ToString() == "Pagado" %>' />
                            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-sm btn-danger" CommandName="EliminarPedido" CommandArgument='<%# Eval("IdPedido") %>' OnClientClick="return confirm('¿Seguro que desea anular/eliminar este pedido?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div class="p-4 text-center text-muted">No se encontraron pedidos con el criterio seleccionado.</div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
