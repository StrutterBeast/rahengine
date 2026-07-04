import webview
import os
import sys

def create_app():
    # Get the absolute path of the current directory
    base_dir = os.path.dirname(os.path.abspath(__file__))
    html_path = os.path.join(base_dir, 'rahengine.html')
    
    # Create the window
    # width/height can be adjusted. resizable=True gives standard window controls.
    webview.create_window(
        'RahEngine Application', 
        html_path,
        width=1024, 
        height=768,
        resizable=True,
        fullscreen=False,
        min_size=(400, 300)
    )
    
    # Start the application
    # gui option can be 'gtk', 'qt', 'cef', or 'webkit' (auto-selects best available)
    webview.start()

if __name__ == '__main__':
    try:
        create_app()
    except Exception as e:
        print(f"Error launching RahEngine: {e}")
        # Fallback: Try to open in default browser if window fails
        import webbrowser
        webbrowser.open(f"file://{os.path.abspath('rahengine.html')}")   