import json 
import random 

#This is a comment
fileName = "quotes.json"
with open(fileName,'r') as f:
    quoteList = json.load(f)
    f.close()

index = random.randint(0,len(quoteList))

quote = quoteList[index]

wrapAroundLim = 60

text = quote['text']
i = 0
textFin = "\""

while i<=len(text)-1:
    if(i+wrapAroundLim <len(text)):
        textFin += text[i:i+wrapAroundLim]    
        textFin += "\n"
    else:
        textFin += text[i:]
        break
    i+=wrapAroundLim

textFin += "\""
print(f"{textFin}")
print("\n")
try:
    if quote['author']:
        pad = wrapAroundLim - len(quote['author']) 
        padding = " "*pad
        print(f"-{quote['author']}") 
except:
    pass
