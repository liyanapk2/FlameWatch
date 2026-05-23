# import cv2
# import datetime
# import numpy as np
# # from SJV.DBConnection import *
# import winsound
# import pymysql
# from django.db import connection
# import time
# from cnnpredict import predict
# import matplotlib.pyplot as plt
# from datetime import datetime
# import requests
# live_Camera = cv2.VideoCapture(0)
#
# lower_bound = np.array([11, 33, 111])
#
# upper_bound = np.array([90, 255, 255])
# def main_code():
#     while (live_Camera.isOpened()):
#
#         ret, frame = live_Camera.read()
#
#         frame = cv2.resize(frame, (1280, 720))
#
#         frame = cv2.flip(frame, 1)
#
#         frame_smooth = cv2.GaussianBlur(frame, (7, 7), 0)
#
#         mask = np.zeros_like(frame)
#
#         mask[0:720, 0:1280] = [255, 255, 255]
#
#         img_roi = cv2.bitwise_and(frame_smooth, mask)
#
#         frame_hsv = cv2.cvtColor(img_roi, cv2.COLOR_BGR2HSV)
#         image_binary = cv2.inRange(frame_hsv, lower_bound, upper_bound)
#
#         check_if_fire_detected = cv2.countNonZero(image_binary)
#         print("check",check_if_fire_detected)
#         v=10
#         if int(check_if_fire_detected) >= 5000:
#             # cv2.putText(frame, "Fire Detected !", (300, 60), cv2.FONT_HERSHEY_COMPLEX, 3, (0, 0, 255), 2)
#             print("prediction")
#             fn = 'sample.jpg'
#             cv2.imwrite(fn,frame)
#             res1=predict(fn)
#             print(res1[0],"====================")
#             if res1[0]==1:
#                 print("******************************************************************************************")
#                 print("******************************************************************************************")
#                 print("******************************************************************************************")
#                 print("******************************************************************************************")
#                 print("******************************************************************************************")
#                 print("******************************************************************************************")
#                 fn=datetime.now().strftime("%Y%m%d%H%M%S")+".png"
#                 # frequency = 2500
#                 # duration = 1000
#                 # winsound.Beep(frequency, duration)
#
#                 cv2.imwrite(r"C:\Users\ADMIN\PycharmProjects\forest_fire\media/"+fn,frame)
#                 requests.get("http://127.0.0.1:5000/insert_noti?cid=1&fn="+fn)
#                 time.sleep(5)
#
#
#
#         cv2.imshow("Fire Detection", frame)
#
#         if cv2.waitKey(10) == 27:
#             print("break")
#             break
#     live_Camera.release()
#
#     cv2.destroyAllWindows()
#
# main_code()


import cv2
import numpy as np
import time
import requests
from datetime import datetime
import os

# Load YOLO for human detection
labelsPath = os.path.sep.join(["yolo-coco", "coco.names"])
LABELS = open(labelsPath).read().strip().split("\n")
weightsPath = os.path.sep.join(["yolo-coco", "yolov3.weights"])
configPath = os.path.sep.join(["yolo-coco", "yolov3.cfg"])
net = cv2.dnn.readNetFromDarknet(configPath, weightsPath)
ln = net.getLayerNames()
ln = [ln[i[0] - 1] for i in net.getUnconnectedOutLayers()]

# Initialize video capture for live camera
live_Camera = cv2.VideoCapture(0)

# Define color ranges for fire detection (HSV)
lower_bound = np.array([11, 33, 111])
upper_bound = np.array([90, 255, 255])

def detect_humans(frame):
    (W, H) = frame.shape[1], frame.shape[0]
    blob = cv2.dnn.blobFromImage(frame, 1 / 255.0, (416, 416), swapRB=True, crop=False)
    net.setInput(blob)
    layerOutputs = net.forward(ln)

    boxes = []
    confidences = []
    classIDs = []

    for output in layerOutputs:
        for detection in output:
            scores = detection[5:]
            classID = np.argmax(scores)
            confidence = scores[classID]

            if confidence > 0.5:
                box = detection[0:4] * np.array([W, H, W, H])
                (centerX, centerY, width, height) = box.astype("int")
                x = int(centerX - (width / 2))
                y = int(centerY - (height / 2))
                boxes.append([x, y, int(width), int(height)])
                confidences.append(float(confidence))
                classIDs.append(classID)

    idxs = cv2.dnn.NMSBoxes(boxes, confidences, 0.4, 0.5)

    current_human_count = 0
    if len(idxs) > 0:
        for i in idxs.flatten():
            if LABELS[classIDs[i]] == "person":
                print("person","kkkkkkkkkkkkkkkkkkkkkkkkk");
                current_human_count += 1

    return current_human_count > 0  # Return True if humans are detected

def detect_fire(frame):
    frame = cv2.resize(frame, (1280, 720))
    frame_smooth = cv2.GaussianBlur(frame, (7, 7), 0)
    mask = np.zeros_like(frame)
    mask[0:720, 0:1280] = [255, 255, 255]

    img_roi = cv2.bitwise_and(frame_smooth, mask)
    frame_hsv = cv2.cvtColor(img_roi, cv2.COLOR_BGR2HSV)
    image_binary = cv2.inRange(frame_hsv, lower_bound, upper_bound)

    check_if_fire_detected = cv2.countNonZero(image_binary)
    if check_if_fire_detected >= 9000:
        return True
    return False

def main_code():
    while live_Camera.isOpened():
        ret, frame = live_Camera.read()
        if not ret:
            break

        human_detected = detect_humans(frame)  # Check for humans in the frame
        if human_detected:
            pass
            # print("Human detected. Skipping fire detection.")
        else:
            fire_detected = detect_fire(frame)  # If no human, check for fire
            if fire_detected:
                print("Fire detected!")
                # You can add a logic here to save the image, notify, etc.

                fn = datetime.now().strftime("%Y%m%d%H%M%S") + ".png"
                cv2.imwrite(r"C:\Users\HP\PycharmProjects\forestfire\media/" + fn, frame)
                requests.get(f"http://127.0.0.1:8000/insert_noti?cid=1&fn={fn}")
                time.sleep(5)

        cv2.imshow("Detection", frame)

        if cv2.waitKey(10) == 27:  # Press 'ESC' to exit
            print("Exiting...")
            break

    live_Camera.release()
    cv2.destroyAllWindows()

main_code()
