

import SwiftUI



struct ContentView: View {
    
    
    @State var answereText: String = " test "
    
    @State var selected : Bool = false
    
    
    var body: some View {
        
     
        // Stabel um übergänge in die Tiefe oder Höhe
        ZStack{
            
            // Bild vom Name background
            Image("background")
            (Color.black) // Farbe Schwarz
                .ignoresSafeArea() // soll SafeArea ignorieren
            
            //Vertikal Stapel
            
                
                
                
                Image("oracle")
                    .position(x:200,y: 260)
                
                Text(answereText)
                .font(selected ? .headline : .caption)
                .foregroundColor(selected ?  Color.green : Color.pink)
                    .position(x:80, y: -100)
                    .frame(width: 150, height:150)
                    .animation(.interpolatingSpring(mass:0.75,
                                                     stiffness: 400, damping: 8,
                                                            initialVelocity: 0))
                
                Image("button")
                    .resizable()
                    .frame(width: selected ? 200 : 120, height: selected ? 90 : 60)
                    .position(x:200, y: 500)
                    .onTapGesture{
                       
                            print("Button pressed")
                            selected.toggle()
                            
                            answereText = oracleAnwere()
                        }
                    
                  
                    .animation(.interpolatingSpring(mass:0.75,
                        stiffness: 400, damping: 8,
                               initialVelocity: 4))
        }
    }
}
    
    
    
    
    
    
    
    
    
//Vorschau

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



func oracleAnwere()-> String{
    
    var positiv = ["Daraus kannst du dich verlassen!", "Aus jedenfall Sportsfreund!", "Logisch! Denn de Sterne stehn' auf deiner Seite", "Ist der Papst katolisch?", "Kackt der Bär im Wald?"]

    var neutral = ["Es ist so wie du dich fühlst", "Sieh es wie Wasser", "some say so, some say so"]

    var negativ = ["nein!", "Nicht im Geringsten", "Auf keinen Fall", "Da kann ja jerder kommen!", "Nie und Nimmer"]


    enum Oracle : CaseIterable{
        case positiv, neutral, negativ
    }

    var answere : Oracle = Oracle.allCases.randomElement()!

    switch answere{
        
    case.positiv : return(positiv.randomElement()!)
    case.negativ : return(negativ.randomElement()!)
    case.neutral : return(neutral.randomElement()!)
        
    }


    
}
