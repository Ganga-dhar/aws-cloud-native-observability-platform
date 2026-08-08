import sys
import os

# Add app directory to Python path
sys.path.insert(
    0,
    os.path.abspath(
        os.path.join(
            os.path.dirname(__file__),
            "../app"
        )
    )
)

from app import app


def test_home():

    client = app.test_client()

    response = client.get("/")

    assert response.status_code == 200

    data = response.get_json()

    assert data["application"] == \
        "cloud-native-observability-platform"

    assert data["status"] == "running"


def test_health():

    client = app.test_client()

    response = client.get("/health")

    assert response.status_code == 200

    data = response.get_json()

    assert data["status"] == "healthy"


def test_orders():

    client = app.test_client()

    response = client.get("/api/orders")

    assert response.status_code == 200

    data = response.get_json()

    assert "orders" in data

    assert len(data["orders"]) == 3


def test_error():

    client = app.test_client()

    response = client.get("/api/error")

    assert response.status_code == 500