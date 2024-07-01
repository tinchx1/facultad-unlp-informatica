/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package parcialesarboles.parcial2023arbriltema1;

import java.util.List;
import tp2.ej2.BinaryTree;

/**
 *
 * @author tinch
 */
public class tipoLista {
    private int cant = 0;
    private List<BinaryTree<Integer>> lista;
    
    public tipoLista(int cant, List<BinaryTree<Integer>> lista) {
        this.cant = cant;
        this.lista = lista;
    }

    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }

    public List<BinaryTree<Integer>> getLista() {
        return lista;
    }

    public void setLista(List<BinaryTree<Integer>> lista) {
        this.lista = lista;
    }
         
}
