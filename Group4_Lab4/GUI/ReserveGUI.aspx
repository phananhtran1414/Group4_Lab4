<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReserveGUI.aspx.cs" Inherits="Group4_Lab4.GUI.ReserveGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 406px;
        }
        .auto-style2 {
            width: 67px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <br />
        <h3 style="font-size: 2em;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Reserve Book <asp:Label ID="lblError" runat="server" ForeColor="#FF9999"></asp:Label></h3>

    <p>
        Borrower number:
        <asp:TextBox ID="txtBorrowerNumber" runat="server" Width="200px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Name:
        <asp:TextBox ID="txtName" runat="server" Width="200px" Enabled="False"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCheckMember" runat="server" OnClick="btnCheckMember_Click" Text="Check Member" Width="116px" />
    </p>
    <p>
        Book Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtBookNumber" runat="server" Width="200px" Enabled="False"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Title:&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtTitle" runat="server" Width="200px" Enabled="False"></asp:TextBox>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnChkCondition" runat="server" Text="CheckCondition" Width="117px" Enabled="False" OnClick="btnChkCondition_Click" />
    </p>
    <p>
        The number of reserved books:
        <asp:Label ID="txtTotal" runat="server" Text="0"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ForeColor="Black">
            <SelectedRowStyle BackColor="#FF9999" />
        </asp:GridView>
    </p>
    <p>
        Reserved Date:</p>
    <p>
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="400px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                        <DayStyle Width="14%" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#FF9999" ForeColor="White" />
                        <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                        <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                        <TodayDayStyle BackColor="#CCCC99" />
                    </asp:Calendar>
                </td>
                <td class="auto-style2">
                    <asp:Button ID="btnReserve" runat="server" Text="Reserve" OnClick="btnReserve_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
