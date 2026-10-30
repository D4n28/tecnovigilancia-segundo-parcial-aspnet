using System;

namespace SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios
{
    public partial class SVC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCalcular_Click(object sender, EventArgs e)
        {
            lblSvcMensaje.Text = "Cotización de vigilancia calculada. Soporte técnico de Barranquilla enviará la propuesta técnica.";
        }
    }
}
