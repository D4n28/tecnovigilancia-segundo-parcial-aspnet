using System;

namespace SEGUNDO_PARCIAL_ASP.NET___Daniel_Barrios
{
    public partial class ALARMAS : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnCotizar_Click(object sender, EventArgs e)
        {
            lblMensaje.Text = "¡Solicitud recibida! Un técnico de TecnoVigilancia en Parque Central se comunicará a la brevedad.";
        }
    }
}
