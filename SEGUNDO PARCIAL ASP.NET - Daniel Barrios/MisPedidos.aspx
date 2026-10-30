<%@ Page Title="Mis Pedidos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MisPedidos.aspx.cs" Inherits="SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios.MisPedidos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
        <div>
            <h2 class="fw-bold mb-1"><i class="bi bi-bag-check-fill text-success me-2"></i>Mis Pedidos & Compras</h2>
            <p class="text-muted mb-0">Consulte, pague y descargue la factura de sus pedidos</p>
        </div>
        <a href="CrearPedido.aspx" class="btn btn-warning text-dark fw-bold">
            <i class="bi bi-cart-plus me-1"></i>Nuevo Pedido
        </a>
    </div>

    <asp:Panel ID="pnlAlerta" runat="server" Visible="false" CssClass="alert alert-info">
        <asp:Label ID="lblAlerta" runat="server" />
    </asp:Panel>

    <div class="card shadow-sm border-0">
        <div class="card-header bg-dark text-white fw-bold">
            <i class="bi bi-clock-history me-2"></i>Historial de Pedidos Realizados
        </div>
        <div class="card-body p-0">
            <asp:GridView ID="gvMisPedidos" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-hover mb-0" GridLines="None" OnRowCommand="gvMisPedidos_RowCommand">
                <Columns>
                    <asp:BoundField DataField="IdPedido" HeaderText="# Pedido" />
                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" DataFormatString="{0:yyyy-MM-dd HH:mm}" />
                    <asp:BoundField DataField="Total" HeaderText="Total" DataFormatString="{0:C0}" />
                    <asp:BoundField DataField="MetodoPago" HeaderText="Método de Pago" />
                    <asp:TemplateField HeaderText="Estado">
                        <ItemTemplate>
                            <span class='badge <%# Eval("Estado").ToString() == "Pagado" ? "bg-success" : (Eval("Estado").ToString() == "Pendiente" ? "bg-warning text-dark" : "bg-info") %>'>
                                <%# Eval("Estado") %>
                            </span>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <a href='Factura.aspx?idPedido=<%# Eval("IdPedido") %>' class="btn btn-sm btn-outline-primary me-1">
                                <i class="bi bi-receipt"></i> Ver Factura
                            </a>
                            <asp:Button ID="btnPagar" runat="server" Text="Pagar Ahora" CssClass="btn btn-sm btn-success" CommandName="PagarPedido" CommandArgument='<%# Eval("IdPedido") %>' Visible='<%# Eval("Estado").ToString() == "Pendiente" %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    <div class="text-center p-5 text-muted">
                        <i class="bi bi-inbox fs-1 d-block mb-2"></i>
                        Aún no tienes pedidos registrados en tu cuenta.
                        <div class="mt-3">
                            <a href="Catalogo.aspx" class="btn btn-primary btn-sm">Explorar Catálogo de Productos</a>
                        </div>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
