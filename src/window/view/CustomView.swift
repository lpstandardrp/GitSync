import Cocoa

/**
 * TODO: Hook up the onWindowResize method
 */
class CustomView:WindowView{
    var section:Section?
    var closeButton:Button?
    var minimizeButton:Button?
    var maximizeButton:Button?
    var testButton:Button?
    /**
     * Add content here
     */
    override func resolveSkin() {
        super.resolveSkin()
        //Swift.print("CustomView.resolveSkin()")
        createTitleBar()
        //createTextInput()
        //createSingleLineTextArea()
        createText()
        //createLeverSpinner()
        //createLeverStepper()
        
        //createRadioBullets()
        //addEventListeners()
        
        //continue here: Take a look at previouse NSTextField code vs NSText code. Run some tests to see which fits best.
        
        /*let tempTextInput = TempTextInput()
        addSubview(tempTextInput)
        
        tempTextInput.frame.origin.y = 50*/
    }

    func createTextInput(){
        var css:String = ""
        /*Text*/
        css += "Text{"
        css +=     "float:left;"
        css +=     "clear:left;"
        css +=     "font:Lucida Grande;"
        css +=     "size:12px;"
        css +=     "align:left;"
        css +=     "autoSize:none;"
        css +=     "color:grey6;"
        css +=     "selectable:true;"
        //css +=     "margin-top:4px;"
        css +=     "backgroundColor:orange;"
        css +=     "background:false;"
        css += "}"
        /*TextInput*/
        css += "TextInput{"
        css +=     "float:left;"
        css +=     "clear:left;"
        css += "}"
        css += "TextInput Text{"
        css +=     "float:left;"
        css +=     "clear:none;"
        css +=     "width:78px;"
        css +=     "height:22px;"
        css +=     "margin-top:4px;"
        css +=     "color:grey4;"
        css += "}"
        css += "TextInput TextArea{"
        css +=     "clear:none;"
        css +=     "width:60px;"
        css +=     "height:24px;"
        css +=     "padding:0px;"
        css +=     "fill:white;"
        css +=     "line:white9;"
        css +=     "line-alpha:1;"
        css +=     "line-thickness:1px;"
        css +=     "line-offset-type:outside;"
        css += "}"
        css += "TextInput TextArea Text{"
        css +=     "leftMargin:4px;"
        css +=     "type:input;"
        css +=     "selectable:true;"
        css += "}"
        
        StyleManager.addStyle(css)
        
        let textInput:TextInput = addSubView(TextInput(0, 0, "Description: ", "blue", self)) as! TextInput;
        textInput
    }
    /**
     *
     */
    func createSingleLineTextArea(){
        var css:String = ""
        /*Text*/
        css += "Text{"
        css +=     "float:left;"
        css +=     "clear:left;"
        css +=     "font:Lucida Grande;"
        css +=     "size:12px;"
        css +=     "align:left;"
        css +=     "autoSize:none;"
        css +=     "color:grey6;"
        css +=     "selectable:true;"
        //css +=     "margin-top:4px;"
        css +=     "backgroundColor:orange;"
        css +=     "background:false;"
        css += "}"
        /*TextArea*/
        css += "TextArea{"
        css +=     "float:left;"
        css +=     "clear:left;"
        css +=     "fill:white;"
        css +=     "line:white9;"
        css +=     "line-alpha:1;"
        css +=     "line-thickness:1px;"
        css +=     "line-offset-type:outside;"
        css +=     "padding:6px;"
        //css +=     "drop-shadow:<InsetShadow>;"
        css += "}"
        css += "TextArea Text{"
        css +=     "width:100%;"
        //css +=     "leading:2px;"
        css +=     "multiline:true;"
        css += "}"
        StyleManager.addStyle(css)
        
        let textArea:TextArea = addSubView(TextArea(200, 24, "This is a single line text area", self)) as! TextArea;
        textArea
    }
    /**
     *
     */
    func createText(){
        var css:String = ""
        css += "Text{"
        css +=     "float:left;"
        css +=     "clear:left;"
        css +=     "font:Lucida Grande;"
        css +=     "size:12px;"
        css +=     "align:left;"
        css +=     "autoSize:none;"
        css +=     "color:grey6;"
        css +=     "type:input;"
        css +=     "selectable:true;"
        css +=     "margin-top:4px;"
        css +=     "backgroundColor:orange;"
        css +=     "background:false;"
        css += "}"
        StyleManager.addStyle(css)
        let text:Text = self.addSubView(Text(100,24,"This is text: ",self)) as! Text
        text
    }
    /**
     * TODO: create the LeverSpinner component with text
     */
    func createLeverSpinner(){
        var css:String = ""
        /*leverSpinner css*/
        css += "Spinner{"
        css +=      "float:left;"
        css +=      "clear:left;"
        css +=      "width:120px;"
        css +=      "height:24px;"
        css +=      "padding:-2px;"
        css += "}"
        /*text css*/
        css += "Spinner TextInput{"
        css +=     "float:left;"
        css +=     "clear:none;"
        css +=     "width:90px;"
        css +=     "height:28px;"
        css +=     "margin-right:6px;"
        css +=     "margin-top:4px;"
        css += "}"
        css += "Spinner TextInput Text{"
        css +=     "font:Lucida Grande;"
        css +=     "selectable:false;"
        css +=     "size:12px;"
        css +=     "color:gray;"
        css +=     "align:left;"
        css +=     "backgroundColor:orange;"
        css +=     "background:false;"
        css +=     "margin-top:5px;"
        css +=     "float:left;"
        css +=     "clear:none;"
        css += "}"
        css += "Spinner TextInput TextArea{"
        css +=     "width:50px;"
        css +=     "height:28px;"
        css +=     "float:left;"
        css +=     "clear:none;"
        css +=     "fill:white;"
        css +=     "line:white9;"
        css +=     "line-alpha:1;"
        css +=     "line-thickness:1px;"
        css +=     "line-offset-type:outside;"
        css += "}"
        css += "Spinner TextInput TextArea Text{"
        css +=     "width:100%;"
        css +=     "align:right;"
        css +=     "selectable:true;"
        css +=     "mouseEnabled:true;"
        css += "}"
        css += "Spinner Stepper{"
        css +=     "clear:none;"
        css += "}"
        
        /*stepper css*/
        css += "ButtonBase{"
        css +=     "fill:linear-gradient(top,#FFFEFE,#E8E8E8);"
        css += "}"
        css += "Stepper{"
        css +=    "float:left;"
        css +=    "clear:none;"
        css += "}"
        css += "Stepper Button{"
        css +=    "float:left;"
        css +=    "width:10px,10px;"
        css +=    "height:10px,10px;"
        css +=    "margin-left:0px,1px;"
        css +=    "fill-alpha:1;"
        css +=    "line:grey7;"
        css +=    "line-offset-type:outside;"
        css +=    "line-alpha:1;"
        css +=    "line-thickness:1px;"
        //css +=    "drop-shadow:<SubtleShadow>,none;"
        css += "}"
        css += "Stepper Button#plus{"
        css +=     "fill:<ButtonBase>,~/Desktop/svg/icons/arrow_up_closed.svg grey8;"//assets/svg/icons/arrow_up_closed.svg
        css +=     "corner-radius:4px 4px 0px 0px;"
        css +=     "margin-top:0px,1px;"
        css += "}"
        css += "Stepper Button#minus{"
        css +=     "clear:left;"
        css +=     "height:10px,10px;"
        css +=     "fill:<ButtonBase>,~/Desktop/svg/icons/arrow_down_closed.svg grey8;"
        css +=     "line-offset-type-top:inside;"
        //css +=     "margin-top:0px;"
        css +=     "corner-radius:0px 0px 4px 4px;"
        css += "}"
        StyleManager.addStyle(css)
        
        
        let leverSpinner:LeverSpinner = self.addSubView(LeverSpinner(0, 0, self)) as! LeverSpinner;
        leverSpinner
        
    }
    /**
     * TODO: maybe change the inside to the top not the bottom
     * TODO: add hover and down states in the css
     */
    func createLeverStepper(){
        var css:String = ""
        css += "ButtonBase{"
        css +=     "fill:linear-gradient(top,#FFFEFE,#E8E8E8);"
        css += "}"
        css += "Stepper{"
        css +=    "float:left;"
        css +=    "clear:left;"
        css += "}"
        css += "Stepper Button{"
        css +=    "float:left;"
        css +=    "width:10px,10px;"
        css +=    "height:10px,10px;"
        css +=    "margin-left:0px,1px;"
        css +=    "fill-alpha:1;"
        css +=    "line:grey7;"
        css +=    "line-offset-type:outside;"
        css +=    "line-alpha:1;"
        css +=    "line-thickness:1px;"
        //css +=    "drop-shadow:<SubtleShadow>,none;"
        css += "}"
        css += "Stepper Button#plus{"
        css +=     "fill:<ButtonBase>,~/Desktop/svg/icons/arrow_up_closed.svg grey8;"//assets/svg/icons/arrow_up_closed.svg
        css +=     "corner-radius:4px 4px 0px 0px;"
        css +=     "margin-top:0px,1px;"
        css += "}"
        css += "Stepper Button#minus{"
        css +=     "clear:left;"
        css +=     "height:10px,10px;"
        css +=     "fill:<ButtonBase>,~/Desktop/svg/icons/arrow_down_closed.svg grey8;"
        css +=     "line-offset-type-top:inside;"
        //css +=     "margin-top:0px;"
        css +=     "corner-radius:0px 0px 4px 4px;"
        css += "}"
        StyleManager.addStyle(css)
        
        
    }
    func buttonTest(){
        Swift.print("buttonTest()")
        var css:String = "Button{width:50px;height:50px;}"
        css += "Button#test{fill:green;float:left;clear:left;corner-radius:5px;}"
        css += "Button#test:over{fill:blue;width:70px;height:70px;}"
        StyleManager.addStyle(css)
        
        
        //let container = Section(500,500,self,"radioBulletContainer")
        //ddSubview(container)
        
        //let box = Element(100,100)
        //addSubview(box)
        
        testButton = Button(0,0,self,"test")
        addSubview(testButton!)
    }
    /*override func hitTest(aPoint: NSPoint) -> NSView? {
    let temp = super.hitTest(aPoint)
    Swift.print("temp: " + "\(NSViewParser.parents(temp!))")
    return temp
    }*/
    /**
     *
     */
    func createRadioBullets(){
        var css:String = ""
        css += "Section#boxContainer{fill:green;float:left;clear:left;padding-top:20px;padding-left:20px;corner-radius:0px;}"
        //css += "Element#box{fill:blue;float:left;clear:left;padding-top:0px;padding-left:0px;}"
        
        /*generics*/
        css += "InsetShadow{"
        css +=      "drop-shadow:drop-shadow(0px 0 #000000 0.4 4 4 1 2 true);"
        css += "}"
        css += "RadioBulletBase{"
        css +=     "fill:linear-gradient(bottom, #EDEDED 1 0,#EDEDED 1 0.4214,#EDEDED 1 0.4908,#F6F6F6 1 0.5605,#FDFDFD 1 0.6768,#FFFFFF 1 1);"
        css += "}"
        css += "RadioBulletBase:selected{"
        css +=    "fill:linear-gradient(bottom, #87C2F3 1 0,#87C2F3 1 0.4214,#87C2F3 1 0.4908,#97CAF4 1 0.5147,#ADD5F6 1 0.5573,#BEDDF7 1 0.6077,#C9E3F8 1 0.67,#D0E6F9 1 0.7574,#D2E7F9 1 1);"
        css += "}"
        css += "RadioBulletTopShine{"
        css +=     "fill:radial-gradient(50% 20% 40% 120% 90 -1, white 1 0,white 0.33 0.4724,white 0 1);"
        css += "}"
        css += "RadioBulletBottomShine{"
        css +=     "fill:radial-gradient(50% 80% 90% 90% 0 0, white 0.70 0,white 0 1);"
        css += "}"
        css += "RadioBulletBulletShine{"
        css +=     "fill:radial-gradient(50% 50% 100% 100% 90 0.2, white 1 0,white 0 0.5);"
        css += "}"
        /*section*/
        css += "Section#radioBulletContainer{"
        css += "corner-radius:4px;"
        css += "fill:#EFEFF4;"//bg color for win: #E8E8E8
        css += "float:left;"
        css += "clear:left;"
        css += "width:56px;"//<---temp solution, this should be minus the padding left, test and fix this in a separate test
        css += "height:24px;"//<---same goes with this one
        css += "padding-left:9px;"
        css += "padding-top:4px;"
        css += "drop-shadow:<InsetShadow>;"
        css += "margin-left:8px;"
        css += "margin-top:4px;"
        css += "}"
        /*idle*/
        css += "Section#radioBulletContainer RadioBullet{"
        css += "float:left;"
        css += "clear:none;"
        css += "drop-shadow:none;"
        css += "padding-left:0px;"
        css += "padding-top:0px;"
        css += "width:14px,14px,14px,14px,5px;"
        css += "height:14px,14px,14px,14px,5px;"
        css += "margin-right:6px;"
        css += "margin-left:0px,0px,0px,0px,5.5px;"
        css += "margin-top:0px,0px,0px,0px,5.5px;"
        css += "corner-radius:7px,7px,7px,7px,2.5px;"
        css += "line:grey7;"
        css += "line-offset-type:outside,outside,outside,outside;"
        css += "line-alpha:1,0,0,0,0;"
        css += "line-thickness:1px,1px,1px,1px,1px;"
        css += "fill:<RadioBulletBase>,blue,blue,blue,blue;"
        css += "fill-alpha:1,0,0,0,0;"
        css += "}"
        /*selected*/
        css += "Section#radioBulletContainer RadioBullet:selected{"
        css += "fill:<RadioBulletBase:selected>,<RadioBulletBottomShine>,<RadioBulletTopShine>,<RadioBulletBulletShine>,#021931;"
        css += "fill-alpha:1,0,0,0,1;"
        css += "}"
        
        StyleManager.addStyle(css)
        
        let container = Section(500,500,self,"radioBulletContainer")
        addSubview(container)
        
        let radioBullet1 = RadioBullet(14,14,true,container)
        container.addSubview(radioBullet1)
        
        let radioBullet2 = RadioBullet(14,14,true,container)
        container.addSubview(radioBullet2)
        radioBullet2.setSelected(false)//<---work around for now
        
        let selectGroup = SelectGroup([radioBullet1,radioBullet2],radioBullet1)/**/
        func onSelect(event:Event){
            if(event.type == SelectGroupEvent.change){
                Swift.print("onSelect selectabe" + "\((event as! SelectGroupEvent).selectable)")
            }
        }
        selectGroup.event = onSelect
    }
    
    /**
     * Adds close button, min, max
     */
    func createTitleBar(){
        var css:String = ""
        css += "Section#titleBar{float:left;clear:left;padding-top:4px;padding-left:8px;}"
        css += "Section#titleBar Button{width:10px;height:10px;corner-radius:5px;float:left;clear:none;margin-right:8px;margin-top:0px;padding-left:0px;padding-top:0px;line-offset-type:outside;line-alpha:1;line-thickness:1px;}"//adding padding here shouldnt be necessary
        css += "Section#titleBar Button:over{fill:#A7A7A7;line:#828282;}"
        css += "Section#titleBar Button#close{fill:#FF5F52;line:#E33E32;}"
        css += "Section#titleBar Button#minimize{fill:#FFBE05;line:#E2A100;}"
        css += "Section#titleBar Button#maximize{fill:#15CC35;line:#17B230;}"
        StyleManager.addStyle(css)
        
        section = Section(frame.width,16,self,"titleBar")
        self.addSubview(section!)
        
        closeButton = section!.addSubView(Button(0,0,section!,"close")) as? Button/*<--TODO: the w and h should be NaN, test if it supports this*/
        minimizeButton = section!.addSubView(Button(0,0,section!,"minimize")) as? Button
        maximizeButton = section!.addSubView(Button(0,0,section!,"maximize")) as? Button
    }
    /**
     *
     */
    func setSize(size:CGSize){
        //Swift.print("CustomView.setSize() size: " + "\(size)")
        //self.skin!.setSize(size.width, size.height)
        super.setSize(width, height)
        section!.setSize(size.width, section!.height)
    }
    /**
     *
     */
    func onCloseButtonReleaseInside() {
        Swift.print("onCloseButtonReleaseInside")
        //Close window here
        //self.window?.close()//this closes the window
        NSApp.terminate(self)//quits the app
    }
    /**
     *
     */
    func onMinimizeButtonReleaseInside(){
        Swift.print("onMinimizeButtonReleaseInside")
        //minimize the window here
        
        //NSApp.miniaturizeAll(self)//minimizes all windows in the app
        self.window?.miniaturize(self)
    }
    /**
     * TODO: Add support for fullscreen mode aswell: window.setFrame(NSScreen.mainScreen()!.visibleFrame, display: true, animate: true)
     * TODO: add support for zooming back to normal size
     */
    func onMaximizeButtonReleaseInside(){
        Swift.print("onMaximizeButtonReleaseInside")
        //maximize the window here
        self.window?.zoom(self)
    }
    /**
     *
     */
    func onTestButtonDown(){
        Swift.print("onTestButtonDown")
    }
    /**
     *
     */
    override func onEvent(event: Event) {
        //Swift.print("CustomView.onEvent: " + "\(event)" + " event.origin: " + "\(event.origin)")
        if(event.origin === closeButton && event.type == ButtonEvent.upInside){onCloseButtonReleaseInside()}
        else if(event.origin === minimizeButton && event.type == ButtonEvent.upInside){onMinimizeButtonReleaseInside()}
        else if(event.origin === maximizeButton && event.type == ButtonEvent.upInside){onMaximizeButtonReleaseInside()}
        else if(event.origin === testButton && event.type == ButtonEvent.down){onTestButtonDown()}
        /*Event listeners:*/
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "onCloseButtonReleaseInside:", name: ButtonEvent.releaseInside, object: closeButton)
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "onMinimizeButtonReleaseInside:", name: ButtonEvent.releaseInside, object: minimizeButton)
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "onMaximizeButtonReleaseInside:", name: ButtonEvent.releaseInside, object: maximizeButton)
    }
}