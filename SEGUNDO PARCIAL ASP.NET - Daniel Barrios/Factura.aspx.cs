using System;
using System.Data;
using System.Data.SqlClient;

namespace SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios
{
    public partial class Factura : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["idPedido"] == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }

            if (!IsPostBack)
            {
                int idPedido = Convert.ToInt32(Request.QueryString["idPedido"]);
                CargarDatosFactura(idPedido);
            }
        }

        private void CargarDatosFactura(int idPedido)
        {
            // 1. Consultar encabezado de factura / pedido y cliente
            string qPedido = @"
                SELECT P.IdPedido, P.Fecha, P.Total, P.Estado, P.MetodoPago,
                       C.Cedula, C.Nombres, C.Apellidos, C.Telefono, C.Direccion, C.Ciudad
                FROM Pedidos P
                INNER JOIN Clientes C ON P.IdCliente = C.IdCliente
                WHERE P.IdPedido = @idP";

            SqlParameter[] pPed = { new SqlParameter("@idP", idPedido) };
            DataTable dtPed = ConexionBD.EjecutarConsulta(qPedido, pPed);

            if (dtPed.Rows.Count > 0)
            {
                DataRow r = dtPed.Rows[0];
                lblNumeroFactura.Text = r["IdPedido"].ToString();
                lblFechaFactura.Text = Convert.ToDateTime(r["Fecha"]).ToString("dd/MM/yyyy HH:mm");
                lblEstadoFactura.Text = r["Estado"].ToString();
                lblMetodoPago.Text = r["MetodoPago"].ToString();

                lblClienteNombre.Text = r["Nombres"].ToString() + " " + r["Apellidos"].ToString();
                lblClienteCedula.Text = r["Cedula"].ToString();
                lblClienteDireccion.Text = r["Direccion"].ToString();
                lblClienteCiudad.Text = r["Ciudad"].ToString();
                lblClienteTelefono.Text = r["Telefono"].ToString();

                decimal total = Convert.ToDecimal(r["Total"]);
                decimal subtotalBase = total / 1.19m;
                decimal iva = total - subtotalBase;

                lblSubtotalBase.Text = "$" + string.Format("{0:N0}", subtotalBase) + " COP";
                lblIva.Text = "$" + string.Format("{0:N0}", iva) + " COP";
                lblTotalGeneral.Text = "$" + string.Format("{0:N0}", total) + " COP";
            }
            else
            {
                Response.Redirect("Default.aspx");
                return;
            }

            // 2. Consultar detalle de productos
            string qDet = @"
                SELECT PR.Nombre, PR.Categoria, D.Cantidad, D.PrecioUnitario, (D.Cantidad * D.PrecioUnitario) AS Subtotal
                FROM DetallePedidos D
                INNER JOIN Productos PR ON D.IdProducto = PR.IdProducto
                WHERE D.IdPedido = @idP";

            DataTable dtDet = ConexionBD.EjecutarConsulta(qDet, pPed);
            gvDetalleFactura.DataSource = dtDet;
            gvDetalleFactura.DataBind();
        }
    }
}
