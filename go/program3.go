
package main

import (
   //"fmt"
   "os"
   "io/ioutil"
   "regexp"
)

func write(str string) string{
   output := []byte(str)
   err := ioutil.WriteFile(os.Args[2], output, 0644)
   checkError(err)
   var out = string(output)
   return(out)
}

func parseString(str string) string {
   reg, err := regexp.Compile("[0-9]")
   checkError(err)
   modified := reg.ReplaceAllString(str, "")
   return modified
}

func checkError(e error) {
   if e != nil {
     panic(e)
   }
}

func read() string {
   input, err := ioutil.ReadFile(os.Args[1])
   checkError(err)
   var str = string(input)
   //fmt.Print(str)
   return str
}

func main() {
   var input = read()
   //fmt.Println()
   var output = parseString(input)
   //fmt.Println(output)
   write(output)
   //fmt.Println(write)
}

