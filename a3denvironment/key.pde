//keyboard functions
void keyPressed(){
 if (key == 'w' || key == 'W') wkey = true;
   if (key == 'a' || key == 'A') dkey = true;
 if (key == 's' || key == 'S') skey = true;
 if (key == 'd' || key == 'D') akey = true;
 
}

void keyReleased(){
 if (key == 'w' || key == 'W') wkey = false;
   if (key == 'a' || key == 'A') dkey = false;
 if (key == 's' || key == 'S') skey = false;
 if (key == 'd' || key == 'D') akey = false;
 
}
