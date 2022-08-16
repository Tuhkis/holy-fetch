#include "time.h"
#include "stdlib.h"
#include "string.h"
#include "krn.h"
#include "logo.h"
#include "math.h"

U0 Main(){
								// Define colours
								char* BLUE = "\e[1;34m";
								char* NORM = "\e[0m";

								char* os = malloc(150);
							
								FILE* os_release=popen("lsb_release -ds", "r");
								fgets(os, 50, os_release);
								
								fclose(os_release);
								os[0] = ' ';
								os[strlen(os) - 2] = ' ';

								char* kern=GetKrn(); // That needs the () due to a problem with the compiler
								char* shell=getenv("SHELL");

								char *slash = strrchr(shell, '/');
								if(slash){
																shell = slash + 1;
								}

								F64 uptime = (((double)(GetUptime()))/60.0/60.0);
								char* term = getenv("TERM");
								char* wm = getenv("XDG_CURRENT_DESKTOP");

								I32 ascii_art=0;
								
								I32 isDistro = strcmp(os, " Arch Linux \n");
								if(isDistro==0){
																ascii_art=1;
								}

								// Print the info
								"%s ", logos[ascii_art][0]; "%sOS         :%s%s", BLUE, NORM, os;
								"%s ", logos[ascii_art][1]; "%sKERNEL     :%s %s\n", BLUE, NORM, kern;
								"%s ", logos[ascii_art][2]; "%sUPTIME     :%s %.2fh\n", BLUE, NORM, uptime;
								"%s ", logos[ascii_art][3]; "%sSHELL      :%s %s\n", BLUE, NORM, shell;
								"%s ", logos[ascii_art][4]; "%sTERMINAL   :%s %s\n", BLUE, NORM, term;
								"%s ", logos[ascii_art][5]; "%sDESKTOP    :%s %s\n", BLUE, NORM, wm;
}
Main;
