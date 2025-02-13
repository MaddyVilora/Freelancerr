<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="freelancerfinal.admin.AdminLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.4/dist/sweetalert2.all.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <section class="h-screen flex items-center justify-center">
            <div class="w-full max-w-md px-6 py-8 bg-white shadow-lg rounded-md">
                <h1 class="text-2xl font-bold mb-5 text-center">Admin Login</h1>

                <!-- Username -->
                <div class="relative mb-4">
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="peer block w-full rounded border px-4 py-2 text-base sm:text-sm" Placeholder="Username"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required." CssClass="text-red-500 text-sm mt-1 block"></asp:RequiredFieldValidator>
                </div>

                <!-- Password -->
                <div class="relative mb-4">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="peer block w-full rounded border px-4 py-2 text-base sm:text-sm" TextMode="Password" Placeholder="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" ErrorMessage="Password is required." CssClass="text-red-500 text-sm mt-1 block"></asp:RequiredFieldValidator>
                </div>

                <!-- Remember Me and Forgot Password -->
                <div class="mb-4 flex items-center justify-between">
                    <asp:CheckBox ID="chkRemember" runat="server" Text="Remember me" CssClass="inline-block text-sm" />
                    <asp:HyperLink ID="lnkForgotPassword" runat="server" NavigateUrl="#" CssClass="text-sm text-blue-500 hover:underline">Forgot password?</asp:HyperLink>
                </div>

                <!-- Error Label -->
                <asp:Label ID="lblError" runat="server" CssClass="text-red-500 text-sm font-medium mt-2 block hidden"></asp:Label>

                <!-- Login Button -->
                <div class="text-center">
                    <asp:Button ID="BtnAdminLogin" runat="server" CssClass="w-full rounded bg-black text-white px-5 py-2" Text="Login" OnClick="BtnLogin_Click" />
                </div>
            </div>
        </section>
    </form>
</body>
</html>
