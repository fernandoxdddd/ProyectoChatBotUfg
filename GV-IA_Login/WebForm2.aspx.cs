using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services.Description;
using System.Text.RegularExpressions;

namespace GV_IA_Login
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LblError.Text = "";
            LblErrorContraseña.Text = "";
        }
        protected void CrearCuenta(object sender, EventArgs e)
        {
            // Limpiar mensajes previos
            LblError.Text = "";
            LblErrorContraseña.Text = "";

            // Validaciones básicas
            if (string.IsNullOrWhiteSpace(CorreoElectronicoLogin.Text) ||
                string.IsNullOrWhiteSpace(NombreYApellido.Text) ||
                string.IsNullOrWhiteSpace(Contraseña.Text) ||
                string.IsNullOrWhiteSpace(ConfirmarContraseña.Text))
            {
                LblError.Text = "Todos los campos son obligatorios.";
                return;
            }

            // Validar formato de correo electrónico
            if (!Regex.IsMatch(CorreoElectronicoLogin.Text, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                LblError.Text = "El correo electrónico no es válido.";
                return;
            }

            // Validar coincidencia de contraseñas
            if (Contraseña.Text != ConfirmarContraseña.Text)
            {
                LblErrorContraseña.Text = "Las contraseñas no coinciden, vuelve a intentarlo.";
                return;
            }

            // Validar longitud mínima de contraseña
            if (Contraseña.Text.Length < 8)
            {
                LblErrorContraseña.Text = "La contraseña debe tener al menos 8 caracteres.";
                return;
            }

            // Validar seguridad de contraseña (1 mayúscula, 1 minúscula, 1 número, 1 carácter especial)
            if (!Regex.IsMatch(Contraseña.Text, @"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).+$"))
            {
                LblErrorContraseña.Text = "La contraseña debe incluir mayúsculas, minúsculas, números y símbolos.";
                return;
            }

            try
            {
                string Conectar = ConfigurationManager.ConnectionStrings["Conexion"].ConnectionString;
                SqlConnection sqlConectar = new SqlConnection(Conectar);
                SqlCommand cmd = new SqlCommand("Sp_AgregarUsuario1", sqlConectar);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@correoElectronico", SqlDbType.NVarChar, 50).Value = CorreoElectronicoLogin.Text;
                cmd.Parameters.Add("@contraseña", SqlDbType.NVarChar, 50).Value = Contraseña.Text;
                cmd.Parameters.Add("@nombre_apellido", SqlDbType.NVarChar, 50).Value = NombreYApellido.Text;

                sqlConectar.Open();
                SqlDataReader dr = cmd.ExecuteReader();

                // Mensaje opcional de éxito
                LblError.Text = "Registro exitoso.";
            }
            catch (SqlException ex)
            {
                LblError.Text = "Error de base de datos: " + ex.Message;
            }
            catch (Exception ex)
            {
                LblError.Text = "Error inesperado: " + ex.Message;
            }
        }
        protected void Regresar(object sender, EventArgs e)
        {
            Response.Redirect("Index.aspx");

        }


    }
}