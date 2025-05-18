from app import app

def test_run_endpoint():
    client = app.test_client()
    response = client.get("/run?cmd=ls")
    assert response.status_code == 200
