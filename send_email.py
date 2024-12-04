import smtplib
import os
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders

def send_email_with_attachment(subject, body, to_email, attachment_path):
    from_email = os.getenv('MY_SECRET')  # Assuming your email is stored in secrets
    password = os.getenv('EMAIL_PASSWORD')  # Assuming you have a password stored in secrets

    # Create the email
    msg = MIMEMultipart()
    msg['From'] = from_email
    msg['To'] = to_email
    msg['Subject'] = subject

    # Attach the body with the msg instance
    msg.attach(MIMEText(body, 'plain'))

    # Open the file to be sent
    with open(attachment_path, 'rb') as attachment:
        part = MIMEBase('application', 'octet-stream')
        part.set_payload(attachment.read())
        encoders.encode_base64(part)

        # Add header with pdf name
        part.add_header('Content-Disposition', f'attachment; filename={os.path.basename(attachment_path)}')

        # Attach the instance 'part' to instance 'msg'
        msg.attach(part)

    # Create SMTP session for sending the mail
    with smtplib.SMTP('smtp.gmail.com', 587) as server:
        server.starttls()  # Enable security
        server.login(from_email, password)  # Login with your email and password
        server.send_message(msg)

if __name__ == "__main__":
    subject = "Robot Framework Test Report"
    body = "Please find attached the Robot Framework test report."
    to_email = "amithbv.1111@gmail.com"  # Change to recipient's email address
    attachment_path = "results/report.html"  # Change to your report path

    send_email_with_attachment(subject, body, to_email, attachment_path)