# SpaceX Launches App

## Overview

The **SpaceX Launches App** is a Flutter application that fetches and displays information about SpaceX rocket launches and rocket details using the **SpaceX API**. It provides a user-friendly interface with responsive design and local storage capabilities.

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

*(Add screenshots of your app here to showcase the UI)*

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

