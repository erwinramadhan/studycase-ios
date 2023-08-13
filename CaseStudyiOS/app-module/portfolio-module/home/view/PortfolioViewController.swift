//
//  PortfolioViewController.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 12/08/23.
//

import UIKit
import Charts

class PortfolioViewController: UIViewController, ChartViewDelegate {
    
    var presenter: PortfolioViewToPresenterProtocol?
    
    var pieChart = PieChartView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.getDonutChart()
        
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = "Portfolio"
        navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 0.8
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        navigationController?.navigationBar.layer.shadowRadius = 1.5
        
        pieChart.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        pieChart.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.width)
        pieChart.center = view.center
        view.addSubview(pieChart)
    }
    
    func chartValueSelected(_ chartView: ChartViewBase, entry: ChartDataEntry, highlight: Highlight) {
        let i = Int(highlight.x)
        guard let label = pieChart.legend.entries[i].label else { return }
        guard let donutChartDataSelected = presenter?.donutChartData?.data.first(where: { $0.label == label }) else { return }
        
        let detailPortfolio = DetailPortfolioRouter.createModule(dataDonut: donutChartDataSelected)
        navigationController?.pushViewController(detailPortfolio, animated: true)
    }

}

extension PortfolioViewController: PortfolioPresenterToViewProtocol {
    func showDonutChart(donutChartData: DonutChartResponse) {
        var entries = [PieChartDataEntry]()
        for data in donutChartData.data {
            entries.append(PieChartDataEntry(value: Double(data.percentage) ?? 0, label: data.label))
        }
        let set = PieChartDataSet(entries: entries, label: "")
        let colors = [
            NSUIColor(red: 228/255, green: 26/255, blue: 28/255, alpha: 1),
            NSUIColor(red: 55/255, green: 126/255, blue: 184/255, alpha: 1),
            NSUIColor(red: 77/255, green: 175/255, blue: 74/255, alpha: 1),
            NSUIColor(red: 255/255, green: 127/255, blue: 0/255, alpha: 1),
            NSUIColor(red: 152/255, green: 78/255, blue: 163/255, alpha: 1)
        ]
        set.colors = colors
        set.entryLabelFont = NSUIFont.systemFont(ofSize: 8, weight: .bold)
        
        let data = PieChartData(dataSet: set)
        pieChart.data = data
        pieChart.rotationEnabled = false
        pieChart.legend.textColor = .black
    }
    
    func showDonutChartError() {
        
    }
    
    func showLineChart(lineChartData: LineChartResponse) {
        
    }
    
    func showLineChartError() {
        
    }
}
