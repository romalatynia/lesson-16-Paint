//
//  ViewController.swift
//  Paint
//
//  Created by Harbros47 on 19.01.21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var canvasView: CanvasView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction private func clear(_ sender: Any) {
        guard let theCanvasView = canvasView else { return }
        theCanvasView.lineArray = []
        theCanvasView.setNeedsDisplay()
    }
}
