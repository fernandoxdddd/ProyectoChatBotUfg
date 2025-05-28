<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="GV_IA_Login.WebForm2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Registro</title>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://kit.fontawesome.com/yourFontAwesomeKit.js" crossorigin="anonymous"></script> 
    <link href="Recursos/css/StyleSheet2.css" rel="stylesheet" />
</head>
<body>
    <!--Formulario de Registro-->
    <div class="form_registro">
        <form class="form_registro" runat="server" id="FormularioRegistro">
            <img src="Recursos/imagenes/logo.png" class="logo" alt="GV-IA">
            <h2>Registro</h2>

            <!-- Correo -->
            <div class="form_input">
                <label for="Correo">Correo Electrónico</label>
                <asp:TextBox runat="server" ID="CorreoElectronicoLogin" type="email" placeholder="Ingresa tu correo electrónico"></asp:TextBox>
                <img src="Recursos/imagenes/correo.png" alt="Correo">
            </div>

            <!-- Nombre -->
            <div class="form_input">
                <label for="Nombre">Nombre y Apellido</label>
                <asp:TextBox runat="server" ID="NombreYApellido" type="text" placeholder="Ingresa el nombre y apellido"></asp:TextBox>
                <img src="Recursos/imagenes/usuario.png" alt="Nombre">
            </div>

            <!-- Contraseña -->
            <div class="form_input">
                <label for="Contrasena_Register">Contraseña</label>
                <asp:TextBox runat="server" ID="Contraseña" type="password" placeholder="Ingresa la contraseña"></asp:TextBox>
                <img src="Recursos/imagenes/bloquear.png" alt="Contraseña">
            </div>

            <!-- Confirmar contraseña -->
            <div class="form_input">
                <label for="ConfirmarContrasena">Confirmar Contraseña</label>
                <asp:TextBox runat="server" ID="ConfirmarContraseña" type="password" placeholder="Confirma tu contraseña"></asp:TextBox>
                <img src="Recursos/imagenes/bloquear.png" alt="Confirmar Contraseña">
            </div>

            <!-- Área de mensajes -->
            <div class="mensaje-contenedor">
                <div class="mensaje-error">
                    <i class="fas fa-exclamation-triangle"></i>
                    <asp:Label runat="server" ID="LblError" Text=""></asp:Label>
                </div>
                <div class="mensaje-error">
                    <i class="fas fa-lock"></i>
                    <asp:Label runat="server" ID="LblErrorContraseña" Text=""></asp:Label>
                </div>
            </div>

            <!-- Botón -->
            <asp:Button runat="server" Text="Crear cuenta" class="btn" OnClick="CrearCuenta"/>

            <!--Boton Salida-->
            <asp:Button runat="server" Text="Regresar" class="btn"  Onclick="Regresar"  />
        </form>
    </div>
</body>
</html>

