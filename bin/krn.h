// I had to cheat using some C
// I wish I knew how to move this to HolyC,
// but the translator I'm using isn't perfect

#include "sys/utsname.h"
#include <errno.h>
#include <linux/unistd.h>
#include <linux/kernel.h>
#include <sys/sysinfo.h>

float GetUptime(){
								struct sysinfo s_info;
								int error = sysinfo(&s_info);
								if(error!=0){
																printf("code error = %d\n", error);
								}
								return s_info.uptime;
}

char* GetKrn(){
								static struct utsname kernelData;
								uname(&kernelData);
								return  kernelData.release;
}
