//
//  ListView.swift
//  ToDoDiplom
//
//  Created by Student on 29.04.2022.
//

import SwiftUI
import UserNotifications
struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        VStack {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear) {
                            listViewModel.updateItem(item: item)
                        }
                    }
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("CheckList 📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("➕", destination: AddView())
            )
        
       Spacer()
            HStack {
                Spacer()
            Button("Send Notification") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
                
                let content = UNMutableNotificationContent()
                content.title = "Важно"
                if listViewModel.items[0] != nil {
                    if listViewModel.items[0].isCompleted != true {
                content.subtitle = "\(listViewModel.items[0].title) задача не выполнена"
                    }
                } else {
                    content.subtitle = "У вас нет задач"
                }
                content.sound = UNNotificationSound.default

                // show this notification five seconds from now
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)

                // choose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                // add our notification request
                UNUserNotificationCenter.current().add(request)
                    }
                Spacer()
                Button("Disable Notification") {
                    UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
                }
                Spacer()
            }
    }
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}
