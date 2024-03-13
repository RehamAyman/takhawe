//
//  progressBar.swift
//  Takhawi
//
//  Created by Reham Ayman on 13/01/2024.
//

import SwiftUI

struct CircularProgressView: View {
  let progress: CGFloat

  var body: some View {
    ZStack {
      // Background for the progress bar
      Circle()
        .stroke(lineWidth: 4)
        .opacity(0.1)
        .foregroundColor(Color("secFavSeg"))

      // Foreground or the actual progress bar
      Circle()
        .trim(from: 0.0, to: min(progress, 1.0))
        .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
        .foregroundColor(Color("secFavSeg"))
        .rotationEffect(Angle(degrees: 270.0))
        .animation(.linear, value: progress)
    }
  }
}

