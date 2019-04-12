
#module for running DOS command 
from subprocess import check_output
#modules for opening a file dialog
import tkinter as tk
from tkinter import filedialog

#open file dialog to determine path to lab file
root = tk.Tk()
root.withdraw()
file_path = filedialog.askopenfilename()

#run mongoimport command in shell
command = f"mongoimport --host localhost --db lab5 --collection beer --file {file_path} --jsonArray"

try:
    check_output(command, shell=True).decode()    
except subprocess.CalledProcessError as e:
    print (e.output)