<%@ Page Title="" Language="C#" MasterPageFile="~/Coffee.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="CoffeeFinal.Admin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:CoffeeShopDatabase %>' SelectCommand="SELECT * FROM [EdibleProducts]" DeleteCommand="DELETE FROM [EdibleProducts] WHERE [Id] = @Id" InsertCommand="INSERT INTO [EdibleProducts] ([Id], [Name], [lgCost], [medCost], [smallCost], [imageURL], [productType], [description], [healthFactsURL]) VALUES (@Id, @Name, @lgCost, @medCost, @smallCost, @imageURL, @productType, @description, @healthFactsURL)" UpdateCommand="UPDATE [EdibleProducts] SET [Name] = @Name, [lgCost] = @lgCost, [medCost] = @medCost, [smallCost] = @smallCost, [imageURL] = @imageURL, [productType] = @productType, [description] = @description, [healthFactsURL] = @healthFactsURL WHERE [Id] = @Id">
        <DeleteParameters>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="lgCost" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="medCost" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="smallCost" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="imageURL" Type="String"></asp:Parameter>
            <asp:Parameter Name="productType" Type="String"></asp:Parameter>
            <asp:Parameter Name="description" Type="String"></asp:Parameter>
            <asp:Parameter Name="healthFactsURL" Type="String"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String"></asp:Parameter>
            <asp:Parameter Name="lgCost" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="medCost" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="smallCost" Type="Decimal"></asp:Parameter>
            <asp:Parameter Name="imageURL" Type="String"></asp:Parameter>
            <asp:Parameter Name="productType" Type="String"></asp:Parameter>
            <asp:Parameter Name="description" Type="String"></asp:Parameter>
            <asp:Parameter Name="healthFactsURL" Type="String"></asp:Parameter>
            <asp:Parameter Name="Id" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:CoffeeShopDatabase %>' SelectCommand="SELECT [Products] FROM [Product]"></asp:SqlDataSource>



    <asp:GridView ID="GridViewAdmin" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" CssClass="GridViewAdmin" OnRowUpdated="GridViewAdmin_RowUpdated" DataKeyNames="Id">
        <Columns>
            <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id"></asp:BoundField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name"></asp:BoundField>
            <asp:BoundField DataField="lgCost" HeaderText="lgCost" SortExpression="lgCost"></asp:BoundField>
            <asp:BoundField DataField="medCost" HeaderText="medCost" SortExpression="medCost"></asp:BoundField>
            <asp:BoundField DataField="smallCost" HeaderText="smallCost" SortExpression="smallCost"></asp:BoundField>
            <asp:BoundField DataField="imageURL" HeaderText="imageURL" SortExpression="imageURL"></asp:BoundField>
            <asp:TemplateField HeaderText="productType" SortExpression="productType">
                <EditItemTemplate>
                 <asp:DropDownList ID="ddlProductype" runat="server" DataSourceID="SqlDataSource2" DataTextField="Products" DataValueField="Products" SelectedValue='<%#Bind("productType")%>' AppendDataBoundItems="true"></asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" Text='<%# Bind("productType") %>' ID="Label1"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description"></asp:BoundField>
            <asp:BoundField DataField="healthFactsURL" HeaderText="healthFactsURL" SortExpression="healthFactsURL"></asp:BoundField>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ButtonType="Button"></asp:CommandField>
        </Columns>

        <EditRowStyle CssClass="GridViewEditRow" />
    </asp:GridView>

    <table class="AdminTable">
                <tr>
                    <th>Id</th>
                    <th>Name</th>
                    <th>large Cost</th>
                    <th>Medium Cost</th>
                    <th>Small Cost</th>
                    <th>Image URL</th>
                    <th>Product Type</th>
                    <th>Description</th>
                    <th>Health Facts URL</th>
                    <th></th>
                </tr>
                <tr>       
                    <td><asp:TextBox ID="txtId" runat="server"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtlgCost" runat="server"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtmedCost" runat="server"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtsmallCost" runat="server"></asp:TextBox></td>
                    <td><asp:TextBox ID="txtimageURL" runat="server"></asp:TextBox></td>
                    <td><asp:DropDownList ID="ddlProductType" runat="server" DataSourceID="SqlDataSource2" DataValueField="Products" DataTextField="Products"></asp:DropDownList></td>
                    <td><asp:TextBox ID="txtdescription" runat="server"></asp:TextBox></td>
                    <td><asp:TextBox ID="txthealthFactsURL" runat="server"></asp:TextBox></td>
                    <td><asp:Button ID="ButtonAdd" runat="server" Text="Add" OnClick="ButtonAdd_Click" /></td>
                    
                </tr>
            </table>


    <br />
    <br />
    <br />



    <asp:Label ID="lblError" runat="server" Text="" CssClass="lblError"></asp:Label>

    <asp:Button ID="Button2" runat="server" Text="Leave Admin"  PostBackUrl="~/Home.aspx"/>


</asp:Content>
