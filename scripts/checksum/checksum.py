#!/usr/bin/python3

import hashlib
import os
import sys

dir_path = os.path.dirname(os.path.realpath(__file__))

def main() -> int:
    actual = get_checksum(dir_path + "/../build/THUNDER.EXE")
    expected = get_checksum(dir_path + "/../SLUS_007.79")
    if expected == actual:
        print("Checksums match.")
        return 0
    else:
        print("Checksums do not match.", file=sys.stderr)
        return 1

def get_checksum(path: str) -> str:
    sha256 = hashlib.sha256()
    with open(path, "rb") as file:
        while True:
            data = file.read(65536)
            if not data:
                break
            sha256.update(data)
    return sha256.hexdigest()

if __name__ == "__main__":
    sys.exit(main())
