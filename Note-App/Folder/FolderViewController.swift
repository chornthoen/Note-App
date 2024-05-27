//
//  FolderViewController.swift
//  Note-App
//
//  Created by Chorn Thoen on 5/24/24.
//


import UIKit

class FolderViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CreateFolderDelegate {
    var noteList: [FolderModels] = [
        FolderModels(
            title: "JAVA",
            description: "This is JAVA",
            date: Date()
        ),
        FolderModels(
            title: "Swift",
            description: "This is Swift",
            date: Date()
        ),
        FolderModels(
            title: "Kotlin",
            description: "This is Kotlin",
            date: Date()
        ),
        FolderModels(
            title: "Python",
            description: "This is Python",
            date: Date()
        ),
    ]
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemGray6
        setUpNavigationBar()
        setupCollectionView()
    }
    
    private func setUpNavigationBar() {
        self.navigationItem.hidesBackButton = true
        self.navigationItem.backBarButtonItem = nil
        self.navigationItem.leftBarButtonItem = nil
        
        self.title = "Folder"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(createNoteButtonTapped))
    }

    @objc func createNoteButtonTapped() {
        let noteViewController = CreateFolderViewController()
        noteViewController.delegate = self
        self.navigationController?.pushViewController(noteViewController, animated: true)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(FolderCollectionViewCell.self, forCellWithReuseIdentifier: FolderCollectionViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return noteList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FolderCollectionViewCell.identifier, for: indexPath) as! FolderCollectionViewCell
        cell.configure(with: noteList[indexPath.row])
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        let configuration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            let delete = UIAction(title: "Delete", image: UIImage(systemName: "trash"), attributes: .destructive) { _ in
                    self.showDeleteConfirmationAlert(forItemAt: indexPath)
            }
            let edit = UIAction(title: "Edit", image: UIImage(systemName: "pencil")) { _ in let vc = CreateFolderViewController()
                        vc.folders = self.noteList[indexPath.row]
                        vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
            }
            return UIMenu(title: "", children: [delete, edit])
        }
        return configuration
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
            let vc = DetailFolderViewController()
            vc.folder = noteList[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfRow: CGFloat = 4
        let widthFrame = collectionView.frame.width
        let widthCell = (widthFrame / numberOfRow) - 10
        return CGSize(width: widthCell, height: widthCell)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 6, left: 0, bottom: 6, right: 0)
    }
    
    
    func showDeleteConfirmationAlert(forItemAt indexPath: IndexPath) {
        
        let alert = UIAlertController(
            title: "Confirm Deletion",
            message: "Are you sure you want to delete this folder?",
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(
                title: "Delete",
                style: .destructive
            ) { _ in
            self.deleteFolder(at: indexPath)
        })
        alert.addAction(
            UIAlertAction(
                title: "Cancel",
                style: .cancel,
                handler: nil
            )
        )
        present(alert, animated: true, completion: nil)
    }

    func deleteFolder(at indexPath: IndexPath) {
        noteList.remove(at: indexPath.row)
        collectionView.deleteItems(at: [indexPath])
    
    }

    
    func onUpdate(folder: FolderModels) {
        print("Updating folder with ID:", folder.id)
        for (index, existingFolder) in noteList.enumerated() {
            print("Folder at index", index, "has ID:", existingFolder.id)
            if existingFolder.id == folder.id {
                // Update the folder in the array
                noteList[index] = folder
                // Reload only the updated item instead of reloading the entire collection view
                collectionView.reloadItems(at: [IndexPath(item: index, section: 0)])
                print("Folder updated successfully")
                return
            }
        }
        print("Folder not found")
    }




    
    func onSave(folder: FolderModels) {
        noteList.append(folder)
        collectionView.reloadData()
        print("Note saved successfully")
    }
}
