<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="GV_IA_Login.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<!DOCTYPE html>
<html lang="es">
<link href="Recursos/css/StyleSheet1.css" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Gv-Ia</title>
</head>
<body>
    <script src="Recursos/JavaScript/JavaScript.js"></script>
    <div class="main-container">
    <div class="content">
        <h1>Bienvenido a GV-IA</h1>
    <p>
        Tu asistente inteligente para acceder fácilmente a toda la información académica.
        GV-IA funciona como un asistente virtual inteligente, capaz de comunicarse en lenguaje natural, comprender consultas diversas y ofrecer respuestas inmediatas las 24 horas del día. Su objetivo principal es facilitar el acceso a la información académica y administrativa, optimizando los tiempos de atención y reduciendo la carga operativa de oficinas y departamentos. Desde consultas sobre horarios de clases, procesos de matrícula, becas, estados de cuenta y trámites estudiantiles, hasta apoyo para docentes en la gestión de sus cursos y comunicaciones con sus grupos, GV-IA ofrece soluciones ágiles, seguras y personalizadas. Estoy aquí para ayudarte
    </p>
    </div>
    <form ID="FormularioLogin" runat="server">
        <img src="Recursos/Imagenes/Logo.png"Logo" class="logo" alt"Logo" />
    <h2>Iniciar Sesion</h2>
    <!--Correo-->
    <div class="form_input">
        <label for="CorreoElectronico">Correo Electronico</label>
    <div class="input_correo">
        <asp:TextBox ID="CorreoElectronico" runat="server" placeholder="Ingrese su correo"></asp:TextBox>
        <img src="Recursos/Imagenes/Correo.png" alt="Correo" class="correo"/>
    </div>
    </div>
    <!--Contraseña-->
    <div class="form_input">
        <label  for="Contraseña">Contraseña</label>
    <div for="Contraseña" class="input_contraseña">
        <asp:TextBox ID="Contraseña" runat="server" TextMode="Password" placeHolder="Ingrese su contraseña"></asp:TextBox>
        <img src="Recursos/Imagenes/Bloquear.png" alt="Contraña" class="bloquear"/>
    </div>
    <div>
        <asp:Button ID="IniciarSesion" runat="server" Text="Iniciar Sesion" OnClick="Inicio" class="button" />

    </div>
    </div>
    <div class="registrar">
        <p>¿No tienes cuenta? <a id="Registrate" href="Webform2.aspx">Registrate</a></p>
    </div>
    <asp:Label ID="lblMensaje" runat="server" Visible="false" >
    <div id="alerta" class="alerta-error" runat="server">
        <i class="fas fa-exclamation-circle"></i>
        <span id="lblTexto" runat="server"></span>
    </div>
</asp:Label>
    </form>
    </div>
</body>
</html>

