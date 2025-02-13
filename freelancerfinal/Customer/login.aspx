<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="freelancerfinal.Customer.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <title>Service Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.4/dist/sweetalert2.all.min.js"></script>
</head>
<body>
<form id="loginform" runat="server">
    <div class="p-6 mx-auto mt-[100px]">
        <div class="bg-white rounded-lg shadow-lg  md:w-4/12 mx-auto p-8  ">
            <div>
                <h2 class="text-center text-blue-500 font-serif font-bold text-2xl">Customer Login</h2>
            </div>
            <div class="mt-6">
                <div class="flex flex-col">
                    <asp:Label runat="server" Text="Username" CssClass="text-start font-bold text-base mt-2"></asp:Label>
                    <asp:TextBox runat="server" ID="username" CssClass="w-full px-4 py-2 border-2 mt-2   rounded-lg focus:ring focus:ring-indigo-200   focus:outline-none" placeholder="Username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv_username" runat="server" ControlToValidate="username"
                        ErrorMessage="Username is required" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="flex flex-col">
                    <div>
                        <asp:Label AssociatedControlID="Password" runat="server" Text="Password" CssClass="block text-gray-700 text-sm font-medium mb-1"></asp:Label>
                        <div class="relative">
                            <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="w-full px-3 py-2 border rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none pr-10" Placeholder="********"></asp:TextBox>
                            <button type="button" id="togglePassword" class="absolute inset-y-0 right-0 pr-3 flex items-center text-sm leading-5">
                                <svg class="h-6 w-6 text-gray-700" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                                </svg>
                            </button>
                        </div>
                        <asp:RequiredFieldValidator ID="rfv_Password" runat="server" ControlToValidate="Password"
                            ErrorMessage="Password is required" CssClass="text-red-500 text-xs mt-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="rev_Password" runat="server" ControlToValidate="Password"
                            ErrorMessage="Password must be at least 8 characters long and contain at least one uppercase letter, one lowercase letter, one number, and one special character"
                            CssClass="text-red-500 text-xs mt-1" Display="Dynamic"
                            ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$"></asp:RegularExpressionValidator>
                    </div>
                   <%-- <div>
                        <a href="#">


                            <h1 class="text-blue-500 mt-3 hover:underline">Forget Password?</h1>
                        </a>
                    </div>--%>

                    <div class="mt-6">
                        <asp:Button runat="server" Text="Login" CssClass="text-white bg-[#19A2E6] hover:bg-[#19A2E6] focus:ring-4 focus:ring-[#19A2E6] font-roboto rounded-lg px-5 py-2.5 mb-2 font-bold w-full text-lg" ID="loginbutton" OnClick="loginbutton_Click"/>

                    </div>
                    <div class="mt-5 text-center">
                        <h2>Don't have an account?  <span class="text-bold text-blue-500"><a href="customerregister.aspx">Signup here</a></span></h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        const togglePassword = document.getElementById('togglePassword');
        const password = document.getElementById('<%= Password.ClientID %>');

        togglePassword.addEventListener('click', function () {
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            this.classList.toggle('text-blue-500');
        });
    });
</script>
</body>
</html>
