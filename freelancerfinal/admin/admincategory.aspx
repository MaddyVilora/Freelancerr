<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admincategory.aspx.cs" Inherits="freelancerfinal.admin.admincategory" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Dashboard</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.14.4/dist/sweetalert2.all.min.js"></script>
    <style>
        .hidden-sidebar {
            display: none;
        }
    </style>
</head>
<body class="bg-gray-50">
    <form action="#" runat="server">
        <div class="flex h-screen">
            <!-- Sidebar -->
            <div id="sidebar" class="w-64 bg-gray-800 text-white p-5 lg:block hidden-sidebar">
                <h1 class="text-2xl font-bold mb-5 text-center">Admin</h1>
                <ul>
                    <li>
                        <a href="#" id="btnDashboard" runat="server" class="block bg-white hover:bg-[b5ac65] text-black py-2 px-4 rounded mb-3 text-left">Dashboard
                        </a>
                    </li>
                    <li>
                        <a href="#" id="btnMyProfile" runat="server" class="block bg-white hover:bg-[b5ac65] text-black py-2 px-4 rounded mb-3 text-left">My Profile
                        </a>
                    </li>
                    <li>
                        <a href="#" id="btnMyServices" runat="server" class="block bg-white hover:bg-[b5ac65] text-black py-2 px-4 rounded mb-3 text-left">Service Categories
                        </a>
                    </li>
                    <li>
                        <a href="#" id="btnLogout" runat="server" class="block bg-white hover:bg-[b5ac65] text-black py-2 px-4 rounded text-left">Logout
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Main Content -->
            <div class="flex-1 flex flex-col">
                <!-- Top Bar -->
                <div class=" md:hidden sm:block bg-white shadow flex justify-between items-center px-6 py-4">
                    <div>
                        <button id="toggleSidebar" class="lg:hidden text-2xl">&#9776;</button>
                    </div>
                    <div class="text-xl font-bold">My Services</div>
                    <div class="flex items-center">
                        <div class="h-10 w-10 rounded-full mr-3 cursor-pointer">
                            <img src="../images/logo.png" />
                        </div>
                        <div>
                            <asp:Label ID="lblUserDetails" runat="server" CssClass="text-sm text-gray-700">

                            </asp:Label>
                        </div>
                    </div>
                </div>
                <!-- Dashboard Content -->
                <%-- <div class="bg-white shadow-lg rounded-lg w-10/12 md:w-8/12 mx-auto md:p-4 mt-[70px] p-6  flex flex-col justify-center ">
                    <div class=" grid md:grid-cols-2 flex justify-center space-x-4 ">
                        
                        <div>
                            <asp:Label AssociatedControlID="txt_category" runat="server" Text="Category"
                                CssClass="block text-gray-700 text-md font-medium mb-2"></asp:Label>
                            
                            <asp:TextBox runat="server" ID="txt_category" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none" ></asp:TextBox>
                        </div>
                     
                        <div>
                            <asp:Label AssociatedControlID="txt_subcategory" runat="server" Text="Sub Category"
                                CssClass="block text-gray-700 text-md font-medium mb-2"></asp:Label>
                         <asp:TextBox runat="server" ID="txt_subcategory" CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none" ></asp:TextBox>
                        </div> 
                    </div>

                    <div class="flex justify-center space-x-6 mt-10 p-3">

                       
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel"
                            CssClass="px-4 py-2 bg-gray-400 text-white font-medium rounded-lg shadow hover:bg-gray-500 focus:outline-none focus:ring focus:ring-gray-300" />
                      
                        <asp:Button ID="btnSave" runat="server" Text="Save"
                            CssClass="px-4 py-2 bg-indigo-600 text-white font-medium rounded-lg shadow hover:bg-indigo-700 focus:outline-none focus:ring focus:ring-indigo-300" OnClick="btnSave_Click" />
                    </div>



                </div>--%>

                <div class="max-w-lg mx-auto mt-[9rem] bg-white p-6 rounded-lg shadow-md">
                    <asp:Panel ID="pnlForm" runat="server">
                        <div class="mb-4">
                            <label for="txt_category" class="block text-gray-700 font-medium">Category</label>
                            <asp:TextBox ID="txt_category" runat="server" CssClass="w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" Placeholder="Enter your Category" Required="true"></asp:TextBox>
                        </div>

                        <div class="mb-4">
                            <label for="txt_subcategory" class="block text-gray-700 font-medium">Sub Category</label>
                            <asp:TextBox ID="txt_subcategory" runat="server" CssClass="w-full p-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-blue-500" Placeholder="Enter your Sub Category" Required="true"></asp:TextBox>
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 font-medium">Upload your Image</label>
                            <asp:FileUpload ID="fileUpload" runat="server" CssClass="mt-2 w-full text-gray-600" />
                        </div>



                        <div class="flex justify-between">
                            <asp:Button ID="btnSave" runat="server" Text="Submit" CssClass="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600" OnClick="btnSave_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="bg-gray-500 text-white px-4 py-2 rounded-md hover:bg-gray-600" />
                        </div>
                    </asp:Panel>
                </div>


            </div>
        </div>
    </form>

    <script>
        document.getElementById('toggleSidebar').addEventListener('click', function () {
            const sidebar = document.getElementById('sidebar');
            sidebar.classList.toggle('hidden-sidebar');
        });
    </script>
</body>
</html>
