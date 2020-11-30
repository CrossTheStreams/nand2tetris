// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

(START)
@SCREEN
D=A
@0
M=D  // Put screen start location at RAM0
@pixels
M=D  // Set pixels to RAM0

(PAINT)
@KBD
D=M      // D=KBD

@black
D;JGT    // If KBD > 0, goto black

@colors
M=0      // select white as color

@LOOP
0;JMP    // Jump to beginning of loop

(black)
@color
M=-1     // select black as color

@color
D=M      // color = black or white

@pixels
A=M      // get address of pixels to fill
M=D      // fill pixels

@pixels
M=M+1    // increment pixels
@pixels
D=M
@24576   // maximum screen memory address
D=D-A

@START
D;JEQ    // Jump to start if we're at 0

@PAINT
0;JMP    // Continue painting
