//
//  priventPopUp.swift
//  LOTRconverter
//
//  Created by Vladyslav Tarabunin on 13/05/2025.
//
import UIKit
import SwiftUI
// קוד שאמור למנוע מהתצוגה לקפוץ כשפותחים מקלדת אבל פה הוא לא עובד..
struct KeyboardAvoidingRootView<Content: View>: UIViewControllerRepresentable {
    var content: () -> Content

    func makeUIViewController(context: Context) -> UIHostingController<Content> {
        let controller = UIHostingController(rootView: content())
        controller.view.backgroundColor = .clear
        return controller
    }

    func updateUIViewController(_ uiViewController: UIHostingController<Content>, context: Context) {
        uiViewController.rootView = content()
    }
}


