<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReturnGUI.aspx.cs" Inherits="Group4_Lab4.GUI.ReturnGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 38px;
        }
        .auto-style2 {
            width: 588px;
        }
        .auto-style3 {
            width: 282px;
        }
        .auto-style4 {
            margin-left: 67px;
        }
        .auto-style5 {
            width: 100%;
            margin-left: 36px;
        }
        .auto-style6 {
            margin-left: 46px;
            margin-top: 9px;
        }
        .auto-style7 {
            width: 334px;
        }
        .auto-style8 {
            margin-left: 43px;
            height: 10px;
            margin-top: 28px;
        }
        .auto-style9 {
            width: 100%;
            margin-left: 24px;
            margin-top: 0px;
        }
        .auto-style10 {
            margin-left: 40px;
        }
        .auto-style11 {
            margin-left: 71px;
        }
        .auto-style12 {
            margin-left: 0px;
        }
        .auto-style13 {
            margin-left: 59px;
        }
        .auto-style14 {
            margin-left: 43px;
        }
        .auto-style15 {
            width: 334px;
            height: 30px;
        }
        .auto-style16 {
            height: 30px;
            width: 443px;
        }
        .auto-style17 {
            width: 443px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p style="font-size: large; font-weight: bold" class="auto-style10">
        Return a copy
        <asp:Label ID="lblError" runat="server" ForeColor="#FF9999"></asp:Label>
    </p>
    <p>
        <table class="auto-style5">
            <tr>
                <td class="auto-style3">Borrow number: </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtBorrowerNumber" runat="server" Height="16px" Width="190px"></asp:TextBox>
&nbsp;<asp:Button ID="btnCheckMember" runat="server" CssClass="auto-style1" Height="23px" Text="Check member..." Width="177px" OnClick="btnCheckMember_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">Name: </td>
                <td class="auto-style2">
                    <asp:TextBox ID="txtName" runat="server" Height="16px" Width="188px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </p>
    <p class="auto-style6">
        The number of borrowed copies:&nbsp;
    <asp:Label ID="lblNumBorrowedCopies" runat="server" Font-Names="Bradley Hand ITC" Font-Size="Larger" Text="0"></asp:Label>
    </p>
    <p class="auto-style13">
        <asp:GridView ID="GridView1" runat="server" Width="446px" CssClass="auto-style12"  AllowPaging="True" AllowSorting="True" DataKeyNames="ID" DataSourceID="ObjectDataSource1" ForeColor="Black" OnDataBound="GridView1_DataBound" PageSize="5">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
            </Columns>
            <SelectedRowStyle BackColor="#FF9999" />
        </asp:GridView>
    </p>
    <p class="auto-style4">
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetBorrowedCopiesNotReturned" TypeName="Group4_Lab4.DAL.ReturnDAO">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtBorrowerNumber" Name="borrowerNum" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </p>
    <p class="auto-style8">
        Return date:</p>
    <p class="auto-style4">
        <table class="auto-style9">
            <tr>
                <td class="auto-style7">
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="400px">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                        <DayStyle Width="14%" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#FF9999" ForeColor="Black" />
                        <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                        <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                        <TodayDayStyle BackColor="#CCCC99" />
                    </asp:Calendar>
                </td>
                <td class="auto-style17">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">Fine amount: </td>
                <td class="auto-style16">
                    <asp:TextBox ID="txtFineAmount" runat="server"></asp:TextBox>
                </td>
            </tr>

        </table>
    </p>
    <asp:Button ID="btnConfirm" runat="server" CssClass="auto-style11" Text="Confirm fine" Width="131px" OnClick="btnConfirm_Click" />
    <asp:Button ID="btnReturn" runat="server" CssClass="auto-style14" Text="Return" Width="106px" OnClick="btnReturn_Click" />
    <br />
</asp:Content>
