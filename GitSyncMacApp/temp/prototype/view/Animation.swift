import Cocoa
@testable import Utils
@testable import Element

extension ProtoTypeView {
    /**
     * Frame animation for promptButton
     */
    func promptButtonAnim(point:CGPoint){
        disableAnim {
            self.promptBtn.layer?.position = point
        }
    }
    /**
     * Frame animation for modal (buttonRect to modalRect)
     */
    func modalFrameAnim(roundedRect:RoundedRect){
        //anim rect here
        //Swift.print("rect: " + "\(rect)")
        disableAnim {
            StyleModifier.overrideStylePropVal(&self.style, ("width",0), roundedRect.size.w)
            StyleModifier.overrideStylePropVal(&self.style, ("height",0), roundedRect.size.h)
//            let fillet:CGFloat = (rect.size.w/2).max(0)
            //continue here, make RoundRect primitive and anim that
            
            StyleModifier.overrideStylePropVal(&self.style, ("corner-radius",0), roundedRect.fillet.topLeft)
            self.modalBtn.skin?.setStyle(self.style)
            self.modalBtn.layer?.position = roundedRect.origin
        }
    }

}