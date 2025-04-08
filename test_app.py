import unittest
from app import app

class FlaskAppTest(unittest.TestCase):
    def setUp(self):
        self.client = app.test_client()

    def test_home(self):
        res = self.client.get("/")
        self.assertEqual(res.status_code, 200)

    def test_hello_api(self):
        res = self.client.get("/api/hello")
        self.assertEqual(res.status_code, 200)
        self.assertEqual(res.get_json(), {"message": "Hello from Flask!"})

if __name__ == "__main__":
    unittest.main()
