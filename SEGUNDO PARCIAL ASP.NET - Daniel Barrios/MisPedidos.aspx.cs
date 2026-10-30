using System;
using System.Data;
using System.Data.SqlClient;

namespace SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios
{
    public partial class MisPedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                CargarPedidosCliente();
            }
        }

        private void CargarPedidosCliente()
        {
            int idCliente = Session["IdCliente"] != null ? Convert.ToInt32(Session["IdCliente"]) : 0;
            if (idCliente == 0)
            {
                // Consultar por idUsuario
                int idUsuario = Convert.ToInt32(Session["IdUsuario"]);
                string qCli = "SELECT IdCliente FROM Clientes WHERE IdUsuario = @idU";
                SqlParameter[] pCli = { new SqlParameter("@idU", idUsuario) };
                object res = ConexionBD.EjecutarEscalar(qCli, pCli);
                if (res != null && res != DBNull.Value)
                {
                    idCliente = Convert.ToInt32(res);
                    Session["IdCliente"] = idCliente;
                }
            }

            string query = "SELECT IdPedido, Fecha, Total, Estado, MetodoPago FROM Pedidos WHERE IdCliente = @idCli ORDER BY IdPedido DESC";
            SqlParameter[] param = { new SqlParameter("@idCli", idCliente) };
            DataTable dt = ConexionBD.EjecutarConsulta(query, param);

            gvMisPedidos.DataSource = dt;
            gvMisPedidos.DataBind();
        }

        protected void gvMisPedidos_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "PagarPedido")
            {
                int idPedido = Convert.ToInt32(e.CommandArgument);
                string query = "UPDATE Pedidos SET Estado = 'Pagado' WHERE IdPedido = @idP";
                SqlParameter[] param = { new SqlParameter("@idP", idPedido) };
                ConexionBD.EjecutarComando(query, param);

                pnlAlerta.Visible = true;
                pnlAlerta.CssClass = "alert alert-success";
                lblAlerta.Text = "¡El pedido #" + idPedido + " ha sido PAGADO exitosamente!";

                CargarPedidosCliente();
            }
        }
    }
}
