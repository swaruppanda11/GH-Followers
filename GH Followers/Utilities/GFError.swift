//
//  Error Message.swift
//  GH Followers
//
//  Created by Swarup Panda on 23/06/24.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This usernamne created an invalid request. Please try again."
    case unableToComplete = "Unable to complete your request, please check your network connection."
    case invalidResponse = "Invalid response from the server. Please try again"
    case invalidData = "The data received from the server is invalid. Please try again."
    case unableToFavourite = "There was an error while adding this user to Favourites"
    case alreadyInFavorites = "You already have this user in your Favorites"
}
