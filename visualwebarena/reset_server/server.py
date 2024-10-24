import http.server
import socketserver
import subprocess
import argparse


class CustomHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        # Extract path
        parsed_path = self.path
        print(f"Request received {parsed_path}")
        if parsed_path == '/reset':
            print("Running reset script...")
            try:
                # Execute the reset script
                subprocess.run(['bash', 'reset.sh'], check=True)
                print("Reset successful!")
                self.send_response(200)
                self.send_header('Content-type', 'text/html')
                self.end_headers()
                self.wfile.write(b'Reset script executed successfully')
            except subprocess.CalledProcessError as e:
                print("Reset failed :(")
                self.send_response(500)
                self.send_header('Content-type', 'text/html')
                self.end_headers()
                self.wfile.write(f'Error executing reset script: {e}'.encode())
        else:
            print("Wrong request")
            self.send_response(404)
            self.send_header('Content-type', 'text/html')
            self.end_headers()
            self.wfile.write(b'Endpoint not found')


# Parse command-line arguments
parser = argparse.ArgumentParser(description='Start a simple HTTP server to execute a reset script.')
parser.add_argument('--port', type=int, help='Port number the server will listen to')
args = parser.parse_args()

# Run the server
with socketserver.TCPServer(('', args.port), CustomHandler) as httpd:
    print(f'Serving on port {args.port}...')
    httpd.serve_forever()
