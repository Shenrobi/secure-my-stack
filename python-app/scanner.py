import os
import subprocess

def insecure_password_check():
    password = "SuperSecret123"  # Hardcoded password (Bandit will flag this)
    if password == "SuperSecret123":
        print("Password is too weak!")

def run_command():
    subprocess.call("ls -la", shell=True)  # Bandit will flag subprocess use

if __name__ == "__main__":
    insecure_password_check()
    run_command()