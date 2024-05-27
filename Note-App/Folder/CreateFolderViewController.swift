
//  CreateFolderViewController.swift
//  Note-App
//
//  Created by Chorn Thoen on 5/24/24.


import UIKit

protocol CreateFolderDelegate: AnyObject {
    func onUpdate(folder: FolderModels)
    func onSave(folder: FolderModels)
}

class CreateFolderViewController: UIViewController {
    
    weak var delegate: CreateFolderDelegate?
    var folders: FolderModels?
    
    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Title"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let descriptionTextField: UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 6
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.layer.borderColor = UIColor.systemGray3.cgColor
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        return textView
    }()
    private let placeholderLabel: UILabel = {
        let label = UILabel()
        label.text = "Description..."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor.systemGray3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        view.addSubview(titleTextField)
        view.addSubview(descriptionTextField)
        let saveButton = UIBarButtonItem(
            barButtonSystemItem: .save,
            target: self, action: #selector(saveFolder))
        navigationItem.rightBarButtonItem = saveButton

        
        title = "Create Folder"
        setupLayout()
        
        if let folder = folders {
            titleTextField.text = folder.title
            descriptionTextField.text = folder.description
        }
        descriptionTextField.addSubview(placeholderLabel)
            
        NSLayoutConstraint.activate([
            placeholderLabel.topAnchor.constraint(
                equalTo:descriptionTextField.topAnchor,
                constant: 8
            ),
            placeholderLabel.leadingAnchor.constraint(
                equalTo: descriptionTextField.leadingAnchor,
                constant: 4
            )]
        )
        descriptionTextField.delegate = self
    }
  
    
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 20
            ),
            titleTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            titleTextField.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            
            descriptionTextField.topAnchor.constraint(
                equalTo: titleTextField.bottomAnchor,
                constant: 20
            ),
            descriptionTextField.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: 20
            ),
            descriptionTextField.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: -20
            ),
            
        ])
    }
    @objc func saveFolder() {
        guard let title = titleTextField.text, !title.isEmpty,
              let description = descriptionTextField.text, !description.isEmpty else {
            alertMessage(
                title: "Title and Description",
                message: "Title and Description cannot be empty."
            )
            return
        }
        
        if var folder = folders {
            folder.title = title
            folder.description = description
            delegate?.onUpdate(folder: folder)
            alertMessageSuccess(
                message: "Folder updated successfully"
            ) {
                self.navigationController?.popViewController(animated: true)
            }
        } else {
            let newFolder = FolderModels(
                title: title,
                description: description,
                date: Date()
            )
            delegate?.onSave(folder: newFolder)
            alertMessageSuccess(
                message: "Folder saved successfully"
            ) {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }

    func alertMessage(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }

    func alertMessageSuccess(message: String, completion: @escaping () -> Void) {
        let alert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        })
        present(alert, animated: true, completion: nil)
    }
}

extension CreateFolderViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        placeholderLabel.isHidden = !textView.text.isEmpty
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        placeholderLabel.isHidden = true
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            placeholderLabel.isHidden = false
        }
    }
}

