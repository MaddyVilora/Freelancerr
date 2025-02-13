<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="customerregister.aspx.cs" Inherits="freelancerfinal.Customer.customerregister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer Register</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.4/dist/sweetalert2.all.min.js"></script>
</head>
<body class="bg-gray-100">
    <form id="RegistrationForm" runat="server">
        <div class="p-4 md:p-6">
            <asp:Panel ID="RegistrationPanel" runat="server" CssClass="w-full md:w-5/12 bg-white rounded-lg shadow-lg p-6 md:p-10 mx-auto font-sans">
                <h2 class="text-2xl font-bold text-center text-[#19A2E6] mb-6">Customer Register</h2>
                <asp:Panel ID="FormContainer" runat="server" CssClass="space-y-4">
                    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">
                        <!-- First Name -->
                        <div>
                            <asp:Label AssociatedControlID="FirstName" runat="server" Text="First Name" CssClass="block text-gray-700 text-sm font-medium mb-1"></asp:Label>
                            <asp:TextBox ID="FirstName" runat="server" CssClass="w-full px-3 py-2 border rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none" Placeholder="First Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_FirstName" runat="server" ControlToValidate="FirstName"
                                ErrorMessage="First Name is required" CssClass="text-red-500 text-xs mt-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Last Name -->
                        <div>
                            <asp:Label AssociatedControlID="LastName" runat="server" Text="Last Name" CssClass="block text-gray-700 text-sm font-medium mb-1"></asp:Label>
                            <asp:TextBox ID="LastName" runat="server" CssClass="w-full px-3 py-2 border rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none" Placeholder="Last Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_LastName" runat="server" ControlToValidate="LastName"
                                ErrorMessage="Last Name is required" CssClass="text-red-500 text-xs mt-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Mobile No -->
                        <div>
                            <asp:Label AssociatedControlID="Mobile" runat="server" Text="Mobile No" CssClass="block text-gray-700 text-sm font-medium mb-1"></asp:Label>
                            <asp:TextBox ID="Mobile" runat="server" CssClass="w-full px-3 py-2 border rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none" Placeholder="Mobile No"></asp:TextBox>
                            <asp:RequiredFieldValidator runat="server" ID="rfv_Mobile" ControlToValidate="Mobile"
                                ErrorMessage="Mobile No is required" CssClass="text-red-500 text-xs mt-1" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator runat="server" ID="rev_Mobile" ControlToValidate="Mobile"
                                ErrorMessage="Invalid mobile number" CssClass="text-red-500 text-xs mt-1" Display="Dynamic"
                                ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
                        </div>

                        <!-- Email Id -->
                        <div>
                            <asp:Label AssociatedControlID="Email" runat="server" Text="Email Id" CssClass="block text-gray-700 text-sm font-medium mb-1"></asp:Label>
                            <asp:TextBox ID="Email" runat="server" CssClass="w-full px-3 py-2 border rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none" Placeholder="email@example.com"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_Email" runat="server" ControlToValidate="Email"
                                ErrorMessage="Email Id is required" CssClass="text-red-500 text-xs mt-1" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="rev_Email" runat="server" ControlToValidate="Email"
                                ErrorMessage="Invalid email format" CssClass="text-red-500 text-xs mt-1" Display="Dynamic"
                                ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator>
                        </div>

                        <!-- Gender -->
                        <div>
                            <asp:Label AssociatedControlID="rd_gender" runat="server" Text="Gender" CssClass="block text-gray-700 text-sm font-medium mb-1"></asp:Label>
                            <asp:RadioButtonList ID="rd_gender" CssClass="flex space-x-2" RepeatLayout="Flow" runat="server">
                                <asp:ListItem Value="Male" Text="Male"></asp:ListItem>
                                <asp:ListItem Value="Female" Text="Female"></asp:ListItem>
                                <asp:ListItem Value="Other" Text="Other"></asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="rfv_gender" runat="server" ControlToValidate="rd_gender"
                                ErrorMessage="Gender is required" CssClass="text-red-500 text-xs mt-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Date of Birth -->
                        <div>
                            <asp:Label AssociatedControlID="DateOfBirth" runat="server" Text="Date of Birth" CssClass="block text-gray-700 text-sm font-medium mb-1"></asp:Label>
                            <asp:TextBox ID="DateOfBirth" runat="server" TextMode="Date" CssClass="w-full px-3 py-2 border rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_DateOfBirth" runat="server" ControlToValidate="DateOfBirth"
                                ErrorMessage="Date of Birth is required" CssClass="text-red-500 text-xs mt-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Username -->
                        <div>
                            <asp:Label AssociatedControlID="UserName" runat="server" Text="User Name" CssClass="block text-gray-700 text-sm font-medium mb-1"></asp:Label>
                            <asp:TextBox ID="UserName" runat="server" CssClass="w-full px-3 py-2 border rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none" Placeholder="User Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfv_UserName" runat="server" ControlToValidate="UserName"
                                ErrorMessage="User Name is required" CssClass="text-red-500 text-xs mt-1" Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <!-- Password -->
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

                        <!-- Terms and Conditions -->
                        <div class="flex items-start">
                            <asp:CheckBox ID="Terms" runat="server" CssClass="w-4 h-4 text-blue-600 bg-gray-100 rounded focus:ring focus:ring-blue-500 mt-1" />
                            <asp:Label AssociatedControlID="Terms" runat="server" CssClass="ml-2 text-sm text-gray-600">
                                I Accept the <a href="#" class="text-blue-600 font-medium">Terms and Conditions</a>
                            </asp:Label>
                        </div>
                    </div>
                    <div>
                        <asp:Button ID="SignUpButton" runat="server" Text="Register" CssClass="w-full text-white bg-[#19A2E6] hover:bg-[#1590CE] focus:ring-4 focus:ring-[#19A2E6] font-medium rounded-lg text-sm px-5 py-2.5 mt-4" OnClick="SignUpButton_Click" OnClientClick="storeUserId()" />
                    </div>
                    <div>
                        <p class="text-center text-sm">
                            <span class="text-gray-500">Already Have an account?</span>
                            <a href="login.aspx" class="text-[#19A2E6] font-medium ml-1">Login</a>
                        </p>
                    </div>
                </asp:Panel>
            </asp:Panel>
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
    <script>
        function storeUserId() {
            const id = document.getElementById('FirstName');
            const idInfo = id.value; 
            //localStorage.setItem("firstname", idInfo);
            console.log(idInfo)
            // alert("User ID stored successfully!");
            const id1 = document.getElementById('LastName');
            const idInfo1 = id1.value;
            //localStorage.setItem("lastName", idInfo1);
            console.log(idInfo1)

            const id2 = document.getElementById('Mobile');
            const idInfo2 = id2.value;
            //localStorage.setItem("mobile", idInfo2);
            console.log(idInfo2)

            const id3 = document.getElementById('Email');
            const idInfo3 = id3.value;
            //localStorage.setItem("email", idInfo3);
            console.log(idInfo3)

            const id4 = document.getElementById('rd_gender');
            const idInfo4 = id4.value;
            //localStorage.setItem("gender", idInfo4);
            console.log(idInfo4)


            const id5 = document.getElementById('DateOfBirth');
            const idInfo5 = id5.value;
            //localStorage.setItem("DOB", idInfo5);
            console.log(idInfo5)


            const id6 = document.getElementById('UserName');
            const idInfo6 = id6.value;
            //localStorage.setItem("Username", idInfo6);
            console.log(idInfo6)


            const id7 = document.getElementById('Password');
            const idInfo7 = id7.value;
            //localStorage.setItem("password", idInfo7);
            console.log(idInfo7)
        }
    </script>
</body>
</html>
