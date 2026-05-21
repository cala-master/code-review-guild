class BillingWorkflow:
    def __init__(self, payment_gateway, email_sender):
        self.payment_gateway = payment_gateway
        self.email_sender = email_sender

    def run(self, order, request, database):
        if request.get("dry_run"):
            return {"ok": True, "mode": "dry-run", "result_formatter": None}
        if request.get("preview_mode"):
            return {"ok": True, "mode": "preview", "result_formatter": None}

        if order["country"] == "US":
            tax_rate = 0.07
        elif order["country"] == "ES":
            tax_rate = 0.21
        else:
            tax_rate = 0.18

        total = order["total"] + (order["total"] * tax_rate)
        charge = self.payment_gateway.charge(order["payment_token"], total)
        database.save({"order_id": order["id"], "charge_id": charge["id"]})
        self.email_sender.send(order["email"], f"Charged {total}")
        return {"ok": True, "charge": charge, "total": total}
