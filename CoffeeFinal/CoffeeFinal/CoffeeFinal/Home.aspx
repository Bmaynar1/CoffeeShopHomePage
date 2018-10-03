<%@ Page Title="" Language="C#" MasterPageFile="~/Coffee.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="CoffeeFinal.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    <asp:SqlDataSource ID="SqlDataSourceDdlProducts" runat="server" ConnectionString='<%$ ConnectionStrings:CoffeeShopDatabase %>' SelectCommand="SELECT [Products] FROM [Product]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceDdledibleProducts" runat="server" ConnectionString='<%$ ConnectionStrings:CoffeeShopDatabase %>' SelectCommand="SELECT * FROM [EdibleProducts] WHERE ([productType] = @productType)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlProducts" PropertyName="SelectedValue" Name="productType" Type="String"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server"></asp:SqlDataSource>
    
    <div id="ddlList">
    <asp:DropDownList ID="ddlProducts" CssClass="ddlProducts" runat="server" DataSourceID="SqlDataSourceDdlProducts" DataTextField="Products" DataValueField="Products" AutoPostBack="true"></asp:DropDownList>
    </div>

    <br />
    <br />
    <br />

    <div id="PoductTable" style="align-content:center">
    <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" DataKeyField="Id" DataSourceID="SqlDataSourceDdledibleProducts" CssClass="DlCenter">
        <ItemTemplate>       
            <table>
                <tr>
                    <td colspan="3" class="hover">
                    <asp:ImageButton runat="server" ID="button"  CssClass="imgButton" ImageUrl='<%# "~/Imgs/"+ Eval("imageURL") %>'  CommandArgument='<%# Eval("ID") %>' OnClick="button_Click" />
                    </td>
              
                </tr>
                <div class="hiddenCost">
                <tr>
                    <td>LG</td>
                    <td>MED</td>
                    <td>SMALL</td>
                </tr>
                <tr> 
                    <td><%# Eval("lgcost", "{0:c}") %></td>
                    <td><%# Eval("medcost", "{0:c}") %></td>
                    <td><%# Eval("smallcost", "{0:c}") %></td>
                </tr>
                </div>
            </table>
        </ItemTemplate>
    </asp:DataList>
    </div>
</div>
    
    <br />
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Admin"  PostBackUrl="~/Admin.aspx"/>










</asp:Content>
