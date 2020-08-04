#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <Cocoa/Cocoa.h>

MainWindow::MainWindow(QWidget *parent)
	: QMainWindow(parent)
	, ui(new Ui::MainWindow)
{
	NSView* view = (NSView*)winId();
	if (0 == view) {setWindowFlags(Qt::FramelessWindowHint); return;}
	NSWindow *window = view.window;
	if (0 == window) {setWindowFlags(Qt::FramelessWindowHint); return;}

	window.titleVisibility = NSWindowTitleHidden;
	window.titlebarAppearsTransparent = YES;
	[window setMovable:NO];
	window.styleMask |=  NSWindowStyleMaskFullSizeContentView;
	ui->setupUi(this);
}

MainWindow::~MainWindow()
{
	delete ui;
}

