<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="category.aspx.cs" Inherits="freelancerfinal.Customer.category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="bg-gray-800 text-white p-4">
        <h1 class="text-xl font-bold">FreeLancer</h1>
    </nav>
    <div class="p-4">
        <div class="md:flex md:space-x-10 grid grid-col-2">

            <div class="bg-white shadow-lg rounded-lg w-full p-6 md:w-[300px] min-h-screen mt-4">
                <div class="grid grid-cols-2 gap-2 md:flex flex-col">
                    <div>
                        <asp:Label runat="server" Text="Select Category" CssClass="font-md font-bold"></asp:Label>
                        <asp:DropDownList ID="ddl_subcategory" CssClass="bg-white w-full md-w-full px-3 py-2 border rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none mt-3" runat="server">
                            <asp:ListItem Value="">Please Select</asp:ListItem>
                            <asp:ListItem>Car Driver</asp:ListItem>
                            <asp:ListItem>Lorry Driver</asp:ListItem>
                            <asp:ListItem>Van Driver</asp:ListItem>
                            <asp:ListItem>Auto Driver</asp:ListItem>
                            <asp:ListItem>Bus Driver</asp:ListItem>
                            <asp:ListItem>Tempo Driver</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div>
                        <asp:Label runat="server" Text="Select Location" CssClass="font-md font-bold"></asp:Label>
                        <asp:DropDownList ID="ddl_location" CssClass="bg-white w-full md-w-full px-3 py-2 border rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none mt-3" runat="server">
                            <asp:ListItem Value="">Please Select</asp:ListItem>
                            <asp:ListItem>Pondicherry </asp:ListItem>
                            <asp:ListItem>Chennai</asp:ListItem>
                            <asp:ListItem>Madurai</asp:ListItem>
                            <asp:ListItem>Bangalore</asp:ListItem>
                            <asp:ListItem>Trichy</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div>
                        <asp:Label runat="server" Text="Experience" CssClass="font-md font-bold"></asp:Label>
                        <asp:DropDownList ID="ddl_experience" CssClass="bg-white w-full md-w-full px-3 py-2 border rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none mt-3" runat="server">
                            <asp:ListItem Value="">Please Select</asp:ListItem>
                            <asp:ListItem>1 year</asp:ListItem>
                            <asp:ListItem>3 year</asp:ListItem>
                            <asp:ListItem>5 year</asp:ListItem>
                            <asp:ListItem>8 year</asp:ListItem>
                            <asp:ListItem>10 year</asp:ListItem>
                            <asp:ListItem>12 year</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div>
                        <asp:Label runat="server" Text="Rating" CssClass="font-md font-bold"></asp:Label>
                        <asp:DropDownList ID="ddl_rating" CssClass="bg-white w-full md-w-full px-3 py-2 border rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none mt-3" runat="server">
                            <asp:ListItem Value="">Please Select</asp:ListItem>
                            <asp:ListItem>1</asp:ListItem>
                            <asp:ListItem>2</asp:ListItem>
                            <asp:ListItem>3</asp:ListItem>
                            <asp:ListItem>4</asp:ListItem>
                            <asp:ListItem>5</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
            </div>



            <div class="bg-white shadow-lg rounded-lg p-4 md:w-8/12 w-full mt-4 mx-auto justify-center">
                <div class="flex justify-between">
                    <div class="flex space-x-4">
                        <div>
                            <img src="Assets/acrepair.jpg" class="w-[170px] h-[100px] md:w-[150px] md:h-[130px] rounded-lg rounded-lg" />

                        </div>
                        <div class="flex flex-col">
                            <span class="ml-3 md:text-xl text-sm font-bold flex">Ramkumar
                    <svg height="20" width="30" class="md:mt-1 mt-0" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <g id="SVGRepo_bgCarriersss" stroke-width="0"></g><g id="SVGRepo_tracerCarriersss" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarriersss">
                            <path d="M14 19.2857L15.8 21L20 17M16.5 14.4018C16.2052 14.2315 15.8784 14.1098 15.5303 14.0472C15.4548 14.0337 15.3748 14.024 15.2842 14.0171C15.059 14 14.9464 13.9915 14.7961 14.0027C14.6399 14.0143 14.5527 14.0297 14.4019 14.0723C14.2569 14.1132 13.9957 14.2315 13.4732 14.4682C12.7191 14.8098 11.8817 15 11 15C10.1183 15 9.28093 14.8098 8.52682 14.4682C8.00429 14.2315 7.74302 14.1131 7.59797 14.0722C7.4472 14.0297 7.35983 14.0143 7.20361 14.0026C7.05331 13.9914 6.94079 14 6.71575 14.0172C6.6237 14.0242 6.5425 14.0341 6.46558 14.048C5.23442 14.2709 4.27087 15.2344 4.04798 16.4656C4 16.7306 4 17.0485 4 17.6841V19.4C4 19.9601 4 20.2401 4.10899 20.454C4.20487 20.6422 4.35785 20.7951 4.54601 20.891C4.75992 21 5.03995 21 5.6 21H10.5M15 7C15 9.20914 13.2091 11 11 11C8.79086 11 7 9.20914 7 7C7 4.79086 8.79086 3 11 3C13.2091 3 15 4.79086 15 7Z" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                        </g></svg>
                            </span>
                            <span class="ml-3 md:mt-2 mt-0 text-sm">Car Driver</span>
                            <span class="flex md:space-x-5  space-x-1  ">
                                <svg height="20" width="30" class="ml-1" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 53.867 53.867" xml:space="preserve" fill="#000000">
                                    <g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier">
                                        <polygon style="fill: #EFCE4A;" points="26.934,1.318 35.256,18.182 53.867,20.887 40.4,34.013 43.579,52.549 26.934,43.798 10.288,52.549 13.467,34.013 0,20.887 18.611,18.182 "></polygon>
                                    </g></svg>
                                <span class="text-sm text-gray-400">5.0 (1 review)</span>
                                <svg height="20" width="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <g id="SVGRepo_bgCarriers" stroke-width="0"></g><g id="SVGRepo_tracerCarriers" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarriers">
                                        <path d="M3 14C3 9.02944 7.02944 5 12 5C16.9706 5 21 9.02944 21 14M17 14C17 16.7614 14.7614 19 12 19C9.23858 19 7 16.7614 7 14C7 11.2386 9.23858 9 12 9C14.7614 9 17 11.2386 17 14Z" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                    </g></svg>
                                <span class="text-sm text-gray-400">1000 views</span>
                                <svg height="20" width="30" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <g id="SVGRepo_bgCarrierss" stroke-width="0"></g><g id="SVGRepo_tracerCarrierss" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrierss">
                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12 6.00019C10.2006 3.90317 7.19377 3.2551 4.93923 5.17534C2.68468 7.09558 2.36727 10.3061 4.13778 12.5772C5.60984 14.4654 10.0648 18.4479 11.5249 19.7369C11.6882 19.8811 11.7699 19.9532 11.8652 19.9815C11.9483 20.0062 12.0393 20.0062 12.1225 19.9815C12.2178 19.9532 12.2994 19.8811 12.4628 19.7369C13.9229 18.4479 18.3778 14.4654 19.8499 12.5772C21.6204 10.3061 21.3417 7.07538 19.0484 5.17534C16.7551 3.2753 13.7994 3.90317 12 6.00019Z" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
                                    </g></svg>
                                <span class="text-sm text-gray-400">Save</span>
                            </span>
                            <div class="hidden md:block relative ml-3">
                                <asp:TextBox runat="server" CssClass="block bg-gray-200 w-[90px] px-2 py-1 border rounded-lg focus:ring focus:ring-indigo-200 focus:outline-none mt-3"></asp:TextBox>
                                <button class="absolute inset-y-0 left-0 pl-2 flex items-center text-sm leading-5 mt-2">
                                    <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" class="size-5">
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M15 10.5a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
                                        <path stroke-linecap="round" stroke-linejoin="round" d="M19.5 10.5c0 7.142-7.5 11.25-7.5 11.25S4.5 17.642 4.5 10.5a7.5 7.5 0 1 1 15 0Z" />
                                    </svg>
                                    <span class="pl-1 md:text-md text-xs">Chennai</span>
                                </button>
                            </div>

                        </div>


                    </div>
                    <div class="flex justify items-end ml-6 mb-2">
                        <button class="md:font-bold font-bold text-white bg-red-400 text-sm font-base md:text-xl rounded-lg mb-6 mr-6 p-2">Pricing</button>
                    </div>

                </div>




                <div class="mt-3 md:space-x-3">
                    <p>A car driver bio, or resume, can highlight your skills, experience, and qualifications for a driver position. Here are some tips for writing a car driver bio<span class="hidden md:block">Include a professional summary A professional summary is typically two to four sentences long and should highlight your most relevant skills and qualifications</span></p>
                </div>


            </div>










        </div>
        <%-- second driver--%>
    </div>







</asp:Content>
