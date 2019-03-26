//
//  ViewController.swift
//  ARB
//
//  Created by Madushan Senavirathna on 1/28/19.
//  Copyright © 2019 Madushan Senavirathna. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import DJSemiModalViewController

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet weak var buyingOption: UIStackView!
    @IBOutlet weak var profileImage: UIView!
    @IBOutlet weak var pfImage: UIImageView!
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //Profile image conner radious
        profileImage.layer.cornerRadius = profileImage.frame.size.width/2
        pfImage.layer.cornerRadius = pfImage.frame.size.width/2
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        //sceneView.showsStatistics = true
//
//        // Createa new scene
//        let scene = SCNScene(named: "art.scnassets/iphone.scn")!
//
//        // Set the scene to the view
//        sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Buying option hidden when 3D Modle genarated
         buyingOption.isHidden = true
        
        // Create a session configuration with Image Tracking configuration.
        let configuration = ARImageTrackingConfiguration()
        
        if let imageToTrack = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: Bundle.main){
       
            configuration.trackingImages = imageToTrack
            configuration.maximumNumberOfTrackedImages = 1
            
            print("Image successfully add ============================================> ")
            

        }
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
        override func viewDidAppear(_ animated: Bool) {
            //
            if UserDefaults.standard.bool(forKey: "hasViewWalkThrough"){
                return
            }
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let walkThroughViewController = storyboard.instantiateViewController(withIdentifier: "walkThroughViewController") as? walkThroughViewController {
                present(walkThroughViewController , animated: true, completion: nil)
                
            }
        }
    
     // MARK: - ARSCNViewDelegate
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        let node = SCNNode()
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            let plane = SCNPlane(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            
            plane.firstMaterial?.diffuse.contents = UIColor(white: 1.0, alpha: 0.0)
            
            let planeNode = SCNNode(geometry: plane)
            
            planeNode.eulerAngles.x = -.pi / 2
            
            node.addChildNode(planeNode)
            
            if let ARScene = SCNScene(named: "art.scnassets/iphone.scn"){
                
                
                let rotationAction = SCNAction.rotateBy(x: 0, y: 0, z: 0.5, duration: 1)
                let inifiniteAction = SCNAction.repeatForever(rotationAction)
                
                
                if let ARS = ARScene.rootNode.childNodes.first {
                    planeNode.addChildNode(ARS)
                    ARS.scale = SCNVector3(0.022, 0.022, 0.022)
                    ARS.position = SCNVector3Zero
                    ARS.position.x = 0.05
                    //ARS.runAction(inifiniteAction)
                }
            }
            
            buyingOption.isHidden = false
            
        }
        
        return node
    }
    
    

    // Card view
    @IBAction func buyItNow(_ sender: Any) {
        let controller = DJSemiModalViewController()
        
        controller.title = "ARB "
        
        let label = UILabel()
        label.text = "ARB Test Don Senavirathna"
        label.textAlignment = .center
        controller.addArrangedSubview(view: label)
        
        controller.presentOn(presentingViewController: self, animated: true, onDismiss: { })
        controller.automaticallyAdjustsContentHeight = true
        
        controller.maxWidth = 420
        
        controller.minHeight = 500
        
        controller.titleLabel.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.bold)
        
        controller.closeButton.setTitle("Buy it now", for: .normal)
        
    }
    
    
    
}
    
    // MARK: - ARSCNViewDelegate
    


        

