<%@ Page Title="Catálogo de Productos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Catalogo.aspx.cs" Inherits="SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios.Catalogo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
        <div>
            <h2 class="fw-bold mb-1"><i class="bi bi-grid-fill text-primary me-2"></i>Catálogo de Productos</h2>
            <p class="text-muted mb-0">Tecnología y Seguridad Electrónica en Parque Central - Barranquilla</p>
        </div>
        <div class="d-flex gap-2">
            <asp:DropDownList ID="ddlFiltroCategoria" runat="server" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="ddlFiltroCategoria_SelectedIndexChanged">
                <asp:ListItem Text="-- Todas las Categorías --" Value="" />
                <asp:ListItem Text="Vigilancia (CCTV / Cámaras)" Value="Vigilancia" />
                <asp:ListItem Text="Tecnología (PCs / Impresoras / Discos)" Value="Tecnología" />
            </asp:DropDownList>
            <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" placeholder="Buscar producto..." />
            <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn btn-primary" OnClick="btnBuscar_Click" />
        </div>
    </div>

    <% if (Session["Usuario"] == null) { %>
        <div class="alert alert-warning d-flex align-items-center mb-4 shadow-sm" role="alert">
            <i class="bi bi-exclamation-triangle-fill flex-shrink-0 me-2 fs-5"></i>
            <div>
                Para realizar compras online y generar pedidos, debe estar <strong>registrado e iniciar sesión</strong> como cliente.
                <a href="Login.aspx" class="alert-link ms-2">Iniciar Sesión</a> o <a href="Registro.aspx" class="alert-link">Registrarse</a>.
            </div>
        </div>
    <% } %>

    <asp:Repeater ID="rptProductos" runat="server">
        <HeaderTemplate>
            <div class="row row-cols-1 row-cols-md-3 g-4">
        </HeaderTemplate>
        <ItemTemplate>
            <div class="col">
                <div class="card h-100 card-custom border-0 shadow-sm">
                    <img src='<%# Eval("ImagenUrl") %>' class="card-img-top" alt='<%# Eval("Nombre") %>' style="height: 200px; object-fit: cover;">
                    <div class="card-body d-flex flex-column">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <span class='badge <%# Eval("Categoria").ToString() == "Vigilancia" ? "bg-primary" : "bg-success" %>'>
                                <%# Eval("Categoria") %>
                            </span>
                            <span class="badge bg-secondary"><%# Eval("Tipo") %></span>
                        </div>
                        <h5 class="card-title fw-bold text-dark mb-1"><%# Eval("Nombre") %></h5>
                        <p class="card-text text-muted small flex-grow-1"><%# Eval("Descripcion") %></p>
                        <div class="d-flex justify-content-between align-items-baseline mt-3">
                            <div>
                                <span class="text-muted small">Precio:</span>
                                <h4 class="text-primary fw-bold mb-0">$<%# String.Format("{0:N0}", Eval("Precio")) %> COP</h4>
                            </div>
                            <span class="badge bg-light text-dark border">Stock: <%# Eval("Stock") %></span>
                        </div>
                    </div>
                    <div class="card-footer bg-transparent border-0 pt-0 pb-3">
                        <% if (Session["Usuario"] != null && Session["Rol"].ToString() == "Cliente") { %>
                            <a href='CrearPedido.aspx?idProd=<%# Eval("IdProducto") %>' class="btn btn-warning text-dark w-100 fw-bold">
                                <i class="bi bi-cart-plus me-1"></i>Comprar / Añadir a Pedido
                            </a>
                        <% } else if (Session["Usuario"] != null && Session["Rol"].ToString() == "Admin") { %>
                            <a href='AdminProductos.aspx' class="btn btn-outline-secondary w-100 btn-sm">
                                <i class="bi bi-pencil me-1"></i>Gestionar en Admin
                            </a>
                        <% } else { %>
                            <a href="Login.aspx" class="btn btn-outline-primary w-100">
                                <i class="bi bi-lock me-1"></i>Iniciar Sesión para Comprar
                            </a>
                        <% } %>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        <FooterTemplate>
            </div>
        </FooterTemplate>
    </asp:Repeater>

    <asp:Label ID="lblSinResultados" runat="server" CssClass="alert alert-info d-block text-center mt-4" Visible="false" Text="No se encontraron productos con el filtro indicado." />
</asp:Content>
