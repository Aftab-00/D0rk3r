#!/usr/bin/env/python3

############################
##                        ##
## Telegram _ SpoiledPrince ##
## Github  _ /Spoiled-Ops##
##                        ##
############################

from __future__ import print_function
try:
    from googlesearch import search

except ImportError:
    print("")

import sys
import time
import os
if sys.version[0] in "2":
    print ("\n[x] ....Sorry Dude.... This Tool only supports  Python 3.x\n")
    print ("\n\n\tHacking Is A Passion \033[1;91mI Happy Hacking \033[0m😃\n\n")
    exit()


class colors:
    CRED2 = "\33[91m"
    CBLUE2 = "\33[94m"
    ENDC = "\033[0m"
os.system('clear')
banner = ("""

    -----------  ------------ ----            ------    ------------ --------  ---    ---  ------------     
***********  ************ ****           ********   ************ ********  ***    ***  ************     
----    ---  ----         ----          ----------  ------------   ----    ---    ---  ----             
*********    ************ ****         ****    ****     ****       ****    ***    ***  ************     
---------    ------------ ----         ------------     ----       ----    ---    ---  ------------     
****  ****   ****         ************ ************     ****       ****     ********   ****             
----   ----  ------------ ------------ ----    ----     ----     --------    ------    ------------     
****    **** ************ ************ ****    ****     ****     ********     ****     ************     
-                   

                                                                                    
------------ ------------    ------    -----------  ------------ ----    ---- ------------ -----------  
************ ************   ********   ***********  ************ ****    **** ************ ***********  
----         ----          ----------  ----    ---  ---          ----    ---- ----         ----    ---  
************ ************ ****    **** *********    ***          ************ ************ *********    
------------ ------------ ------------ ---------    ---          ------------ ------------ ---------    
       ***** ****         ************ ****  ****   ***          ****    **** ****         ****  ****   
------------ ------------ ----    ---- ----   ----  ------------ ----    ---- ------------ ----   ----  
************ ************ ****    **** ****    **** ************ ****    **** ************ ****    **** 
                                                                                                                                                                                                                                                               """)                                                                                                                                                                                                                                          
############################
##                        ##
## Telegram _ SpoiledPrince ##
## Github  _ /Spoiled-Ops##
##                        ##
############################

for col in banner:
    print(colors.CRED2 + col, end="")
    sys.stdout.flush()
    time.sleep(0.0025)
x = ("""\n
                Creators :  SpoiledPrince & Hacker_RK \n
                Github  :  https://github.com/Spoiled-Ops \n
                Telegram : https://t.me/SpoiledPrince \n""")
for col in x:
    print(colors.CBLUE2 + col, end="")
    sys.stdout.flush()
    time.sleep(0.0040)

y = "\n\t\t Lets Get started..... \n"
for col in y:
    print(colors.CRED2 + col, end="")
    sys.stdout.flush()
    time.sleep(0.0040)

z = "\n"
for col in z:
    print(colors.ENDC + col, end="")
    sys.stdout.flush()
    time.sleep(0.4)


try:
    data = input("\n •∆•  Would You Like To Save The Output In A File? (y/n) ").strip()
    l0g = ("")

except KeyboardInterrupt:
        print ("\n")
        print ("\033[1;91m[!] User Interruption Detected..!\033[0")
        time.sleep(0.5)
        print ("\n\n\t\033[1;91m \t[!] Sorry Dude, You Manually Ended it.....\n\n\t\t****Try Someother time later**** \033[0m😃\n\n")
        time.sleep(0.5)
        sys.exit(1)


def logger(data):
    file = open((l0g) + ".txt", "a")
    file.write(str(data))
    file.write("\n")
    file.close()


if data.startswith("y" or "Y"):
    l0g = input("[✓] Now Give it a Name : ")
    print ("\n" + "  " + "»" * 78 + "\n")
    logger(data)
else:
    print ("[!] Saving is Skipped...")
    print ("\n" + "  " + "»" * 78 + "\n")


def k3yword():
    try:
        w0rd = input("\n[∆] Enter The Keyword(s) for top relative search results: ")
        amount = input("[^|•×•|^] Enter The Number Of Websites To Display: ")
        print ("\n ")

        requ = 0
        counter = 0

        for results in search(w0rd, tld="com", lang="en", num=int(amount), start=0, stop=None, pause=2):
            counter = counter + 1
            print ("[+]", counter, results)
            time.sleep(0.1)
            requ += 1
            if requ >= int(amount):
                break

            data = (counter, results)

            logger(data)
            time.sleep(0.1)

    except KeyboardInterrupt:
            print ("\n")
            print ("\033[1;91m[!] User Interruption Detected..!\033[0")
            time.sleep(0.5)
            print ("\n\n\t\033[1;91m \t[!] Sorry Dude, You Manually Ended it.....\n\n\t\t****Try Someother time later**** \033[0m😃\n\n")          
            time.sleep(0.5)
            sys.exit(1)

    print ("\n\n [✓] Results Sucessfully Listed....\n\n Quitting....")
    print ("\t\t \n\t\t ........HAPPY HACKING.......\033[0m\n\n")
    sys.exit()
    #__main__#
if __name__ == "__main__":
    k3yword()
    
    
############################
##                        ##
## Telegram _ SpoiledPrince ##
## Github  _ /Spoiled-Ops##
##                        ##
############################