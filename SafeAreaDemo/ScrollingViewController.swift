//
//  ScrollingViewController.swift
//  SafeAreaDemo
//
//  Created by Kevin Donnelly on 9/26/17.
//

import UIKit

class ContentInsetScrollView : UIScrollView {
  override func adjustedContentInsetDidChange() {
    super.adjustedContentInsetDidChange()
    print("Content Inset: \(contentInset)\nAdjustedContentInset:\(adjustedContentInset)")
  }
}

class ScrollingViewController: UIViewController {
  @IBOutlet weak var scrollView: UIScrollView!
  
  @IBAction func neverTapped(_ sender: Any) {
    scrollView.contentInsetAdjustmentBehavior = .never
  }
  @IBAction func automticTapped(_ sender: Any) {
    scrollView.contentInsetAdjustmentBehavior = .automatic
  }
}
