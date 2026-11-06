
<%@ Page Title="Admin Dashboard" Language="C#"
    MasterPageFile="~/public.Master"
    AutoEventWireup="true"
    CodeBehind="admindashboard.aspx.cs"
    Inherits="BookNest.admindashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
.dashboard-page {
    max-width: 1280px;
    margin: auto;
    padding: 30px 28px 70px;
}
.admin-layout {
    display: grid;
    grid-template-columns: 230px minmax(0, 1fr);
    gap: 28px;
    align-items: start;
}
.admin-sidebar {
    position: sticky;
    top: 24px;
    padding: 24px 16px;
    background: #132238;
    border-radius: 16px;
    box-shadow: 0 10px 28px #192b3d1c;
}
.admin-sidebar-brand {
    padding: 0 12px 22px;
    color: #f8c85b;
    font-size: 18px;
    font-weight: bold;
    border-bottom: 1px solid #ffffff24;
}
.admin-sidebar-brand small {
    display: block;
    margin-top: 5px;
    color: #c8d5df;
    font-size: 11px;
    font-weight: normal;
    letter-spacing: 1px;
}
.admin-sidebar-nav {
    display: flex;
    flex-direction: column;
    gap: 7px;
    margin-top: 20px;
}
.admin-sidebar-nav a {
    display: block;
    padding: 12px;
    color: #d8e3eb;
    border-radius: 8px;
    text-decoration: none;
    font-size: 14px;
}
.admin-sidebar-nav a:hover,
.admin-sidebar-nav a.active {
    background: #f8c85b;
    color: #132238;
}
.dashboard-content {
    min-width: 0;
}
.dashboard-hero {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 25px;
    padding: 40px;
    background: linear-gradient(120deg,#132238,#1e3a4f,#0e6657);
    border-radius: 18px;
    color: white;
}
.dashboard-eyebrow {
    color: #f8c85b;
    font-weight: bold;
    letter-spacing: 1.5px;
    margin-bottom: 14px;
}
.dashboard-title {
    font-size: 38px;
    margin: 0 0 12px;
}
.dashboard-subtitle {
    color: #c8d5df;
    line-height: 1.7;
}
.dashboard-hero-mark {
    font-size: 48px;
    color: #f8c85b;
    padding: 25px;
    border: 1px solid #ffffff55;
    border-radius: 50%;
}
.dashboard-section-heading {
    margin: 40px 0 18px;
    color: #132238;
}
.dashboard-actions {
    display: grid;
    grid-template-columns: repeat(4,minmax(0,1fr));
    gap: 16px;
}
.dashboard-action-card {
    display: flex;
    flex-direction: column;
    min-height: 175px;
    padding: 24px;
    background: white;
    border: 1px solid #e5eaf0;
    border-radius: 14px;
    text-decoration: none !important;
    box-shadow: 0 8px 24px #192b3d0d;
    transition: .2s;
}
.dashboard-action-card:hover {
    transform: translateY(-4px);
    border-color: #f2bd45;
}
.dashboard-action-icon {
    font-size: 25px;
    color: #c17a00;
    margin-bottom: 20px;
}
.dashboard-action-card strong {
    color: #132238;
    font-size: 16px;
    margin-bottom: 8px;
}
.dashboard-action-card span {
    color: #718096;
    font-size: 13px;
    line-height: 1.6;
}
.dashboard-arrow {
    margin-top: auto;
    padding-top: 16px;
    color: #d08a08 !important;
}
.dashboard-note {
    margin-top: 30px;
    padding: 20px;
    background: #f1f7f6;
    border-left: 4px solid #16836c;
    color: #42605d;
    border-radius: 10px;
}
@media(max-width:900px) {
    .admin-layout {
        grid-template-columns: 1fr;
    }
    .admin-sidebar {
        position: static;
    }
    .admin-sidebar-nav {
        flex-direction: row;
        flex-wrap: wrap;
    }
    .dashboard-actions {
        grid-template-columns: repeat(2,minmax(0,1fr));
    }
}
@media(max-width:600px) {
    .dashboard-page { padding: 25px 15px; }
    .dashboard-hero { padding: 25px; flex-direction: column; align-items: flex-start; }
    .dashboard-title { font-size: 29px; }
    .dashboard-actions { grid-template-columns: 1fr; }
}
</style>
</asp:Content>

<asp:Content ID="Content3"
    ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

<main class="dashboard-page">

<div class="admin-layout">

    <aside class="admin-sidebar">
        <div class="admin-sidebar-brand">
            BookNest
            <small>ADMIN PANEL</small>
        </div>

        <nav class="admin-sidebar-nav">
            <a href="admindashboard.aspx" class="active">&#9632; Dashboard</a>
            <a href="add_books.aspx">&#43; Add Product</a>
            <a href="add_author.aspx">&#9998; Add Author</a>
            <a href="manage_books.aspx">&#9776; Manage Books</a>
            <a href="manage_categories.aspx">&#9830; Categories</a>
            <a href="manage_orders.aspx">&#128722; Orders</a>
            <a href="manage_users.aspx">&#128101; Users</a>
            <a href="Login.aspx?logout=1">&#10140; Logout</a>
        </nav>
    </aside>

    <div class="dashboard-content">

    <section class="dashboard-hero">
        <div>
            <div class="dashboard-eyebrow">
                BOOKNEST ADMIN PANEL
            </div>

            <h1 class="dashboard-title">
                <asp:Label ID="Label1" runat="server"
                    Text="Welcome back"></asp:Label>
            </h1>
            
<asp:Button ID="btnLogout" runat="server"
    Text="Logout"
    OnClick="btnLogout_Click"
    CausesValidation="false"
    Style="padding: 10px 22px; background: #f8c85b;
           color: #132238; border: none; border-radius: 6px;
           cursor: pointer; margin-top: 20px;" />


            <p class="dashboard-subtitle">
                Manage your bookstore catalogue, authors and books
                from one place.
            </p>
        </div>

        <div class="dashboard-hero-mark">&#128218;</div>
    </section>

    <div class="dashboard-section-heading">
        <h2>Quick Actions</h2>
        <p>Choose what you want to manage.</p>
    </div>

    <section class="dashboard-actions">

        <a href="add_author.aspx" class="dashboard-action-card">
            <div class="dashboard-action-icon">&#9998;</div>
            <strong>Add Author</strong>
            <span>Add and manage book authors.</span>
            <span class="dashboard-arrow">Open author manager &rarr;</span>
        </a>

        <a href="add_books.aspx" class="dashboard-action-card">
            <div class="dashboard-action-icon">&#128214;</div>
            <strong>Add Product</strong>
            <span>Add a new product to your book catalogue.</span>
            <span class="dashboard-arrow">Open product page &rarr;</span>
        </a>

        <a href="Books.aspx" class="dashboard-action-card">
            <div class="dashboard-action-icon">&#128218;</div>
            <strong>Browse Catalogue</strong>
            <span>View books available to customers.</span>
            <span class="dashboard-arrow">View books &rarr;</span>
        </a>

        <a href="Categories.aspx" class="dashboard-action-card">
            <div class="dashboard-action-icon">&#9776;</div>
            <strong>Categories</strong>
            <span>Explore book categories.</span>
            <span class="dashboard-arrow">View categories &rarr;</span>
        </a>

    </section>

    <section class="dashboard-note">
        Your bookstore management options are available above.
        Saved book changes can appear in the public catalogue.
    </section>

    </div>
</div>

</main>

</asp:Content>

<asp:Content ID="Content4"
    ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
