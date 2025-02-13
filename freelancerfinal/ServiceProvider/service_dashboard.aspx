<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProvider/ServiceProviderMasterPage.Master" AutoEventWireup="true" CodeBehind="service_dashboard.aspx.cs" Inherits="freelancerfinal.ServiceProvider.ServiceDashboard" %>
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
         <div class="text-xl font-bold">Dashboard</div>
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
     <div class="flex-1 p-6 bg-gray-100">
         <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
             <div class="bg-white shadow rounded-lg p-4">
                 <h2 class="text-lg font-bold mb-2">Overview</h2>
                 <p class="text-sm text-gray-600">Details about the current status of services.</p>
             </div>
             <div class="bg-white shadow rounded-lg p-4">
                 <h2 class="text-lg font-bold mb-2">Statistics</h2>
                 <p class="text-sm text-gray-600">Key performance indicators and analytics.</p>
             </div>
             <div class="bg-white shadow rounded-lg p-4">
                 <h2 class="text-lg font-bold mb-2">Recent Activity</h2>
                 <p class="text-sm text-gray-600">See the latest updates and changes.</p>
             </div>
         </div>
     </div>
 </div>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('toggleSidebar').addEventListener('click', function () {
                const sidebar = document.getElementById('sidebar');
                sidebar.classList.toggle('hidden-sidebar');
            });
        });
    </script>
</asp:Content>
