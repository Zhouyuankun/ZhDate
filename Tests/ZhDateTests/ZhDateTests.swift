import XCTest
@testable import ZhDate

final class ZhDateTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        //XCTAssertEqual(ZhDate().text, "Hello, World!")
        let date = Date() //Jun 7, 2023 at 11:07
        let zhd = NongDate(lunarYear: 2023, lunarMonth: 12, lunarDay: 15, leapMonth: false) //农历2023年12月15日
        print(zhd.toDate()) //2024-01-24 16:00:00 +0000
        print(NongDate.fromDate(date: date)) //农历2023年4月20日
        print(zhd.chinese()) //二〇二三年腊月十五 癸卯兔年
        print(zhd == NongDate.fromDate(date: date)) //false
        print(zhd - NongDate.fromDate(date: date)) //232
        print(zhd - date) //231
        print(zhd - 100) //农历2023年9月3日
        print(zhd + 100) //农历2024年3月26日
        print(NongDate.today()) //农历2023年4月20日
    }
}
