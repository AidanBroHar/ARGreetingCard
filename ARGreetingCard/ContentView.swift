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
        
        // Set up the AR session configuration
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal] // Ensuring horizontal plane detection is set.
        arView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        
        // Create an anchor and add it to the scene
        let anchor = AnchorEntity(.plane(.horizontal, classification: .any, minimumBounds: SIMD2<Float>(0.1, 0.1)))
        
        // Assuming text entity creation is successful
        if let textEntity = createText("Happy Birthday!") {
            textEntity.position = [0, 0.1, 0] // Adjust position as needed
            anchor.addChild(textEntity)
            arView.scene.addAnchor(anchor)
        }
        
        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func createText(_ text: String) -> Entity? {
        let font = UIFont.systemFont(ofSize: 16) // Using UIFont
        let mesh = MeshResource.generateText(text, extrusionDepth: 0.1, font: font)
        let material = SimpleMaterial(color: .white, isMetallic: true)
        return ModelEntity(mesh: mesh, materials: [material])
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

