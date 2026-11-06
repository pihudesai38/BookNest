
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="manage_books.aspx.cs"
    Inherits="BookNest.manage_books" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Manage Books | BookNest Admin</title>

    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
          rel="stylesheet" />

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            font-family: 'Poppins', sans-serif;
            background: #f4f6fb;
            color: #263247;
        }

        .topbar {
            background: #17243b;
            color: white;
            padding: 18px 35px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-wrap: wrap;
            gap: 15px;
            box-shadow: 0 3px 12px rgba(0,0,0,.08);
        }

        .brand {
            font-size: 21px;
            font-weight: 700;
        }

        .brand span {
            color: #f5b738;
        }

        .top-links {
            display: flex;
            gap: 20px;
        }

        .top-links a {
            color: #e2e8f0;
            text-decoration: none;
            font-size: 14px;
        }

        .top-links a:hover {
            color: #f5b738;
        }

        .page-container {
            max-width: 1350px;
            margin: 35px auto;
            padding: 0 25px;
        }

        .page-heading {
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
            margin-bottom: 25px;
        }

        .page-heading h1 {
            margin: 0 0 7px;
            font-size: 28px;
            color: #17243b;
        }

        .subtitle {
            color: #7b8799;
            font-size: 14px;
            margin: 0;
        }

        .btn {
            display: inline-block;
            border: none;
            border-radius: 7px;
            padding: 11px 18px;
            font-family: inherit;
            font-size: 13px;
            font-weight: 600;
            text-decoration: none;
            cursor: pointer;
            transition: .2s;
        }

        .btn-gold {
            background: #f5b738;
            color: #17243b;
            box-shadow: 0 3px 8px rgba(245,183,56,.2);
        }

        .btn-gold:hover {
            background: #eab308;
            transform: translateY(-1px);
        }

        .btn-edit {
            background: #fff5d9;
            color: #946200;
            padding: 7px 12px;
        }

        .btn-edit:hover {
            background: #fce7a6;
        }

        .btn-delete {
            background: #fff0f0;
            color: #c62828;
            padding: 7px 12px;
        }

        .btn-delete:hover {
            background: #fee0e0;
        }

        .content-card {
            background: white;
            border-radius: 13px;
            border: 1px solid #e8edf5;
            box-shadow: 0 5px 22px rgba(23,36,59,.04);
            overflow: hidden;
        }

        .card-toolbar {
            padding: 22px 24px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 15px;
            flex-wrap: wrap;
            border-bottom: 1px solid #edf0f5;
        }

        .card-toolbar h2 {
            font-size: 17px;
            margin: 0;
            color: #17243b;
        }

        .search-box {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .search-input {
            width: 260px;
            max-width: 100%;
            padding: 10px 13px;
            border: 1px solid #dce2eb;
            border-radius: 7px;
            font-family: inherit;
            font-size: 13px;
            outline: none;
        }

        .search-input:focus {
            border-color: #f5b738;
            box-shadow: 0 0 0 3px rgba(245,183,56,.15);
        }

        .table-wrap {
            width: 100%;
            overflow-x: auto;
        }

        .books-grid {
            width: 100%;
            border-collapse: collapse;
            min-width: 850px;
        }

        .books-grid th {
            background: #f8fafc;
            color: #64748b;
            font-size: 12px;
            text-align: left;
            padding: 16px 18px;
            font-weight: 600;
            white-space: nowrap;
            border-bottom: 1px solid #e8edf5;
        }

        .books-grid td {
            padding: 16px 18px;
            font-size: 13px;
            color: #475569;
            border-bottom: 1px solid #edf0f5;
            vertical-align: middle;
        }

        .books-grid tr:hover td {
            background: #fffdf7;
        }

        .books-grid tr:last-child td {
            border-bottom: none;
        }

        .book-id {
            color: #b77908;
            font-weight: 600;
        }

        .book-name {
            color: #17243b;
            font-weight: 600;
        }

        .price {
            color: #17243b;
            font-weight: 600;
            white-space: nowrap;
        }

        .action-buttons {
            display: flex;
            gap: 7px;
            align-items: center;
        }

        .message {
            display: block;
            margin: 18px 24px;
            font-size: 13px;
            font-weight: 600;
        }

        .empty-message {
            padding: 30px;
            text-align: center;
            color: #7b8799;
        }

        .footer-note {
            padding: 16px 24px;
            background: #fcfcfd;
            border-top: 1px solid #edf0f5;
            color: #8490a1;
            font-size: 12px;
        }

        @media (max-width: 600px) {
            .topbar {
                padding: 17px 20px;
            }

            .page-container {
                padding: 0 12px;
                margin: 22px auto;
            }

            .page-heading h1 {
                font-size: 23px;
            }

            .card-toolbar {
                padding: 17px;
            }

            .search-box,
            .search-input {
                width: 100%;
            }
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <header class="topbar">
        <div class="brand">
            Book<span>Nest</span> Admin
        </div>

        <nav class="top-links">
            <a href="admindashboard.aspx">Dashboard</a>
            <a href="add_books.aspx">Add Book</a>
            <a href="Login.aspx?logout=1">Logout</a>
        </nav>
    </header>

    <main class="page-container">

        <div class="page-heading">
            <div>
                <h1>Manage Books</h1>
                <p class="subtitle">
                    View and manage your existing bookstore inventory.
                </p>
            </div>

            <a href="add_books.aspx" class="btn btn-gold">
                + Add New Book
            </a>
        </div>

        <div class="content-card">

            <div class="card-toolbar">
                <h2>Book Inventory</h2>

                <div class="search-box">
                    <asp:TextBox ID="txtSearch" runat="server"
                        CssClass="search-input"
                        placeholder="Search books or category..."
                        MaxLength="200" />

                    <asp:Button ID="btnSearch" runat="server"
                        Text="Search"
                        CssClass="btn btn-gold"
                        OnClick="btnSearch_Click" />

                    <asp:Button ID="btnClear" runat="server"
                        Text="Clear"
                        CssClass="btn"
                        CausesValidation="false"
                        OnClick="btnClear_Click" />
                </div>
            </div>

            <asp:Label ID="lblMessage" runat="server"
                CssClass="message" />

            <div class="table-wrap">

                <asp:GridView ID="gvBooks" runat="server"
                    CssClass="books-grid"
                    AutoGenerateColumns="False"
                    DataKeyNames="Book_Id"
                    GridLines="None"
                    EmptyDataText="No books found."
                    OnRowCommand="gvBooks_RowCommand">

                    <Columns>

                        <asp:TemplateField HeaderText="BOOK ID">
                            <ItemTemplate>
                                <span class="book-id">
                                    #<%# Eval("Book_Id") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="BOOK NAME">
                            <ItemTemplate>
                                <span class="book-name">
                                    <%# Server.HtmlEncode(
                                        Convert.ToString(Eval("Book_Name"))) %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="Author_Name"
                            HeaderText="AUTHOR"
                            NullDisplayText="Not assigned" />

                        <asp:BoundField DataField="Book_Type"
                            HeaderText="CATEGORY"
                            NullDisplayText="Not specified" />

                        <asp:TemplateField HeaderText="PRICE">
                            <ItemTemplate>
                                <span class="price">
                                    ₹<%# Eval("Book_Price", "{0:N2}") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="ACTIONS">
                            <ItemTemplate>
                                <div class="action-buttons">

                                    <asp:HyperLink ID="lnkEdit"
                                        runat="server"
                                        CssClass="btn btn-edit"
                                        NavigateUrl='<%# "edit_books.aspx?id=" +
                                            Eval("Book_Id") %>'
                                        Text="Edit" />

                                    <asp:LinkButton ID="btnDelete"
                                        runat="server"
                                        CssClass="btn btn-delete"
                                        Text="Delete"
                                        CommandName="DeleteBook"
                                        CommandArgument='<%# Eval("Book_Id") %>'
                                        CausesValidation="false"
                                        OnClientClick="return confirm('Are you sure you want to delete this book?');" />

                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                    </Columns>

                    <EmptyDataTemplate>
                        <div class="empty-message">
                            No books found. Try another search.
                        </div>
                    </EmptyDataTemplate>

                </asp:GridView>

            </div>

            <div class="footer-note">
                BookNest Inventory Management
            </div>

        </div>

    </main>

</form>
</body>
</html>