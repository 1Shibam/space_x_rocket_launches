# SpaceX Launches App

## Overview

The **SpaceX Launches App** is a Flutter application that fetches and displays information about SpaceX rocket launches and rocket details using the **SpaceX API**. It provides a user-friendly interface with responsive design and local storage capabilities.
## Video demo (Sorry for the Quality 😌😌)
<video src="https://github.com/user-attachments/assets/9d6065fb-e00a-4d9f-b601-d73a02dfdeca" controls width="400"></video>

## 📌 Features

- Fetch and display **SpaceX launches** and **SpaceX Rockets**.
- Search the launches by their name, sort searching by either **Success Status** or **Date**.
- View **Launches Details** including name, description, and URLs for more information.
- View **Rocket Details** including name, description, and rocket specifications.
- **State management** with `Riverpod`.
- **API integration** using `Dio`.
- **Responsive design** using `flutter_screenutil`.
- **Local storage** with `sqflite` to save favorite launches and rockets.

## Tech Stack

- **Flutter** - Frontend framework
- **Dio** - API calls
- **Riverpod** - State management
- **sqflite** - Local storage
- **flutter\_screenutil** - Responsive design

## 📸 Screenshots


Here are some screenshots of the app:

<img src="https://github.com/user-attachments/assets/da0f0add-0bc8-445f-afd8-c0e97bf21952" width="200">

<img src="https://github.com/user-attachments/assets/1062dfa3-6804-4ab8-b4ac-035316d21b24" width="200">

<img src="https://github.com/user-attachments/assets/71bdf251-3f40-4692-8af8-d3d3a77b807a" width="200">

<img src="https://github.com/user-attachments/assets/ebb46f66-1902-4fd0-aa32-13120eca521d" width="200">

<img src="https://github.com/user-attachments/assets/a70c3d0a-dd45-40ab-ad50-9d0cef48aeb3" width="200">

<img src="https://github.com/user-attachments/assets/1e875a68-b201-4c59-990e-dd9bd8585f29" width="200">

<img src="https://github.com/user-attachments/assets/f72f63ea-30d8-4755-be36-75a235a9541c" width="200">

<img src="https://github.com/user-attachments/assets/af12ca1e-8649-440d-8c2a-fc4ba19100a4" width="200">

<img src="https://github.com/user-attachments/assets/677f991f-ff2c-432e-b885-66c713de6e08" width="200">

<img src="https://github.com/user-attachments/assets/d32cbb43-ec17-4c7a-a3a1-34af0a377e1a" width="200">

<img src="https://github.com/user-attachments/assets/b805e27a-1cfd-421c-8531-20fc86e521ee" width="200">

<img src="https://github.com/user-attachments/assets/a6a785f0-62ed-4e21-acd5-0ab84d3e1c86" width="200">

<img src="https://github.com/user-attachments/assets/7dee6c75-0755-4930-bb6b-6e0fe0225bea" width="200">

<img src="https://github.com/user-attachments/assets/af7343af-9440-4cc4-81c0-327afef4cec9" width="200">


## Installation & Setup

1. **Clone the repository:**
   ```sh
   git clone https://github.com/1Shibam/spcae_x_rocket_launches.git
   cd spcae_x_rocket_launches
   ```
2. **Install dependencies:**
   ```sh
   flutter pub get
   ```
3. **Run the app:**
   ```sh
   flutter run
   ```

## Challenges Faced

One challenge I faced was displaying whether an item was saved or not in the database. Specifically, when opening the detail screen after refresh, I wanted to show a **filled or unfilled bookmark** icon to indicate if the item was already saved. I struggled with the logic at first, but after getting help from ChatGPT, I realized it was just a simple condition on top of what I had already built. Sometimes, the solution is easier than it seems!!!

## API Used

- [SpaceX API](https://github.com/r-spacex/SpaceX-API)

⭐ Don't forget to **star** this repository if you find it useful!

