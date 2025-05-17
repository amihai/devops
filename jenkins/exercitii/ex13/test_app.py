import app

def test_hash():
    result = app.hash_password('admin')
    assert isinstance(result, str)
    assert len(result) == 32
