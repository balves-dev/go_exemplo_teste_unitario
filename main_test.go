package main
	
import "testing"

func TestSoma(t *testing.T) {
    resultadoTeste := soma(5, 5)
    if resultadoTeste != 10 {
        t.Errorf("Soma incorreta, trouxe: %d, o correto é: %d.", resultadoTeste, 10)
    }
}
