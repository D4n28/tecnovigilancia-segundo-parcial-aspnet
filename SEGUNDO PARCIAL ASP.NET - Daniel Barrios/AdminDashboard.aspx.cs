using System;

namespace SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios
{
    public partial class AdminDashboard : System.Web.UI.Page
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
                CargarContadores();
            }
        }

        private void CargarContadores()
        {
            lblTotalEmpleados.Text = ConexionBD.EjecutarEscalar("SELECT COUNT(*) FROM Empleados").ToString();
            lblTotalClientes.Text = ConexionBD.EjecutarEscalar("SELECT COUNT(*) FROM Clientes").ToString();
            lblTotalProductos.Text = ConexionBD.EjecutarEscalar("SELECT COUNT(*) FROM Productos").ToString();
            lblTotalPedidos.Text = ConexionBD.EjecutarEscalar("SELECT COUNT(*) FROM Pedidos").ToString();
        }
    }
}
