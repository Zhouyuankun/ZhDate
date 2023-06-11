//
//  File.swift
//  
//
//  Created by 周源坤 on 2023/6/11.
//

import Foundation

public struct NongDate: CustomStringConvertible {
    //toString
    public var description: String {
        return "农历\(self.lunarYear)年\(self.leapMonth ? "闰" : "")\(self.lunarMonth)月\(self.lunarDay)日"
    }
    public let lunarYear: Int
    public let lunarMonth: Int
    public let lunarDay: Int
    public let leapMonth: Bool
    
    var yearCode: Int {
        CHINESEYEARCODE[lunarYear - 1900]
    }
    var newYear: Date {
        NongDate.dateStringToDate(str: CHINESENEWYEAR[self.lunarYear - 1900])
    }
    
    public init(lunarYear: Int, lunarMonth: Int, lunarDay: Int, leapMonth: Bool) {
        guard NongDate.validate(year: lunarYear, month: lunarMonth, day: lunarDay, leap: leapMonth) else {
            fatalError("The Chinese date given is not exist.")
        }
        self.lunarYear = lunarYear
        self.lunarMonth = lunarMonth
        self.lunarDay = lunarDay
        self.leapMonth = leapMonth
    }
    
    //lunar to solar
    //
    public func toDate() -> Date {
        var dateComponent = DateComponents()
        dateComponent.day = daysFromChunjie()
        return Calendar.current.date(byAdding: dateComponent, to: self.newYear)!
    }
    
    public static func fromDate(date: Date) -> NongDate {
        var lunarYear = Calendar.current.dateComponents([.year], from: date).year!
        //当时农历新年时的日期对象
        let newYearDate = NongDate.dateStringToDate(str: CHINESENEWYEAR[lunarYear - 1900])
        //如果还没有到农历正月初一 农历年份减去1
        lunarYear -= (newYearDate > date) ? 1 : 0
        //查询日期距离当年的春节差了多久
        let dayPassed = Calendar.current.dateComponents([.day], from: newYearDate, to: date).day!
        //被查询日期的年份码
        let yearCode = CHINESEYEARCODE[lunarYear - 1900]
        //取得本年的月份列表
        let monthDays = NongDate.decode(yearCode: yearCode)
        
        var accumulated = monthDays
        for i in 1..<accumulated.count {
            accumulated[i] += accumulated[i-1]
        }
        var month = 0
        var lunarDay = 0
        for (idx, days) in accumulated.enumerated() {
            if dayPassed + 1 <= days {
                month = idx + 1
                lunarDay = monthDays[idx] - (days - dayPassed) + 1
                break
            }
        }
        var leapMonth = false
        var lunarMonth = 0
        if (yearCode & 0xf) == 0 || month <= (yearCode & 0xf) {
            lunarMonth = month
        } else {
            lunarMonth = month - 1
        }
        
        if (yearCode & 0xf) != 0 && month == (yearCode & 0xf) + 1 {
            leapMonth = true
        }
        
        return NongDate(lunarYear: lunarYear, lunarMonth: lunarMonth, lunarDay: lunarDay, leapMonth: leapMonth)
    }
    
    //Days between current lunar day and lunar new year
    public func daysFromChunjie() -> Int {
        let monthDays = NongDate.decode(yearCode: self.yearCode)
        //当前农历年的闰月，为0表示无闰月
        let monthLeap = self.yearCode & 0xf
        //当年无闰月，或者有闰月但是当前月小于闰月
        var daysPassedMonth: Int = 0
        if monthLeap == 0 || self.lunarMonth < monthLeap {
            let arr = monthDays[0..<self.lunarMonth-1]
            daysPassedMonth = arr.reduce(0) {$0 + $1}
        }
        //当前不是闰月，并且当前月份和闰月相同
        else if !self.leapMonth && self.lunarMonth == monthLeap {
            let arr = monthDays[0..<self.lunarMonth-1]
            daysPassedMonth = arr.reduce(0) {$0 + $1}
        } else {
            let arr = monthDays[0..<self.lunarMonth]
            daysPassedMonth = arr.reduce(0) {$0 + $1}
        }
        return daysPassedMonth + self.lunarDay - 1
    }
    
    public func chinese() -> String {
        let ZHNUMS = ["〇","一","二","三","四","五","六","七","八","九","十"]
        let SHENGXIAO = ["鼠","牛","虎","兔","龙","蛇","马","羊","猴","鸡","狗","猪"]
        var zhYear = ""
        var zhMonth = self.leapMonth ? "闰" : ""
        var zhDay = ""
        let zhTGDZ = NongDate.tgdz(num: self.lunarYear - 1900 + 36)
        let zhSX = SHENGXIAO[(self.lunarYear - 1900) % 12]
        for i in 0..<4 {
            let str = String(self.lunarYear)
            zhYear += ZHNUMS[str[str.index(str.startIndex, offsetBy: i)].wholeNumberValue!]
        }
        if self.lunarMonth == 1 {
            zhMonth += "正"
        } else if self.lunarMonth == 12 {
            zhMonth += "腊"
        } else if self.lunarMonth <= 10 {
            zhMonth += ZHNUMS[self.lunarMonth]
        } else {
            zhMonth += "十\(ZHNUMS[self.lunarMonth - 10])"
        }
        
        if self.lunarDay <= 10 {
            zhDay = "初\(ZHNUMS[self.lunarDay])"
        } else if self.lunarDay < 20 {
            zhDay = "十\(ZHNUMS[self.lunarDay - 10])"
        } else if self.lunarDay == 20 {
            zhDay = "二十"
        } else if self.lunarDay < 30 {
            zhDay = "廿\(ZHNUMS[self.lunarDay - 20])"
        } else {
            zhDay = "三十"
        }
        
        return "\(zhYear)年\(zhMonth)月\(zhDay) \(zhTGDZ)\(zhSX)年"
    }
    
    public static func today() -> NongDate {
        return NongDate.fromDate(date: Date())
    }

    static func validate(year: Int, month: Int, day: Int, leap: Bool) -> Bool {
        guard year >= 1900 && year <= 2100 && month >= 1 && month <= 12 && day >= 1 && day <= 30 else {
            return false
        }
        let yearCode = CHINESEYEARCODE[year - 1900]
        if leap {
            if yearCode & 0xf != month { //年度闰月和校验闰月不一致的话，返回校验失败
                return false
            } else if day == 30 { //如果日期是30的话，直接返回年度代码首位是否为1，即闰月是否为大月
                return yearCode >> 16 == 1
            } else { //年度闰月和当前月份相同，日期不为30的情况，返回通过
                return true
            }
        } else if day <= 29 { //非闰月，并且日期小于等于29，返回通过
            return true
        } else { //非闰月日期为30，返回年度代码中的月份位是否为1，即是否为大月
            return ((yearCode >> (12 - month) + 4) & 1) == 1
        }
    }

    //decode year code return month list
    static func decode(yearCode: Int) -> [Int] {
        var monthDays: [Int] = []
    //    向右移动相应的位数
    //    1 这个数只有一位，与任何数进行 按位与 都只能获得其
    //    从后往前第一位，对！是获得这一位
        for i in 4..<16 {
            let onebit: Int = (yearCode >> i) & 1
            monthDays.insert(onebit == 1 ? 30 : 29, at: 0)
        }
        
    //    0xf 即 15 即二进制的 1111
    //    所以 1111 与任何数进行 按位与
    //    都将获得其最后四位，对！是获得这最后四位
    //    后四位非0则表示有闰月（多一月），则插入一次月份
    //    而首四位表示闰月的天数
        if yearCode & 0xf != 0{
            monthDays.insert((yearCode >> 16 != 0) ? 30 : 29, at: yearCode & 0xf)
        }
        return monthDays
    }
    
    //tian gan di zhi
    static func tgdz(num: Int) -> String {
        let tian = ["甲","乙","丙","丁","戊","己","庚","辛","壬","癸"]
        let di = ["子","丑","寅","卯","辰","巳","午","未","申","酉","戌","亥"]
        return tian[num % 10] + di[num % 12]
    }
    
    static func monthDays(year: Int) -> [Int] {
        return NongDate.decode(yearCode: CHINESEYEARCODE[year - 1900])
    }
    
    static func dateStringToDate(str: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMdd"
        return dateFormatter.date(from: str)!
    }
}

extension NongDate {
    public static func == (left: NongDate, right: NongDate) -> Bool {
        return left.lunarYear == right.lunarYear && left.lunarMonth == right.lunarMonth && left.lunarDay == right.lunarDay && left.leapMonth == right.leapMonth
    }
    
    public static func + (left: NongDate, right: Int) -> NongDate {
        return NongDate.fromDate(date: Calendar.current.date(byAdding: .day, value: right, to: left.toDate())!)
    }
    
    public static func - (left: NongDate, right: Int) -> NongDate {
        return NongDate.fromDate(date: Calendar.current.date(byAdding: .day, value: -right, to: left.toDate())!)
    }
    
    public static func - (left: NongDate, right: NongDate) -> Int {
        return Calendar.current.dateComponents([.day], from: right.toDate(), to: left.toDate()).day!
    }
    
    public static func - (left: NongDate, right: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: right, to: left.toDate()).day!
    }
}
