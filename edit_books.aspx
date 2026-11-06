<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="edit_books.aspx.cs"
    Inherits="BookNest.edit_books" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Edit Product - BookNest Admin</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
        body { margin: 0; font-family: Arial, sans-serif; background: #f4f6fb; color: #263247; }
        .navbar { background: #17243b; color: white; padding: 18px 30px; display: flex; justify-content: space-between; }
        .navbar a, .back { color: inherit; text-decoration: none; margin-left: 18px; }
        .container { max-width: 700px; margin: 35px auto; background: white; padding: 30px; border-radius: 12px; box-shadow: 0 5px 20px #00000012; }
        h2 { margin-top: 20px; color: #17243b; }
        .field { margin-bottom: 18px; }
        .field label { display: block; margin-bottom: 7px; font-weight: bold; }
        .field input, .field select, .field textarea { width: 100%; padding: 11px; border: 1px solid #d5dce8; border-radius: 6px; box-sizing: border-box; font-size: 14px; }
        .field textarea { min-height: 100px; resize: vertical; }
        .btn { background: #f5b738; color: #17243b; border: none; padding: 12px 22px; border-radius: 6px; font-weight: bold; cursor: pointer; }
        .message { display: block; margin: 15px 0; font-weight: bold; }
        .current-image { max-width: 120px; max-height: 120px; display: block; margin: 8px 0; }
    </style>
</head>
<body>
<form id="form1" runat="server" enctype="multipart/form-data">
    <div class="navbar">
        <strong>BookNest Admin</strong>
        <div>
            <a href="manage_books.aspx">Manage Books</a>
            <a href="Login.aspx?logout=1">Logout</a>
        </div>
    </div>
    <div class="container">
        <a class="back" href="manage_books.aspx">&#8592; Back to Manage Books</a>
        <h2>Edit Product</h2>
        <asp:Label ID="lblMessage" runat="server" CssClass="message" />

        <div class="field">
            <label>Book Name</label>
            <asp:TextBox ID="txtBookName" runat="server" MaxLength="200" />
        </div>
        <div class="field">
            <label>Author</label>
            <asp:DropDownList ID="ddlAuthor" runat="server" />
        </div>
        <div class="field">
            <label>Book Type / Category</label>
            <asp:TextBox ID="txtBookType" runat="server" MaxLength="100" />
        </div>
        <div class="field">
            <label>Description</label>
            <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" MaxLength="4000" />
        </div>
        <div class="field">
            <label>Price</label>
            <asp:TextBox ID="txtPrice" runat="server" TextMode="Number" />
        </div>
        <div class="field">
            <label>Product Image (optional)</label>
            <asp:Image ID="imgCurrent" runat="server" CssClass="current-image" Visible="false" />
            <asp:FileUpload ID="fuBookImage" runat="server" accept="image/*" />
            <small>Select a new image only if you want to replace the current one.</small>
        </div>
        <asp:Button ID="btnUpdate" runat="server" Text="Update Product"
            CssClass="btn" OnClick="btnUpdate_Click" />
    </div>
</form>
</body>
</html>
