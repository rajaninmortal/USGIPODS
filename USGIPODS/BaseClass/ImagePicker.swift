//
//  ImagePicker.swift
//  UniversalSompo
//
//  Created by Zoi Technologies on 06/02/20.
//  Copyright © 2020 Inmorteltech. All rights reserved.
//

import Foundation
import UIKit

public protocol ImagePickerDelegate: class {
    func didSelect(image: UIImage?, format: String?)
}

open class ImagePicker: NSObject, UINavigationControllerDelegate {

    private let pickerController: UIImagePickerController
    private weak var presentationController: UIViewController?
    private weak var delegate: ImagePickerDelegate?

    public init(presentationController: UIViewController, delegate: ImagePickerDelegate) {
        self.pickerController = UIImagePickerController()

        super.init()

        self.presentationController = presentationController
        self.delegate = delegate

        self.pickerController.delegate = self
        self.pickerController.allowsEditing = true
        self.pickerController.mediaTypes = ["public.image"]
    }

    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }

        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController.sourceType = type
            self.presentationController?.present(self.pickerController, animated: true)
        }
    }

    public func present(from sourceView: UIView, libraryOnly: Bool = true, cameraOnly: Bool = true) {

        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        if cameraOnly {
            if let action = self.action(for: .camera, title: "Take photo") {
                alertController.addAction(action)
            }
        }
        if libraryOnly {
            if let action = self.action(for: .savedPhotosAlbum, title: "Camera roll") {
                alertController.addAction(action)
            }
            if let action = self.action(for: .photoLibrary, title: "Photo library") {
                alertController.addAction(action)
            }
        }
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        if UIDevice.current.userInterfaceIdiom == .pad {
            alertController.popoverPresentationController?.sourceView = sourceView
            alertController.popoverPresentationController?.sourceRect = sourceView.bounds
            alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
        }

        self.presentationController?.present(alertController, animated: true)
    }

    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?, format: String?) {
        controller.dismiss(animated: true, completion: nil)
        self.delegate?.didSelect(image: image, format: format)
    }
}

extension ImagePicker: UIImagePickerControllerDelegate {

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController(picker, didSelect: nil, format: nil)
    }

    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return self.pickerController(picker, didSelect: nil, format: nil)
        }
        var format = ""
        if #available(iOS 11.0, *) {
            if let imageURL = info[UIImagePickerController.InfoKey.imageURL] as? URL {
                print(imageURL.typeIdentifier ?? "unknown UTI")  // this will print public.jpeg or another file UTI
                format = imageURL.typeIdentifier ?? ""
            }
        } else {
            // Fallback on earlier versions
        }
        self.pickerController(picker, didSelect: image, format: format)
    }
}

extension URL {
    var typeIdentifier: String? {
        return (try? resourceValues(forKeys: [.typeIdentifierKey]))?.typeIdentifier
    }
}
