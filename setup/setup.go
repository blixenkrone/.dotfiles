package main

import (
	"bytes"
	"fmt"
	"os/exec"
)

var commands = []*exec.Cmd{
	// exec.Command("xcode-select", "--install"),
	exec.Command("echo", "hello"),
}

func main() {
	fmt.Println("running setup...")

	for _, cmd := range commands {
		var buf bytes.Buffer
		cmd.Stderr = &buf
		cmd.Stdout = &buf
		fmt.Printf("running cmd '%s' \n", cmd.String())
		if err := cmd.Run(); err != nil {
			panic(err)
		}
		fmt.Println(buf.String())

	}
}
