//
//  MyGraphControllerView.swift
//  Mediana
//
//  Created by dianaMediana on 03.01.2021.
//

import Foundation
import UIKit

class MyGraphControllerView: UIViewController {
    
    var yForX: ((Double) -> Double)? { didSet { refreshGraph() } }
    
    @IBOutlet weak var viewGraph: MyGraphView! { didSet {
        viewGraph.addGestureRecognizer(UIPinchGestureRecognizer(target: viewGraph, action: #selector(MyGraphView.scale(_:))))
        viewGraph.addGestureRecognizer(UIPanGestureRecognizer(target: viewGraph, action: #selector(MyGraphView.originMove(_:))))
        let doubleTapRecognizer = UITapGestureRecognizer(target: viewGraph, action: #selector(MyGraphView.origin(_:)))
        doubleTapRecognizer.numberOfTapsRequired = 2
        viewGraph.addGestureRecognizer(doubleTapRecognizer)
        refreshGraph() } }
    
    @IBOutlet weak var viewChart: MyChartView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func chooseView(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            viewGraph.isHidden = false
            viewChart.isHidden = true
        case 1:
            viewGraph.isHidden = true
            viewChart.isHidden = false
        default:
            break
        }
    }
    
    func refreshGraph() {
        viewGraph.yForX = yForX
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yForX = { $0 * $0 }
    }
}
