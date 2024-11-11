// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

#if os(iOS)
public struct SwiftyCalendarView: View {
    // State for selected date
    @State private var selectedDate: Date = Date()
    @Binding var showFullScreen: Bool
    
    // Customizable colors
    public var backgroundColor: Color
    public var overlayColor: Color
    public var buttonTextColor: Color
    public var buttonBackgroundColor: Color
    public var datePickerColor: Color
    
    public init(
        showFullScreen: Binding<Bool>,
        backgroundColor: Color = .white,
        overlayColor: Color = Color.black.opacity(0.2),
        buttonTextColor: Color = .blue,
        buttonBackgroundColor: Color = .clear,
        datePickerColor: Color = .blue
    ) {
        self._showFullScreen = showFullScreen
        self.backgroundColor = backgroundColor
        self.overlayColor = overlayColor
        self.buttonTextColor = buttonTextColor
        self.buttonBackgroundColor = buttonBackgroundColor
        self.datePickerColor = datePickerColor
    }
    
    public var body: some View {
        ZStack {
            // Background overlay color
            overlayColor
                .onTapGesture {
                    showFullScreen = false // Dismiss on tap outside
                }
            
            VStack {
                DatePicker("Select Date", selection: $selectedDate, displayedComponents: [.date])
                    .padding(.horizontal)
                    .datePickerStyle(.graphical)
                    .accentColor(datePickerColor) // Customizable date picker accent color
                
                VStack {
                    HStack {
                        Button(action: {
                            showFullScreen = false
                        }) {
                            Text("Cancel")
                                .foregroundColor(buttonTextColor)
                                .padding()
                                .background(buttonBackgroundColor)
                                .cornerRadius(8)
                        }
                        .accessibilityLabel("Cancel date selection")
                        
                        Spacer()
                        
                        Button(action: {
                            showFullScreen = false
                        }) {
                            Text("Done")
                                .fontWeight(.bold)
                                .foregroundColor(buttonTextColor)
                                .padding()
                                .background(buttonBackgroundColor)
                                .cornerRadius(8)
                        }
                        .accessibilityLabel("Confirm selected date")
                    }
                }
                .padding(24)
                
            }
            .background(backgroundColor)
            .cornerRadius(12)
            .shadow(radius: 10)
            .padding(16)
        }
        .ignoresSafeArea()
        .transition(.opacity) // Smooth opacity transition
    }
}
#endif
