# JSONSerializationDemo

**JSONSerializationDemo** is an iOS application built using Swift and UIKit. It demonstrates how to perform network requests using `URLSession`, manually parse JSON data using `JSONSerialization`, and display the parsed data in a `UITableView` with a custom cell.

## Features

- Sends a GET request to a public API: `https://jsonplaceholder.typicode.com/posts`
- Uses `URLSession` for asynchronous networking
- Parses raw JSON into a custom model using `JSONSerialization`
- Displays the data in a scrollable `UITableView`
- Implements a custom `UITableViewCell` with labels for user ID, post ID, title, and body

## How It Works

On launch, the app makes a GET request to the API endpoint. The JSON response is parsed into an array of `Model` objects. These objects are then displayed in the table view using a reusable custom cell, each showing relevant post details in a structured format.

## Screenshot->

![imgonline-com-ua-twotoone-2VNIVJ8Y2H3iUJKs](https://github.com/user-attachments/assets/60858e75-de7d-49cd-8275-b9d166607653)
