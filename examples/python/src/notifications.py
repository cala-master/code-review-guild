class NotificationManager:
    def send_order_update(self, order, email_client, sms_client, audit_log):
        message = f"Order {order['id']} is now {order['status']}"
        if order.get("email"):
            email_client.send(order["email"], message)
        if order.get("phone"):
            sms_client.send(order["phone"], message)
        audit_log.write({"order_id": order["id"], "message": message})
        return message
