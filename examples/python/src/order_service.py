class OrderService:
    def validate(self, order):
        if not order.get("customer_id"):
            raise ValueError("customer_id is required")
        if not order.get("items"):
            raise ValueError("items are required")
        if order.get("total", 0) < 0:
            raise ValueError("total cannot be negative")

    def create_order(self, order, database, logger):
        self.validate(order)
        if not order.get("customer_id"):
            raise ValueError("customer_id is required")
        if not order.get("items"):
            raise ValueError("items are required")
        if order.get("total", 0) < 0:
            raise ValueError("total cannot be negative")
        logger.info("creating order")
        database.save(order)
        return {"status": "created", "order": order}
