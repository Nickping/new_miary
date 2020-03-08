//
//  FeedCreationViewController.swift
//  Miary
//
//  Created by Euijoon Jung on 2020/03/08.
//  Copyright © 2020 Euijoon Jung. All rights reserved.
//

import UIKit
import Photos
import BSImagePicker

class FeedCreationViewController: UIViewController {

    @IBOutlet weak var addPicturesView: UIView!
    static let viewID = "FeedCreationViewController"
    
    private let imagePickerController = ImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        self.navigationController?.navigationBar.topItem?.title = "New Feed"
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(didTapAddPicturesView))
        addPicturesView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func didTapAddPicturesView() {
//        imagePickerController.cancelButton.title = "취소"
//        imagePickerController.doneButton.title = "확인"
//        imagePickerController.delegate = self
//        imagePickerController.modalPresentationStyle = .fullScreen
//
//
//
//        presentImagePicker(imagePickerController, select: { (asset) in
//
//        }, deselect: { (asset) in
//            print(asset)
//        }, cancel: { (assets) in
//            print(assets)
//        }, finish: { (assets) in
//            print(assets)
//        })
//
        
        let imagePicker = UIImagePickerController()
        imagePicker.modalPresentationStyle = .fullScreen
        imagePicker.imageExportPreset
        self.present(imagePicker, animated: true, completion: nil)
//        self.pushViewController(imagePickerController, animated: true)
//        imagePickerController.sourceType = .photoLibrary
//        imagePickerController.delegate = self
//        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

extension FeedCreationViewController: UINavigationControllerDelegate {
    
}

extension FeedCreationViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//
//        if let image = info[UIImagePickerControllerEditedImage] as? UIImage {
//            imageView.image = image
//            imageView.contentMode = .scaleAspectFill
//            imageView.clipsToBounds = true
//        }
//
//        let leadingConstraint = NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: imageView.superview, attribute: .leading, multiplier: 1, constant: 0)
//
//        leadingConstraint.isActive = true
//
//        let trailingConstraint = NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: imageView.superview, attribute: .trailing, multiplier: 1, constant: 0)
//
//        trailingConstraint.isActive = true
//
//        let topConstraint = NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: imageView.superview, attribute: .top, multiplier: 1, constant: 0)
//
//        topConstraint.isActive = true
//        let bottomConstraint = NSLayoutConstraint(item: imageView, attribute: .bottom, relatedBy: .equal, toItem: imageView.superview, attribute: .bottom, multiplier: 1, constant: 0)
//
//        bottomConstraint.isActive = true
//
//        self.dismiss(animated: true, completion: nil)
    }
}

extension FeedCreationViewController: ImagePickerControllerDelegate {
    func imagePicker(_ imagePicker: ImagePickerController, didSelectAsset asset: PHAsset) {
        print(asset)
    }
    
    func imagePicker(_ imagePicker: ImagePickerController, didDeselectAsset asset: PHAsset) {
        print(asset)
    }
    
    func imagePicker(_ imagePicker: ImagePickerController, didFinishWithAssets assets: [PHAsset]) {
        print(assets)
    }
    
    func imagePicker(_ imagePicker: ImagePickerController, didCancelWithAssets assets: [PHAsset]) {
        print(assets)
    }
    
    func imagePicker(_ imagePicker: ImagePickerController, didReachSelectionLimit count: Int) {
        print(count)
    }
    
    
}
