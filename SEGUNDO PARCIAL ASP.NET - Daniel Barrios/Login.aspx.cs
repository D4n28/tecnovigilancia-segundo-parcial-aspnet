using System;
using System.Data;
using System.Data.SqlClient;

namespace SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Usuario"] != null)
                {
                    RedireccionarSegunRol();
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string correo = txtCorreo.Text.Trim();
            string clave = txtClave.Text.Trim();

            string query = "SELECT IdUsuario, Nombre, Correo, Rol FROM Usuarios WHERE Correo = @cor AND Clave = @cla";
            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@cor", correo),
                new SqlParameter("@cla", clave)
            };

            DataTable dt = ConexionBD.EjecutarConsulta(query, param);

            if (dt.Rows.Count > 0)
            {
                int idUsuario = Convert.ToInt32(dt.Rows[0]["IdUsuario"]);
                string nombre = dt.Rows[0]["Nombre"].ToString();
                string rol = dt.Rows[0]["Rol"].ToString();

                Session["Usuario"] = correo;
                Session["IdUsuario"] = idUsuario;
                Session["Nombre"] = nombre;
                Session["Rol"] = rol;

                // Si es cliente, obtener su IdCliente
                if (rol == "Cliente")
                {
                    string qCliente = "SELECT IdCliente FROM Clientes WHERE IdUsuario = @idUser";
                    SqlParameter[] pCli = { new SqlParameter("@idUser", idUsuario) };
                    object resCliente = ConexionBD.EjecutarEscalar(qCliente, pCli);
                    if (resCliente != null && resCliente != DBNull.Value)
                    {
                        Session["IdCliente"] = Convert.ToInt32(resCliente);
                    }
                }

                RedireccionarSegunRol();
            }
            else
            {
                pnlError.Visible = true;
                lblError.Text = "Correo o contraseña incorrectos. Verifique sus credenciales.";
            }
        }

        private void RedireccionarSegunRol()
        {
            string rol = Session["Rol"] != null ? Session["Rol"].ToString() : "";
            if (rol == "Admin")
            {
                Response.Redirect("AdminDashboard.aspx");
            }
            else
            {
                Response.Redirect("Catalogo.aspx");
            }
        }
    }
}
