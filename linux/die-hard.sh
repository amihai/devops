#!/bin/bash

cleanup() {
    echo "Nope. I don't want to die.."
}

trap cleanup INT TERM

echo "PID-ul scriptului este $$"
echo "Aștept semnale, dar refuz să mor."

while true; do
    sleep 1
done

