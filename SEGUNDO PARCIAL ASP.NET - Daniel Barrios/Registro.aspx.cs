using System;
using System.Data.SqlClient;

namespace SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios
{
    public partial class Registro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            string cedula = txtCedula.Text.Trim();
            string nombres = txtNombres.Text.Trim();
            string apellidos = txtApellidos.Text.Trim();
            string telefono = txtTelefono.Text.Trim();
            string direccion = txtDireccion.Text.Trim();
            string ciudad = txtCiudad.Text.Trim();
            string correo = txtCorreo.Text.Trim();
            string clave = txtClave.Text.Trim();

            // Verificar si el correo ya existe
            string qCheck = "SELECT COUNT(*) FROM Usuarios WHERE Correo = @cor";
            SqlParameter[] pCheck = { new SqlParameter("@cor", correo) };
            int countUser = Convert.ToInt32(ConexionBD.EjecutarEscalar(qCheck, pCheck));

            if (countUser > 0)
            {
                pnlAlerta.CssClass = "alert alert-danger small mb-3";
                pnlAlerta.Visible = true;
                lblAlerta.Text = "El correo ya se encuentra registrado. Utilice otro correo o inicie sesión.";
                return;
            }

            try
            {
                // 1. Insertar Usuario
                string qUser = "INSERT INTO Usuarios (Nombre, Correo, Clave, Rol) VALUES (@nom, @cor, @cla, 'Cliente'); SELECT SCOPE_IDENTITY();";
                SqlParameter[] pUser = {
                    new SqlParameter("@nom", nombres + " " + apellidos),
                    new SqlParameter("@cor", correo),
                    new SqlParameter("@cla", clave)
                };
                int idUsuario = Convert.ToInt32(ConexionBD.EjecutarEscalar(qUser, pUser));

                // 2. Insertar Cliente asociado
                string qCliente = "INSERT INTO Clientes (IdUsuario, Cedula, Nombres, Apellidos, Telefono, Direccion, Ciudad) VALUES (@idU, @ced, @nom, @ape, @tel, @dir, @ciu); SELECT SCOPE_IDENTITY();";
                SqlParameter[] pCli = {
                    new SqlParameter("@idU", idUsuario),
                    new SqlParameter("@ced", cedula),
                    new SqlParameter("@nom", nombres),
                    new SqlParameter("@ape", apellidos),
                    new SqlParameter("@tel", telefono),
                    new SqlParameter("@dir", direccion),
                    new SqlParameter("@ciu", ciudad)
                };
                int idCliente = Convert.ToInt32(ConexionBD.EjecutarEscalar(qCliente, pCli));

                // Iniciar Sesión Automáticamente
                Session["Usuario"] = correo;
                Session["IdUsuario"] = idUsuario;
                Session["IdCliente"] = idCliente;
                Session["Nombre"] = nombres + " " + apellidos;
                Session["Rol"] = "Cliente";

                Response.Redirect("Catalogo.aspx");
            }
            catch (Exception ex)
            {
                pnlAlerta.CssClass = "alert alert-danger small mb-3";
                pnlAlerta.Visible = true;
                lblAlerta.Text = "Error al registrar cliente: " + ex.Message;
            }
        }
    }
}
