<%@ Page Title="" Language="C#" MasterPageFile="~/ServiceProvider/ServiceProviderMasterPage.Master" AutoEventWireup="true" CodeBehind="serviceprofilepage.aspx.cs" Inherits="freelancerfinal.ServiceProvider.serviceprofilepage" %>

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
            <div class="text-xl font-bold">My Profile</div>
            <div class="flex items-center">
                <div class="h-10 w-10 rounded-full mr-3 cursor-pointer">
                    <img src="../images/logo.png" />
                </div>
                <div>
                    <asp:Label ID="lblUserDetails" runat="server" CssClass="text-sm text-gray-700"></asp:Label>
                </div>
            </div>
        </div>

        <div class="flex justify-between mt-2 p-4">
            <h1 class="text-center font-bold text-2xl mt-3">Welcome</h1>
            <div>
                <asp:HiddenField ID="hfServiceRegisterId" runat="server" />
                <asp:Button ID="mydetails" runat="server" CssClass="bg-blue-500 text-white font-bold p-2 rounded-lg mt-2" Text="Edit Details" OnCommand="mydetails_Command" />
                <asp:Button ID="goback" runat="server" CssClass="bg-blue-500 text-white font-bold p-2 rounded-lg mt-2" Text="Go Back" OnCommand="goback_Command" Visible="false" />
            </div>
        </div>

        <!-- Dashboard Content -->
        <asp:Panel runat="server" ID="mydetailsedit" Visible="false">
            <div class="bg-cream text-charcoal h-full mt-4">
                <div class="flex-1 md:p-0 lg:pt-8 lg:px-8 flex flex-col">
                    <div class="bg-cream-lighter p-6 shadow rounded-lg">

                        <!-- Profile Picture Preview Centered -->
                        <div class="flex justify-center">
                            <asp:Image ID="imgupload" runat="server" CssClass="w-32 h-32 object-cover rounded-full shadow-md border" />
                        </div>

                        <!-- File Upload Input Centered -->
                        <div class="flex justify-center mt-2 relative">
                            <asp:FileUpload ID="fileUploadControl" runat="server" CssClass="w-60 border p-2 opacity-0 absolute" onchange="previewImage(this);" />
                            <button type="button" class="text-blue-500 px-4 py-2 rounded flex items-center gap-2" onclick="document.getElementById('<%= fileUploadControl.ClientID %>').click();">
                                <i class="fas fa-edit"></i>Change Picture
                            </button>
                        </div>

                        <div class="mt-4 space-y-4">
                            <!-- Name -->
                            <div class="md:px-3">
                                <label class="block uppercase tracking-wide text-xs font-bold">Name</label>
                                <asp:TextBox runat="server" ID="name" CssClass="w-full shadow-inner p-3 border-0" placeholder="Enter Your Name"></asp:TextBox>
                            </div>

                            <!-- Email -->
                            <div class="md:px-3">
                                <label class="block uppercase tracking-wide text-xs font-bold">Email</label>
                                <asp:TextBox ID="email" runat="server" CssClass="w-full shadow-inner p-3 border-0" placeholder="contact@acme.co"></asp:TextBox>
                            </div>

                            <!-- Phone -->
                            <div class="md:px-3">
                                <label class="block uppercase tracking-wide text-xs font-bold">Phone</label>
                                <asp:TextBox ID="mobile" runat="server" CssClass="w-full shadow-inner p-3 border-0" placeholder="(+91) XXXXX XXXXX"></asp:TextBox>
                            </div>

                            <!-- Bio -->
                            <div class="md:px-3">
                                <label class="block uppercase tracking-wide text-xs font-bold">Bio</label>
                                <asp:TextBox ID="bio" runat="server" CssClass="w-full shadow-inner p-3 border-0 h-24" TextMode="MultiLine" placeholder="Tell us about yourself..."></asp:TextBox>
                            </div>
                        </div>

                        <!-- Buttons -->
                        <div class="flex justify-between mt-6">
                            <button type="button" class="bg-gray-400 text-white py-2 px-4 rounded-lg text-base" onclick="window.location.reload();">
                                Cancel
                            </button>
                            <asp:Button ID="updatebutton" runat="server" CssClass="bg-[#19A2E6] text-white py-2 px-4 rounded-lg transition duration-200 text-base" Text="Update" OnClick="updatebutton_Click" />
                        </div>

                    </div>
                </div>
            </div>
        </asp:Panel>

    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            document.getElementById('toggleSidebar').addEventListener('click', function () {
                const sidebar = document.getElementById('sidebar');
                sidebar.classList.toggle('hidden-sidebar');
            });
        });
        function previewImage(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    document.getElementById('<%= imgupload.ClientID %>').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]); // Read file as a Data URL
            }
        }
    </script>

</asp:Content>
