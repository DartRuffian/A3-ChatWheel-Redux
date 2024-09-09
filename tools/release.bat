@ECHO off
winget install --id=BrettMayson.HEMTT  -e
hemtt script update_build.rhai
hemtt script update_minor.rhai
hemtt release