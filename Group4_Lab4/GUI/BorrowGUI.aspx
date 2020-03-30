<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BorrowGUI.aspx.cs" Inherits="Group4_Lab4.GUI.BorrowGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style7 {
            width: 420px;
        }
        .auto-style8 {
            width: 122px;
        }
        .auto-style9 {
            width: 198px;
        }
        .auto-style10 {
            width: 212px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Borrow a copy" Width="100px"></asp:Label>
    <asp:Label ID="lblError" runat="server" Font-Bold="True" Font-Size="Large" ForeColor="#FF9999" Width="1000px"></asp:Label>
    <br />
    <table style="width:100%;">
        <tr>
            <td class="auto-style9">
    <asp:Label ID="Label2" runat="server" Text="Borrower Number:"></asp:Label>
            </td>
            <td class="auto-style10">
    <asp:TextBox ID="txtBorrowerNumber" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnCheckMember" runat="server" OnClick="btnCheck_Click" Text="Check member" />
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
    <asp:Label ID="Label3" runat="server" Text="Name:"></asp:Label>
    
            </td>
            <td class="auto-style10">
    
    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">
    <asp:Label ID="Label4" runat="server" Text="Copy Number:"></asp:Label>
            </td>
            <td class="auto-style10">
    <asp:TextBox ID="txtCopyNumber" runat="server"></asp:TextBox>
            </td>
            <td>
                <asp:Button ID="btnCheckConditionCopy" runat="server" Text="Check Condition" OnClick="btnCheckConditionCopy_Click" />
            </td>
        </tr>
    </table>
    <br />
    <asp:Label ID="Label5" runat="server" Text="The numbers of borrowed copy:"></asp:Label>
    <asp:Label ID="lblNumberCopy" runat="server" Text="0"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" DataSourceID="ObjectDataSource1" Height="173px" OnDataBound="GridView1_DataBound" Width="536px">
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetBorrowedCopies" TypeName="Group4_Lab4.DAL.BorrowDAO">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtBorrowerNumber" Name="borrowerNum" PropertyName="Text" Type="Int32" />
        </SelectParameters>
    </asp:ObjectDataSource>
    <br />
    <table style="width:100%;">
        <tr>
            <td class="auto-style7">
                <asp:Label ID="Label6" runat="server" Text="Borrowed Date:"></asp:Label>
            </td>
            <td class="auto-style8">Due date:</td>
            <td>
                <asp:TextBox ID="txtDueDate" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">
                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" DayNameFormat="Shortest" Font-Names="Times New Roman" Font-Size="10pt" ForeColor="Black" Height="220px" NextPrevFormat="FullMonth" TitleFormat="Month" Width="400px" OnSelectionChanged="Calendar1_SelectionChanged">
                    <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" ForeColor="#333333" Height="10pt" />
                    <DayStyle Width="14%" />
                    <NextPrevStyle Font-Size="8pt" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#CC3333" ForeColor="White" />
                    <SelectorStyle BackColor="#CCCCCC" Font-Bold="True" Font-Names="Verdana" Font-Size="8pt" ForeColor="#333333" Width="1%" />
                    <TitleStyle BackColor="Black" Font-Bold="True" Font-Size="13pt" ForeColor="White" Height="14pt" />
                    <TodayDayStyle BackColor="#CCCC99" />
                </asp:Calendar>
            </td>
            <td class="auto-style8">
                <asp:Button ID="btnBorrow" runat="server" OnClick="Button1_Click" Text="Borrow" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style7">&nbsp;</td>
            <td class="auto-style8">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
