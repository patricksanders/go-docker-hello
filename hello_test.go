package main

import "testing"

func TestAdd(t *testing.T) {
	expected := 4
	actual := add(2, 2)
	if actual != expected {
		t.Error(
			"expected", expected,
			"got", actual,
		)
	}
}
