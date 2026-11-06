
<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="add_books.aspx.cs"
    Inherits="BookNest.add_books" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Add Product - BookNest Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />

    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f6fb;
            color: #263247;
        }

        .navbar {
            background: #17243b;
            color: white;
            padding: 18px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 18px;
        }

        .container {
            max-width: 700px;
            margin: 35px auto;
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 5px 20px #00000012;
        }

        h2 {
            margin-top: 0;
            color: #17243b;
        }

        .field {
            margin-bottom: 18px;
        }

        .field label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
        }

        .field input,
        .field select,
        .field textarea {
            width: 100%;
            padding: 11px;
            border: 1px solid #d5dce8;
            border-radius: 6px;
            box-sizing: border-box;
            font-size: 14px;
        }

        .field textarea {
            min-height: 100px;
            resize: vertical;
        }

        .btn {
            background: #f5b738;
            color: #17243b;
            border: none;
            padding: 12px 22px;
            border-radius: 6px;
            font-weight: bold;
            cursor: pointer;
        }

        .btn:hover {
            background: #eab308;
        }

        .message {
            display: block;
            margin: 15px 0;
            font-weight: bold;
        }

        .back {
            color: #17243b;
            text-decoration: none;
        }
    </style>
</head>

<body>
<form id="form1" runat="server">

    <div class="navbar">
        <strong>BookNest Admin</strong>
        <div>
            <a href="admindashboard.aspx">Dashboard</a>
            <a href="Login.aspx?logout=1">Logout</a>
        </div>
    </div>

    <div class="container">
        <a class="back" href="admindashboard.aspx">
            &#8592; Back to Dashboard
        </a>

        <h2>Add New Product</h2>

        <asp:Label ID="lblMessage" runat="server"
            CssClass="message" />

        <div class="field">
            <label>Book Name</label>
            <asp:TextBox ID="txtBookName" runat="server"
                MaxLength="200" required="required" />
        </div>

        <div class="field">
            <label>Author</label>
            <asp:DropDownList ID="ddlAuthor" runat="server"
                required="required" />
        </div>

        <div class="field">
            <label>Book Type / Category</label>
            <asp:TextBox ID="txtBookType" runat="server"
                MaxLength="100" required="required" />
        </div>

        <div class="field">
            <label>Description</label>
            <asp:TextBox ID="txtDescription" runat="server"
                TextMode="MultiLine" MaxLength="4000" />
        </div>

        <div class="field">
            <label>Price</label>
            <asp:TextBox ID="txtPrice" runat="server"
                TextMode="Number" />
        </div>

        <div class="field">
            <label>Product Image</label>
            <asp:FileUpload ID="fuBookImage" runat="server"
                accept="image/*" />
            <small>Allowed formats: JPG, JPEG, PNG, GIF (maximum 5 MB).</small>
        </div>

        <asp:Button ID="btnSave" runat="server"
            Text="Save Book"
            CssClass="btn"
            OnClick="addprod_Click" />

    </div>

</form>
</body>
</html>