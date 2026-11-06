<%@ Page Title="Contact Us - MRE Book Store" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="BookNest.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Contact Page Styles */
        
        /* 1. Contact Hero Banner */
        .contact-hero-banner {
            background-color: #f3ebd9;
            background: linear-gradient(135deg, #f6f0e4 0%, #ebe0cd 100%);
            border-radius: 16px;
            margin: 25px 0 40px 0;
            padding: 50px 60px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 40px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
            position: relative;
            overflow: hidden;
        }

        .contact-hero-left {
            flex: 1;
            max-width: 580px;
            z-index: 2;
        }

        .contact-hero-tagline {
            display: inline-block;
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 2px;
            color: #2d6a4f;
            text-transform: uppercase;
            margin-bottom: 14px;
        }

        .contact-hero-title {
            font-size: 42px;
            font-weight: 800;
            color: #1e293b;
            line-height: 1.2;
            letter-spacing: -0.5px;
            margin-bottom: 18px;
        }

        .contact-hero-desc {
            font-size: 15px;
            color: #64748b;
            line-height: 1.6;
        }

        .contact-hero-right {
            flex: 1;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            z-index: 2;
        }

        .contact-hero-img {
            max-width: 100%;
            height: auto;
            max-height: 220px;
            object-fit: contain;
            filter: drop-shadow(0 8px 20px rgba(0,0,0,0.08));
        }

        /* 2. Main 2-Column Grid Layout */
        .contact-main-grid {
            display: grid;
            grid-template-columns: 1fr 1.15fr;
            gap: 40px;
            margin-bottom: 50px;
        }

        /* Left Column: Get In Touch Cards */
        .get-in-touch-section {
            display: flex;
            flex-direction: column;
        }

        .section-title {
            font-size: 26px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 8px;
        }

        .section-subtitle {
            font-size: 14px;
            color: #64748b;
            line-height: 1.5;
            margin-bottom: 30px;
        }

        .info-cards-list {
            display: flex;
            flex-direction: column;
            gap: 18px;
            margin-bottom: 30px;
        }

        .info-card {
            display: flex;
            align-items: flex-start;
            gap: 18px;
            background-color: #ffffff;
            border-radius: 14px;
            padding: 20px 24px;
            border: 1px solid #f1f5f9;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.03);
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .info-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.06);
        }

        .info-icon-circle {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            color: #ffffff;
            flex-shrink: 0;
        }

        .icon-green { background-color: #15803d; }
        .icon-orange { background-color: #f59e0b; }
        .icon-blue { background-color: #2563eb; }
        .icon-purple { background-color: #7c3aed; }

        .info-content {
            display: flex;
            flex-direction: column;
        }

        .info-title {
            font-size: 16px;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 4px;
        }

        .info-detail {
            font-size: 14px;
            color: #475569;
            line-height: 1.5;
        }

        .info-subtext {
            font-size: 12px;
            color: #94a3b8;
            margin-top: 2px;
        }

        /* Follow Us & Annotation */
        .follow-connected-wrapper {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 10px;
        }

        .follow-us-box {
            display: flex;
            align-items: center;
            gap: 14px;
        }

        .follow-label {
            font-size: 14px;
            font-weight: 700;
            color: #334155;
        }

        .social-circle-btn {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background-color: #f1f5f9;
            color: #334155;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
            font-size: 14px;
            transition: all 0.2s ease;
        }

        .social-circle-btn:hover {
            background-color: #15803d;
            color: #ffffff;
        }

        .stay-connected-badge {
            font-family: 'Comic Sans MS', 'Caveat', cursive, sans-serif;
            color: #15803d;
            font-size: 18px;
            font-weight: 700;
            transform: rotate(-6deg);
            display: inline-flex;
            align-items: center;
            gap: 6px;
            position: relative;
        }

        .stay-connected-badge::after {
            content: '✨';
            font-size: 14px;
        }

        /* Right Column: Send Us a Message Form */
        .send-message-container {
            background-color: #f2f8f6;
            border-radius: 20px;
            padding: 40px;
            border: 1px solid #e2ece9;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.02);
        }

        .form-grid {
            display: flex;
            flex-direction: column;
            gap: 20px;
            margin-top: 25px;
        }

        .form-row-2col {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        .input-group-custom {
            position: relative;
            background-color: #ffffff;
            border-radius: 10px;
            border: 1px solid #e2e8f0;
            transition: all 0.2s ease;
            display: flex;
            align-items: center;
        }

        .input-group-custom:focus-within {
            border-color: #f59e0b;
            box-shadow: 0 0 0 3px rgba(245, 158, 11, 0.15);
        }

        .input-group-custom i {
            position: absolute;
            left: 16px;
            color: #94a3b8;
            font-size: 15px;
            pointer-events: none;
        }

        .form-control-custom {
            width: 100%;
            padding: 14px 16px 14px 44px;
            border: none;
            outline: none;
            border-radius: 10px;
            font-size: 14px;
            color: #334155;
            font-family: inherit;
            background: transparent;
        }

        .form-control-custom::placeholder {
            color: #a1a1aa;
        }

        textarea.form-control-custom {
            resize: vertical;
            min-height: 120px;
            padding-top: 14px;
        }

        select.form-control-custom {
            cursor: pointer;
            appearance: none;
            background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='%2394a3b8'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M19 9l-7 7-7-7'%3E%3C/path%3E%3C/svg%3E");
            background-repeat: no-repeat;
            background-position: right 16px center;
            background-size: 16px;
        }

        .submit-btn-yellow {
            background-color: #f5b738;
            color: #1e293b;
            border: none;
            outline: none;
            border-radius: 30px;
            padding: 15px 30px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            transition: all 0.2s ease;
            box-shadow: 0 4px 14px rgba(245, 183, 56, 0.35);
            margin-top: 10px;
        }

        .submit-btn-yellow:hover {
            background-color: #eab308;
            transform: translateY(-1px);
            box-shadow: 0 6px 18px rgba(245, 183, 56, 0.5);
        }

        /* Success / Status Message */
        .form-message-alert {
            padding: 14px 18px;
            border-radius: 10px;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .form-message-success {
            background-color: #dcfce7;
            color: #15803d;
            border: 1px solid #bbf7d0;
        }

        /* 3. Visit Our Store Section */
        .visit-store-card {
            background-color: #f8fafc;
            border-radius: 20px;
            border: 1px solid #e2e8f0;
            display: grid;
            grid-template-columns: 1.1fr 1.4fr;
            overflow: hidden;
            margin-bottom: 60px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.03);
        }

        .visit-left-content {
            padding: 45px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .store-icon-circle {
            width: 56px;
            height: 56px;
            border-radius: 50%;
            background-color: #dcfce7;
            color: #15803d;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .store-title {
            font-size: 24px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 8px;
        }

        .store-desc {
            font-size: 14px;
            color: #64748b;
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .get-directions-btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 12px 26px;
            border-radius: 30px;
            border: 2px solid #15803d;
            color: #15803d;
            background: #ffffff;
            font-size: 14px;
            font-weight: 700;
            text-decoration: none;
            transition: all 0.2s ease;
            align-self: flex-start;
        }

        .get-directions-btn:hover {
            background-color: #15803d;
            color: #ffffff;
        }

        .visit-right-map {
            width: 100%;
            height: 100%;
            min-height: 280px;
            position: relative;
            background-color: #e2e8f0;
        }

        .visit-right-map iframe {
            width: 100%;
            height: 100%;
            border: none;
        }

        /* Responsive */
        @media (max-width: 992px) {
            .contact-main-grid {
                grid-template-columns: 1fr;
            }
            .visit-store-card {
                grid-template-columns: 1fr;
            }
            .form-row-2col {
                grid-template-columns: 1fr;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Top Contact Hero Banner -->
    <section class="contact-hero-banner">
        <div class="contact-hero-left">
            <span class="contact-hero-tagline">CONTACT US</span>
            <h1 class="contact-hero-title">We'd Love to<br />Hear From You!</h1>
            <p class="contact-hero-desc">
                Have a question, suggestion, or need help? Our team is here to assist you. Get in touch with us anytime!
            </p>
        </div>
        <div class="contact-hero-right">
            <img src="images/hero-banner.png" alt="Contact Us Banner" class="contact-hero-img" />
        </div>
    </section>

    <!-- Main 2-Column Grid -->
    <div class="contact-main-grid">
        <!-- Left Column: Get In Touch -->
        <div class="get-in-touch-section">
            <h2 class="section-title">Get In Touch</h2>
            <p class="section-subtitle">
                You can reach us through any of the following channels. We're always happy to help!
            </p>

            <!-- Info Cards -->
            <div class="info-cards-list">
                <!-- Address Card -->
                <div class="info-card">
                    <div class="info-icon-circle icon-green">
                        <i class="fa-solid fa-location-dot"></i>
                    </div>
                    <div class="info-content">
                        <span class="info-title">Our Address</span>
                        <span class="info-detail">123 Book Street, Near City Library, Ahmedabad, Gujarat &ndash; 380001, India</span>
                    </div>
                </div>

                <!-- Phone Card -->
                <div class="info-card">
                    <div class="info-icon-circle icon-orange">
                        <i class="fa-solid fa-phone"></i>
                    </div>
                    <div class="info-content">
                        <span class="info-title">Phone</span>
                        <span class="info-detail">+91 98765 43210</span>
                        <span class="info-subtext">Mon &ndash; Sat, 9:00 AM &ndash; 8:00 PM</span>
                    </div>
                </div>

                <!-- Email Card -->
                <div class="info-card">
                    <div class="info-icon-circle icon-blue">
                        <i class="fa-solid fa-envelope"></i>
                    </div>
                    <div class="info-content">
                        <span class="info-title">Email</span>
                        <span class="info-detail">support@mrebookstore.com</span>
                        <span class="info-subtext">We reply within 24 hours</span>
                    </div>
                </div>

                <!-- Working Hours Card -->
                <div class="info-card">
                    <div class="info-icon-circle icon-purple">
                        <i class="fa-solid fa-clock"></i>
                    </div>
                    <div class="info-content">
                        <span class="info-title">Working Hours</span>
                        <span class="info-detail">Mon &ndash; Sat: 9:00 AM &ndash; 8:00 PM</span>
                        <span class="info-subtext">Sun: 10:00 AM &ndash; 6:00 PM</span>
                    </div>
                </div>
            </div>

            <!-- Follow Us & Let's Stay Connected -->
            <div class="follow-connected-wrapper">
                <div class="follow-us-box">
                    <span class="follow-label">Follow Us</span>
                    <a href="#" class="social-circle-btn"><i class="fa-brands fa-facebook-f"></i></a>
                    <a href="#" class="social-circle-btn"><i class="fa-brands fa-instagram"></i></a>
                    <a href="#" class="social-circle-btn"><i class="fa-brands fa-youtube"></i></a>
                    <a href="#" class="social-circle-btn"><i class="fa-brands fa-x-twitter"></i></a>
                </div>
                <div class="stay-connected-badge">
                    Let's stay connected!
                </div>
            </div>
        </div>

        <!-- Right Column: Send Us a Message Form (ASP.NET Controls) -->
        <div class="send-message-container">
            <h2 class="section-title">Send Us a Message</h2>
            <p class="section-subtitle">
                Fill out the form below and we'll get back to you as soon as possible.
            </p>

            <asp:Panel ID="pnlSuccess" runat="server" Visible="false" CssClass="form-message-alert form-message-success">
                <i class="fa-solid fa-circle-check"></i> Thank you! Your message has been sent successfully. We will contact you soon.
            </asp:Panel>

            <div class="form-grid">
                <!-- Name & Email Row -->
                <div class="form-row-2col">
                    <div class="input-group-custom">
                        <i class="fa-regular fa-user"></i>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control-custom" Placeholder="Your Name *"></asp:TextBox>
                    </div>
                    <div class="input-group-custom">
                        <i class="fa-regular fa-envelope"></i>
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control-custom" Placeholder="Your Email *"></asp:TextBox>
                    </div>
                </div>

                <!-- Phone Row -->
                <div class="input-group-custom">
                    <i class="fa-solid fa-phone"></i>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control-custom" Placeholder="Your Phone (Optional)"></asp:TextBox>
                </div>

                <!-- Subject DropDown Row -->
                <div class="input-group-custom">
                    <i class="fa-regular fa-envelope"></i>
                    <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control-custom">
                        <asp:ListItem Value="">Subject *</asp:ListItem>
                        <asp:ListItem Value="General Inquiry">General Inquiry</asp:ListItem>
                        <asp:ListItem Value="Order Status">Order Status</asp:ListItem>
                        <asp:ListItem Value="Book Request">Book Availability / Request</asp:ListItem>
                        <asp:ListItem Value="Feedback">Feedback / Suggestion</asp:ListItem>
                        <asp:ListItem Value="Other">Other</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <!-- Message Row -->
                <div class="input-group-custom">
                    <i class="fa-regular fa-comment-dots"></i>
                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control-custom" Placeholder="Your Message *"></asp:TextBox>
                </div>

                <!-- Submit Button -->
                <asp:Button ID="btnSendMessage" runat="server" CssClass="submit-btn-yellow" Text="Send Message" OnClick="btnSendMessage_Click" />
            </div>
        </div>
    </div>

    <!-- Visit Our Store & Map Section -->
    <section class="visit-store-card">
        <div class="visit-left-content">
            <div class="store-icon-circle">
                <i class="fa-solid fa-store"></i>
            </div>
            <h3 class="store-title">Visit Our Store</h3>
            <p class="store-desc">
                Come by and explore our collection in person. We'd love to see you!
            </p>
            <a href="https://maps.google.com/?q=Ahmedabad+Book+Store" target="_blank" class="get-directions-btn">
                <i class="fa-solid fa-location-arrow"></i>
                <span>Get Directions</span>
            </a>
        </div>
        <div class="visit-right-map">
            <iframe src="https://maps.google.com/maps?q=Ahmedabad,Gujarat&t=&z=13&ie=UTF8&iwloc=&output=embed" allowfullscreen="" loading="lazy"></iframe>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
