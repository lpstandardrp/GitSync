import Cocoa
@testable import Utils
@testable import Element
@testable import GitSyncMac
/**
 * This is the main class for the application
 * Not one error in a million keystrokes
 */
@NSApplicationMain
class AppDelegate:NSObject, NSApplicationDelegate {
    weak var window:NSWindow!
    var win:NSWindow?/*<--The window must be a class variable, local variables doesn't work*/
    var menu:Menu?
    
    func applicationDidFinishLaunching(_ aNotification:Notification) {
        Swift.print("GitSync - Automates git")//Simple git automation for macOS, The autonomouse git client,The future is automated
        NSApp.windows[0].close()/*<--Close the initial non-optional default window*/
        
        //test()
        initApp()
        //initTestWin()//🚧👷
        //initMinimalWin()
        //hitTesting()
        
        
        //let a:String = "<item title=\"New folder\" isOpen=\"false\" hasChildren=\"true\"></item>"
        //treeList.node.addAt(newIdx(idx), a.xml)//"<item title=\"New folder\"/>"
        //let tree = TreeConverter.tree(a.xml)
        
        menu = Menu()/*This creates the App menu*/
    }
    /**
     *
     */
    func hitTesting(){
        window.contentView = InteractiveView2()
        StyleManager.addStyle("Button{fill:blue;}")

        let btn = Button(50,50)
        let container = window.contentView!.addSubView(Container(0,0,nil))
         
         container.addSubview(btn)
         /*container.layer?.position.x = 100
         container.layer?.position.y = 100*/
         container.layer?.position = CGPoint(40,20)
         //container.frame.origin = CGPoint(100,100)
         Swift.print("container.layer?.position: " + "\(container.layer?.position)")
         Swift.print("container.frame.origin: " + "\(container.frame.origin)")
         
         btn.layer?.position = CGPoint(40,20)
         //btn.frame
         Swift.print("btn.layer?.position: " + "\(btn.layer?.position)")
         Swift.print("btn.frame.origin: " + "\(btn.frame.origin)")
         btn.event = { event in
            if(event.type == ButtonEvent.upInside){Swift.print("hello world")}
         }
    }
    func initApp(){
         StyleManager.addStylesByURL("~/Desktop/ElCapitan/gitsync.css",false)//<--toggle this bool for live refresh
         win = MainWin(MainView.w,MainView.h)
         //win = VibrantMainWin(MainView.w,MainView.h)
         //win = ConflictDialogWin(380,400)
         //win = CommitDialogWin(400,356)
         //StyleWatcher.watch("~/Desktop/ElCapitan/","~/Desktop/ElCapitan/gitsync.css", self.win!.contentView!)
    }
    func initTestWin(){
        //StyleManager.addStylesByURL("~/Desktop/ElCapitan/explorer.css",false)
        StyleManager.addStylesByURL("~/Desktop/ElCapitan/test.css",false)
        win = TestWin(500,400)/*Debugging Different List components*/
        
        /*fileWatcher = */
        //StyleWatcher.watch("~/Desktop/ElCapitan/","~/Desktop/ElCapitan/gitsync.css", self.win!.contentView!)
    }
    func initMinimalWin(){
        StyleManager.addStylesByURL("~/Desktop/ElCapitan/minimal.css",true)
        //Swift.print("StyleManager.styles.count: " + "\(StyleManager.styles.count)")
        //Swift.print("StyleManager.styles: " + "\(StyleManager.styles)")
        win = MinimalWin(500,400)
    }
    func applicationWillTerminate(_ aNotification:Notification) {
        /*Stores the app prefs*/
        if(PrefsView.keychainUserName != nil){//make sure the data has been read and written to first
            _ = FileModifier.write("~/Desktop/gitsyncprefs.xml".tildePath, PrefsView.xml.xmlString)
            Swift.print("💾 Write PrefsView to: prefs.xml")
        }
        Swift.print("💾 Write RepoList to: repo.xml")
        _ = FileModifier.write(RepoView.repoListFilePath.tildePath, RepoView.treeDP.tree.xml.xmlString)/*store the repo xml*/
        print("Good-bye")
    }
}
/**
 * //TODO: support tray menu
 * //TODO: create the Menu class and Customize the about menu, and remove the others, then add the missing items
 */
class Menu {
    init(){
        while(NSApp.mainMenu!.items.count > 1){
            NSApp.mainMenu!.removeItem(at: NSApp.mainMenu!.items.count-1)
        }
        /*NSApp.mainMenu!.addMenuItem(FileMenu())
         NSApp.mainMenu!.addMenuItem(EditMenu())
         NSApp.mainMenu!.addMenuItem(ViewMenu())
         NSApp.mainMenu!.addMenuItem(ToolsMenu())
         NSApp.mainMenu!.addMenuItem(WindowMenu())*/
        let customAboutMenu = CustomAboutMenu()
        _ = customAboutMenu
    }
}
class CustomAboutMenu {
    static let about:String = "About"
    static let preferences:String = "Preferences…"
    static let appName:String = "GitSync"
    private var preferencesMenuItem:NSMenuItem?
    init(){
        let appMenuItem = NSApp.mainMenu!.item(at: 0)//ref to App.menu
        _ = appMenuItem
        /*
         Swift.print("appMenuItem?.submenu?.itemAtIndex(0): " + "\(appMenuItem?.submenu?.itemAtIndex(0))")
         Swift.print("appMenuItem?.submenu?.itemAtIndex(2): " + "\(appMenuItem?.submenu?.itemAtIndex(2))")
         Swift.print("appMenuItem?.submenu?.itemAtIndex(2).title: " + "\(appMenuItem?.submenu?.itemAtIndex(2)!.title)")
         */
        //appMenuItem?.submenu?.removeItemAtIndex(0)//remove the old aboutMenuItem
        //let aboutMenuItem = appMenuItem?.submenu?.addMenuItem(NSMenuItem())
        //aboutMenuItem?.title = "About"
        
        /*let prefsMenuItem = appMenuItem?.submenu?.addMenuItem(NSMenuItem())
         prefsMenuItem?.title = "Prefs"*/
        //Swift.print("appMenuItem?.submenu?.itemWithTitle(CustomAboutMenu.preferences): " + "\(appMenuItem?.submenu?.itemWithTitle(CustomAboutMenu.preferences))")
        
        if(appMenuItem?.submenu?.item(withTitle: CustomAboutMenu.preferences) != nil){
            //Swift.print("prefs menu created")
            preferencesMenuItem = appMenuItem!.submenu!.item(withTitle: CustomAboutMenu.preferences)
            let index:Int = appMenuItem!.submenu!.index(of: preferencesMenuItem!)
            appMenuItem!.submenu!.removeItem(preferencesMenuItem!)
            preferencesMenuItem = PreferencesMenuItem()
            appMenuItem!.submenu!.insertItem(preferencesMenuItem!, at: index)
        }
    }
}
class PreferencesMenuItem:CustomMenuItem{
    init() {
        super.init(CustomAboutMenu.preferences, ",")
    }
    override func onSelect(event : AnyObject) {
        Swift.print("PreferencesMenuItem.onSelect")
        //Proxy.windows.append(WinUtils.buildWin(PreferencesWin.self))/*open the prefs window*/
    }
    /**
     * Return true if you want to enable the menu item, false will disable it
     */
    override func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
        //add assertion logic here
        return true
    }
    required init(coder decoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
class CustomMenuItem:NSMenuItem{
    init(_ title:String = "", _ keyEquivalent:String = "") {
        super.init(title: title, action: ObjectiveC.Selector(("onSelect:")), keyEquivalent: keyEquivalent)
        target = self/*target specifies where the selector should work, in this case in this class scope*/
        //self.enabled = true
    }
    func onSelect(event : AnyObject) {
        //override in subclass (optional)
    }
    /**
     * Return true if you want to enable the menu item, false will disable it
     * NOTE: add assertion logic here
     */
    override func validateMenuItem(_ menuItem: NSMenuItem) -> Bool {
        //override in subclass (optional)
        return true
    }
    required init(coder decoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
class ViewMenu:CustomMenuItem {
    init(){
        super.init("View", "")
        submenu = NSMenu(title: "View")
        //submenu!.addMenuItem(ShowRulerMenuItem())
        _ = submenu!.addMenuItem(ShowGridMenuItem())
        //submenu!.addMenuItem(CustomMenuItem("Fullscreen",""))
    }
    override func onSelect(event sender: AnyObject){
        Swift.print("ViewMenu.onSelect() " + "\(sender)")
    }
}
class ShowGridMenuItem:CustomMenuItem{
    static var isSideMenuHidden:Bool = false
    init() {super.init("Show grid", "g")}
    override func onSelect(event : AnyObject) {
        Swift.print("ShowGridMenuItem.onSelect()")
        //Proxy.page!.gridLayer!.hidden = !Proxy.page!.gridLayer!.hidden
    }
    /**
     * Return true if you want to enable the menu item, false will disable it
     */
    override func validateMenuItem(menuItem: NSMenuItem) -> Bool {
        if(DocWinAsserter.hasActiveDocWin()){
            self.title = ShowGridMenuItem.isSideMenuHidden ? "Show grid" : "Hide grid"
            return true
        }else{
            return false
        }
    }
    //required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}
/*class ShowRulerMenuItem:CustomMenuItem{
 init() {super.init("Show rulers", "r")}
 override func onSelect(event : AnyObject) {
 Swift.print("ShowRulerMenuItem()")
 Proxy.activeDocView!.rulerLayer!.hidden = !Proxy.activeDocView!.rulerLayer!.hidden
 }
 /**
 * Return true if you want to enable the menu item, false will disable it
 */
 override func validateMenuItem(menuItem: NSMenuItem) -> Bool {
 if(DocWinAsserter.hasActiveDocWin()){
 self.title = Proxy.page!.gridLayer!.hidden ? "Show rulers" : "Hide rulers"
 return true
 }else{return false}
 }
 required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
 }*/
