//
//  MBTIView.swift
//  TransitionPractice
//
//  Created by hwanghye on 9/3/24.
//

import SwiftUI

struct MBTIView: View {
    
    @State var nickname: String = ""
    @State private var isSheetPresented = false
    
    var body: some View {
        Image(.profile6)
            .resizable()
            .frame(width: 80, height: 80)
            .background(.blue)
            .clipShape(Circle())
            .border(Color.black, width: 3)
            .padding(.top, 60)
        TextField("닉네임을 입력해주세요 :D",text: $nickname)
            .padding()
            .border(Color.black)
            .padding()
        HStack {
            Text("MBTI")
                .bold()
                .frame(height: 120)
                .background(.red)
            
            
            Spacer()
            MBTIButtonSelector()
        }
        .padding(.horizontal)
        Spacer()
        Button(action: {
            isSheetPresented = true
        }, label: {
            Text("완료")
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(100)
        })
        .padding(.horizontal)
        .sheet(isPresented: $isSheetPresented, content: {
            TransitionView()
        })
    }
}


struct MBTIButtonSelector: View {
    @State private var selectedTypes: Set<String> = []
    
    let firstRow = ["E", "S", "T", "J"]
    let secondRow = ["I", "N", "F", "P"]
    
    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 10) {
                ForEach(firstRow, id: \.self) { type in
                    MBTIButton(type: type, isSelected: selectedTypes.contains(type)) {
                        toggleSelection(type)
                    }
                }
            }
            HStack(spacing: 10) {
                ForEach(secondRow, id: \.self) { type in
                    MBTIButton(type: type, isSelected: selectedTypes.contains(type)) {
                        toggleSelection(type)
                    }
                }
            }
        }
        
    }
    private func toggleSelection(_ type: String) {
        if selectedTypes.contains(type) {
            selectedTypes.remove(type)
        } else {
            selectedTypes.insert(type)
        }
    }
    
    struct MBTIButton: View {
        let type: String
        let isSelected: Bool
        let action: () -> Void
        
        var body: some View {
            Button(action: action) {
                Text(type)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(width: 60, height: 60)
                    .foregroundColor(isSelected ? .white : .blue)
                    .background(
                        Circle()
                            .fill(isSelected ? Color.blue : Color.white)
                            .overlay(
                                Circle()
                                    .stroke(Color.blue, lineWidth: isSelected ? 0 : 1)
                            )
                    )
            }
        }
    }
}

struct TransitionView: View {
    var body: some View {
        Text("가입되었습니다")
    }
}

#Preview {
    MBTIView()
}
