import utils
import logging

# pip install pytest
# pytest

def test_encode_decode():
    text = "This is a test message"
    encoded = utils.base64_encode(text)
    decoded = utils.base64_decode(encoded)
    assert "VGhpcyBpcyBhIHRlc3QgbWVzc2FnZQ==" == encoded
    assert text == decoded 

def test_sha256sum():
    text = "This is a test message"
    sha256sum = utils.sha256sum(text)
    assert "6f3438001129a90c5b1637928bf38bf26e39e57c6e9511005682048bedbef906" == sha256sum


def test_sha256sum_file():
    file_path = "fmt.sh"
    sha256sum = utils.sha256sum_file(file_path)
    assert "6e2b894823c81469cf74373f5b11c70ef80a9c75bf9df5788d20d144077cd4f3" == sha256sum