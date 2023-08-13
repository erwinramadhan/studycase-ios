//
//  ScanQRISViewController.swift
//  CaseStudyiOS
//
//  Created by Erwin Ramadhan on 13/08/23.
//

import UIKit
import AVFoundation

class ScanQRISViewController: UIViewController {

    var presenter: ScanQRISViewToPresenterProtocol? 
    
    var session = AVCaptureSession()
    var previewLayer = AVCaptureVideoPreviewLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        byPassing()
        view.backgroundColor = .white
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor =  UIColor(named: "Black800")
        navigationController?.navigationBar.topItem?.title = "QRIS"
        navigationController?.navigationBar.layer.shadowColor = UIColor.lightGray.cgColor
        navigationController?.navigationBar.layer.shadowOpacity = 0.8
        navigationController?.navigationBar.layer.shadowOffset = CGSize(width: 0, height: 2)
        navigationController?.navigationBar.layer.shadowRadius = 1.5
        navigationController?.navigationBar.isHidden = false
        
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice)
            session.addInput(input)
        } catch {
            print("error")
        }
        
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [.qr]
        
        previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.frame = view.layer.bounds
        view.layer.addSublayer(previewLayer)
        
        DispatchQueue.global(qos: .userInitiated).async {
            self.session.startRunning()
        }
    }
    
    func byPassing() {
        let qrisData = QRISData(
            bankName: "BNI",
            transactionId: "ID12345678",
            merchantName: "MERCHANT MOCK TEST",
            payAmount: 50000
        )
        
        let detailPaymentQRISVC = DetailPaymentQRISRouter.createModule(qrisData: qrisData)
        navigationController?.pushViewController(detailPaymentQRISVC, animated: true)
    }
}

extension ScanQRISViewController: AVCaptureMetadataOutputObjectsDelegate {
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        if let metadataObject = metadataObjects.first {
            guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return }
            
            print("readableObject", readableObject.stringValue ?? "")
            
            if let qrisDatas = readableObject.stringValue?.components(separatedBy: ".") {
                if qrisDatas.count == 4 {
                    let bankName = qrisDatas.first!
                    let transactionId = qrisDatas[1]
                    let merchantName = qrisDatas[2]
                    let payAmount = qrisDatas.last!
                    guard let payAmountInt = Int(payAmount) else { return }
                    
                    let qrisData = QRISData(
                        bankName: bankName,
                        transactionId: transactionId,
                        merchantName: merchantName,
                        payAmount: payAmountInt
                    )
                    
                    let detailPaymentQRISVC = DetailPaymentQRISRouter.createModule(qrisData: qrisData)
                    navigationController?.pushViewController(detailPaymentQRISVC, animated: true)
                } else {
                    let alertController = UIAlertController(
                        title: "QRIS Tidak Valid",
                        message: "QR yang terscan tidak dikenali",
                        preferredStyle: .alert
                    )
                    
                    let okAction = UIAlertAction(
                        title: "OK",
                        style: .default,
                        handler: { _ in
                            self.navigationController?.popViewController(animated: true)
                        }
                    )
                    alertController.addAction(okAction)
                    
                    present(alertController, animated: true, completion: nil)
                }
            }
            
            DispatchQueue.global(qos: .userInitiated).async {
                self.session.stopRunning()
            }
        }
    }
}

extension ScanQRISViewController: ScanQRISPresenterToViewProtocol {
    
}
