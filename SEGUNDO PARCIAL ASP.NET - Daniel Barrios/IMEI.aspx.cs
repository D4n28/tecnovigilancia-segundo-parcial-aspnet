using System;

namespace SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios
{
    public partial class IMEI : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAgendar_Click(object sender, EventArgs e)
        {
            lblImeiMensaje.Text = "Turno agendado con éxito. Un técnico revisará la disponibilidad de laboratorio.";
        }
    }
}
