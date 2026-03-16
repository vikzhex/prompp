//go:build testgcdouble

package cppbridge

import (
	"runtime"
	"testing"
)

func testGC() {
	if testing.Testing() {
		runtime.GC()
		runtime.GC()
	}
}
