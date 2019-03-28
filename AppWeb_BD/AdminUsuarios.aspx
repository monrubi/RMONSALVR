<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AdminUsuarios.aspx.cs" Inherits="AdminUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Administración de usuarios</title>
    <style type="text/css">
        #form1 {
            height: 680px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-color: #FFCC99">
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtNombre" ErrorMessage="Dar Nombre" style="z-index: 1; left: 89px; position: absolute; width: 143px; bottom: 420px">*</asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtRFC" ErrorMessage="Dar formato: A0" Font-Bold="True" style="z-index: 1; left: 89px; top: 205px; position: absolute; width: 142px" ValidationExpression="\w\d">Dar formato: A0</asp:RegularExpressionValidator>
    <div style="background-color: #FFCC99; height: 641px; z-index: 1; left: 10px; top: 15px; position: absolute; width: 884px;">
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" style="z-index: 1; left: 226px; top: 34px; position: absolute; width: 279px" Text="Administración de usuarios"></asp:Label>
        <asp:Button ID="BtnAlta" runat="server" style="z-index: 1; left: 69px; top: 81px; position: absolute" Text="Alta de usuarios" OnClick="BtnAlta_Click" />
        <asp:Button ID="BtnBaja" runat="server" style="z-index: 1; left: 267px; top: 81px; position: absolute" Text="Baja de usuarios" OnClick="BtnBaja_Click" />
        <asp:Button ID="BtnCambio" runat="server" style="z-index: 1; left: 465px; top: 80px; position: absolute" Text="Cambio de datos" />
        <asp:TextBox ID="TxtRFC" runat="server" style="z-index: 1; left: 75px; top: 150px; position: absolute" Visible="False" >RFC</asp:TextBox>
        <asp:TextBox ID="TxtNombre" runat="server" style="z-index: 1; left: 74px; top: 226px; position: absolute" Visible="False">Nombre</asp:TextBox>
        <asp:TextBox ID="TxtPassw" runat="server" style="z-index: 1; left: 74px; top: 304px; position: absolute" Visible="False">Contraseña</asp:TextBox>
        <asp:DropDownList ID="DDLTipo" runat="server" style="z-index: 1; left: 73px; top: 360px; position: absolute" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="DDLTipo_SelectedIndexChanged">
            <asp:ListItem>Tipo de usuario</asp:ListItem>
            <asp:ListItem Value="Cli">Cliente</asp:ListItem>
            <asp:ListItem Value="Emp">Empleado</asp:ListItem>
            <asp:ListItem Value="Ger">Gerente</asp:ListItem>
        </asp:DropDownList>
        <asp:Label ID="LblMensaje" runat="server" style="z-index: 1; left: 71px; top: 410px; position: absolute" Text="Operación: en espera"></asp:Label>
        <asp:DropDownList ID="DDLUsuarios" runat="server" style="z-index: 1; left: 269px; top: 149px; position: absolute" Visible="False" AutoPostBack="True" OnSelectedIndexChanged="DDLUsuarios_SelectedIndexChanged">
        </asp:DropDownList>
        <asp:TextBox ID="TxtDomicilio" runat="server" style="z-index: 1; left: 270px; top: 198px; position: absolute; width: 131px" Visible="False">Domicilio</asp:TextBox>
        <asp:TextBox ID="TxtCat" runat="server" style="z-index: 1; left: 269px; top: 254px; position: absolute" Visible="False" Enabled="False">Categoría</asp:TextBox>
        <asp:Button ID="BtnEjecuta" runat="server" Enabled="False" OnClick="BtnEjecuta_Click" style="z-index: 1; left: 471px; top: 296px; position: absolute" Text="Ejecutar operación" ValidationGroup="AllValidators)" />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" style="z-index: 1; left: 474px; top: 355px; position: absolute">Página inicial</asp:HyperLink>
    
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TxtDomicilio" ErrorMessage="Valor: [1,10]" MaximumValue="10" MinimumValue="1" style="z-index: 1; left: 441px; top: 198px; position: absolute" Type="Integer" Visible="False"></asp:RangeValidator>
    
    </div>
    </form>
</body>
</html>
