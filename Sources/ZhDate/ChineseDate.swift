import Foundation
/*
 从1900年，至2100年每年的农历春节的公历日期
 */
let CHINESENEWYEAR: [String] = [
    "19000131",
    "19010219", "19020208", "19030129", "19040216", "19050204",
    "19060125", "19070213", "19080202", "19090122", "19100210",
    "19110130", "19120218", "19130206", "19140126", "19150214",
    "19160203", "19170123", "19180211", "19190201", "19200220",
    "19210208", "19220128", "19230216", "19240205", "19250124",
    "19260213", "19270202", "19280123", "19290210", "19300130",
    "19310217", "19320206", "19330126", "19340214", "19350204",
    "19360124", "19370211", "19380131", "19390219", "19400208",
    "19410127", "19420215", "19430205", "19440125", "19450213",
    "19460202", "19470122", "19480210", "19490129", "19500217",
    "19510206", "19520127", "19530214", "19540203", "19550124",
    "19560212", "19570131", "19580218", "19590208", "19600128",
    "19610215", "19620205", "19630125", "19640213", "19650202",
    "19660121", "19670209", "19680130", "19690217", "19700206",
    "19710127", "19720215", "19730203", "19740123", "19750211",
    "19760131", "19770218", "19780207", "19790128", "19800216",
    "19810205", "19820125", "19830213", "19840202", "19850220",
    "19860209", "19870129", "19880217", "19890206", "19900127",
    "19910215", "19920204", "19930123", "19940210", "19950131",
    "19960219", "19970207", "19980128", "19990216", "20000205",
    "20010124", "20020212", "20030201", "20040122", "20050209",
    "20060129", "20070218", "20080207", "20090126", "20100214",
    "20110203", "20120123", "20130210", "20140131", "20150219",
    "20160208", "20170128", "20180216", "20190205", "20200125",
    "20210212", "20220201", "20230122", "20240210", "20250129",
    "20260217", "20270206", "20280126", "20290213", "20300203",
    "20310123", "20320211", "20330131", "20340219", "20350208",
    "20360128", "20370215", "20380204", "20390124", "20400212",
    "20410201", "20420122", "20430210", "20440130", "20450217",
    "20460206", "20470126", "20480214", "20490202", "20500123",
    "20510211", "20520201", "20530219", "20540208", "20550128",
    "20560215", "20570204", "20580124", "20590212", "20600202",
    "20610121", "20620209", "20630129", "20640217", "20650205",
    "20660126", "20670214", "20680203", "20690123", "20700211",
    "20710131", "20720219", "20730207", "20740127", "20750215",
    "20760205", "20770124", "20780212", "20790202", "20800122",
    "20810209", "20820129", "20830217", "20840206", "20850126",
    "20860214", "20870203", "20880124", "20890210", "20900130",
    "20910218", "20920207", "20930127", "20940215", "20950205",
    "20960125", "20970212", "20980201", "20990121", "21000209"
]
/*
 从1900年到2100年的农历月份数据代码 20位二进制代码表示一个年份的数据。

 前四位0:表示闰月为29天，1:表示闰月为30天
 中间12位：从左起表示1-12月每月的大小，1为30天，0为29天
 最后四位：表示闰月的月份，0表示当年无闰月

 前四位和最后四位应该结合使用，如果最后四位为0，则不考虑前四位
 例：
 1901年代码为 19168，转成二进制为 0b100101011100000, 最后四位为0，当年无闰月，月份数据为 010010101110 分别代表12月的大小情况
 1903年代码为 21717，转成二进制为 0b101010011010101，最后四位为5，当年为闰五
 */
let CHINESEYEARCODE: [Int] = [
    19416,
    19168,  42352,  21717,  53856,  55632,  91476,  22176,  39632,
    21970,  19168,  42422,  42192,  53840, 119381,  46400,  54944,
    44450,  38320,  84343,  18800,  42160,  46261,  27216,  27968,
    109396,  11104,  38256,  21234,  18800,  25958,  54432,  59984,
    92821,  23248,  11104, 100067,  37600, 116951,  51536,  54432,
    120998,  46416,  22176, 107956,   9680,  37584,  53938,  43344,
    46423,  27808,  46416,  86869,  19872,  42416,  83315,  21168,
    43432,  59728,  27296,  44710,  43856,  19296,  43748,  42352,
    21088,  62051,  55632,  23383,  22176,  38608,  19925,  19152,
    42192,  54484,  53840,  54616,  46400,  46752, 103846,  38320,
    18864,  43380,  42160,  45690,  27216,  27968,  44870,  43872,
    38256,  19189,  18800,  25776,  29859,  59984,  27480,  23232,
    43872,  38613,  37600,  51552,  55636,  54432,  55888,  30034,
    22176,  43959,   9680,  37584,  51893,  43344,  46240,  47780,
    44368,  21977,  19360,  42416,  86390,  21168,  43312,  31060,
    27296,  44368,  23378,  19296,  42726,  42208,  53856,  60005,
    54576,  23200,  30371,  38608,  19195,  19152,  42192, 118966,
    53840,  54560,  56645,  46496,  22224,  21938,  18864,  42359,
    42160,  43600, 111189,  27936,  44448,  84835,  37744,  18936,
    18800,  25776,  92326,  59984,  27296, 108228,  43744,  37600,
    53987,  51552,  54615,  54432,  55888,  23893,  22176,  42704,
    21972,  21200,  43448,  43344,  46240,  46758,  44368,  21920,
    43940,  42416,  21168,  45683,  26928,  29495,  27296,  44368,
    84821,  19296,  42352,  21732,  53600,  59752,  54560,  55968,
    92838,  22224,  19168,  43476,  41680,  53584,  62034,  54560
]

public class ChineseDate: CustomStringConvertible {
    //toString
    public var description: String {
        return "农历\(self.lunarYear)年\(self.leapMonth ? "闰" : "")\(self.lunarMonth)月\(self.lunarDay)日"
    }
    
    let lunarYear: Int
    let lunarMonth: Int
    let lunarDay: Int
    let leapMonth: Bool
    let yearCode: Int
    let newYear: Date
    
    init(lunarYear: Int, lunarMonth: Int, lunarDay: Int, leapMonth: Bool) {
        guard ChineseDate.validate(year: lunarYear, month: lunarMonth, day: lunarDay, leap: leapMonth) else {
            fatalError("The Chinese date given is not exist")
        }
        self.lunarYear = lunarYear
        self.lunarMonth = lunarMonth
        self.lunarDay = lunarDay
        self.leapMonth = leapMonth
        self.yearCode = CHINESEYEARCODE[lunarYear - 1900]
        self.newYear = ChineseDate.dateStringToDate(str: CHINESENEWYEAR[self.lunarYear - 1900])
    }
    
    //lunar to solar
    //
    func toDate() -> Date {
        var dateComponent = DateComponents()
        dateComponent.day = dayPassed()
        return Calendar.current.date(byAdding: dateComponent, to: self.newYear)!
    }
    
    static func fromDate(date: Date) -> ChineseDate {
        var lunarYear = Calendar.current.dateComponents([.year], from: date).year!
        //当时农历新年时的日期对象
        let newYearDate = ChineseDate.dateStringToDate(str: CHINESENEWYEAR[lunarYear - 1900])
        //如果还没有到农历正月初一 农历年份减去1
        lunarYear -= (newYearDate > date) ? 1 : 0
        //查询日期距离当年的春节差了多久
        let dayPassed = Calendar.current.dateComponents([.day], from: newYearDate, to: date).day!
        //被查询日期的年份码
        let yearCode = CHINESEYEARCODE[lunarYear - 1900]
        //取得本年的月份列表
        let monthDays = ChineseDate.decode(yearCode: yearCode)
        
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
        
        return ChineseDate(lunarYear: lunarYear, lunarMonth: lunarMonth, lunarDay: lunarDay, leapMonth: leapMonth)
    }
    
    //Days between current lunar day and lunar new year
    func dayPassed() -> Int {
        let monthDays = ChineseDate.decode(yearCode: self.yearCode)
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
    
    func chinese() -> String {
        let ZHNUMS = ["〇","一","二","三","四","五","六","七","八","九","十"]
        let SHENGXIAO = ["鼠","牛","虎","兔","龙","蛇","马","羊","猴","鸡","狗","猪"]
        var zhYear = ""
        var zhMonth = self.leapMonth ? "闰" : ""
        var zhDay = ""
        let zhTGDZ = ChineseDate.tgdz(num: self.lunarYear - 1900 + 36)
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
    
    static func today() -> ChineseDate {
        return ChineseDate.fromDate(date: Date())
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
        return ChineseDate.decode(yearCode: CHINESEYEARCODE[year - 1900])
    }
    
    static func dateStringToDate(str: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYYMMdd"
        return dateFormatter.date(from: str)!
    }
}

extension ChineseDate {
    static func == (left: ChineseDate, right: ChineseDate) -> Bool {
        return left.lunarYear == right.lunarYear && left.lunarMonth == right.lunarMonth && left.lunarDay == right.lunarDay && left.leapMonth == right.leapMonth
    }
    
    static func + (left: ChineseDate, right: Int) -> ChineseDate {
        return ChineseDate.fromDate(date: Calendar.current.date(byAdding: .day, value: right, to: left.toDate())!)
    }
    
    static func - (left: ChineseDate, right: Int) -> ChineseDate {
        return ChineseDate.fromDate(date: Calendar.current.date(byAdding: .day, value: -right, to: left.toDate())!)
    }
    
    static func - (left: ChineseDate, right: ChineseDate) -> Int {
        return Calendar.current.dateComponents([.day], from: right.toDate(), to: left.toDate()).day!
    }
    
    static func - (left: ChineseDate, right: Date) -> Int {
        return Calendar.current.dateComponents([.day], from: right, to: left.toDate()).day!
    }
}