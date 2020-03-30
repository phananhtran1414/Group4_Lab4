<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BorrowerGUI.aspx.cs" Inherits="Group4_Lab4.GUI.BorrowerGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style5 {
            width: 18px;
        }
        .auto-style6 {
            width: 108px;
            margin-left: 65px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="list_mem"><b>List of members</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblError" runat="server" ForeColor="#FF9999"></asp:Label>
    </p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    The number of members:&nbsp;
    <asp:Label ID="lblNumOfMem" runat="server" Font-Names="Bradley Hand ITC" Font-Size="Larger" Text="0"></asp:Label>
    <br />
    <table style="width:100%;">
        <tr>
            <td rowspan="7">
                <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AllowSorting="True" DataKeyNames="borrowerNumber" DataSourceID="ObjectDataSource2" ForeColor="Black" OnDataBound="GridView2_DataBound1" OnSelectedIndexChanged="GridView2_SelectedIndexChanged1">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                    </Columns>
                    <SelectedRowStyle BackColor="#FF9999" />
                </asp:GridView>
        <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" DataObjectTypeName="Group4_Lab4.DTL.Borrower" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetDataTableBorrower" TypeName="Group4_Lab4.DAL.BorrowerDAO" UpdateMethod="Update"></asp:ObjectDataSource>
            </td>
        </tr>
        <td class="auto-style1"></td>
        <tr>
            
            <td class="auto-style5">Name</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtName" runat="server" Width="147px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ErrorMessage="Name required!"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Sex</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtSex" runat="server" Width="147px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtSex" ErrorMessage="Sex required!"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtSex" ErrorMessage="F or M" ForeColor="Black" ValidationExpression="[FMfm]"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Address</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtAddress" runat="server" Width="147px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Telephone</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtTelephone" runat="server" Width="147px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td class="auto-style5">
                <asp:TextBox ID="txtEmail" runat="server" Width="147px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <p>
        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnEdit" runat="server" OnClick="btnEdit_Click" Text="Edit" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSave" runat="server" OnClick="btnSave_Click" Text="Save" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" CausesValidation="False" />
    </p>
</asp:Content>