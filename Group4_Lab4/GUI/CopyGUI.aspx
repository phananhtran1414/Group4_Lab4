<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CopyGUI.aspx.cs" Inherits="Group4_Lab4.GUI.CopyGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
    .auto-style1 {
        height: 30px;
    }
    .auto-style2 {
        width: 8px;
    }
    .auto-style3 {
        height: 30px;
        width: 348px;
    }
    .auto-style4 {
        width: 348px;
    }
    .auto-style5 {
        margin-left: 65px;
    }
    .auto-style6 {
        margin-left: 228px;
    }
    .auto-style7 {
        margin-left: 68px;
    }
    .auto-style8 {
        margin-left: 67px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p style="font-size: large; font-weight: bold;">
    List of Copies
    <asp:Label ID="lblError" runat="server" ForeColor="#FF9999"></asp:Label>
</p>
<p>
    Book number:
    <asp:TextBox ID="txtBookNum" runat="server" Height="16px"></asp:TextBox>
&nbsp;Title: <asp:TextBox ID="txtTitle" runat="server" Height="16px"></asp:TextBox>
</p>
<p>
    The number of copies:&nbsp;
    <asp:Label ID="lblNumberOfCopy" runat="server" Font-Names="Bradley Hand ITC" Font-Size="Larger" Text="0"></asp:Label>
</p>
<p>
    <table style="width:100%;">
        <tr>
            <td rowspan="3" class="auto-style2">
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="ObjectDataSource1" Width="515px" DataKeyNames="CopyNumber" ForeColor="Black" OnDataBound="GridView1_DataBound" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                    </Columns>
                    <SelectedRowStyle BackColor="#FF9999" />
                </asp:GridView>
            </td>
            <td class="auto-style1"></td>
            <td class="auto-style3">
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" FilterExpression="BookNumber = {0}" DataObjectTypeName="Group4_Lab4.DTL.Copy" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetDataTableCopy" TypeName="Group4_Lab4.DAL.CopyDAO" UpdateMethod="Update">
        <FilterParameters>
            <asp:ControlParameter ControlID="txtBookNum" Name="newparameter" PropertyName="Text" />
        </FilterParameters>
    </asp:ObjectDataSource>
            </td>
        </tr>
        <tr>
            <td>Type</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtType" runat="server" Width="147px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtType" ErrorMessage="Required" ForeColor="#FF9999"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtType" ErrorMessage="A or R" ValidationExpression="[ARar]" ForeColor="#FF9999"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Price</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtPrice" runat="server" Width="147px"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPrice" ErrorMessage="From 0 to 999.999.999" ForeColor="#FF9999" ValidationExpression="^\d{0,9}$"></asp:RegularExpressionValidator>
            </td>
        </tr>
    </table>
</p>
<p>
    <asp:Button ID="btnAdd" runat="server" CssClass="auto-style8" Text="Add" Width="72px" OnClick="btnAdd_Click" />
    <asp:Button ID="btnEdit" runat="server" CssClass="auto-style5" Text="Edit" Width="71px" OnClick="btnEdit_Click" />
    <asp:Button ID="btnSave" runat="server" CssClass="auto-style6" Text="Save" Width="72px" OnClick="btnSave_Click" />
    <asp:Button ID="btnCancel" runat="server" CssClass="auto-style7" Text="Cancel" OnClick="btnCancel_Click" />
</p>
<p>
    &nbsp;</p>
</asp:Content>
