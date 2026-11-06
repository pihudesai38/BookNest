<%@ Page Title="Home - MRE Book Store" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="BookNest.index"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Hero Banner Section Styles (Second Section) */
        .hero-banner-section {
            background-color: #f3ebd9;
            background: linear-gradient(135deg, #f6f0e4 0%, #ebe0cd 100%);
            border-radius: 16px;
            margin: 25px 0;
            padding: 50px 60px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 40px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
            position: relative;
            overflow: hidden;
        }

        /* Left Text Column */
        .hero-text-col {
            flex: 1;
            max-width: 580px;
            z-index: 2;
        }

        .hero-tagline {
            display: inline-block;
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 2.5px;
            color: #b47a32;
            text-transform: uppercase;
            margin-bottom: 16px;
        }

        .hero-main-title {
            font-size: 42px;
            font-weight: 800;
            color: #1e293b;
            line-height: 1.22;
            letter-spacing: -0.5px;
            margin-bottom: 18px;
        }

        .hero-subtitle-text {
            font-size: 16px;
            color: #64748b;
            line-height: 1.6;
            margin-bottom: 35px;
        }

        /* Interactive Search Box */
        .hero-search-wrapper {
            background: #ffffff;
            border-radius: 50px;
            padding: 6px 6px 6px 22px;
            display: flex;
            align-items: center;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.9);
            max-width: 500px;
        }

        .hero-search-wrapper .search-icon-left {
            color: #94a3b8;
            font-size: 17px;
            margin-right: 12px;
        }

        .hero-search-wrapper .hero-search-input {
            flex: 1;
            border: none;
            outline: none;
            font-size: 15px;
            color: #334155;
            font-family: inherit;
            background: transparent;
        }

        .hero-search-wrapper .hero-search-input::placeholder {
            color: #a1a1aa;
        }

        .hero-search-wrapper .hero-search-button {
            background-color: #f5b738;
            color: #1e293b;
            border: none;
            outline: none;
            border-radius: 30px;
            padding: 12px 30px;
            font-size: 14px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.2s ease;
            box-shadow: 0 4px 12px rgba(245, 183, 56, 0.3);
        }

        .hero-search-wrapper .hero-search-button:hover {
            background-color: #eab308;
            box-shadow: 0 6px 16px rgba(245, 183, 56, 0.45);
        }

        /* Right Visual Image Column */
        .hero-visual-col {
            flex: 1;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            z-index: 2;
        }

        .hero-img {
            max-width: 100%;
            height: auto;
            max-height: 380px;
            object-fit: contain;
            filter: drop-shadow(0 10px 20px rgba(0,0,0,0.08));
        }

        /* Offer Promo Banner Section (Third Section - Dark Green) */
        .offer-banner-section {
            background-color: #0d382c;
            background: linear-gradient(135deg, #0e3b2e 0%, #082920 100%);
            border-radius: 16px;
            margin: 30px 0;
            padding: 35px 50px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 30px;
            box-shadow: 0 8px 30px rgba(14, 59, 46, 0.15);
            position: relative;
            overflow: hidden;
        }

        .offer-left-content {
            flex: 1;
            max-width: 550px;
            color: #ffffff;
            z-index: 2;
        }

        .offer-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: #f5b738;
            font-size: 14px;
            font-weight: 700;
            margin-bottom: 12px;
        }

        .offer-badge i {
            font-size: 16px;
        }

        .offer-title {
            font-size: 32px;
            font-weight: 800;
            color: #ffffff;
            line-height: 1.25;
            margin-bottom: 10px;
            letter-spacing: -0.3px;
        }

        .offer-title .highlight-yellow {
            color: #f5b738;
        }

        .offer-subtitle {
            font-size: 14px;
            color: #cbd5e1;
            margin-bottom: 25px;
        }

        .offer-subtitle .code-highlight {
            color: #ffffff;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        .shop-now-btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            background-color: #f5b738;
            color: #0e3b2e;
            text-decoration: none;
            font-size: 14px;
            font-weight: 700;
            padding: 12px 28px;
            border-radius: 30px;
            transition: all 0.2s ease;
            box-shadow: 0 4px 14px rgba(245, 183, 56, 0.3);
        }

        .shop-now-btn:hover {
            background-color: #eab308;
            transform: translateY(-2px);
            box-shadow: 0 6px 18px rgba(245, 183, 56, 0.45);
        }

        .offer-right-visual {
            flex: 1;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            z-index: 2;
        }

        .offer-banner-img {
            max-width: 100%;
            height: auto;
            max-height: 180px;
            object-fit: contain;
            filter: drop-shadow(0 4px 15px rgba(0, 0, 0, 0.2));
        }

        /* Feature Badges Grid (4 Columns) */
        .features-grid-section {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 20px;
            margin: 30px 0 40px 0;
            padding: 20px 10px;
        }

        .feature-card {
            display: flex;
            align-items: center;
            gap: 16px;
            padding: 18px 22px;
            background-color: #ffffff;
            border-radius: 12px;
            border: 1px solid #f1f5f9;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.02);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .feature-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(0, 0, 0, 0.05);
        }

        .feature-icon-circle {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background-color: #f8fafc;
            border: 1px solid #e2e8f0;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #1e293b;
            font-size: 18px;
            flex-shrink: 0;
        }

        .feature-text-info {
            display: flex;
            flex-direction: column;
        }

        .feature-title {
            font-size: 15px;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 2px;
        }

        .feature-desc {
            font-size: 12px;
            color: #64748b;
        }

        /* Responsive Styles */
        @media (max-width: 992px) {
            .hero-banner-section, .offer-banner-section {
                flex-direction: column;
                padding: 40px 30px;
                text-align: center;
            }
            .hero-text-col, .offer-left-content {
                max-width: 100%;
            }
            .hero-search-wrapper {
                margin: 0 auto;
            }
            .hero-visual-col, .offer-right-visual {
                justify-content: center;
                width: 100%;
            }
            .features-grid-section {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media (max-width: 576px) {
            .features-grid-section {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Hero Banner (Second Section) -->
    <section class="hero-banner-section">
        <!-- Left Text & Search Area -->
        <div class="hero-text-col">
            <span class="hero-tagline">READ &ndash; LEARN &ndash; GROW</span>
            <h1 class="hero-main-title">
                Your Next Great Book<br />
                Is Just a Click Away
            </h1>
            <p class="hero-subtitle-text">
                Discover a world of stories, knowledge and inspiration at MRE Book Store.
            </p>

            <!-- Search Form -->
            <div class="hero-search-wrapper">
                <i class="fa-solid fa-magnifying-glass search-icon-left"></i>
                <asp:TextBox ID="txtHeroSearch" runat="server" CssClass="hero-search-input" Placeholder="Search for books, authors, genres..."></asp:TextBox>
                <asp:Button ID="btnHeroSearch" runat="server" CssClass="hero-search-button" Text="Search" OnClick="btnHeroSearch_Click" />
            </div>
        </div>

        <!-- Right Image Visual Area -->
        <div class="hero-visual-col">
            <img src="images/hero-banner.png" alt="Your Next Great Book Banner" class="hero-img" />
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <!-- Special Offer Promo Banner (Third Section) -->
    <section class="offer-banner-section">
        <!-- Left Content -->
        <div class="offer-left-content">
            <div class="offer-badge">
                <i class="fa-solid fa-gift"></i>
                <span>Special Offer</span>
            </div>
            <h2 class="offer-title">
                Get <span class="highlight-yellow">20% OFF</span> on your first order
            </h2>
            <p class="offer-subtitle">
                Use code: <span class="code-highlight">WELCOME20</span> at checkout
            </p>
            <a href="Books.aspx" class="shop-now-btn">
                <span>Shop Now</span>
                <i class="fa-solid fa-arrow-right"></i>
            </a>
        </div>

        <!-- Right Image Visual -->
        <div class="offer-right-visual">
            <img src="images/offer-banner.png" alt="Special Offer 20% OFF" class="offer-banner-img" />
        </div>
    </section>

    <!-- Feature Badges Section (4 Column Grid) -->
    <section class="features-grid-section">
        <!-- Feature 1: Free Shipping -->
        <div class="feature-card">
            <div class="feature-icon-circle">
                <i class="fa-solid fa-truck"></i>
            </div>
            <div class="feature-text-info">
                <span class="feature-title">Free Shipping</span>
                <span class="feature-desc">On orders over &#8377;999</span>
            </div>
        </div>

        <!-- Feature 2: Secure Payment -->
        <div class="feature-card">
            <div class="feature-icon-circle">
                <i class="fa-solid fa-lock"></i>
            </div>
            <div class="feature-text-info">
                <span class="feature-title">Secure Payment</span>
                <span class="feature-desc">100% safe &amp; trusted</span>
            </div>
        </div>

        <!-- Feature 3: Easy Returns -->
        <div class="feature-card">
            <div class="feature-icon-circle">
                <i class="fa-solid fa-rotate-left"></i>
            </div>
            <div class="feature-text-info">
                <span class="feature-title">Easy Returns</span>
                <span class="feature-desc">Hassle-free within 7 days</span>
            </div>
        </div>

        <!-- Feature 4: Customer Support -->
        <div class="feature-card">
            <div class="feature-icon-circle">
                <i class="fa-solid fa-headset"></i>
            </div>
            <div class="feature-text-info">
                <span class="feature-title">Customer Support</span>
                <span class="feature-desc">We're here to help</span>
            </div>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
