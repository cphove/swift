class ShowMeBug {
    
    func solution(_ a: Int, _ b: Int) -> Int {        
        return a + b
    }

    func search(_ nums: [Int], _ target: Int) -> Int {
        for (index, num) in nums.enumerated() {
            if num == target {
                return index
            }
        }
        return -1;
    }

    func find(_ strs: [String], _ target: String) -> Bool {
        for str in strs {
            if str == target {
                return true
            }
        }
        return false
    }

    func substring(_ origin: String, _ start: Int, _ len: Int) -> String {
        let startIndex = origin.index(origin.startIndex, offsetBy: start - 1)
        let endIndex = origin.index(origin.startIndex, offsetBy: start + len - 1)
        return String(origin[startIndex..<endIndex])
    }

    func add(_ a: Double, _ b: Double) -> Double {
        return a + b
    }
    
    func sub(_ a: Float, _ b: Float) -> Float {
        return a - b
    }

    func createArray(_ initNum: Int, _ n: Int) -> [Int] {
        var nums: [Int] = []
        var num = initNum;
        for _ in 0..<n {
            nums.append(num)
            num += 1
        }
        return nums
    }

    func createTwoDArray(_ row: Int, _ col: Int, _ base: Int) -> [[Int]] {
        var i = 0, j = 0
        var arr: [[Int]] = []
        var num = base
        while i < row {
            var element: [Int] = []
            while j < col {
                element.append(num % 10)
                num += 1
                j += 1
            }
            arr.append(element)
            i += 1
            j = 0
        }
        return arr
    }

    func onlyElementEqual(_ a: Int) -> [Int] {
        var nums: [Int] = []
        var i = 0;
        while i < a {
            nums.append(a - i)
            i += 1
        }
        return nums
    }
}
