#!/usr/bin/python3


import os
import sys
import subprocess


class Updater:
    def __init__(self):
        self.docs_local = "docs/"
        self.blog_local = f"{self.docs_local}blog/"
        self.posts_local = f"{self.blog_local}posts/"
        self.index_local = f"{self.blog_local}index.html"
        self.html_tab = " "*6
        self.html_tab2 = " "*8
        
        self.ls = list()
        self._html = ""
        self.html = ""

        return None
    
    def generatePosts(self):
        _ls = os.listdir(f"{os.environ['PWD']}/{self.posts_local}")
        for l in _ls:
            self.ls.append(l.split(".txt")[0])
        return 0

    def buildHtml(self):
        posts = ""
        i = len(self.ls)
        ii = 0
        for l in self.ls:
            posts = posts + f"<li><a href='posts/{str(l)}.txt'>{str(l).replace('_', ' ')}</a></li>"
            ii += 1
            if i != ii:
                posts = posts + "<br>"
                posts = posts + "\n" + self.html_tab2
        self.html = self._html.split("<li><a")[0] + f"  {posts}" + f"\n{self.html_tab}</ul>" + self._html.split("</ul>")[1]
        return 0

    def runme(self):
        self.generatePosts()

        try:
            with open(self.index_local, 'r') as rh:
                self._html = rh.read()
        except:
            sys.stderr.write(f"[x] Error reading from {self.index_local}\n") 

        self.buildHtml()

        try:
            with open(self.index_local, 'w') as wh:
                wh.write(self.html)
        except:
            sys.stderr.write(f"[x] Error writting to {self.index_local}\n") 
       
        sys.stdout.write("[*] Successfully updated posts\n")
        return 0


def main():
    updater = Updater()
    updater.runme()
    return 0

if __name__ == '__main__':
    sys.exit(main())
