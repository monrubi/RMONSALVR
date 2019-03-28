<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ListaPedidos.aspx.cs" Inherits="ListaPedidos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Lista de pedidos del cliente</title>
    <style type="text/css">
        #form1 {
            height: 651px;
        }
        .auto-style1 {
            width: 96%;
            z-index: 1;
            left: 21px;
            top: 369px;
            position: absolute;
            height: 28px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" style="background-color: #FFCC99">
    <div style="background-color: #FF9933; height: 624px;">
    
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" style="z-index: 1; left: 260px; top: 64px; position: absolute" Text="Información de los pedidos del cliente"></asp:Label>
        <asp:Table ID="TblUsuario" runat="server" GridLines="Both" style="z-index: 1; left: 266px; top: 112px; position: absolute; height: 54px; width: 364px">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">RFC</asp:TableCell>
                <asp:TableCell runat="server">Nombre</asp:TableCell>
                <asp:TableCell runat="server">Domicilio</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <asp:Label ID="Label2" runat="server" style="z-index: 1; left: 286px; top: 216px; position: absolute" Text="Pedidos:"></asp:Label>
        <asp:DropDownList ID="DdlPedidos" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DdlPedidos_SelectedIndexChanged" style="z-index: 1; left: 399px; top: 212px; position: absolute">
        </asp:DropDownList>
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Default.aspx" style="z-index: 1; left: 25px; top: 584px; position: absolute">Página inicial</asp:HyperLink>
        <asp:Table ID="TblPedido" runat="server" GridLines="Both" style="z-index: 1; left: 187px; top: 277px; position: absolute; height: 54px; width: 509px">
            <asp:TableRow runat="server">
                <asp:TableCell runat="server">Pedido</asp:TableCell>
                <asp:TableCell runat="server">Fecha</asp:TableCell>
                <asp:TableCell runat="server">Monto</asp:TableCell>
                <asp:TableCell runat="server">Saldo del cliente</asp:TableCell>
                <asp:TableCell runat="server">Saldo en facturas</asp:TableCell>
            </asp:TableRow>
            <asp:TableRow runat="server">
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
                <asp:TableCell runat="server"></asp:TableCell>
            </asp:TableRow>
        </asp:Table>
        <table class="auto-style1">
            <tr>
                <td>
                    <asp:GridView ID="GrdArtículos" runat="server">
                    </asp:GridView>
                </td>
                <td>
                    <asp:GridView ID="GrdPagos" runat="server">
                    </asp:GridView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
