<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookGUI.aspx.cs" Inherits="Group4_Lab4.GUI.BookGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
        .auto-style2 {
            height: 39px;
        }
        .auto-style3 {
            margin-left: 42px;
        }
        .auto-style4 {
            margin-left: 9px;
        }
        .auto-style5 {
            margin-left: 41px;
        }
        .auto-style6 {
            margin-left: 212px;
        }
        .auto-style7 {
            margin-left: 44px;
        }
        .auto-style8 {
            margin-left: 80px;
        }
        .auto-style9 {
            width: 313px;
        }
        .auto-style10 {
            height: 39px;
            width: 313px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p style="font-size: large; font-weight: bold">
        List of Book: 
        <asp:Label ID="lblError" runat="server" ForeColor="#FF9999" Visible="False"></asp:Label>
        <br />
    </p>
    <p>
        Title:&nbsp;
        <asp:TextBox ID="txtFilter" runat="server" Height="16px" Width="231px"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="btnFilter" runat="server" CssClass="auto-style1" Height="24px" Text="Filter" Width="121px" OnClick="btnFilter_Click" />
    </p>
    <p>
    The number of books:
    <asp:Label ID="lblNumberOfBook" runat="server" Font-Names="Bradley Hand ITC" Font-Size="Larger" Text="0"></asp:Label>
    </p>
    <p>
        <table style="width:100%;">
            <tr>
                <td rowspan="4">
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" DataKeyNames="BookNumber" DataSourceID="ObjectDataSource1" ForeColor="Black" OnDataBound="GridView1_DataBound" AllowSorting="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                        </Columns>
                        <SelectedRowStyle BackColor="#FF9999" />
                    </asp:GridView>
                </td>
                <td>&nbsp;</td>
                <td class="auto-style9">
                    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DataObjectTypeName="Group4_Lab4.DTL.Book" DeleteMethod="Delete" InsertMethod="Insert" SelectMethod="GetDataTableBook" TypeName="Group4_Lab4.DAL.BookDAO" UpdateMethod="Update">
                        <FilterParameters>
                            <asp:ControlParameter ControlID="txtFilter" Name="newparameter" PropertyName="Text" />
                        </FilterParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtFilter" Name="title" PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Title</td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtTitle" runat="server" Width="200px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtTitle" ErrorMessage="Title Required" ForeColor="#FF9999"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Authors</td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtAuthors" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Publisher</td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtPublisher" runat="server" Width="200px"></asp:TextBox>
                </td>
            </tr>
        </table>
    </p>
    <p class="auto-style8">
        <asp:Button ID="btnAdd" runat="server" CssClass="auto-style4" Text="Add" Width="68px" OnClick="btnAdd_Click" />
        <asp:Button ID="btnEdit" runat="server" CssClass="auto-style5" Text="Edit" Width="59px" OnClick="btnEdit_Click" />
        <asp:Button ID="btnCopies" runat="server" OnClick="btnCopies_Click" Text="Copies" CssClass="auto-style3" Width="71px" />
        <asp:Button ID="btnSave" runat="server" CssClass="auto-style6" Text="Save" Width="62px" OnClick="btnSave_Click" />
        <asp:Button ID="btnCancel" runat="server" CssClass="auto-style7" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="False" />
    </p>
    <p class="auto-style8">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="lblMessage" runat="server" ForeColor="#FF9999" Text="Label" Visible="False"></asp:Label>
    </p>
    <p>
        &nbsp;</p>
</asp:Content>
