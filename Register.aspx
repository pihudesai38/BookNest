
<%@ Page Title="Register - MRE Book Store" Language="C#" MasterPageFile="~/public.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="BookNest.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Register Page Container */
        .register-page-wrapper {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 50px 20px;
            min-height: 85vh;
        }

        .register-card-container {
            background-color: #ffffff;
            border-radius: 24px;
            padding: 45px 40px;
            width: 100%;
            max-width: 500px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.05);
            border: 1px solid #f1f5f9;
        }

        /* Header / Logo */
        .register-header-logo {
            display: flex;
            align-items: center;
            gap: 12px;
            text-decoration: none;
            margin-bottom: 30px;
        }

        .register-logo-icon {
            color: #f59e0b;
            font-size: 32px;
        }

        .register-logo-text-group {
            display: flex;
            flex-direction: column;
        }

        .register-logo-title {
            font-size: 20px;
            font-weight: 800;
            color: #1e293b;
            letter-spacing: -0.3px;
            line-height: 1.2;
        }

        .register-logo-sub {
            font-size: 13px;
            color: #64748b;
        }

        /* Headings */
        .register-heading {
            font-size: 32px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 8px;
            letter-spacing: -0.5px;
        }

        .register-subtitle {
            font-size: 14px;
            color: #64748b;
            line-height: 1.5;
            margin-bottom: 30px;
        }

        /* Form Inputs */
        .form-floating-group {
            background-color: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 14px;
            padding: 10px 16px;
            margin-bottom: 18px;
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

        /* Register Button */
        .register-submit-btn {
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
            margin-top: 10px;
        }

            .register-submit-btn:hover {
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

        /* Footer */
        .register-footer-note {
            text-align: center;
            font-size: 14px;
            color: #64748b;
        }

        .login-link-highlight {
            color: #15803d;
            font-weight: 700;
            text-decoration: underline;
            margin-left: 4px;
            transition: color 0.2s ease;
        }

            .login-link-highlight:hover {
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

        .alert-success {
            background-color: #dcfce7;
            color: #15803d;
            border: 1px solid #bbf7d0;
        }

        /* GridView */
        .register-grid {
            width: 100%;
            margin-top: 30px;
            border-collapse: collapse;
        }

            .register-grid th,
            .register-grid td {
                padding: 10px;
                border: 1px solid #e2e8f0;
            }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="register-page-wrapper">

        <div class="register-card-container">

            <!-- Brand Logo -->
            <a href="index.aspx" class="register-header-logo">

                <i class="fa-solid fa-book-open register-logo-icon"></i>

                <div class="register-logo-text-group">
                    <span class="register-logo-title">MRE Book Store</span>
                    <span class="register-logo-sub">Books make life better.</span>
                </div>

            </a>


            <!-- Heading -->
            <h1 class="register-heading">Create Your Account</h1>

            <p class="register-subtitle">
                Join MRE Book Store and get access to amazing books, offers and more.
            </p>


            <!-- Alert -->
            <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert-box">
                <asp:Literal ID="litAlert" runat="server"></asp:Literal>
            </asp:Panel>


            <!-- Full Name -->
            <div class="form-floating-group">

                <i class="fa-regular fa-user floating-icon"></i>

                <div class="floating-input-box">

                    <label class="floating-label">Full Name</label>

                    <asp:TextBox
                        ID="txtFullName"
                        runat="server"
                        CssClass="form-input-clean"
                        Placeholder="Enter your full name">
                    </asp:TextBox>

                </div>

            </div>


            <!-- Email -->
            <div class="form-floating-group">

                <i class="fa-regular fa-envelope floating-icon"></i>

                <div class="floating-input-box">

                    <label class="floating-label">Email Address</label>

                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        TextMode="Email"
                        CssClass="form-input-clean"
                        Placeholder="e.g. user@example.com">
                    </asp:TextBox>

                </div>

            </div>


            <!-- Phone -->
            <div class="form-floating-group">

                <i class="fa-solid fa-phone floating-icon"></i>

                <div class="floating-input-box">

                    <label class="floating-label">Phone Number</label>

                    <asp:TextBox
                        ID="txtPhone"
                        runat="server"
                        CssClass="form-input-clean"
                        Placeholder="+91 98765 43210">
                    </asp:TextBox>

                </div>

            </div>


            <!-- Password -->
            <div class="form-floating-group">

                <i class="fa-solid fa-lock floating-icon"></i>

                <div class="floating-input-box">

                    <label class="floating-label">Password</label>

                    <asp:TextBox
                        ID="txtPassword"
                        runat="server"
                        TextMode="Password"
                        CssClass="form-input-clean"
                        Placeholder="Create a strong password">
                    </asp:TextBox>

                </div>

                <i class="fa-regular fa-eye toggle-password-icon"
                    id="togglePasswordBtn"></i>

            </div>


            <!-- Confirm Password -->
            <div class="form-floating-group">

                <i class="fa-solid fa-lock floating-icon"></i>

                <div class="floating-input-box">

                    <label class="floating-label">Confirm Password</label>

                    <asp:TextBox
                        ID="txtConfirmPassword"
                        runat="server"
                        TextMode="Password"
                        CssClass="form-input-clean"
                        Placeholder="Re-enter your password">
                    </asp:TextBox>

                </div>

                <i class="fa-regular fa-eye toggle-password-icon"
                    id="toggleConfirmPasswordBtn"></i>

            </div>


            <!-- Register Button -->
            <!-- IMPORTANT: Text must match C# condition -->
            <asp:Button
                ID="btnRegister"
                runat="server"
                CssClass="register-submit-btn"
                Text="Register"
                OnClick="btnRegister_Click" />


            <!-- Social Divider -->
            <div class="social-divider">

                <span>or continue with</span>

            </div>


            <!-- Social Buttons -->
            <div class="social-btn-grid">

                <a href="#" class="social-btn-card" title="Google">
                    <i class="fa-brands fa-google"
                        style="color: #ea4335;"></i>
                </a>

                <a href="#" class="social-btn-card" title="Facebook">
                    <i class="fa-brands fa-facebook"
                        style="color: #1877f2;"></i>
                </a>

                <a href="#" class="social-btn-card" title="Apple">
                    <i class="fa-brands fa-apple"
                        style="color: #000000;"></i>
                </a>

            </div>


            <!-- Login Link -->
            <div class="register-footer-note">

                <span>Already have an account?</span>

                <a href="Login.aspx"
                    class="login-link-highlight">Login
                </a>

            </div>

        </div>

    </div>


    <!-- GridView -->
    <asp:GridView
        ID="GridView1"
        runat="server"
        AutoGenerateColumns="False"
        CssClass="register-grid"
        OnRowCommand="GridView1_RowCommand1">

        <Columns>

         
            <asp:TemplateField HeaderText="Id">

                <ItemTemplate>

                    <asp:Label
                        ID="Label1"
                        runat="server"
                        Text='<%# Eval("Id") %>'>
                    </asp:Label>

                </ItemTemplate>

            </asp:TemplateField>



            <asp:TemplateField HeaderText="Full Name">

                <ItemTemplate>

                    <asp:Label
                        ID="Label2"
                        runat="server"
                        Text='<%# Eval("Full_Name") %>'>
                    </asp:Label>

                </ItemTemplate>

            </asp:TemplateField>


       
            <asp:TemplateField HeaderText="Email">

                <ItemTemplate>

                    <asp:Label
                        ID="Label3"
                        runat="server"
                        Text='<%# Eval("Email") %>'>
                    </asp:Label>

                </ItemTemplate>

            </asp:TemplateField>


            <asp:TemplateField HeaderText="Phone No">

                <ItemTemplate>

                    <asp:Label
                        ID="Label4"
                        runat="server"
                        Text='<%# Eval("Phone") %>'>
                    </asp:Label>

                </ItemTemplate>

            </asp:TemplateField>


            <asp:TemplateField HeaderText="Password">

                <ItemTemplate>

                    <asp:Label
                        ID="Label5"
                        runat="server"
                        Text='<%# Eval("Password") %>'>
                    </asp:Label>

                </ItemTemplate>

            </asp:TemplateField>


        
            <asp:TemplateField HeaderText="Confirm Password">

                <ItemTemplate>

                    <asp:Label
                        ID="Label6"
                        runat="server"
                        Text='<%# Eval("Confirm_Password") %>'>
                    </asp:Label>

                </ItemTemplate>

            </asp:TemplateField>


            <asp:TemplateField HeaderText="Edit">

                <ItemTemplate>

                    <asp:LinkButton
                        ID="LinkButton1"
                        runat="server"
                        CommandArgument='<%# Eval("Id") %>'
                        CommandName="cmd_edt">
                        Edit
                    </asp:LinkButton>

                </ItemTemplate>

            </asp:TemplateField>


            <asp:TemplateField HeaderText="Delete">

                <ItemTemplate>

                    <asp:LinkButton
                        ID="LinkButton2"
                        runat="server"
                        CommandArgument='<%# Eval("Id") %>'
                        CommandName="cmd_del">
                        Delete
                    </asp:LinkButton>

                </ItemTemplate>

            </asp:TemplateField>

        </Columns>

    </asp:GridView>


    <!-- Password Visibility Toggle Script -->
    <script>

        document.addEventListener("DOMContentLoaded", function () {

            function setupToggle(toggleId, inputId) {

                var toggleBtn = document.getElementById(toggleId);
                var inputEl = document.getElementById(inputId);

                if (toggleBtn && inputEl) {

                    toggleBtn.addEventListener("click", function () {

                        if (inputEl.type === "password") {

                            inputEl.type = "text";

                            toggleBtn.classList.remove("fa-eye");

                            toggleBtn.classList.add("fa-eye-slash");

                        }
                        else {

                            inputEl.type = "password";

                            toggleBtn.classList.remove("fa-eye-slash");

                            toggleBtn.classList.add("fa-eye");

                        }

                    });

                }

            }


            setupToggle(
                "togglePasswordBtn",
                "<%= txtPassword.ClientID %>"
            );


            setupToggle(
                "toggleConfirmPasswordBtn",
                "<%= txtConfirmPassword.ClientID %>"
            );

        });

    </script>

</asp:Content>


<asp:Content ID="Content3"
    ContentPlaceHolderID="ContentPlaceHolder2"
    runat="server">
</asp:Content>


<asp:Content ID="Content4"
    ContentPlaceHolderID="ContentPlaceHolder3"
    runat="server">
</asp:Content>
