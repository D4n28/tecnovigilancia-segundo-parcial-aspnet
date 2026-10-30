using System;
using System.Data;
using System.Data.SqlClient;

namespace SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios
{
    public partial class AdminProductos : System.Web.UI.Page
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
                CargarProductos();
            }
        }

        private void CargarProductos(string filtro = "")
        {
            string query = "SELECT IdProducto, Nombre, Categoria, Tipo, Descripcion, Precio, Stock, ImagenUrl FROM Productos";
            SqlParameter[] param = null;

            if (!string.IsNullOrEmpty(filtro))
            {
                query += " WHERE Nombre LIKE @f OR Tipo LIKE @f OR Categoria LIKE @f";
                param = new SqlParameter[] { new SqlParameter("@f", "%" + filtro + "%") };
            }

            query += " ORDER BY IdProducto DESC";
            DataTable dt = ConexionBD.EjecutarConsulta(query, param);
            gvProductos.DataSource = dt;
            gvProductos.DataBind();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarProductos(txtBuscar.Text.Trim());
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int idProducto = Convert.ToInt32(hfIdProducto.Value);
            string nombre = txtNombre.Text.Trim();
            string categoria = ddlCategoria.SelectedValue;
            string tipo = txtTipo.Text.Trim();
            decimal precio = 0;
            decimal.TryParse(txtPrecio.Text, out precio);
            int stock = 0;
            int.TryParse(txtStock.Text, out stock);
            string descripcion = txtDescripcion.Text.Trim();
            string imagenUrl = txtImagenUrl.Text.Trim();

            if (string.IsNullOrEmpty(imagenUrl))
            {
                imagenUrl = "https://images.unsplash.com/photo-1557597774-9d273605dfa9?w=500&auto=format&fit=crop&q=60";
            }

            try
            {
                if (idProducto == 0)
                {
                    // Crear nuevo producto
                    string query = "INSERT INTO Productos (Nombre, Categoria, Tipo, Descripcion, Precio, Stock, ImagenUrl) VALUES (@nom, @cat, @tip, @des, @pre, @stk, @img)";
                    SqlParameter[] param = {
                        new SqlParameter("@nom", nombre),
                        new SqlParameter("@cat", categoria),
                        new SqlParameter("@tip", tipo),
                        new SqlParameter("@des", descripcion),
                        new SqlParameter("@pre", precio),
                        new SqlParameter("@stk", stock),
                        new SqlParameter("@img", imagenUrl)
                    };
                    ConexionBD.EjecutarComando(query, param);
                    MostrarMensaje("Producto registrado con éxito.", "alert-success");
                }
                else
                {
                    // Actualizar producto
                    string query = "UPDATE Productos SET Nombre = @nom, Categoria = @cat, Tipo = @tip, Descripcion = @des, Precio = @pre, Stock = @stk, ImagenUrl = @img WHERE IdProducto = @id";
                    SqlParameter[] param = {
                        new SqlParameter("@id", idProducto),
                        new SqlParameter("@nom", nombre),
                        new SqlParameter("@cat", categoria),
                        new SqlParameter("@tip", tipo),
                        new SqlParameter("@des", descripcion),
                        new SqlParameter("@pre", precio),
                        new SqlParameter("@stk", stock),
                        new SqlParameter("@img", imagenUrl)
                    };
                    ConexionBD.EjecutarComando(query, param);
                    MostrarMensaje("Producto actualizado con éxito.", "alert-success");
                }

                LimpiarFormulario();
                CargarProductos();
            }
            catch (Exception ex)
            {
                MostrarMensaje("Error al guardar producto: " + ex.Message, "alert-danger");
            }
        }

        protected void gvProductos_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int idProducto = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditarProducto")
            {
                string query = "SELECT IdProducto, Nombre, Categoria, Tipo, Descripcion, Precio, Stock, ImagenUrl FROM Productos WHERE IdProducto = @id";
                SqlParameter[] param = { new SqlParameter("@id", idProducto) };
                DataTable dt = ConexionBD.EjecutarConsulta(query, param);

                if (dt.Rows.Count > 0)
                {
                    DataRow r = dt.Rows[0];
                    hfIdProducto.Value = r["IdProducto"].ToString();
                    txtNombre.Text = r["Nombre"].ToString();
                    if (ddlCategoria.Items.FindByValue(r["Categoria"].ToString()) != null)
                    {
                        ddlCategoria.SelectedValue = r["Categoria"].ToString();
                    }
                    txtTipo.Text = r["Tipo"].ToString();
                    txtPrecio.Text = Convert.ToInt64(Convert.ToDecimal(r["Precio"])).ToString();
                    txtStock.Text = r["Stock"].ToString();
                    txtDescripcion.Text = r["Descripcion"].ToString();
                    txtImagenUrl.Text = r["ImagenUrl"].ToString();

                    lblTituloForm.Text = "Editar Producto #" + idProducto;
                    btnGuardar.Text = "Actualizar Producto";
                }
            }
            else if (e.CommandName == "EliminarProducto")
            {
                try
                {
                    string query = "DELETE FROM Productos WHERE IdProducto = @id";
                    SqlParameter[] param = { new SqlParameter("@id", idProducto) };
                    ConexionBD.EjecutarComando(query, param);
                    MostrarMensaje("Producto eliminado de inventario.", "alert-success");
                    CargarProductos();
                }
                catch (Exception ex)
                {
                    MostrarMensaje("No se pudo eliminar el producto (puede estar incluido en un pedido previo): " + ex.Message, "alert-danger");
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            LimpiarFormulario();
        }

        private void LimpiarFormulario()
        {
            hfIdProducto.Value = "0";
            txtNombre.Text = "";
            txtTipo.Text = "";
            txtPrecio.Text = "";
            txtStock.Text = "10";
            txtDescripcion.Text = "";
            txtImagenUrl.Text = "";
            lblTituloForm.Text = "Registrar Nuevo Producto";
            btnGuardar.Text = "Guardar Producto";
        }

        private void MostrarMensaje(string msg, string clase)
        {
            pnlMensaje.Visible = true;
            pnlMensaje.CssClass = "alert " + clase;
            lblMensaje.Text = msg;
        }
    }
}
