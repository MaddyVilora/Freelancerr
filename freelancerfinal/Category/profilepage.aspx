<%@ Page Title="" Language="C#" MasterPageFile="~/Category/Categorymasterpage.Master" AutoEventWireup="true" CodeBehind="profilepage.aspx.cs" Inherits="freelancerfinal.Category.profilepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="flex flex-col justify-center min-h-screen px-4 md:px-8">
        <!-- Main Profile Section -->
        <div class="relative flex flex-col md:flex-row md:space-x-5 space-y-3 md:space-y-0 rounded-xl shadow-lg p-6 max-w-full mx-auto bg-white border border-gray-200">
            <!-- Image Section -->
            <div class="w-full md:w-1/3 bg-white grid place-items-center">
                <img src="../Assets/images.jpeg" alt="Profile Image" class="rounded-xl w-full h-auto" />
            </div>

            <!-- Content Section -->
            <div class="w-full md:w-2/3 bg-white flex flex-col space-y-4 p-4">
                <!-- Header with Rating and Superhost -->
                <div class="flex justify-between items-center">
                    <p class="text-gray-500 font-medium hidden md:block">Vacations</p>
                    <div class="flex items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-yellow-500" viewBox="0 0 20 20" fill="currentColor">
                            <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                        </svg>
                        <p class="text-gray-600 font-bold text-sm ml-1">4.96 <span class="text-gray-500 font-normal">(76 reviews)</span></p>
                    </div>
                    <div class="flex items-center">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-pink-500" viewBox="0 0 20 20" fill="currentColor">
                            <path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd" />
                        </svg>
                    </div>
                    <div class="bg-gray-200 px-3 py-1 rounded-full text-xs font-medium text-gray-800 hidden md:block">
                        Superhost
                    </div>
                </div>

                <!-- Title and Description -->
                <h3 class="font-black text-gray-800 text-xl md:text-3xl">The Majestic and Wonderful Bahamas</h3>
                <p class="text-gray-500 text-base md:text-lg">The best kept secret of The Bahamas is the country’s sheer size and diversity. With 16 major islands, The Bahamas is an unmatched destination.</p>

                <!-- Price Section -->
                <p class="text-xl font-black text-gray-800">
                    $110 <span class="font-normal text-gray-600 text-base">/night</span>
                </p>
            </div>
        </div>

        <!-- Image Gallery -->
        <div class="container font-bold text-xl mt-2">
            Our Gallery
        </div>
        <div class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-4 mt-6">

            <div>
                <img class="object-cover object-center w-full h-40 max-w-full rounded-lg" src="https://images.unsplash.com/photo-1499696010180-025ef6e1a8f9" alt="gallery-photo" />
            </div>
            <div>
                <img class="object-cover object-center w-full h-40 max-w-full rounded-lg" src="https://images.unsplash.com/photo-1432462770865-65b70566d673" alt="gallery-photo" />
            </div>
            <div>
                <img class="object-cover object-center w-full h-40 max-w-full rounded-lg" src="https://images.unsplash.com/photo-1497436072909-60f360e1d4b1" alt="gallery-photo" />
            </div>
            <div>
                <img class="object-cover object-center w-full h-40 max-w-full rounded-lg" src="https://images.unsplash.com/photo-1493246507139-91e8fad9978e" alt="gallery-photo" />
            </div>
            <div>
                <img class="object-cover object-center w-full h-40 max-w-full rounded-lg" src="https://images.unsplash.com/photo-1518623489648-a173ef7824f3" alt="gallery-photo" />
            </div>
            <div>
                <img class="object-cover object-center w-full h-40 max-w-full rounded-lg" src="https://images.unsplash.com/photo-1682407186023-12c70a4a35e0" alt="gallery-photo" />
            </div>
            <div>
                <img class="object-cover object-center w-full h-40 max-w-full rounded-lg" src="https://demos.creative-tim.com/material-kit-pro/assets/img/examples/blog5.jpg" alt="gallery-photo" />
            </div>
            <div>
                <img class="object-cover object-center w-full h-40 max-w-full rounded-lg" src="https://material-taillwind-pro-ct-tailwind-team.vercel.app/img/content2.jpg" alt="gallery-photo" />
            </div>
            <div>
                <img class="object-cover object-center w-full h-40 max-w-full rounded-lg" src="https://images.unsplash.com/photo-1620064916958-605375619af8" alt="gallery-photo" />
            </div>
        </div>
    </div>
</asp:Content>
