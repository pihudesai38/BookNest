<%@ Page Title="Login - MRE Book Store" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BookNest.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Login Page Container */
        .login-page-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 50px 20px;
            min-height: 80vh;
        }

        .login-card-container {
            background-color: #ffffff;
            border-radius: 24px;
            padding: 45px 40px;
            width: 100%;
            max-width: 480px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.05);
            border: 1px solid #f1f5f9;
        }

        /* Header / Logo */
        .login-header-logo {
            display: flex;
            align-items: center;
            gap: 12px;
            text-decoration: none;
            margin-bottom: 30px;
        }

        .login-logo-icon {
            color: #f59e0b;
            font-size: 32px;
        }

        .login-logo-text-group {
            display: flex;
            flex-direction: column;
        }

        .login-logo-title {
            font-size: 20px;
            font-weight: 800;
            color: #1e293b;
            letter-spacing: -0.3px;
            line-height: 1.2;
        }

        .login-logo-sub {
            font-size: 13px;
            color: #64748b;
        }

        /* Headings */
        .login-heading {
            font-size: 32px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 8px;
            letter-spacing: -0.5px;
        }

        .login-subtitle {
            font-size: 14px;
            color: #64748b;
            line-height: 1.5;
            margin-bottom: 30px;
        }

        /* Form Inputs Floating Group */
        .form-floating-group {
            background-color: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 10px 16px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 14px;
            transition: all 0.2s ease;
            position: relative;
        }

        .form-floating-group:focus-within {
            border-color: #f59e0b;
            box-shadow: 0 0 0 3px rgba(245, 158, 11, 0.15);
        }

        .floating-icon {
            color: #64748b;
            font-size: 18px;
            flex-shrink: 0;
        }

        .floating-input-box {
            display: flex;
            flex-direction: column;
            flex: 1;
        }

        .floating-label {
            font-size: 12px;
            font-weight: 600;
            color: #64748b;
            margin-bottom: 2px;
        }

        .form-input-clean {
            border: none;
            outline: none;
            font-size: 14px;
            color: #1e293b;
            font-family: inherit;
            background: transparent;
            width: 100%;
        }

        .form-input-clean::placeholder {
            color: #cbd5e1;
        }

        .toggle-password-icon {
            color: #94a3b8;
            font-size: 16px;
            cursor: pointer;
            padding: 4px;
            transition: color 0.2s ease;
        }

        .toggle-password-icon:hover {
            color: #334155;
        }

        /* Options Row (Remember & Forgot) */
        .login-options-row {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 25px;
            font-size: 14px;
        }

        .remember-checkbox {
            display: flex;
            align-items: center;
            gap: 8px;
            color: #475569;
            font-size: 14px;
            cursor: pointer;
        }

        .remember-checkbox input[type="checkbox"] {
            accent-color: #15803d;
            width: 18px;
            height: 18px;
            cursor: pointer;
        }

        .forgot-password-link {
            color: #15803d;
            font-weight: 600;
            text-decoration: none;
            transition: color 0.2s ease;
        }

        .forgot-password-link:hover {
            color: #166534;
            text-decoration: underline;
        }

        /* Golden Login Button */
        .login-submit-btn {
            background-color: #f5b738;
            color: #1e293b;
            border: none;
            outline: none;
            border-radius: 30px;
            padding: 14px 30px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            transition: all 0.2s ease;
            box-shadow: 0 4px 14px rgba(245, 183, 56, 0.35);
        }

        .login-submit-btn:hover {
            background-color: #eab308;
            transform: translateY(-1px);
            box-shadow: 0 6px 18px rgba(245, 183, 56, 0.5);
        }

        /* Divider */
        .social-divider {
            display: flex;
            align-items: center;
            margin: 30px 0;
            color: #94a3b8;
            font-size: 13px;
        }

        .social-divider::before,
        .social-divider::after {
            content: '';
            flex: 1;
            border-bottom: 1px solid #e2e8f0;
        }

        .social-divider span {
            padding: 0 15px;
        }

        /* Social Buttons */
        .social-btn-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 12px;
            margin-bottom: 35px;
        }

        .social-btn-card {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 12px;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            background-color: #ffffff;
            color: #334155;
            font-size: 18px;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .social-btn-card:hover {
            background-color: #f8fafc;
            border-color: #cbd5e1;
            transform: translateY(-1px);
        }

        /* Footer Register Link */
        .login-footer-note {
            text-align: center;
            font-size: 14px;
            color: #64748b;
        }

        .register-link-highlight {
            color: #15803d;
            font-weight: 700;
            text-decoration: underline;
            margin-left: 4px;
            transition: color 0.2s ease;
        }

        .register-link-highlight:hover {
            color: #166534;
        }

        /* Alert Panel */
        .alert-box {
            padding: 12px 16px;
            border-radius: 10px;
            font-size: 14px;
            margin-bottom: 20px;
        }
        .alert-error {
            background-color: #fef2f2;
            color: #b91c1c;
            border: 1px solid #fecaca;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="login-page-wrapper">
        <div class="login-card-container">
            <!-- Brand Logo -->
            <a href="index.aspx" class="login-header-logo">
                <i class="fa-solid fa-book-open login-logo-icon"></i>
                <div class="login-logo-text-group">
                    <span class="login-logo-title">MRE Book Store</span>
                    <span class="login-logo-sub">Books make life better.</span>
                </div>
            </a>

            <!-- Welcome Headings -->
            <h1 class="login-heading">Welcome Back!</h1>
            <p class="login-subtitle">
                Log in to your MRE Book Store account and continue your reading journey.
            </p>

            <!-- Error Panel -->
            <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="alert-box alert-error">
                <i class="fa-solid fa-triangle-exclamation"></i>
                <asp:Literal ID="litError" runat="server"></asp:Literal>
            </asp:Panel>

            <!-- Email Address Input Group -->
            <div class="form-floating-group">
                <i class="fa-regular fa-envelope floating-icon"></i>
                <div class="floating-input-box">
                    <label class="floating-label">Email Address</label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-input-clean" Placeholder="e.g. user@example.com"></asp:TextBox>
                </div>
            </div>

            <!-- Password Input Group -->
            <div class="form-floating-group">
                <i class="fa-solid fa-lock floating-icon"></i>
                <div class="floating-input-box">
                    <label class="floating-label">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-input-clean" Placeholder="Enter your password"></asp:TextBox>
                </div>
                <i class="fa-regular fa-eye toggle-password-icon" id="togglePasswordBtn"></i>
            </div>

            <!-- Options Row (Remember Me & Forgot Password) -->
            <div class="login-options-row">
                <label class="remember-checkbox">
                    <asp:CheckBox ID="chkRemember" runat="server" Text="Remember me" />
                </label>
                <a href="ForgotPassword.aspx" class="forgot-password-link">Forgot Password?</a>
            </div>

            <!-- Login Submit Button -->
            <asp:Button ID="btnLogin" runat="server" CssClass="login-submit-btn" Text="Login &rarr;" OnClick="btnLogin_Click" />

            <!-- Social Divider -->
            <div class="social-divider">
                <span>or continue with</span>
            </div>

            <!-- Social Login Buttons -->
            <div class="social-btn-grid">
                <a href="#" class="social-btn-card" title="Google">
                    <i class="fa-brands fa-google" style="color: #ea4335;"></i>
                </a>
                <a href="#" class="social-btn-card" title="Facebook">
                    <i class="fa-brands fa-facebook" style="color: #1877f2;"></i>
                </a>
                <a href="#" class="social-btn-card" title="Apple">
                    <i class="fa-brands fa-apple" style="color: #000000;"></i>
                </a>
            </div>

            <!-- Footer Register Note -->
            <div class="login-footer-note">
                <span>Don't have an account?</span>
                <a href="Register.aspx" class="register-link-highlight">Register</a>
            </div>
        </div>
    </div>

    <!-- Toggle Password Visibility Script -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var toggleBtn = document.getElementById("togglePasswordBtn");
            var passInput = document.getElementById("<%= txtPassword.ClientID %>");
            if (toggleBtn && passInput) {
                toggleBtn.addEventListener("click", function () {
                    if (passInput.type === "password") {
                        passInput.type = "text";
                        toggleBtn.classList.remove("fa-eye");
                        toggleBtn.classList.add("fa-eye-slash");
                    } else {
                        passInput.type = "password";
                        toggleBtn.classList.remove("fa-eye-slash");
                        toggleBtn.classList.add("fa-eye");
                    }
                });
            }
        });
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
</asp:Content>
