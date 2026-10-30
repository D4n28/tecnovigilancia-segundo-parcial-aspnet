<%@ Page Title="Factura de Venta" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Factura.aspx.cs" Inherits="SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios.Factura" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row justify-content-center my-4">
        <div class="col-lg-9">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <a href="MisPedidos.aspx" class="btn btn-outline-secondary btn-sm"><i class="bi bi-arrow-left"></i> Volver a Mis Pedidos</a>
                <button type="button" class="btn btn-primary btn-sm" onclick="window.print();"><i class="bi bi-printer-fill me-1"></i> Imprimir Factura</button>
            </div>

            <div class="card shadow border-0 p-4 bg-white" id="facturaImprimible">
                <!-- Encabezado de Factura -->
                <div class="row border-bottom pb-4 mb-4">
                    <div class="col-sm-6">
                        <h3 class="fw-bold text-primary mb-1"><i class="bi bi-shield-check me-2"></i>TECNOVIGILANCIA</h3>
                        <p class="text-muted small mb-0">Seguridad Electrónica y Tecnología Integral</p>
                        <p class="text-muted small mb-0">NIT: 900.842.125-4</p>
                        <p class="text-muted small mb-0">Parque Central, Calle 50 # 44-12, Barranquilla - Atlántico</p>
                        <p class="text-muted small mb-0">PBX: (605) 385-0000 | Cel: 300 123 4567</p>
                    </div>
                    <div class="col-sm-6 text-sm-end mt-3 mt-sm-0">
                        <div class="p-3 bg-light rounded border d-inline-block text-start">
                            <span class="text-muted small d-block">FACTURA DE VENTA ELECTRÓNICA</span>
                            <h4 class="fw-bold text-danger mb-1">FACT- #<asp:Label ID="lblNumeroFactura" runat="server" Text="1001" /></h4>
                            <span class="small d-block"><strong>Fecha:</strong> <asp:Label ID="lblFechaFactura" runat="server" /></span>
                            <span class="small d-block"><strong>Estado:</strong> <asp:Label ID="lblEstadoFactura" runat="server" CssClass="badge bg-success" /></span>
                            <span class="small d-block"><strong>Forma de Pago:</strong> <asp:Label ID="lblMetodoPago" runat="server" /></span>
                        </div>
                    </div>
                </div>

                <!-- Datos del Cliente -->
                <div class="row mb-4">
                    <div class="col-12">
                        <div class="p-3 bg-light rounded border">
                            <h6 class="fw-bold text-dark border-bottom pb-1 mb-2">DATOS DEL CLIENTE (ADQUIRIENTE)</h6>
                            <div class="row small">
                                <div class="col-md-6 mb-1"><strong>Nombres y Apellidos:</strong> <asp:Label ID="lblClienteNombre" runat="server" /></div>
                                <div class="col-md-6 mb-1"><strong>Cédula / NIT:</strong> <asp:Label ID="lblClienteCedula" runat="server" /></div>
                                <div class="col-md-6 mb-1"><strong>Dirección:</strong> <asp:Label ID="lblClienteDireccion" runat="server" /></div>
                                <div class="col-md-6 mb-1"><strong>Ciudad:</strong> <asp:Label ID="lblClienteCiudad" runat="server" /></div>
                                <div class="col-md-6 mb-1"><strong>Teléfono:</strong> <asp:Label ID="lblClienteTelefono" runat="server" /></div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Detalle de Productos Facturados -->
                <div class="table-responsive mb-4">
                    <asp:GridView ID="gvDetalleFactura" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped" GridLines="None">
                        <HeaderStyle CssClass="table-dark small text-uppercase" />
                        <Columns>
                            <asp:BoundField DataField="Nombre" HeaderText="Descripción del Producto / Equipo" />
                            <asp:BoundField DataField="Categoria" HeaderText="Categoría" />
                            <asp:BoundField DataField="Cantidad" HeaderText="Cant." ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center" />
                            <asp:BoundField DataField="PrecioUnitario" HeaderText="Precio Unitario" DataFormatString="{0:C0}" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" />
                            <asp:BoundField DataField="Subtotal" HeaderText="Subtotal" DataFormatString="{0:C0}" ItemStyle-HorizontalAlign="Right" HeaderStyle-HorizontalAlign="Right" />
                        </Columns>
                    </asp:GridView>
                </div>

                <!-- Resumen de Totales e Impuestos -->
                <div class="row justify-content-end mb-4">
                    <div class="col-md-5">
                        <table class="table table-sm table-borderless">
                            <tr>
                                <td class="text-end text-muted">Subtotal Base:</td>
                                <td class="text-end fw-bold"><asp:Label ID="lblSubtotalBase" runat="server" Text="$0 COP" /></td>
                            </tr>
                            <tr>
                                <td class="text-end text-muted">IVA (19% incluido):</td>
                                <td class="text-end fw-bold"><asp:Label ID="lblIva" runat="server" Text="$0 COP" /></td>
                            </tr>
                            <tr class="border-top border-dark">
                                <td class="text-end fs-5 fw-bold text-dark">TOTAL GENERAL:</td>
                                <td class="text-end fs-5 fw-bold text-success"><asp:Label ID="lblTotalGeneral" runat="server" Text="$0 COP" /></td>
                            </tr>
                        </table>
                    </div>
                </div>

                <!-- Pie de Factura -->
                <div class="border-top pt-3 text-center small text-muted">
                    <p class="mb-1">Esta factura se asimila en todos sus efectos a una letra de cambio según Art. 774 del Código de Comercio.</p>
                    <p class="mb-0">¡Gracias por confiar en <strong>TecnoVigilancia Parque Central - Barranquilla</strong>!</p>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
