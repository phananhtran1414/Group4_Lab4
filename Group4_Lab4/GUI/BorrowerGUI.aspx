<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BorrowerGUI.aspx.cs" Inherits="Group4_Lab4.GUI.BorrowerGUI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p class="list_mem"><b>List of members</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="lblError" runat="server" ForeColor="#FF3300"></asp:Label>
    </p>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    The number of members:&nbsp;
    <asp:Label ID="lblNumOfMem" runat="server" Text="0"></asp:Label>
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"></asp:ObjectDataSource>
    <p>
        &nbsp;</p>
</asp:Content>