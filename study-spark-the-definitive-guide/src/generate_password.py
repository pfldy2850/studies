from notebook.auth import passwd


if __name__ == "__main__":
    pwd = passwd()
    print(pwd)
    
    password_file = open("password.txt", "w+")
    password_file.write(pwd)
    password_file.close()