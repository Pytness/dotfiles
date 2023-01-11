import os
import sys

# Clear the screen replacing the current contents with a blank screen,
# and move the cursor to the upper left corner of the screen.
# using the terminal escape sequences.
def clear():
    for x in range(32):
        sys.stdout.write("\x1b[2J\x1b[1;1H")
        sys.stdout.flush()
        os.system("sleep 0.02")


