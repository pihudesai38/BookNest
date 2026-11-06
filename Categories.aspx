<%@ Page Title="Categories - MRE Book Store" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="BookNest.Categories" %>

<asp:Content ID="CategoriesHead" ContentPlaceHolderID="head" runat="server">

    <style>

        * {
            box-sizing: border-box;
        }

        .page-title {
            text-align: center;
            padding: 50px 20px 25px;
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

        .categories {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 25px;
            padding: 40px 50px 70px;
        }

        .category-card {
            width: 260px;
            height: 220px;
            background: white;
            border-radius: 15px;
            padding: 30px 20px;
            text-align: center;
            box-shadow: 0 5px 18px rgba(0,0,0,0.08);
            transition: 0.3s;
        }

        .category-card:hover {
            transform: translateY(-7px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.13);
        }

        .category-icon {
            font-size: 55px;
            margin-bottom: 15px;
        }

        .category-card h2 {
            margin: 5px 0 10px;
            color: #092c52;
            font-size: 21px;
        }

        .category-card p {
            color: #66758b;
            font-size: 14px;
            margin-bottom: 15px;
        }

        .view-btn {
            display: inline-block;
            background: #f9b51b;
            color: #111;
            text-decoration: none;
            padding: 9px 22px;
            border-radius: 22px;
            font-size: 14px;
        }

        .view-btn:hover {
            background: #eaa300;
        }

    </style>

</asp:Content>

<asp:Content ID="CategoriesContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- TITLE -->

    <div class="page-title">

        <h1>Book Categories</h1>

        <p>
            Explore books by your favourite categories.
        </p>

    </div>


    <!-- CATEGORIES -->

    <div class="categories">


        <!-- FICTION -->

        <div class="category-card">

            <div class="category-icon">
                📚
            </div>

            <h2>fictional</h2>

            <p>
                Stories, novels and imaginative worlds.
            </p>

            <a href="Books.aspx?category=fictional" class="view-btn">
                View Books
            </a>

        </div>


        <!-- SELF HELP -->

        <div class="category-card">

            <div class="category-icon">
                🧠
            </div>

            <h2>Self Help</h2>

            <p>
                Books for personal growth and motivation.
            </p>

            <a href="Books.aspx?category=SelfHelp" class="view-btn">
                View Books
            </a>

        </div>


        <!-- BUSINESS -->

        <div class="category-card">

            <div class="category-icon">
                💼
            </div>

            <h2>Business</h2>

            <p>
                Business, finance and entrepreneurship books.
            </p>

            <a href="Books.aspx?category=Business" class="view-btn">
                View Books
            </a>

        </div>


        <!-- CHILDREN -->

        <div class="category-card">

            <div class="category-icon">
                🧒
            </div>

            <h2>Children</h2>

            <p>
                Fun and educational books for children.
            </p>

            <a href="Books.aspx?category=Children" class="view-btn">
                View Books
            </a>

        </div>


    </div>


</asp:Content>