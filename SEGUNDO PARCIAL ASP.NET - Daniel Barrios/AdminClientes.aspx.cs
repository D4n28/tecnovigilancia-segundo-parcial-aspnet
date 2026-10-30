using System;
using System.Data;
using System.Data.SqlClient;

namespace SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios
{
    public partial class AdminClientes : System.Web.UI.Page
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
                CargarClientes();
            }
        }

        private void CargarClientes(string filtro = "")
        {
            string query = "SELECT IdCliente, Cedula, Nombres, Apellidos, Telefono, Direccion, Ciudad FROM Clientes";
            SqlParameter[] param = null;

            if (!string.IsNullOrEmpty(filtro))
            {
                query += " WHERE Nombres LIKE @f OR Apellidos LIKE @f OR Cedula LIKE @f";
                param = new SqlParameter[] { new SqlParameter("@f", "%" + filtro + "%") };
            }

            query += " ORDER BY IdCliente DESC";
            DataTable dt = ConexionBD.EjecutarConsulta(query, param);
            gvClientes.DataSource = dt;
            gvClientes.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarClientes(txtBuscar.Text.Trim());
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int idCliente = Convert.ToInt32(hfIdCliente.Value);
            string cedula = txtCedula.Text.Trim();
            string nombres = txtNombres.Text.Trim();
            string apellidos = txtApellidos.Text.Trim();
            string telefono = txtTelefono.Text.Trim();
            string direccion = txtDireccion.Text.Trim();
            string ciudad = txtCiudad.Text.Trim();

            try
            {
                if (idCliente == 0)
                {
                    // Crear nuevo cliente
                    string query = "INSERT INTO Clientes (Cedula, Nombres, Apellidos, Telefono, Direccion, Ciudad) VALUES (@ced, @nom, @ape, @tel, @dir, @ciu)";
                    SqlParameter[] param = {
                        new SqlParameter("@ced", cedula),
                        new SqlParameter("@nom", nombres),
                        new SqlParameter("@ape", apellidos),
                        new SqlParameter("@tel", telefono),
                        new SqlParameter("@dir", direccion),
                        new SqlParameter("@ciu", ciudad)
                    };
                    ConexionBD.EjecutarComando(query, param);
                    MostrarMensaje("Cliente registrado correctamente.", "alert-success");
                }
                else
                {
                    // Actualizar cliente
                    string query = "UPDATE Clientes SET Cedula = @ced, Nombres = @nom, Apellidos = @ape, Telefono = @tel, Direccion = @dir, Ciudad = @ciu WHERE IdCliente = @id";
                    SqlParameter[] param = {
                        new SqlParameter("@id", idCliente),
                        new SqlParameter("@ced", cedula),
                        new SqlParameter("@nom", nombres),
                        new SqlParameter("@ape", apellidos),
                        new SqlParameter("@tel", telefono),
                        new SqlParameter("@dir", direccion),
                        new SqlParameter("@ciu", ciudad)
                    };
                    ConexionBD.EjecutarComando(query, param);
                    MostrarMensaje("Datos del cliente actualizados exitosamente.", "alert-success");
                }

                LimpiarFormulario();
                CargarClientes();
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al guardar cliente: " + ex.Message, "alert-danger");
            }
        }

        protected void gvClientes_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int idCliente = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditarCliente")
            {
                string query = "SELECT IdCliente, Cedula, Nombres, Apellidos, Telefono, Direccion, Ciudad FROM Clientes WHERE IdCliente = @id";
                SqlParameter[] param = { new SqlParameter("@id", idCliente) };
                DataTable dt = ConexionBD.EjecutarConsulta(query, param);

                if (dt.Rows.Count > 0)
                {
                    DataRow r = dt.Rows[0];
                    hfIdCliente.Value = r["IdCliente"].ToString();
                    txtCedula.Text = r["Cedula"].ToString();
                    txtNombres.Text = r["Nombres"].ToString();
                    txtApellidos.Text = r["Apellidos"].ToString();
                    txtTelefono.Text = r["Telefono"].ToString();
                    txtDireccion.Text = r["Direccion"].ToString();
                    txtCiudad.Text = r["Ciudad"].ToString();

                    lblTituloForm.Text = "Editar Cliente #" + idCliente;
                    btnGuardar.Text = "Actualizar Cambios";
                }
            }
            else if (e.CommandName == "EliminarCliente")
            {
                try
                {
                    string query = "DELETE FROM Clientes WHERE IdCliente = @id";
                    SqlParameter[] param = { new SqlParameter("@id", idCliente) };
                    ConexionBD.EjecutarComando(query, param);
                    MostrarMensaje("Cliente eliminado correctamente.", "alert-success");
                    CargarClientes();
                }
                catch (Exception ex)
                {
                    MostrarMensaje("No se pudo eliminar el cliente (puede tener pedidos vinculados): " + ex.Message, "alert-danger");
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
        }

        private void LimpiarFormulario()
        {
            hfIdCliente.Value = "0";
            txtCedula.Text = "";
            txtNombres.Text = "";
            txtApellidos.Text = "";
            txtTelefono.Text = "";
            txtDireccion.Text = "";
            txtCiudad.Text = "Barranquilla";
            lblTituloForm.Text = "Registrar / Editar Cliente";
            btnGuardar.Text = "Guardar Cliente";
        }

        private void MostrarMensaje(string msg, string clase)
        {
            pnlMensaje.Visible = true;
            pnlMensaje.CssClass = "alert " + clase;
            lblMensaje.Text = msg;
        }
    }
}
