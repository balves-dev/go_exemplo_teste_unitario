package main
	
import "fmt"

func soma(numeros ...int) (resultado int) {
	for _, numero := range numeros {
        resultado += numero
    }
    return
}


func main() {
    fmt.Println(soma(5, 5))
}