using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text.RegularExpressions;

namespace GV_IA_Login
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void Inicio(object sender, EventArgs e)
        {
            string correo = CorreoElectronico.Text.Trim();
            string contrasena = Contraseña.Text;

            // Validación de campos vacíos
            if (string.IsNullOrEmpty(correo) || string.IsNullOrEmpty(contrasena))
            {
                lblMensaje.Text = "Por favor, completa todos los campos.";
                lblMensaje.Visible = true;
                return;
            }

            if (!Regex.IsMatch(correo, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                lblMensaje.Text = "Formato de correo electrónico no válido.";
                lblMensaje.Visible = true;
                return;
            }


            // Conexión segura y uso de stored procedure
            string Conectar = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;

            try
            {
                using (SqlConnection sqlConectar = new SqlConnection(Conectar))
                using (SqlCommand cmd = new SqlCommand("Sp_ValidarUsuario", sqlConectar))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@CorreoElectronico", SqlDbType.NVarChar, 50).Value = correo;
                    cmd.Parameters.Add("@Contraseña", SqlDbType.NVarChar, 50).Value = contrasena;

                    sqlConectar.Open();
                    using (SqlDataReader dr = cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            string contrasenaBD = dr["Contraseña"].ToString();

                            if (contrasenaBD == contrasena)
                            {
                                Response.Redirect("https://chatbot-gv-ia.vercel.app/");
                            }
                            else
                            {
                                lblMensaje.Text = "Contraseña incorrecta.";
                                lblMensaje.Visible = true;

                            }
                        }
                        else
                        {
                            lblMensaje.Text = "Correo electronico no encontrado";
                            lblMensaje.Visible = true;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error del servidor: " + ex.Message);
            }
        }

    }
}