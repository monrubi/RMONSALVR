<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Aplicación de Pedidos-Clientes</title>
    <style type="text/css">
        #form1 {
            height: 641px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-color: #FF9933">
    <div style="background-color: #FF9966; height: 615px;">
    
        <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" style="z-index: 1; left: 261px; top: 101px; position: absolute; height: 147px; width: 342px">
        </asp:Login>
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    
    </div>
    </form>
</body>
</html>
