import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet weak var timeLabel: NSTextField!
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Start the timer to update time label every second
        startTimer()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    // MARK: - Timer
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
            self?.updateTimeLabel()
        }
        timer?.tolerance = 0.1
        RunLoop.main.add(timer!, forMode: .common)
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateTimeLabel() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let currentTime = Date()
        // timeLabelがnilでない場合のみ更新
        timeLabel?.stringValue = dateFormatter.string(from: currentTime)
    }

    
    // MARK: - Actions
    
    @IBAction func clockInButtonClicked(_ sender: NSButton) {
        // Implement clock in action
        print("Clock in")
    }
    
    @IBAction func clockOutButtonClicked(_ sender: NSButton) {
        // Implement clock out action
        print("Clock out")
    }
    
    @IBAction func goOutButtonClicked(_ sender: NSButton) {
        // Implement go out action
        print("Go out")
    }
}

