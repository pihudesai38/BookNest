<%@ Page Title="Book Details - MRE Book Store" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="Book_Details.aspx.cs" Inherits="BookNest.Book_Details" %>

<asp:Content ID="BookDetailsHead" ContentPlaceHolderID="head" runat="server">

    <style>

        * {
            box-sizing: border-box;
        }

        .page-title {
            text-align: center;
            padding: 40px 20px 20px;
        }

        .page-title h1 {
            font-size: 38px;
            margin: 0;
            color: #092c52;
        }

        .book-details {
            width: 800px;
            margin: 25px auto 60px;
            background: white;
            padding: 35px;
            border-radius: 14px;
            box-shadow: 0 5px 18px rgba(0,0,0,0.08);
            display: flex;
            gap: 40px;
        }

        .book-image {
            width: 230px;
            height: 320px;
            object-fit: cover;
            border-radius: 5px;
        }

        .details {
            padding-top: 10px;
        }

        .details h2 {
            font-size: 30px;
            color: #092c52;
            margin: 0 0 20px;
        }

        .details p {
            color: #526b88;
            font-size: 16px;
            line-height: 1.6;
            margin: 12px 0;
        }

        .label {
            color: #092c52;
            font-weight: bold;
        }

        .price {
            color: #f2a900 !important;
            font-size: 22px !important;
            font-weight: bold;
            margin-top: 20px !important;
        }

        .back-btn {
            display: inline-block;
            background: #f9b51b;
            color: #111;
            text-decoration: none;
            padding: 11px 28px;
            border-radius: 25px;
            font-size: 15px;
            font-weight: 500;
            margin-top: 15px;
        }

        .back-btn:hover {
            background: #eaa300;
        }

    </style>

</asp:Content>

<asp:Content ID="BookDetailsContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <!-- TITLE -->

        <div class="page-title">

            <h1>Book Details</h1>

        </div>


        <!-- BOOK DETAILS -->

        <div class="book-details">

            <div>

                <asp:Image
                    ID="imgBook"
                    runat="server"
                    CssClass="book-image" />

            </div>


            <div class="details">

                <h2>

                    <asp:Label
                        ID="lblBookName"
                        runat="server">
                    </asp:Label>

                </h2>


                <p>

                    <span class="label">Author:</span>

                    <asp:Label
                        ID="lblAuthor"
                        runat="server">
                    </asp:Label>

                </p>


                <p>

                    <span class="label">Type:</span>

                    <asp:Label
                        ID="lblType"
                        runat="server">
                    </asp:Label>

                </p>


                <p>

                    <span class="label">Description:</span>

                    <asp:Label
                        ID="lblDescription"
                        runat="server">
                    </asp:Label>

                </p>


                <p class="price">

                    ₹<asp:Label
                        ID="lblPrice"
                        runat="server">
                    </asp:Label>

                    <p>
                        <a href="Cart.aspx" class="AddToCart-btn">
                            Add to Cart
                        </a>

                    </p>

                </p>


                <a href="Books.aspx" class="back-btn">
                    ← Back to Books
                </a>

            </div>

        </div>


</asp:Content>
