using System;
using System.Data;
using System.Data.SqlClient;

namespace SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios
{
    public partial class AdminEmpleados : System.Web.UI.Page
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
                CargarEmpleados();
            }
        }

        private void CargarEmpleados(string filtro = "")
        {
            string query = "SELECT IdEmpleado, Cedula, Nombres, Apellidos, Cargo, Telefono, Correo FROM Empleados";
            SqlParameter[] param = null;

            if (!string.IsNullOrEmpty(filtro))
            {
                query += " WHERE Nombres LIKE @f OR Apellidos LIKE @f OR Cedula LIKE @f";
                param = new SqlParameter[] { new SqlParameter("@f", "%" + filtro + "%") };
            }

            query += " ORDER BY IdEmpleado DESC";
            DataTable dt = ConexionBD.EjecutarConsulta(query, param);
            gvEmpleados.DataSource = dt;
            gvEmpleados.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarEmpleados(txtBuscar.Text.Trim());
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int idEmpleado = Convert.ToInt32(hfIdEmpleado.Value);
            string cedula = txtCedula.Text.Trim();
            string nombres = txtNombres.Text.Trim();
            string apellidos = txtApellidos.Text.Trim();
            string cargo = ddlCargo.SelectedValue;
            string telefono = txtTelefono.Text.Trim();
            string correo = txtCorreo.Text.Trim();

            try
            {
                if (idEmpleado == 0)
                {
                    // Crear nuevo empleado
                    string query = "INSERT INTO Empleados (Cedula, Nombres, Apellidos, Cargo, Telefono, Correo) VALUES (@ced, @nom, @ape, @car, @tel, @cor)";
                    SqlParameter[] param = {
                        new SqlParameter("@ced", cedula),
                        new SqlParameter("@nom", nombres),
                        new SqlParameter("@ape", apellidos),
                        new SqlParameter("@car", cargo),
                        new SqlParameter("@tel", telefono),
                        new SqlParameter("@cor", correo)
                    };
                    ConexionBD.EjecutarComando(query, param);
                    MostrarMensaje("Empleado registrado exitosamente.", "alert-success");
                }
                else
                {
                    // Actualizar empleado existente
                    string query = "UPDATE Empleados SET Cedula = @ced, Nombres = @nom, Apellidos = @ape, Cargo = @car, Telefono = @tel, Correo = @cor WHERE IdEmpleado = @id";
                    SqlParameter[] param = {
                        new SqlParameter("@id", idEmpleado),
                        new SqlParameter("@ced", cedula),
                        new SqlParameter("@nom", nombres),
                        new SqlParameter("@ape", apellidos),
                        new SqlParameter("@car", cargo),
                        new SqlParameter("@tel", telefono),
                        new SqlParameter("@cor", correo)
                    };
                    ConexionBD.EjecutarComando(query, param);
                    MostrarMensaje("Datos del empleado actualizados exitosamente.", "alert-success");
                }

                LimpiarFormulario();
                CargarEmpleados();
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al guardar: " + ex.Message, "alert-danger");
            }
        }

        protected void gvEmpleados_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int idEmpleado = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditarEmpleado")
            {
                string query = "SELECT IdEmpleado, Cedula, Nombres, Apellidos, Cargo, Telefono, Correo FROM Empleados WHERE IdEmpleado = @id";
                SqlParameter[] param = { new SqlParameter("@id", idEmpleado) };
                DataTable dt = ConexionBD.EjecutarConsulta(query, param);

                if (dt.Rows.Count > 0)
                {
                    DataRow r = dt.Rows[0];
                    hfIdEmpleado.Value = r["IdEmpleado"].ToString();
                    txtCedula.Text = r["Cedula"].ToString();
                    txtNombres.Text = r["Nombres"].ToString();
                    txtApellidos.Text = r["Apellidos"].ToString();
                    if (ddlCargo.Items.FindByValue(r["Cargo"].ToString()) != null)
                    {
                        ddlCargo.SelectedValue = r["Cargo"].ToString();
                    }
                    txtTelefono.Text = r["Telefono"].ToString();
                    txtCorreo.Text = r["Correo"].ToString();

                    lblTituloForm.Text = "Editar Empleado #" + idEmpleado;
                    btnGuardar.Text = "Actualizar Cambios";
                }
            }
            else if (e.CommandName == "EliminarEmpleado")
            {
                try
                {
                    string query = "DELETE FROM Empleados WHERE IdEmpleado = @id";
                    SqlParameter[] param = { new SqlParameter("@id", idEmpleado) };
                    ConexionBD.EjecutarComando(query, param);
                    MostrarMensaje("Empleado eliminado correctamente.", "alert-success");
                    CargarEmpleados();
                }
                catch (Exception ex)
                {
                    MostrarMensaje("No se pudo eliminar el empleado: " + ex.Message, "alert-danger");
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
        }

        private void LimpiarFormulario()
        {
            hfIdEmpleado.Value = "0";
            txtCedula.Text = "";
            txtNombres.Text = "";
            txtApellidos.Text = "";
            txtTelefono.Text = "";
            txtCorreo.Text = "";
            lblTituloForm.Text = "Registrar Nuevo Empleado";
            btnGuardar.Text = "Guardar Empleado";
        }

        private void MostrarMensaje(string msg, string clase)
        {
            pnlMensaje.Visible = true;
            pnlMensaje.CssClass = "alert " + clase;
            lblMensaje.Text = msg;
        }
    }
}
