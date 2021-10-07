//
//  QRViewController.swift
//  Pets
//
//  Created by Uladzimir Kulakou on 10/5/21.
//

import UIKit
import AVFoundation

class QRViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {


    
    var video = AVCaptureVideoPreviewLayer()
    // 1. Настраиваем сессию
    let session = AVCaptureSession()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupVideo()
        // Do any additional setup after loading the view.
    }
    
    func setupVideo() {
       
        // 2. Настраиваем устройство
        let captureDevice = AVCaptureDevice.default(for: AVMediaType.video)
        // 3. Настроим input
        do {
            let input = try AVCaptureDeviceInput(device: captureDevice!)
            session.addInput(input)
        } catch {
            fatalError(error.localizedDescription)
        }
        // 4. Настроим output
        let output = AVCaptureMetadataOutput()
        session.addOutput(output)
        output.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
        output.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
        // 5.
        video = AVCaptureVideoPreviewLayer(session: session)
        video.frame = view.layer.bounds
    }
    
    func startRunning() {
        view.layer.addSublayer(video)
        session.startRunning()
    }
    
    @IBAction func startVideoTapped(_ sender: Any) {
        startRunning()
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        guard metadataObjects.count > 0 else { return }
        if let object = metadataObjects.first as? AVMetadataMachineReadableCodeObject {
            if object.type == AVMetadataObject.ObjectType.qr {
                let alert = UIAlertController(title: "QR-Code", message: object.stringValue, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Перейти", style: .default, handler: {(action) in
                    print(object.stringValue)}))
                alert.addAction(UIAlertAction(title: "Копировать", style: .default, handler: {(action) in
                    UIPasteboard.general.string = object.stringValue
                    self.view.layer.sublayers?.removeLast()
                    self.session.stopRunning()
                    print(object.stringValue)
                }))
                present(alert, animated: true, completion: nil)
            }
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
