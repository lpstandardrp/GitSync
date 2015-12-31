import Cocoa

class WinView3:NSView {
    override var wantsDefaultClipping:Bool{return false}//avoids clipping the view
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        createContent()
    }
    required init?(coder: NSCoder) {fatalError("init(coder:) has not been implemented")}
    func createContent(){
        //continue here: make winview3.swift and start testing the SVGLib, you probably will need to look over some old notes
        svgTest()
    }
    /**
     *
     */
    func svgTest(){
        let path = "~/Desktop/icons/cross.svg".tildePath
        let content = FileParser.content(path)
        //Swift.print("content: " + "\(content)")
        
        let xmlDoc:NSXMLDocument = try! NSXMLDocument(XMLString: content!, options: 0)
        let rootElement:NSXMLElement = xmlDoc.rootElement()!
        Swift.print("rootElement.childCount: " + "\(rootElement.childCount)")
        Swift.print("rootElement.stringValue: " + "\(rootElement.stringValue)")
        
        let child:NSXMLElement = XMLParser.childAt(children, i)!
        
        let svg:SVG = SVGParser.svg(rootElement);
        SVGParser.describeAll(svg)
        //SVGModifier.scale(svg, CGPoint(), CGPoint(2,2));
        //addSubview(svg);
    }
}
