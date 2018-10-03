<%@ Page Title="" Language="C#" MasterPageFile="~/Coffee.Master" AutoEventWireup="true" CodeBehind="ProductPage.aspx.cs" Inherits="CoffeeFinal.EdibleProducts.BlackCoffee" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Productbody">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:CoffeeShopDatabase %>' SelectCommand="SELECT * FROM [EdibleProducts] WHERE ([Id] = @Id)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="ID" Name="Id" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">

        <ItemTemplate>
            <asp:Image ID="HealthImage" runat="server" CssClass="HealthImage" ImageUrl='<%# "~/Heathfacts/"+ Eval("healthFactsURL") %>'/>
            <asp:Image ID="CoffeeImage" runat="server" CssClass="CoffeeImage" ImageUrl='<%# "~/Imgs/"+ Eval("imageURL") %>'/>
            <p class="ProductD"><%# Eval("description") %></p>
        </ItemTemplate>
        


    </asp:Repeater>
    </div>
</asp:Content>
