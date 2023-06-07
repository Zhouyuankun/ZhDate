# ZhDate

This is an swift package for convertion between Chinese calendar and Gregorian calendar. I found the Calendar(identifier: .chinese) is not work as expected when convert Chinese date to Gregorian date. So I make this package to enhance the usage of both calendar.
Here is the usage
```
let date = Date() //Jun 7, 2023 at 11:07
let zhd = ZhDate(lunarYear: 2023, lunarMonth: 12, lunarDay: 15, leapMonth: false) //农历2023年12月15日
print(zhd.toDate()) //2024-01-24 16:00:00 +0000
print(ZhDate.fromDate(date: date)) //农历2023年4月20日
print(zhd.chinese()) //二〇二三年腊月十五 癸卯兔年
print(zhd == ZhDate.fromDate(date: date)) //false
print(zhd - ZhDate.fromDate(date: date)) //232
print(zhd - date) //231
print(zhd - 100) //农历2023年9月3日
print(zhd + 100) //农历2024年3月26日
print(ZhDate.today()) //农历2023年4月20日
```
