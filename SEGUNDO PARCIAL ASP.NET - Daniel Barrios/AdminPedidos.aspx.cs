using System;
using System.Data;
using System.Data.SqlClient;

namespace SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios
{
    public partial class AdminPedidos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Rol"] == null || Session["Rol"].ToString() != "Admin")
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                CargarPedidos();
            }
        }

        private void CargarPedidos()
        {
            string estado = ddlFiltroEstado.SelectedValue;
            string buscar = txtBuscar.Text.Trim();

            string query = @"
                SELECT P.IdPedido, P.Fecha, P.Total, P.Estado, P.MetodoPago,
                       (C.Nombres + ' ' + C.Apellidos) AS Cliente, C.Cedula
                FROM Pedidos P
                INNER JOIN Clientes C ON P.IdCliente = C.IdCliente
                WHERE 1=1";

            if (!string.IsNullOrEmpty(estado))
            {
                query += " AND P.Estado = @est";
            }
            if (!string.IsNullOrEmpty(buscar))
            {
                query += " AND (C.Nombres LIKE @bus OR C.Apellidos LIKE @bus OR C.Cedula LIKE @bus OR CAST(P.IdPedido AS NVARCHAR) LIKE @bus)";
            }

            query += " ORDER BY P.IdPedido DESC";

            SqlParameter[] param = {
                new SqlParameter("@est", (object)estado ?? DBNull.Value),
                new SqlParameter("@bus", "%" + buscar + "%")
            };

            DataTable dt = ConexionBD.EjecutarConsulta(query, param);
            gvPedidos.DataSource = dt;
            gvPedidos.DataBind();
        }

        protected void ddlFiltroEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarPedidos();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarPedidos();
        }

        protected void gvPedidos_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int idPedido = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "MarcarPagado")
            {
                string query = "UPDATE Pedidos SET Estado = 'Pagado' WHERE IdPedido = @idP";
                SqlParameter[] param = { new SqlParameter("@idP", idPedido) };
                ConexionBD.EjecutarComando(query, param);

                MostrarMensaje("El pedido #" + idPedido + " fue marcado como PAGADO.", "alert-success");
                CargarPedidos();
            }
            else if (e.CommandName == "MarcarEntregado")
            {
                string query = "UPDATE Pedidos SET Estado = 'Entregado' WHERE IdPedido = @idP";
                SqlParameter[] param = { new SqlParameter("@idP", idPedido) };
                ConexionBD.EjecutarComando(query, param);

                MostrarMensaje("El pedido #" + idPedido + " fue marcado como ENTREGADO.", "alert-info");
                CargarPedidos();
            }
            else if (e.CommandName == "EliminarPedido")
            {
                try
                {
                    string query = "DELETE FROM Pedidos WHERE IdPedido = @idP";
                    SqlParameter[] param = { new SqlParameter("@idP", idPedido) };
                    ConexionBD.EjecutarComando(query, param);

                    MostrarMensaje("El pedido #" + idPedido + " ha sido eliminado correctamente.", "alert-success");
                    CargarPedidos();
                }
                catch (Exception ex)
                {
                    MostrarMensaje("No se pudo eliminar el pedido: " + ex.Message, "alert-danger");
                }
            }
        }

        private void MostrarMensaje(string msg, string clase)
        {
            pnlMensaje.Visible = true;
            pnlMensaje.CssClass = "alert " + clase;
            lblMensaje.Text = msg;
        }
    }
}
