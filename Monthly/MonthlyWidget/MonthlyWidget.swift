//
//  MonthlyWidget.swift
//  MonthlyWidget
//
//  Created by Zach Uptin on 21/9/2022.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
	func getSnapshot(for configuration: ChangeFontIntent, in context: Context, completion: @escaping (DayEntry) -> Void) {
		let entry = DayEntry(date: Date())
		completion(entry)
	}
	
	func getTimeline(for: ChangeFontIntent, in: Context, completion: @escaping (Timeline<DayEntry>) -> Void) {
		var entries: [DayEntry] = []
		
		// Generate a timeline consisting of seven entries an day apart, starting from the current date.
		let currentDate = Date()
		for dayOffset in 0 ..< 7 {
			let entryDate = Calendar.current.date(byAdding: .day, value: dayOffset, to: currentDate)!
			let startOfDate = Calendar.current.startOfDay(for: entryDate)
			let entry = DayEntry(date: startOfDate)
			entries.append(entry)
		}
		
		let timeline = Timeline(entries: entries, policy: .atEnd)
		completion(timeline)
	}
	
    func placeholder(in context: Context) -> DayEntry {
        DayEntry(date: Date())
    }
}

struct DayEntry: TimelineEntry {
    let date: Date
    
}

struct MonthlyWidgetEntryView : View {
    var entry: DayEntry
    var config: MonthConfig
    
    init(entry: DayEntry) {
        self.entry = entry
        self.config = MonthConfig.determineConfig(from: entry.date)
    }
    
    var body: some View {
        ZStack {
            ContainerRelativeShape()
                .fill(config.backgroundColor.gradient)
            VStack {
                HStack(spacing: 4) {
                    Text(config.emojiText)
                        .font(.title)
                    Text(entry.date.weekdayDisplayFormat)
                        .font(.title3)
                        .fontWeight(.bold)
                        .minimumScaleFactor(0.6)
                        .foregroundColor(config.weekdayTextColor)
                    Spacer()
                }
                
                Text(entry.date.dayDisplayFormat)
                    .font(.system(size: 80, weight: .heavy))
                    .foregroundColor(config.dayTextColor)
            }
            .padding()
        }
    }
}

@main
struct MonthlyWidget: Widget {
    let kind: String = "MonthlyWidget"
    
    var body: some WidgetConfiguration {
        IntentConfiguration(kind: kind, intent: ChangeFontIntent.self, provider: Provider()) { entry in
            MonthlyWidgetEntryView(entry: entry)
        }
		.configurationDisplayName("Monthly Widget Style")
        .description("The theme of widget changes based on month.")
        .supportedFamilies([.systemSmall])
    }
}

struct MonthlyWidget_Previews: PreviewProvider {
    static var previews: some View {
        MonthlyWidgetEntryView(entry: DayEntry(date: dateToDisplay(month: 7, day: 23)))
            .previewContext(WidgetPreviewContext(family: .systemSmall))
    }
    
    static func dateToDisplay(month: Int, day: Int) -> Date {
        let components = DateComponents(calendar: Calendar.current,
                                        year: 2022,
                                        month: month,
                                        day: day)
        
        return Calendar.current.date(from: components)!
    }
}

extension Date {
    var weekdayDisplayFormat: String {
        self.formatted(.dateTime.weekday(.wide))
    }
    
    var dayDisplayFormat: String {
        self.formatted(.dateTime.day())
    }
}
