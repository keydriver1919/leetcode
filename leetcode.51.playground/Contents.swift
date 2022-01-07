
//由下往上

class Solution {
    //皇后位置
    var cols: [Int] = []
    //正在發生的某一行的皇后所在的列
    //幾乘幾棋盤
    private var nQueue: Int = 0
    private var ways: Int = 0
    private var results: [[String]] = [[String]]()
    
    
    func solveNQueens(_ n: Int) -> [[String]] {
        //if n < 1 { return [] }
        nQueue = n
        cols = [Int](repeating: 0, count: nQueue)
        //跑到第幾行，從0開始
        placeQueue(row: 0)
        print("\(ways)种解法")
        return results
    }
    
    //皇后位置
    func placeQueue(row: Int) {
        //等於8時才開始跑
        if row == nQueue {
            //每重跑一次way+1
            ways += 1
            var result: [String] = [String]()
            for row in 0..<nQueue {
                var rowStr = ""
                for col in 0..<nQueue {
                    //第4行的皇后 == 第4列時（列與列的交會，代表一行只有一個皇后，有交會加入Ｑ，沒交會加入.）
                    if cols[row] == col {
                        rowStr.append("Q")
                    } else {
                        rowStr.append(".")
                    }
                }
                //加入小陣列[]
                result.append(rowStr)
            }//加入大陣列[[]]
            results.append(result)
            return//離開函數
        }
        //如果row 不到8時，跑這個
        for col in 0..<nQueue {
            //若都沒有違反條件（只留剪枝結果）
            if isValidate(row: row, col: col) {
                cols[row] = col //下好存放皇后的位置，下一行
                placeQueue(row: row + 1) // 行＋1回溯，跑下一行
            }
        }
    }
    
    //剪枝項目
    func isValidate(row: Int, col: Int) -> Bool {
        for i in 0..<row {
            if cols[i] == col { return false } //判斷當前行的列是否存儲有皇后，有存傳F
            if(row - i) == abs(Int(cols[i] - col)) { return false } // 對角線是否存儲有皇后對角線的斜率是1或者是-1因此用了系統的abs函數(絕對值)
        }
        return true
    }
}


var solution = Solution()
print(solution.solveNQueens(8))




