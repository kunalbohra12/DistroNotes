//
//  ImagePicker.swift
//  DistroNotes
//
//  Created by bd013 on 17/07/25.
//

import Foundation
import SwiftUI
import SwiftUI
import UIKit

struct ImagePicker: UIViewControllerRepresentable {
    @Environment(\.presentationMode) private var presentationMode
    let sourceType: UIImagePickerController.SourceType
    let onImagePicked: (UIImage) -> Void

    func makeCoordinator() -> Coordinator {
        return Coordinator(presentationMode: presentationMode,
                           onImagePicked: onImagePicked)
    }

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        @Binding private var presentationMode: PresentationMode
        private let onImagePicked: (UIImage) -> Void

        init(presentationMode: Binding<PresentationMode>,
             onImagePicked: @escaping (UIImage) -> Void) {
            self._presentationMode = presentationMode
            self.onImagePicked = onImagePicked
        }

        func imagePickerController(_ picker: UIImagePickerController,
                                   didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {
                onImagePicked(image)
            }
            presentationMode.dismiss()
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            presentationMode.dismiss()
        }
    }
}
