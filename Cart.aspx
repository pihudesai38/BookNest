<%@ Page Title="Shopping Cart - MRE Book Store" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BookNest.Cart" %>

<asp:Content ID="CartHead" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .cart-table {
            border-collapse: collapse;
            width: 80%;
            margin: 20px auto;
            font-family: Arial, sans-serif;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
        }
        .cart-table th {
            background-color: #008A52;
            color: white;
            padding: 12px;
            font-size: 16px;
            text-align: center;
        }
        .cart-table td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            font-size: 15px;
        }
        .cart-table tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        .cart-table tr:hover {
            background-color: #e6f7ff;
        }
        .btn-action {
            color: #005AFF;
            text-decoration: none;
            font-weight: bold;
            padding: 5px 12px;
            border: 1px solid #005AFF;
            border-radius: 4px;
        }
        .btn-delete {
            color: #EB0029;
            border: 1px solid #EB0029;
        }

        .cart-total {
            width: 80%;
            margin: 20px auto 40px;
            text-align: right;
            color: #092c52;
            font-size: 22px;
            font-weight: 700;
        }

        .checkout-button {
            background: #f5b738;
            color: #1e293b;
            border: none;
            border-radius: 24px;
            padding: 12px 28px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            margin: 0 10% 40px 0;
        }

        .checkout-button:hover {
            background: #eab308;
        }
    </style>
</asp:Content>

<asp:Content ID="CartContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <center>
                <h1>My Shopping Cart</h1>
                
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="cart-table" DataKeyNames="Cart_Id"
                    OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                    OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting">
                    <Columns>
                        <asp:TemplateField HeaderText="Product Image">
                            <ItemTemplate>
                                <asp:Image ID="imgBook" runat="server" Height="100px" Width="75px" ImageUrl='<%# Eval("Book_Image") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Product Name">
                            <ItemTemplate>
                                <asp:Label ID="lblBookName" runat="server" Text='<%# Eval("Book_Name") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Price">
                            <ItemTemplate>
                                ₹<asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Book_Price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:Label ID="lblQunty" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="drpqnt" runat="server" SelectedValue='<%# Eval("Quantity") %>'>
                                    <asp:ListItem Value="1">1</asp:ListItem>
                                    <asp:ListItem Value="2">2</asp:ListItem>
                                    <asp:ListItem Value="3">3</asp:ListItem>
                                    <asp:ListItem Value="4">4</asp:ListItem>
                                    <asp:ListItem Value="5">5</asp:ListItem>
                                    <asp:ListItem Value="6">6</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CssClass="btn-action" CommandName="Edit">Edit</asp:LinkButton>
                                &nbsp;
                                <asp:LinkButton ID="lnkDeleteItem" runat="server" CssClass="btn-action btn-delete" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to remove this item?');">Delete</asp:LinkButton>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:LinkButton ID="lnkUpdate" runat="server" CssClass="btn-action" CommandName="Update">Update</asp:LinkButton>
                                &nbsp;
                                <asp:LinkButton ID="lnkDelete" runat="server" CssClass="btn-action btn-delete" CommandName="Delete">Delete</asp:LinkButton>
                            </EditItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <div class="cart-summary">
                    <asp:Label ID="lblGrandTotal" runat="server" CssClass="cart-total"></asp:Label>
                    <asp:Button ID="btnCheckout" runat="server" Text="Checkout" CssClass="checkout-button" OnClientClick="alert('Checkout process will be added next.'); return false;" />
                </div>
            </center>
</asp:Content>
