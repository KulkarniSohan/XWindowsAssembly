#ifndef XLIB_ILLEGAL_ACCESS
#define XLIB_ILLEGAL_ACCESS
#endif 


#include <stdio.h> 
#include <stdlib.h> 
#include <X11/Xlib.h> 
#include <X11/Xutil.h> 
#include <GL/gl.h> 
#include <GL/glx.h> 


#ifndef OFFSET_OF
#define OFFSET_OF(T,x)	(long)(&(((T*)0)->x))
#endif


int main (int argc, char *argv[])
{
	printf ("Size of Display:%d\n", sizeof (struct _XDisplay)); 
	printf ("Size of Window:%d\n", sizeof (Window)); 
	printf ("Size of DC:%d\n", sizeof (GC)); 
	printf ("Size of Xevent:%d\n", sizeof (XEvent)); 
	printf ("Size of KeySym:%d\n", sizeof (KeySym)); 
	printf ("Size of XSizeHints:%d\n", sizeof (XSizeHints)); 
	printf ("Size of Screen:%d\n", sizeof (Screen)); 
	printf ("Size of XVisualInfo:%d\n", sizeof (XVisualInfo)); 
	printf ("Size of Colormap:%d\n", sizeof (Colormap)); 
	printf ("Size of XSetWindowAttributes:%d\n", sizeof (XSetWindowAttributes)); 
	printf ("\n\n"); 

	printf ("####struct _XDisplay field offsets:\n"); 
	printf ("ext_data:%d\n", OFFSET_OF(struct _XDisplay, ext_data)); 
	printf ("fd:%d\n", OFFSET_OF(struct _XDisplay, fd)); 
	printf ("proto_major_version:%d\n", OFFSET_OF(struct _XDisplay, proto_major_version)); 
	printf ("proto_minor_version:%d\n", OFFSET_OF(struct _XDisplay, proto_minor_version)); 
	printf ("vendor:%d\n", OFFSET_OF(struct _XDisplay, vendor)); 
	printf ("byte_order:%d\n", OFFSET_OF(struct _XDisplay, byte_order)); 
	printf ("bitmap_unit:%d\n", OFFSET_OF(struct _XDisplay, bitmap_unit)); 
	printf ("bitmap_pad:%d\n", OFFSET_OF(struct _XDisplay, bitmap_pad)); 
	printf ("bitmap_bit_order:%d\n", OFFSET_OF(struct _XDisplay, bitmap_bit_order)); 
	printf ("nformats:%d\n", OFFSET_OF(struct _XDisplay, nformats)); 
	printf ("pixmap_format:%d\n", OFFSET_OF(struct _XDisplay, pixmap_format)); 
	printf ("release:%d\n", OFFSET_OF(struct _XDisplay, release)); 
	printf ("qlen:%d\n", OFFSET_OF(struct _XDisplay, qlen)); 
	printf ("last_request_read:%d\n", OFFSET_OF(struct _XDisplay, last_request_read)); 
	printf ("request:%d\n", OFFSET_OF(struct _XDisplay, request)); 
	printf ("max_request_size:%d\n", OFFSET_OF(struct _XDisplay, max_request_size)); 
	printf ("display_name:%d\n", OFFSET_OF(struct _XDisplay, display_name)); 
	printf ("default_screen:%d\n", OFFSET_OF(struct _XDisplay, default_screen)); 
	printf ("nscreens:%d\n", OFFSET_OF(struct _XDisplay, nscreens)); 
	printf ("screens:%d\n", OFFSET_OF(struct _XDisplay, screens)); 
	printf ("min_keycode:%d\n", OFFSET_OF(struct _XDisplay, min_keycode)); 
	printf ("max_keycode:%d\n", OFFSET_OF(struct _XDisplay, max_keycode)); 
	printf ("\n\n"); 
	
	printf ("####Screen field Offsets\n"); 
	printf ("ext_data:%d\ndisplay:%d\nroot:%d\nwidth:%d\nheight:%d\nmwidth:%d\nmheight:%d\n", 
			OFFSET_OF(Screen, ext_data), OFFSET_OF(Screen, display), OFFSET_OF(Screen, root), 
			OFFSET_OF(Screen, width), OFFSET_OF(Screen, height), OFFSET_OF(Screen, mwidth), 
			OFFSET_OF(Screen, mheight)); 
	printf ("ndepths:%d\ndepths:%d\nroot_depths:%d\nroot_visual:%d\ndefault_gc:%d\ncmap:%d\n", 
			OFFSET_OF(Screen, ndepths), OFFSET_OF(Screen, depths), 
			OFFSET_OF(Screen, root_depth), OFFSET_OF(Screen, root_visual), 
			OFFSET_OF(Screen, default_gc), OFFSET_OF(Screen,cmap)); 
	printf ("white_pixel:%d\nblack_pixel:%d\nmax_maps:%d\nmin_maps:%d\nbacking_store:%d\n", 
			OFFSET_OF(Screen,white_pixel), OFFSET_OF(Screen, black_pixel), 
			OFFSET_OF(Screen,max_maps), OFFSET_OF(Screen,min_maps), 
			OFFSET_OF(Screen,backing_store)); 
	printf ("root_input_mask:%d\n", OFFSET_OF(Screen,root_input_mask)); 
	printf ("\n\n"); 

	printf ("#####Offsets of XSizeHints structure fields\n"); 
	printf ("flags:%d\nx:%d\ny:%d\nwidth:%d\nheight:%d\nmin_width:%d\nmin_height:%d\n", 
			OFFSET_OF(XSizeHints,flags), OFFSET_OF(XSizeHints,x), OFFSET_OF(XSizeHints,y), 
			OFFSET_OF(XSizeHints, width), OFFSET_OF(XSizeHints, height), 
			OFFSET_OF(XSizeHints, min_width), OFFSET_OF(XSizeHints, min_height)); 
	printf ("max_width:%d\nmax_height:%d\nwidth_inc:%d\nheight_inc:%d\nmin_aspect:%d\nmax_aspect:%d\n", 
			OFFSET_OF(XSizeHints, max_width), OFFSET_OF(XSizeHints, max_height), 
			OFFSET_OF(XSizeHints, width_inc), OFFSET_OF(XSizeHints, height_inc), 
			OFFSET_OF(XSizeHints, min_aspect), OFFSET_OF(XSizeHints, max_aspect)); 
	printf ("base_width:%d\nbase_height:%d\nwin_gravity:%d\n", 
			OFFSET_OF(XSizeHints, base_width), OFFSET_OF(XSizeHints, base_height), 
			OFFSET_OF(XSizeHints, win_gravity)); 
	printf ("\n\n"); 

	printf ("####Sizes of event structs\n"); 
	printf ("sizeof(XAnyEvent):%d\nsizeof(XKeyEvent):%d\nsizeof(XButtonEvent):%d\nsizeof(XMotionEvent):%d\nsizeof(XCrossingEvent):%d\nsizeof(XFocusChangeEvent):%d\n",sizeof (XAnyEvent), sizeof (XKeyEvent), sizeof (XButtonEvent),sizeof (XMotionEvent), sizeof (XCrossingEvent), sizeof (XFocusChangeEvent)); 
	printf ("sizeof (XExposeEvent):%d\nsizeof (XGraphicsExposeEvent):%d\nsizeof (XNoExposeEvent):%d\n",
		sizeof (XExposeEvent), sizeof (XGraphicsExposeEvent), sizeof (XNoExposeEvent)); 
	printf ("sizeof (XVisibilityEvent):%d\nsizeof (XCreateWindowEvent):%d\nsizeof (XDestroyWindowEvent):%d\n",
			sizeof (XVisibilityEvent), sizeof (XCreateWindowEvent), sizeof (XDestroyWindowEvent)); 
	printf ("sizeof (XUnmapEvent):%d\nsizeof (XMapEvent):%d\nsizeof (XMapRequestEvent):%d\n", 
			sizeof (XUnmapEvent), sizeof (XMapEvent), sizeof (XMapRequestEvent)); 
	printf ("sizeof (XReparentEvent):%d\nsizeof (XConfigureEvent):%d\nsizeof (XGravityEvent):%d\n", 
		sizeof (XReparentEvent), sizeof (XConfigureEvent), sizeof (XGravityEvent)); 
	printf ("sizeof (XResizeRequestEvent):%d\nsizeof (XConfigureRequestEvent):%d\n", 
		sizeof (XResizeRequestEvent), sizeof (XConfigureRequestEvent)); 
	printf ("sizeof (XCirculateEvent):%d\nsizeof (XCirculateRequestEvent):%d\nsizeof (XPropertyEvent)\n", 
		sizeof (XCirculateEvent), sizeof (XCirculateRequestEvent), sizeof (XPropertyEvent)); 
	printf ("sizeof (XSelectionClearEvent):%d\nsizeof (XSelectionRequestEvent):%d\n", 
		sizeof (XSelectionClearEvent), sizeof (XSelectionRequestEvent)); 
	printf ("sizeof (XSelectionEvent):%d\nsizeof (XColormapEvent):%d\nsizeof (XClientMessageEvent):%d\n", 
			sizeof (XSelectionEvent), sizeof (XColormapEvent), sizeof (XClientMessageEvent)); 
	printf ("sizeof (XMappingEvent):%d\nsizeof (XErrorEvent):%d\nsizeof (XKeymapEvent):%d\n", 
		sizeof (XMappingEvent), sizeof (XErrorEvent), sizeof (XKeymapEvent)); 
	printf ("sizeof (XGenericEvent):%d\nsizeof (XGenericEventCookie):%d\n", 
		sizeof (XGenericEvent), sizeof (XGenericEventCookie)); 
	printf ("\n\n");

	printf ("####Offsets of XExposeEvent struct fields\n"); 
	printf ("type:%d\nserial:%d\nsend_event:%d\ndisplay:%d\nwindow:%d\nx:%d\ny:%d\nheight:%d\ncount:%d\n", 
		OFFSET_OF(XExposeEvent,type), OFFSET_OF (XExposeEvent, serial), 
		OFFSET_OF (XExposeEvent, send_event), OFFSET_OF (XExposeEvent, display), 
		OFFSET_OF (XExposeEvent, window), OFFSET_OF (XExposeEvent, x), 
		OFFSET_OF (XExposeEvent, y), OFFSET_OF (XExposeEvent, height),
		OFFSET_OF (XExposeEvent, count)); 
	printf ("\n\n"); 

	printf ("####Offsets of XButtonPressEvent struct fields\n"); 
	printf ("type:%d\nserial:%d\nsend_event:%d\ndisplay:%d\nwindow:%d\nroot:%d\nsubwindow:%d\ntime:%d\n", 
		OFFSET_OF (XButtonEvent, type), OFFSET_OF (XButtonEvent, serial), 
		OFFSET_OF (XButtonEvent, send_event), OFFSET_OF (XButtonEvent, display), 
		OFFSET_OF (XButtonEvent, window), OFFSET_OF (XButtonEvent, root), 
		OFFSET_OF (XButtonEvent, subwindow), OFFSET_OF (XButtonEvent, time)); 
	printf ("x:%d\ny:%d\nx_root:%d\ny_root:%d\nstate:%d\nbutton:%d\nsame_screen:%d\n", 
		OFFSET_OF (XButtonEvent, x), OFFSET_OF (XButtonEvent, y), 
		OFFSET_OF (XButtonEvent, x_root), OFFSET_OF (XButtonEvent, y_root), 
		OFFSET_OF (XButtonEvent, state), OFFSET_OF (XButtonEvent, button), 
		OFFSET_OF (XButtonEvent, same_screen)); 
	printf ("\n\n"); 

	printf ("####Offsets of XVisualInfo struct fields\n"); 
	printf ("*visual:%d\nvisualid:%d\nscreen:%d\ndepth:%d\nclass:%d\nred_mask:%d\ngreen_mask:%d\n", 
		OFFSET_OF (XVisualInfo, visual), OFFSET_OF (XVisualInfo, visualid), 
		OFFSET_OF (XVisualInfo, screen), OFFSET_OF (XVisualInfo, depth), 
		OFFSET_OF (XVisualInfo, class), OFFSET_OF (XVisualInfo, red_mask), 
		OFFSET_OF (XVisualInfo, green_mask)); 
	printf ("blue_mask:%d\ncolormap_size:%d\nbits_per_rgb:%d\n", OFFSET_OF (XVisualInfo, blue_mask), 
		OFFSET_OF (XVisualInfo, colormap_size), OFFSET_OF (XVisualInfo, bits_per_rgb)); 
	printf ("\n\n"); 
	
	printf ("####Offsets of XSetWindowAttributes struct field\n"); 
	printf ("background_pixmap:%d\nbackground_pixel:%d\nborder_pixmap:%d\nborder_pixel:%d\n", 
		OFFSET_OF (XSetWindowAttributes, background_pixmap), 
		OFFSET_OF (XSetWindowAttributes, background_pixel), 
		OFFSET_OF (XSetWindowAttributes, border_pixmap), 
		OFFSET_OF (XSetWindowAttributes, border_pixel)); 
	printf ("bit_gravity:%d\nwin_gravity:%d\nbacking_store:%d\nbacking_planes:%d\n", 
		OFFSET_OF (XSetWindowAttributes, bit_gravity), 
		OFFSET_OF (XSetWindowAttributes, win_gravity), 
		OFFSET_OF (XSetWindowAttributes, backing_store), 
		OFFSET_OF (XSetWindowAttributes, backing_planes)); 
	printf ("backing_pixel:%d\nsave_under:%d\nevent_mask:%d\ndo_not_propagate_mask:%d\n", 
		OFFSET_OF (XSetWindowAttributes, backing_pixel), 
		OFFSET_OF (XSetWindowAttributes, save_under), 
		OFFSET_OF (XSetWindowAttributes, event_mask), 
		OFFSET_OF (XSetWindowAttributes, do_not_propagate_mask)); 
	printf ("override_redirect:%d\ncolormap:%d\ncursor:%d\n", 
		OFFSET_OF (XSetWindowAttributes, override_redirect), 
		OFFSET_OF (XSetWindowAttributes, colormap), 
		OFFSET_OF (XSetWindowAttributes, cursor)); 


	exit (0); 
}
