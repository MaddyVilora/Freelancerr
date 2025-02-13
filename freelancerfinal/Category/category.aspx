        <%@ Page Title="" Language="C#" MasterPageFile="~/Category/Categorymasterpage.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="freelancerfinal.Category.drivercategory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Repeater ID="reptProfile" runat="server">
        <ItemTemplate>
            <a href="profilepage.aspx">
                <div class="bg-white shadow-lg rounded-lg p-4 md:w-10/12 w-full mt-4 mx-auto justify-center">
                    <div class="flex justify-between cursor-pointer">
                        <div class="flex space-x-4">
                            <div>
                                <img src="../Assets/images.jpeg" class="w-[170px] h-[100px] md:w-[150px] md:h-[130px] rounded-lg rounded-lg" />
                            </div>
                            <div class="flex flex-col">
                                <span class="ml-3 md:text-xl text-sm font-bold flex">Ramkumar
                                </span>
                                <span class="ml-3 md:mt-2 mt-0 text-sm">Car Driver</span>
                                <span class="flex md:space-x-5  space-x-1  ">
                                    <i class="fa-regular fa-star"></i><span class="text-sm text-gray-400">5.0 (1 review)</span>
                                    <i class="fa-regular fa-eye"></i><span class="text-sm text-gray-400">1000 views</span>
                                    <i class="fa-regular fa-bookmark"></i><span class="text-sm text-gray-400">Save</span>
                                </span>
                                <div class="hidden md:block relative ml-3">
                                    <asp:TextBox runat="server" CssClass="block bg-gray-200 w-[90px] px-2 py-1 border rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none mt-3"></asp:TextBox>
                                    <i class="fa-solid fa-location-dot"></i>
                                    <asp:Button Text="Chennai" CssClass="absolute inset-y-0 left-0 pl-2 flex items-center text-sm leading-5 mt-2" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="flex justify items-end ml-6 mb-2">
                            <asp:Button CssClass="md:font-bold font-bold text-white bg-red-400 text-sm font-base md:text-xl rounded-lg mb-6 mr-6 p-2" Text="Pricing" runat="server" />
                        </div>
                    </div>
                    <div class="mt-3 md:space-x-3">
                        <p>
                            A car driver bio, or resume, can highlight your skills, experience, and 
                    qualifications for a driver position. Here are some tips for writing a 
                    car driver bio<span class="hidden md:block">Include a professional summary
                        A professional summary is typically two to four sentences long and
                        should highlight your most relevant skills and qualifications</span>
                        </p>
                    </div>
                </div>
            </a>
        </ItemTemplate>
    </asp:Repeater>


</asp:Content>
