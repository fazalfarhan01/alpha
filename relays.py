"""
'relay4_out.py'
===================================
Example of turning on and off a LED
from the Adafruit IO Python Client

Author(s): Brent Rubell, Todd Treece
"""
# Import standard python modules
import time

# import Adafruit Blinka
import digitalio
import board

# import Adafruit IO REST client.
from Adafruit_IO import Client, Feed, RequestError

# Set to your Adafruit IO key.
# Remember, your key is a secret,
# so make sure not to publish it when you publish this code!
ADAFRUIT_IO_KEY = '34e4ad43c9ef4cb08402e2a8e44f6912'

# Set to your Adafruit IO username.
# (go to https://accounts.adafruit.com to find your username)
ADAFRUIT_IO_USERNAME = 'farhanf1'

# Create an instance of the REST client.
aio = Client(ADAFRUIT_IO_USERNAME, ADAFRUIT_IO_KEY)
try: # if we have a 'relay4' feed
    
    Arelay = aio.feeds('relay1')
    Brelay = aio.feeds('relay2')
    Crelay = aio.feeds('relay3')
    Drelay = aio.feeds('relay4')
    
except RequestError: # create a digital feed
    Afeed = Feed(name=relay1)
    Arelay = aio.create_feed(Afeed)
    Bfeed = Feed(name=relay2)
    Brelay = aio.create_feed(Bfeed)
    Cfeed = Feed(name=relay3)
    Crelay = aio.create_feed(Cfeed)
    Dfeed = Feed(name=relay4)
    Drelay = aio.create_feed(Dfeed)

# relay set up
ledA = digitalio.DigitalInOut(board.D19)
ledB = digitalio.DigitalInOut(board.D16)
ledC = digitalio.DigitalInOut(board.D26)
ledD = digitalio.DigitalInOut(board.D20)
ledA.direction = digitalio.Direction.OUTPUT
ledB.direction = digitalio.Direction.OUTPUT
ledC.direction = digitalio.Direction.OUTPUT
ledD.direction = digitalio.Direction.OUTPUT


while True:
    Adata = aio.receive(Arelay.key)
    Bdata = aio.receive(Brelay.key)
    Cdata = aio.receive(Crelay.key)
    Ddata = aio.receive(Drelay.key)

    if int(Adata.value) == 1:
        print('received 1 <- ON\n')
    elif int(Adata.value) == 0:
        print('received 1 <- OFF\n')
    if int(Bdata.value) == 1:
        print('received 2 <- ON\n')
    elif int(Bdata.value) == 0:
        print('received 2 <- OFF\n')
    if int(Cdata.value) == 1:
        print('received 3 <- ON\n')
    elif int(Cdata.value) == 0:
        print('received 3 <- OFF\n')
    if int(Ddata.value) == 1:
        print('received 4 <- ON\n')
    elif int(Ddata.value) == 0:
        print('received 4 <- OFF\n')

    # set the LED to the feed value
    ledA.value = not int(Adata.value)
    ledB.value = not int(Bdata.value)
    ledC.value = not int(Cdata.value)
    ledD.value = not int(Ddata.value)
    # timeout so we dont flood adafruit-io with requests
    time.sleep(0.4)
