<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProvider/ServiceProviderMasterPage.Master" AutoEventWireup="true" CodeBehind="service_myservices.aspx.cs" Inherits="freelancerfinal.ServiceProvider.service_myservices" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
                <!-- Main Content -->
            <div class="flex-1 flex flex-col">
                <!-- Top Bar -->
                <div class="bg-white shadow flex justify-between items-center px-6 py-4">
                    <div>
                        <button id="toggleSidebar" class="lg:hidden text-2xl">&#9776;</button>
                    </div>
                    <div class="text-xl font-bold">My Services</div>
                    <div class="flex items-center">
                        <div class="h-10 w-10 rounded-full mr-3 cursor-pointer">
                            <img src="../images/logo.png" />
                        </div>
                        <div>
                            <asp:Label ID="lblUserDetails" runat="server" CssClass="text-sm text-gray-700"></asp:Label>
                        </div>
                    </div>
                </div>
                <!-- Dashboard Content -->
                <div class="bg-white shadow-lg rounded-lg w-10/12 md:w-8/12 mx-auto md:p-4 p-2 mt-[70px] flex flex-col justify-center">
                    <div class="grid md:grid-cols-2 flex justify-center space-x-4">
                        <!-- Category Field -->
                        <div>
                            <asp:Label AssociatedControlID="ddl_category" runat="server" Text="Category"
                                CssClass="block text-gray-700 text-md font-medium mb-2"></asp:Label>
                            <asp:DropDownList ID="ddl_category" runat="server" AutoPostBack="False"
                                CssClass="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none">
                            </asp:DropDownList>
                        </div>
                        <!-- Sub Category Field -->
                        <div>
                            <asp:Label AssociatedControlID="ddl_subcategory" runat="server" Text="Subcategory"
                                CssClass="block text-gray-700 text-md font-medium mb-2"></asp:Label>
                            <select runat="server" id="ddl_subcategory" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none">
                                <option value="0">Please Select</option>
                            </select>
                        </div>
                    </div>

                    <!-- Buttons -->
                    <div class="flex justify-center space-x-6 mt-10">
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel"
                            CssClass="px-4 py-2 bg-gray-400 text-white font-medium rounded-lg shadow hover:bg-gray-500 focus:outline-none focus:ring focus:ring-gray-300" />
                        <asp:Button ID="btnSave" runat="server" Text="Save"
                            CssClass="px-4 py-2 bg-indigo-600 text-white font-medium rounded-lg shadow hover:bg-indigo-700 focus:outline-none focus:ring focus:ring-indigo-300" OnClick="btnSave_Click"   />
                    </div>
                </div>
            </div>
22
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('toggleSidebar').addEventListener('click', function () {
                const sidebar = document.getElementById('sidebar');
                sidebar.classList.toggle('hidden-sidebar');
            });
        });
    </script>
</asp:Content>