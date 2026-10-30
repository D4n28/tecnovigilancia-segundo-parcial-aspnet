using System;
using System.Data;
using System.Data.SqlClient;

namespace SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios
{
    public partial class Catalogo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarProductos();
            }
        }

        private void CargarProductos()
        {
            string categoria = ddlFiltroCategoria.SelectedValue;
            string buscar = txtBuscar.Text.Trim();

            string query = "SELECT IdProducto, Nombre, Categoria, Tipo, Descripcion, Precio, Stock, ImagenUrl FROM Productos WHERE 1=1";

            if (!string.IsNullOrEmpty(categoria))
            {
                query += " AND Categoria = @cat";
            }
            if (!string.IsNullOrEmpty(buscar))
            {
                query += " AND (Nombre LIKE @bus OR Descripcion LIKE @bus OR Tipo LIKE @bus)";
            }

            query += " ORDER BY IdProducto ASC";

            SqlParameter[] param = new SqlParameter[]
            {
                new SqlParameter("@cat", (object)categoria ?? DBNull.Value),
                new SqlParameter("@bus", "%" + buscar + "%")
            };

            DataTable dt = ConexionBD.EjecutarConsulta(query, param);

            if (dt.Rows.Count > 0)
            {
                rptProductos.DataSource = dt;
                rptProductos.DataBind();
                rptProductos.Visible = true;
                lblSinResultados.Visible = false;
            }
            else
            {
                rptProductos.Visible = false;
                lblSinResultados.Visible = true;
            }
        }

        protected void ddlFiltroCategoria_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarProductos();
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarProductos();
        }
    }
}
