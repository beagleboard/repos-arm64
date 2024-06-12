#Copied from: https://gist.github.com/Mic92/3ca60e6865a9793423a41db0480275d8
import glob
import re
import sys
import os
import subprocess
import curses.ascii
import binascii
from typing import Tuple, Optional

def parse_network_manager(filename: str) -> Tuple[Optional[str], Optional[str]]:
    with open(filename) as f:
        ssid = None
        psk = None
        for line in f:
            match = re.match("^ssid=(.+)", line)
            if match:
                ssid = match.group(1)
            match2 = re.match("^psk=(.+)", line)
            if match2:
                psk = match2.group(1)
        return (ssid, psk)


def main() -> None:
    networks = {}
    with open("/boot/firmware/firstrun.sh") as f:
        ssid = None
        psk = None
        for line in f:
            match = re.match("\s*ssid=\"(.+)\"", line)
            if match:
                ssid = match.group(1)
            match2 = re.match("\s*psk=\"(.+)\"", line)
            if match2:
                psk = match2.group(1)
            match3 = re.match("\s*network\s*=\s*", line)
            if match3:
                if ssid and psk:
                    networks[ssid] = psk
                ssid = None
                psk = None

    nm_profiles = glob.glob("/etc/NetworkManager/system-connections/*")
    for f in nm_profiles:
        ssid, psk = parse_network_manager(f)
        if ssid and psk:
            networks[ssid] = psk
    for ssid, psk in networks.items():
        if not re.match("^[0-9 \-_a-zA-z]+$", ssid):
            hexstr = binascii.hexlify(ssid.encode("utf-8")).decode("ascii")
            filename = f"={hexstr}.psk"
        else:
            filename = f"{ssid}.psk"
        name = os.path.join("/var/lib/iwd", filename)
        #if os.path.exists(name):
        #    continue
        proc = subprocess.run(["wpa_passphrase", ssid, psk], check=True,capture_output=True)
        out = proc.stdout.decode("utf-8")
        preshared_key = out.split("\n")[3].replace("psk=", "").strip()

        print(f"{ssid} -> {name}")
        with open(name, "w") as f:
          f.write(f"""[Security]
PreSharedKey={preshared_key}
Passphrase={psk}
""")

if __name__ == '__main__':
    main()
