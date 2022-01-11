//
//  OnboardingModel.swift
//  UIKitNavigation
//
//  Created by Danil on 21.12.2021.
//

import Foundation

struct OnboardingModel {
    var imageName: String = ""
    var title: String = ""
    var subTitle: String = ""
}

extension OnboardingModel {
    static var mockData: [OnboardingModel] {
        [
            OnboardingModel(imageName: "Onb3", title: "Test test test", subTitle: " Test et Test test testTest test testTest test test "),
            OnboardingModel(imageName: "Onb2", title: "Refresh Test test test ", subTitle: "Test test test"),
            OnboardingModel(imageName: "Onb1", title: "Fastest Delivery Ever", subTitle: "Because chilled drinks are alway6s better")
        ]
    }
    
    static var realData: [OnboardingModel] {
        [
            OnboardingModel(imageName: "Onb1", title: "Choose Your Favorite Drink", subTitle: "Find your favorite drink anytime from your existing location easily "),
            OnboardingModel(imageName: "Onb2", title: "Refresh Yourself with a Drink ", subTitle: "Be it a game night or long day after office we are always there to refresh you"),
            OnboardingModel(imageName: "Onb3", title: "Fastest Delivery Ever", subTitle: "Because chilled drinks are alway6s better")
        ]
    }

}
