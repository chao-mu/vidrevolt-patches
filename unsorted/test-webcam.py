#!/usr/bin/env python3

import cv2

def main():
    cap = cv2.VideoCapture(0)
    if cap.read()[0]:
        cap.release()


if __name__ == "__main__":
    main()

