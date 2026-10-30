using System;
using System.Data;
using System.Data.SqlClient;

namespace SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios
{
    public partial class CrearPedido : System.Web.UI.Page
    {
        private DataTable Carrito
        {
            get
            {
                if (Session["CarritoPedidos"] == null)
                {
                    DataTable dt = new DataTable();
                    dt.Columns.Add("IdProducto", typeof(int));
                    dt.Columns.Add("Nombre", typeof(string));
                    dt.Columns.Add("Precio", typeof(decimal));
                    dt.Columns.Add("Cantidad", typeof(int));
                    dt.Columns.Add("Subtotal", typeof(decimal), "Precio * Cantidad");
                    Session["CarritoPedidos"] = dt;
                }
                return (DataTable)Session["CarritoPedidos"];
            }
            set
            {
                Session["CarritoPedidos"] = value;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                CargarDatosCliente();
                CargarProductosCombo();

                if (Request.QueryString["idProd"] != null)
                {
                    string idProd = Request.QueryString["idProd"];
                    if (ddlProductos.Items.FindByValue(idProd) != null)
                    {
                        ddlProductos.SelectedValue = idProd;
                    }
                }

                ActualizarDetalleProductoSeleccionado();
                ActualizarGridCarrito();
            }
        }

        private void CargarDatosCliente()
        {
            lblNombreCliente.Text = Session["Nombre"] != null ? Session["Nombre"].ToString() : "";
            int idUsuario = Convert.ToInt32(Session["IdUsuario"]);

            string query = "SELECT IdCliente, Direccion, Ciudad FROM Clientes WHERE IdUsuario = @idU";
            SqlParameter[] param = { new SqlParameter("@idU", idUsuario) };
            DataTable dt = ConexionBD.EjecutarConsulta(query, param);

            if (dt.Rows.Count > 0)
            {
                Session["IdCliente"] = dt.Rows[0]["IdCliente"];
                lblDireccionCliente.Text = dt.Rows[0]["Direccion"].ToString() + " (" + dt.Rows[0]["Ciudad"].ToString() + ")";
            }
            else
            {
                lblDireccionCliente.Text = "No registrada";
            }
        }

        private void CargarProductosCombo()
        {
            string query = "SELECT IdProducto, Nombre + ' (' + Categoria + ')' AS Titulo FROM Productos WHERE Stock > 0 ORDER BY Nombre";
            DataTable dt = ConexionBD.EjecutarConsulta(query);

            ddlProductos.DataSource = dt;
            ddlProductos.DataTextField = "Titulo";
            ddlProductos.DataValueField = "IdProducto";
            ddlProductos.DataBind();
        }

        private void ActualizarDetalleProductoSeleccionado()
        {
            if (ddlProductos.SelectedValue != "")
            {
                int idProd = Convert.ToInt32(ddlProductos.SelectedValue);
                string query = "SELECT Precio, Stock FROM Productos WHERE IdProducto = @idP";
                SqlParameter[] param = { new SqlParameter("@idP", idProd) };
                DataTable dt = ConexionBD.EjecutarConsulta(query, param);

                if (dt.Rows.Count > 0)
                {
                    decimal precio = Convert.ToDecimal(dt.Rows[0]["Precio"]);
                    int stock = Convert.ToInt32(dt.Rows[0]["Stock"]);
                    lblPrecioUnitario.Text = "$" + string.Format("{0:N0}", precio) + " COP";
                    lblStock.Text = stock.ToString() + " unidades";
                }
            }
        }

        protected void ddlProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            ActualizarDetalleProductoSeleccionado();
        }

        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(ddlProductos.SelectedValue)) return;

            int idProd = Convert.ToInt32(ddlProductos.SelectedValue);
            int cant = 1;
            int.TryParse(txtCantidad.Text, out cant);
            if (cant <= 0) cant = 1;

            string query = "SELECT IdProducto, Nombre, Precio, Stock FROM Productos WHERE IdProducto = @idP";
            SqlParameter[] param = { new SqlParameter("@idP", idProd) };
            DataTable dtProd = ConexionBD.EjecutarConsulta(query, param);

            if (dtProd.Rows.Count > 0)
            {
                int stock = Convert.ToInt32(dtProd.Rows[0]["Stock"]);
                if (cant > stock)
                {
                    pnlMensaje.Visible = true;
                    pnlMensaje.CssClass = "alert alert-warning";
                    lblMensaje.Text = "La cantidad seleccionada supera el stock disponible (" + stock + ").";
                    return;
                }

                DataTable dtCarrito = Carrito;
                bool existe = false;
                foreach (DataRow fila in dtCarrito.Rows)
                {
                    if (Convert.ToInt32(fila["IdProducto"]) == idProd)
                    {
                        fila["Cantidad"] = Convert.ToInt32(fila["Cantidad"]) + cant;
                        existe = true;
                        break;
                    }
                }

                if (!existe)
                {
                    DataRow nr = dtCarrito.NewRow();
                    nr["IdProducto"] = idProd;
                    nr["Nombre"] = dtProd.Rows[0]["Nombre"].ToString();
                    nr["Precio"] = Convert.ToDecimal(dtProd.Rows[0]["Precio"]);
                    nr["Cantidad"] = cant;
                    dtCarrito.Rows.Add(nr);
                }

                Carrito = dtCarrito;
                ActualizarGridCarrito();
                pnlMensaje.Visible = false;
            }
        }

        private void ActualizarGridCarrito()
        {
            DataTable dt = Carrito;
            gvCarrito.DataSource = dt;
            gvCarrito.DataBind();

            decimal total = 0;
            foreach (DataRow fila in dt.Rows)
            {
                total += Convert.ToDecimal(fila["Subtotal"]);
            }
            lblTotalPedido.Text = "$" + string.Format("{0:N0}", total) + " COP";
        }

        protected void gvCarrito_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            if (e.CommandName == "QuitarItem")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                DataTable dt = Carrito;
                if (index >= 0 && index < dt.Rows.Count)
                {
                    dt.Rows.RemoveAt(index);
                    Carrito = dt;
                    ActualizarGridCarrito();
                }
            }
        }

        protected void btnLimpiarCarrito_Click(object sender, EventArgs e)
        {
            Carrito.Clear();
            ActualizarGridCarrito();
        }

        protected void btnConfirmarPedido_Click(object sender, EventArgs e)
        {
            DataTable dt = Carrito;
            if (dt.Rows.Count == 0)
            {
                pnlMensaje.Visible = true;
                pnlMensaje.CssClass = "alert alert-danger";
                lblMensaje.Text = "El pedido no contiene ningún producto. Por favor agregue al menos uno.";
                return;
            }

            int idCliente = Session["IdCliente"] != null ? Convert.ToInt32(Session["IdCliente"]) : 0;
            if (idCliente == 0)
            {
                pnlMensaje.Visible = true;
                pnlMensaje.CssClass = "alert alert-danger";
                lblMensaje.Text = "No se encontró el registro de cliente asociado a esta cuenta.";
                return;
            }

            decimal total = 0;
            foreach (DataRow fila in dt.Rows)
            {
                total += Convert.ToDecimal(fila["Subtotal"]);
            }

            string metodoPago = ddlMetodoPago.SelectedValue;

            try
            {
                // 1. Insertar Pedido
                string qPedido = "INSERT INTO Pedidos (IdCliente, Fecha, Total, Estado, MetodoPago) VALUES (@idCli, GETDATE(), @tot, 'Pendiente', @met); SELECT SCOPE_IDENTITY();";
                SqlParameter[] pPed = {
                    new SqlParameter("@idCli", idCliente),
                    new SqlParameter("@tot", total),
                    new SqlParameter("@met", metodoPago)
                };
                int idPedido = Convert.ToInt32(ConexionBD.EjecutarEscalar(qPedido, pPed));

                // 2. Insertar Detalle y descontar stock
                foreach (DataRow fila in dt.Rows)
                {
                    int idProd = Convert.ToInt32(fila["IdProducto"]);
                    int cant = Convert.ToInt32(fila["Cantidad"]);
                    decimal precio = Convert.ToDecimal(fila["Precio"]);

                    string qDetalle = "INSERT INTO DetallePedidos (IdPedido, IdProducto, Cantidad, PrecioUnitario) VALUES (@idP, @idPr, @cant, @pre);";
                    SqlParameter[] pDet = {
                        new SqlParameter("@idP", idPedido),
                        new SqlParameter("@idPr", idProd),
                        new SqlParameter("@cant", cant),
                        new SqlParameter("@pre", precio)
                    };
                    ConexionBD.EjecutarComando(qDetalle, pDet);

                    // Actualizar Stock
                    string qStock = "UPDATE Productos SET Stock = Stock - @cant WHERE IdProducto = @idPr";
                    SqlParameter[] pStock = {
                        new SqlParameter("@cant", cant),
                        new SqlParameter("@idPr", idProd)
                    };
                    ConexionBD.EjecutarComando(qStock, pStock);
                }

                // Limpiar carrito
                Carrito.Clear();

                // Redirigir a la factura del pedido generado
                Response.Redirect("Factura.aspx?idPedido=" + idPedido);
            }
            catch (Exception ex)
            {
                pnlMensaje.Visible = true;
                pnlMensaje.CssClass = "alert alert-danger";
                lblMensaje.Text = "Error al procesar el pedido: " + ex.Message;
            }
        }
    }
}
