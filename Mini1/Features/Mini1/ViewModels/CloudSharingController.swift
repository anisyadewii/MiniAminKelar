//
//  CloudSharingController.swift
//  Mini1
//
//  Created by Anisya Dewi Larasati on 02/05/23.
//

import Foundation
import CloudKit
import SwiftUI
import UIKit

struct CloudSharingView: UIViewControllerRepresentable {
    
    let share: CKShare
    let container: CKContainer
    let journal: Journal

    func makeCoordinator() -> CloudSharingCoordinator {
          CloudSharingCoordinator(journal: journal)
    }

    func makeUIViewController(context: Context) -> UICloudSharingController {
          share[CKShare.SystemFieldKey.title] = journal.wrappedText
          let controller = UICloudSharingController(share: share, container: container)
          controller.modalPresentationStyle = .formSheet
          controller.delegate = context.coordinator
          return controller
    }

    func updateUIViewController(_ uiViewController: UICloudSharingController, context: Context) {
    }
  }

    final class CloudSharingCoordinator: NSObject, UICloudSharingControllerDelegate {
        let stack = CoreDataStack.shared
        let journal: Journal
        init(journal: Journal) {
            self.journal = journal
        }

        func itemTitle(for csc: UICloudSharingController) -> String? {
            journal.wrappedText
        }

        func cloudSharingController(_ csc: UICloudSharingController, failedToSaveShareWithError error: Error) {
          print("Failed to save share: \(error)")
        }

        func cloudSharingControllerDidSaveShare(_ csc: UICloudSharingController) {
          print("Saved the share")
        }

//    func cloudSharingControllerDidStopSharing(_ csc: UICloudSharingController) {
//        if !stack.isOwner(object: journal) {
//        stack.delete(journal)
//      }
//    }
      
//    @Environment(\.presentationMode) var presentationMode
//
//    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
//
//    }
//
//    let share: CKShare
//    let container: CKContainer
//
//    func makeUIViewController(context: Context) -> some UIViewController {
//        let sharingController = UICloudSharingController(share: share, container: container)
//        sharingController.availablePermissions = [.allowReadOnly, .allowPrivate]
//        sharingController.delegate = context.coordinator
//        sharingController.modalPresentationStyle = .formSheet
//        return sharingController
//    }
//
//    func makeCoordinator() -> CloudSharingView.Coordinator {
//        Coordinator()
//    }
//
//    final class Coordinator: NSObject, UICloudSharingControllerDelegate{
//        func cloudSharingController(_ csc: UICloudSharingController, failedToSaveShareWithError error: Error) {
//            debugPrint("Error saving share: \(error)")
//        }
//
//        func itemTitle(for csc: UICloudSharingController) -> String? {
//            "Sharing sample"
//        }
//    }
}








//  let journal: Journal

//  func makeCoordinator() -> CloudSharingCoordinator {
//    CloudSharingCoordinator(journal: journal)
//  }
//
//  func makeUIViewController(context: Context) -> UICloudSharingController {
//    share[CKShare.SystemFieldKey.title] = journal.wrappedText
//
//    let controller = UICloudSharingController(share: share, container: container)
//    controller.modalPresentationStyle = .formSheet
//    controller.delegate = context.coordinator
//    return controller
//  }
//
//  func updateUIViewController(_ uiViewController: UICloudSharingController, context: Context) {
//  }
//}

//final class CloudSharingCoordinator: NSObject, UICloudSharingControllerDelegate {
//  let stack = CoreDataStack.shared
//  let journal: Journal
//
//  init(journal: Journal) {
//      self.journal = journal
//  }
//
//  func itemTitle(for csc: UICloudSharingController) -> String? {
//      journal.wrappedText
//  }
//
//  func cloudSharingController(_ csc: UICloudSharingController, failedToSaveShareWithError error: Error) {
//    print("Failed to save share: \(error)")
//  }
//
//  func cloudSharingControllerDidSaveShare(_ csc: UICloudSharingController) {
//    print("Saved the share")
//  }

//  func cloudSharingControllerDidStopSharing(_ csc: UICloudSharingController) {
//    if !stack.isOwner(object: journal) {
//      stack.delete(journal)
//    }
//  }

