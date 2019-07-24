# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'msg_center_display.ui'
#
# Created by: PyQt5 UI code generator 5.12.1
#
# WARNING! All changes made in this file will be lost!

from PyQt5 import QtCore, QtGui, QtWidgets


class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(599, 589)
        self.centralwidget = QtWidgets.QWidget(MainWindow)
        self.centralwidget.setObjectName("centralwidget")
        self.send_frame = QtWidgets.QFrame(self.centralwidget)
        self.send_frame.setGeometry(QtCore.QRect(20, 310, 561, 80))
        self.send_frame.setFrameShape(QtWidgets.QFrame.StyledPanel)
        self.send_frame.setFrameShadow(QtWidgets.QFrame.Raised)
        self.send_frame.setObjectName("send_frame")
        self.push_button_send = QtWidgets.QPushButton(self.send_frame)
        self.push_button_send.setGeometry(QtCore.QRect(10, 10, 261, 61))
        self.push_button_send.setObjectName("push_button_send")
        self.push_button_receive = QtWidgets.QPushButton(self.send_frame)
        self.push_button_receive.setGeometry(QtCore.QRect(290, 10, 261, 61))
        self.push_button_receive.setObjectName("push_button_receive")
        self.textBrowser = QtWidgets.QTextBrowser(self.centralwidget)
        self.textBrowser.setGeometry(QtCore.QRect(20, 20, 561, 101))
        self.textBrowser.setObjectName("textBrowser")
        self.receive_frame = QtWidgets.QFrame(self.centralwidget)
        self.receive_frame.setGeometry(QtCore.QRect(20, 410, 561, 131))
        self.receive_frame.setFrameShape(QtWidgets.QFrame.StyledPanel)
        self.receive_frame.setFrameShadow(QtWidgets.QFrame.Raised)
        self.receive_frame.setObjectName("receive_frame")
        self.label_2 = QtWidgets.QLabel(self.receive_frame)
        self.label_2.setGeometry(QtCore.QRect(20, 10, 151, 17))
        self.label_2.setObjectName("label_2")
        self.text_browser_receive = QtWidgets.QTextBrowser(self.receive_frame)
        self.text_browser_receive.setGeometry(QtCore.QRect(20, 30, 521, 71))
        self.text_browser_receive.setObjectName("text_browser_receive")
        self.label_3 = QtWidgets.QLabel(self.centralwidget)
        self.label_3.setGeometry(QtCore.QRect(20, 230, 121, 17))
        self.label_3.setObjectName("label_3")
        self.text_browser_status = QtWidgets.QTextBrowser(self.centralwidget)
        self.text_browser_status.setGeometry(QtCore.QRect(20, 260, 271, 31))
        self.text_browser_status.setObjectName("text_browser_status")
        self.push_button_start = QtWidgets.QPushButton(self.centralwidget)
        self.push_button_start.setGeometry(QtCore.QRect(20, 160, 561, 61))
        self.push_button_start.setObjectName("push_button_start")
        self.label = QtWidgets.QLabel(self.centralwidget)
        self.label.setGeometry(QtCore.QRect(310, 230, 151, 17))
        self.label.setObjectName("label")
        self.line_edit_data = QtWidgets.QLineEdit(self.centralwidget)
        self.line_edit_data.setGeometry(QtCore.QRect(310, 260, 271, 29))
        self.line_edit_data.setObjectName("line_edit_data")
        self.receive_frame.raise_()
        self.send_frame.raise_()
        self.textBrowser.raise_()
        self.label_3.raise_()
        self.text_browser_status.raise_()
        self.push_button_start.raise_()
        self.label.raise_()
        self.line_edit_data.raise_()
        MainWindow.setCentralWidget(self.centralwidget)
        self.menubar = QtWidgets.QMenuBar(MainWindow)
        self.menubar.setGeometry(QtCore.QRect(0, 0, 599, 23))
        self.menubar.setObjectName("menubar")
        self.menuTESTE_PY = QtWidgets.QMenu(self.menubar)
        self.menuTESTE_PY.setTitle("")
        self.menuTESTE_PY.setObjectName("menuTESTE_PY")
        self.menuMessage_Center = QtWidgets.QMenu(self.menubar)
        self.menuMessage_Center.setObjectName("menuMessage_Center")
        MainWindow.setMenuBar(self.menubar)
        self.statusbar = QtWidgets.QStatusBar(MainWindow)
        self.statusbar.setObjectName("statusbar")
        MainWindow.setStatusBar(self.statusbar)
        self.menubar.addAction(self.menuTESTE_PY.menuAction())
        self.menubar.addAction(self.menuMessage_Center.menuAction())

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        _translate = QtCore.QCoreApplication.translate
        MainWindow.setWindowTitle(_translate("MainWindow", "MainWindow"))
        self.push_button_send.setText(_translate("MainWindow", "Send"))
        self.push_button_receive.setText(_translate("MainWindow", "Receive"))
        self.textBrowser.setHtml(_translate("MainWindow", "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n"
"<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\n"
"p, li { white-space: pre-wrap; }\n"
"</style></head><body style=\" font-family:\'Ubuntu\'; font-size:11pt; font-weight:400; font-style:normal;\">\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:12pt; font-weight:600;\">Welcome to the BM32OS message center</span></p>\n"
"<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-size:12pt; font-weight:600;\"><br /></p>\n"
"<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-size:12pt; font-weight:600;\">Here you will be able to stablish connection with BM32OS system for read and write routines during process schedulling.</span></p></body></html>"))
        self.label_2.setText(_translate("MainWindow", "Received data:"))
        self.label_3.setText(_translate("MainWindow", "Interface Status:"))
        self.push_button_start.setText(_translate("MainWindow", "Start "))
        self.label.setText(_translate("MainWindow", "Data to be sent:"))
        self.menuMessage_Center.setTitle(_translate("MainWindow", "Message Center"))


