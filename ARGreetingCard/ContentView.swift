import SwiftUI
import RealityKit
import ARKit

struct ContentView: View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Check if the device supports VisionOS and adjust configurations accordingly
        if let visionConfiguration = makeVisionConfiguration() {
            arView.session.run(visionConfiguration, options: [.resetTracking, .removeExistingAnchors])
        } else {
            // Fallback to ARWorldTrackingConfiguration for other devices
            let configuration = ARWorldTrackingConfiguration()
            configuration.planeDetection = [.horizontal]
            arView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        }
        
        // Create and add an anchor to the scene
        if let anchor = createAnchor(), let textEntity = createText("Happy Birthday!") {
            textEntity.position = [0, 0.1, 0] // Adjust position as needed
            anchor.addChild(textEntity)
            arView.scene.addAnchor(anchor)
        }
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    // Helper function to create an anchor
    func createAnchor() -> AnchorEntity? {
        return AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.1, 0.1)))
    }
    
    // Helper function to create a text entity
    func createText(_ text: String) -> ModelEntity? {
        let fontSize: CGFloat = 16
        let extrusionDepth: Float = 0.1
        
        guard let font = UIFont(name: "Helvetica", size: fontSize) else {
            print("Failed to load font.")
            return nil
        }
        
        let mesh = MeshResource.generateText(text, extrusionDepth: extrusionDepth, font: font)
        let material = SimpleMaterial(color: .white, isMetallic: true)
        
        return ModelEntity(mesh: mesh, materials: [material])
    }
    
    // Function to create a VisionOS-specific configuration if available
    func makeVisionConfiguration() -> ARConfiguration? {
        if #available(iOS 17.0, *) {
            let configuration = ARWorldTrackingConfiguration()
            configuration.planeDetection = [.horizontal]
            // Add any VisionOS-specific configurations here
            return configuration
        }
        return nil
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

