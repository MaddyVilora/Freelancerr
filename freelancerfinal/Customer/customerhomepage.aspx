<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="customerhomepage.aspx.cs" Inherits="freelancerfinal.Customer.customerhomepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <header class="header z-[9999] sticky top-0 bg-white shadow-md flex items-center justify-between px-8 py-2">
        <!-- logo -->
        <h1 class="w-3/12">
            <a href="customerhomepage.aspx"
                class="font-bold  w-auto bold hover:text-green-500 duration-300">FreeLancer
            </a>
        </h1>

        <!-- buttons -->
        <div class="w-3/12 flex justify-end">
            <a href="login.aspx">
                <i class="fa-regular fa-user h-8 p-1 hover:text-green-500 duration-200"></i>
            </a>
        </div>
    </header>

    <%--end of navbaar--%>
    <div class="p-4">
        <div class="grid grid-cols-1 mt-4">
            <div class="bg-white w-full h-96 flex rounded-lg mt-3 p-0">
                <div class="md:grid-cols-2 flex p-4">
                    <div class="h-full ">
                        <img src="../Contents/assets/download.jpeg" alt="Alternate Text" />
                    </div>
                </div>
            </div>
        </div>


        <div class="text-center mt-6">
            <h1 class="mt-4 md:text-2xl text-xl font-bold">Categories</h1>
        </div>

        <div class="grid grid-cols-2 gap-6 md:grid-cols-4  place-items-center mt-4  ">
            <asp:Repeater ID="reptcategories" runat="server">
                <ItemTemplate>
                    <a href="../Category/category.aspx" class="bg-gray-100 shadow-lg hover:shadow-gray-400 rounded-lg p-5 w-full md:w-2/4 lg:w-2/3 text-center font-bold text-xl md:text-2xl text-blue-500 flex justify-center">
                        <div class="container">
                            <div class="flex flex-col items-center">
                                <asp:Image runat="server" ID="imgcategory" ImageUrl='<%# ResolveUrl(Eval("Category_Img").ToString()) %>' CssClass="w-20 h-20 mb-3" />
                                <asp:Label runat="server" ID="lblcategorytype" Text='<%# Eval("Category_Type") %>' CssClass="text-lg"></asp:Label>
                            </div>
                        </div>
                    </a>
                </ItemTemplate>
            </asp:Repeater>
        </div>



        <div class="bg-gray-50 py-10 mt-10">
            <h2 class="text-center text-2xl font-bold mb-6">What Our Customers Say</h2>
            <div class="swiper w-full">
                <div class="swiper-wrapper">
                    <div class="swiper-slide text-center">
                        <p class="text-lg italic">"Amazing service! Highly recommend."</p>
                        <span class="block mt-2 text-blue-500 font-bold">- John Doe</span>
                    </div>
                    <div class="swiper-slide text-center">
                        <p class="text-lg italic">"Professional and reliable services."</p>
                        <span class="block mt-2 text-blue-500 font-bold">- Jane Smith</span>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>
        </div>


        <div class="py-10 mt-10">
            <h2 class="text-center text-2xl font-bold mb-6">How It Works</h2>
            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <div class="text-center">
                    <div class="bg-blue-500 text-white w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">1</div>
                    <h3 class="text-xl font-bold">Choose a Service</h3>
                    <p class="mt-2">Browse and select the service you need.</p>
                </div>
                <div class="text-center">
                    <div class="bg-blue-500 text-white w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">2</div>
                    <h3 class="text-xl font-bold">Book Online</h3>
                    <p class="mt-2">Book your service instantly with just a few clicks.</p>
                </div>
                <div class="text-center">
                    <div class="bg-blue-500 text-white w-16 h-16 rounded-full flex items-center justify-center mx-auto mb-4">3</div>
                    <h3 class="text-xl font-bold">Relax</h3>
                    <p class="mt-2">Sit back while our professionals handle the rest.</p>
                </div>
            </div>
        </div>

    </div>


    <script src="https://cdn.jsdelivr.net/npm/swiper/swiper-bundle.min.js"></script>
    <script>

        const swiper = new Swiper('.swiper', {
            loop: true,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            autoplay: {
                delay: 3000,
            },
        });
    </script>
    <!-- Script to toggle mobile menu -->
    <script>
        const hamburgerMenu = document.getElementById('hamburger-menu');
        const mobileMenu = document.getElementById('mobile-menu');

        hamburgerMenu.addEventListener('click', () => {
            mobileMenu.classList.toggle('hidden');
        });
    </script>
</asp:Content>
