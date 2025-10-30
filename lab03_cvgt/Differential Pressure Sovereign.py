# -------------------------------------------------
# Differential Pressure Waveform GUI (Python 3)
# -------------------------------------------------
# Reads a differential pressure sensor over I2C,
# plots a real-time waveform, and shows the last
# 25 pressure readings in a terminal-like list
# on the LEFT of the plot.
# -------------------------------------------------

import tkinter as tk
from tkinter import Spinbox, IntVar, DoubleVar, Frame, Label, Button, Listbox
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import numpy as np
import pylab
import time
import smbus

# -------------------------------
# I2C setup (communication with sensor)
# -------------------------------
DEV_ADDR = 0x28        # I2C device address for pressure sensor
time.sleep(0.1)
i2c = smbus.SMBus(1)   # Raspberry Pi uses I2C bus 1

# -------------------------------
# Globals
# -------------------------------
index = 1
next_ = 0
values = [0.0 for _ in range(101)]   # ~100-sample rolling buffer for plot
valueSave = []                       # all readings for CSV export
valueSave2 = []                      # optional raw/debug store
last_readings = []                   # last 25 readings for the list

# Helper for ms sleep
msleep = lambda x: time.sleep(x / 1000.0)

# -------------------------------
# Sensor read
# -------------------------------
def readValues():
    global values, valueSave, valueSave2, next_, last_readings

    # Read 3 bytes from sensor
    msb = i2c.read_i2c_block_data(DEV_ADDR, 0, 3)
    byte0 = str(np.binary_repr(msb[0], width=8))
    byte1 = str(np.binary_repr(msb[1], width=8))
    msleep(0.1)  # <-- original timing (~10 Hz overall with after(0))

    # Wait until status clears (first bit of byte0 must be 0)
    while byte0[0] == "1":
        msb = i2c.read_i2c_block_data(DEV_ADDR, 1)  # keep original call style
        byte0 = str(np.binary_repr(msb[0], width=8))
        byte1 = str(np.binary_repr(msb[1], width=8))
        msleep(0.1)

    # Convert raw output (datasheet formula)
    Out = int(byte0[2:] + byte1, 2)
    bits = 2**14
    OutMin = 0.10 * bits
    OutMax = 0.90 * bits
    PressMax = 5.0
    PressMin = -5.0

    pressure = ((Out - OutMin) * (PressMax - PressMin)) / (OutMax - OutMin) + PressMin
    kpa = pressure * 6.89476  # psi -> kPa

    print("Pressure = {:.6f} kPa".format(kpa))

    # Update rolling plot buffer
    values[next_] = kpa
    if next_ >= len(values) - 1:
        values.pop(0)
        values.append(kpa)
    else:
        next_ += 1

    # Save for CSV / debug
    valueSave.append(kpa)
    valueSave2.append(float(msb[1]))

    # Update last 25 readings (terminal-like: newest at bottom)
    last_readings.append(kpa)
    if len(last_readings) > 25:
        last_readings.pop(0)

    pressure_listbox.delete(0, tk.END)
    for v in last_readings:                      # oldest at top
        pressure_listbox.insert(tk.END, f"{v:.3f} kPa")
    pressure_listbox.see(tk.END)                 # keep bottom in view

    # Requeue immediately (original behavior; rate set by sleeps above)
    root.after(0, readValues)

# -------------------------------
# Plot update
# -------------------------------
def plotValues():
    global values
    NumberSamples = 100  # unchanged

    CurrentXAxis = pylab.arange(len(values) - NumberSamples, len(values), 1)
    CurrentYAxis = pylab.array(values[-NumberSamples:])
    line1[0].set_data(CurrentXAxis, CurrentYAxis)

    # Dynamic symmetric autoscale (unchanged)
    ylimit = np.max(np.abs(CurrentYAxis))
    ylimit = 1.5 * max(ylimit, 1)
    ax.axis([CurrentXAxis.min(), CurrentXAxis.max(), -ylimit, ylimit])

    canvas.draw()
    root.after(10, plotValues)  # unchanged

# -------------------------------
# Save recent data to CSV
# -------------------------------
def autoSavefile():
    global valueSave, index
    autoNum = '{:03d}'.format(index)
    valueSaveSubset = valueSave[-varNumPts.get():]  # last N points

    file_path = f"pressure_{varTmp.get()}_Celsius.csv"
    try:
        with open(file_path, "w") as writefile:
            writefile.write("Datum,Pressure(kPa)\n")
            for i, value in enumerate(valueSaveSubset):
                writefile.write(f"{i+1},{value:.3f}\n")
        print(f"Saved data to {file_path}")
        index += 1
    except Exception as e:
        print(f"Error saving file: {e}")

def _quit():
    root.quit()
    root.destroy()

# -------------------------------
# GUI setup
# -------------------------------
root = tk.Tk()
root.title("Differential Pressure Waveform")
root.configure(background='linen')

# Window: top-center with a small offset so the title bar is visible/movable
win_w, win_h = 950, 540
screen_w = root.winfo_screenwidth()
x = int((screen_w / 2) - (win_w / 2))
y = 40  # leave room for title bar
root.geometry(f"{win_w}x{win_h}+{x}+{y}")

root.grid_rowconfigure(1, weight=1)
root.grid_columnconfigure(0, weight=1)

# LEFT panel: list + plot (list stays on the LEFT of the plot)
panelLeft = Frame(root)
panelLeft.pack(ipadx=5, ipady=5, side='left')

# Bottom controls panel (unchanged layout choice from your original)
panelRight = Frame(root)
panelRight.pack(padx=10, pady=10, side='bottom')

instrument = Frame(panelRight, relief='groove', width=160, height=540, padx=10, pady=10)
instrument.pack()

statusTxt = Label(instrument, text='Click to save data')
statusTxt.grid(row=0, columnspan=2, rowspan=2)

varNumPts = IntVar()
varNumPts.set(25)
NumPts = Spinbox(instrument, width=6, from_=0, to=100, increment=1,
                 textvariable=varNumPts, justify='left')
NumPts.grid(row=2, column=0)

varTmp = DoubleVar()
varTmp.set(20)
Tmp = Spinbox(instrument, width=6, from_=0, to=100, increment=1,
                 textvariable=varTmp, justify='left')
Tmp.grid(row=3, column=0)

NumPtsLabel = Label(instrument, text='# samples/pt', height=2)
NumPtsLabel.grid(row=2, column=1, sticky='w')

TmpLabel = Label(instrument, text='# temperature', height=2)
TmpLabel.grid(row=3, column=1, sticky='w')

buttonSave = Button(instrument, text='Save Data', command=autoSavefile)
buttonSave.grid(row=4, column=0)

buttonQuit = Button(instrument, text='Quit', command=_quit)
buttonQuit.grid(row=4, column=1)

# -------- LEFT column contents: LIST (left) + PLOT (right) --------
pressure_listbox = Listbox(panelLeft, height=25, width=20, font=("Courier", 10))
pressure_listbox.pack(side='left', padx=5, pady=5)

# Plot setup (unchanged)
xAchse = pylab.arange(0, 100, 1)
yAchse = pylab.array([0]*100)

fig = pylab.figure(1, figsize=(6, 6), dpi=90)
ax = fig.add_subplot(111)
ax.grid(True)
ax.set_title("Realtime Pressure Waveform Plot")
ax.set_xlabel("Samples")
ax.set_ylabel("Amplitude (kPa)")
ax.axis([0, 100, 0, 1])
line1 = ax.plot(xAchse, yAchse, '-')

canvas = FigureCanvasTkAgg(fig, master=panelLeft)
canvas.draw()
canvas.get_tk_widget().pack(fill=tk.BOTH, expand=True)
canvas._tkcanvas.pack(fill=tk.BOTH, expand=True)

# -------------------------------
# Mainloop
# -------------------------------
root.protocol("WM_DELETE_WINDOW", _quit)
root.after(10, plotValues)   # start plot updates
root.after(10, readValues)   # start sensor reads (original rate via sleeps)
tk.mainloop()
    