import smtplib
import os
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart


def send_email(subject, body, recipients):
    sender_email = "amithbv.1111@gmail.com"
    password = "rmtyottjtdyfzhjx"

    # Create the email
    msg = MIMEMultipart()
    msg['From'] = sender_email
    msg['To'] = ", ".join(recipients)
    msg['Subject'] = subject

    # Attach the body with the msg instance
    msg.attach(MIMEText(body, 'plain'))

    # Server setup
    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    server.login(sender_email, password)

    # Send the email
    server.send_message(msg)
    server.quit()


if __name__ == "__main__":
    # Prepare your email content
    subject = "Robot Framework Test Results"

    # Assuming results are in 'output' directory
    body = "The test execution has completed. Please find the results attached."

    recipients = ["amithbv.1111@gmail.com", "amithbv.1111@gmail.com"]

    send_email(subject, body, recipients)