// CityXen
// Draw Smokerdore Screen Routine by Deadline
// Call in BASIC: 
//  SYS 51154
*=$c000
#import "../include/Constants.asm"
#import "../include/DrawPetMateScreen.asm"
#import "c64-smokerdore-screen.asm"
*=$c7d2
DrawPetMateScreen(screen_001)
rts
