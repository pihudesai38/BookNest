<%@ Page Title="Books - MRE Book Store" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="Books.aspx.cs" Inherits="BookNest.Books" %>

<asp:Content ID="BooksHead" ContentPlaceHolderID="head" runat="server">

    <style>

        * {
            box-sizing: border-box;
        }

        /* TITLE */

        .page-title {
            text-align: center;
            padding: 45px 20px 20px;
        }

        .page-title h1 {
            font-size: 42px;
            margin: 0 0 15px;
            color: #092c52;
        }

        .page-title p {
            color: #58708d;
            font-size: 17px;
        }

        /* BOOKS */

        .books {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
            padding: 45px 50px 70px;
        }

        /* BOOK CARD */

        .book-card {
            width: 260px;
            min-height: 430px;
            background: white;
            border-radius: 14px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 5px 18px rgba(0,0,0,0.08);
            transition: 0.3s;
        }

        .book-card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.12);
        }

        .book-image {
            width: 160px;
            height: 220px;
            object-fit: cover;
            border-radius: 4px;
            margin-bottom: 15px;
        }

        .book-card h3 {
            margin: 5px 0 10px;
            font-size: 19px;
            color: #092c52;
        }

        .author {
            color: #526b88;
            font-size: 15px;
            margin-bottom: 15px;
        }

        .price {
            color: #f2a900;
            font-size: 20px;
            font-weight: bold;
            margin-bottom: 15px;
        }

        .view-btn {
            display: inline-block;
            background: #f9b51b;
            color: #111;
            text-decoration: none;
            padding: 11px 28px;
            border-radius: 25px;
            font-size: 15px;
            font-weight: 500;
        }

        .view-btn:hover {
            background: #eaa300;
        }

        .cart-btn-book {
            display: inline-block;
            background: #15803d;
            color: #ffffff;
            text-decoration: none;
            padding: 11px 20px;
            border: 0;
            border-radius: 25px;
            font-size: 15px;
            font-weight: 500;
            cursor: pointer;
            margin-left: 4px;
        }

        .cart-btn-book:hover {
            background: #166534;
        }

        .book-empty {
            width: 100%;
            text-align: center;
            color: #58708d;
            padding: 30px;
        }

    </style>

</asp:Content>

<asp:Content ID="BooksContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- TITLE -->

    <div class="page-title">

        <h1>Our Books</h1>

        <p>
            Explore our collection of books and find your next great read.
        </p>

    </div>


    <!-- BOOKS -->

    <div class="books">


        <asp:DataList ID="DataList1" runat="server" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
            <ItemTemplate>
                <div class="book-card">
                    <asp:Image ID="imgBook" runat="server" CssClass="book-image" ImageUrl='<%# Eval("Book_Image") %>' AlternateText='<%# Eval("Book_Name") %>' />

                    <h3><%# Eval("Book_Name") %></h3>

                    <div class="author"><%# Eval("Book_Type") %></div>

                    <div class="price">₹<%# Eval("Book_Price") %></div>

                    <asp:LinkButton ID="btnView" runat="server" CssClass="view-btn" CommandName="cmd_vewdtl" CommandArgument='<%# Eval("Book_Id") %>'>View Book</asp:LinkButton>
                    <asp:LinkButton ID="btnAddCart" runat="server" CssClass="cart-btn-book" CommandName="cmd_addcart" CommandArgument='<%# Eval("Book_Id") %>'>Add to Cart</asp:LinkButton>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                <asp:Label ID="lblEmpty" runat="server" CssClass="book-empty" Visible='<%# DataList1.Items.Count == 0 %>'>No books found.</asp:Label>
            </FooterTemplate>
        </asp:DataList>


    </div>


</asp:Content>

