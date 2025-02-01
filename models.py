# models.py
from extensions import db
db.create_all()

class Expense(db.Model):
    id = db.Column(db.String(36), primary_key=True)
    date = db.Column(db.Date, nullable=False)
    store = db.Column(db.String(128), nullable=False)
    amount = db.Column(db.Integer, nullable=False)
    tag = db.Column(db.String(64), default="その他")
    details = db.Column(db.Text, default="")

    def to_dict(self):
        return {
            "id": self.id,
            "date": self.date.strftime("%Y-%m-%d"),
            "store": self.store,
            "amount": self.amount,
            "tag": self.tag,
            "details": self.details
        }
