/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package grafos.parcial2023junio24;

import java.util.LinkedList;
import java.util.List;
import tp5.ejercicio1.Edge;
import tp5.ejercicio1.Graph;
import tp5.ejercicio1.Vertex;

/**
 *
 * @author tinch
 */
public class Parcial {
    public List<Info> resolver(Graph<String> sitios, String origen, String destino, List<String> evitarPasarPor) {
        List<Info> lista = new LinkedList<Info>();
        if (!sitios.isEmpty()) {
            Vertex<String> v1 = sitios.search(origen);
            Vertex<String> v2 = sitios.search(destino);
            List<String> lisAct = new LinkedList<String>();
            if (v1 != null && v2 != null) {
                boolean[] marcas = new boolean[sitios.getSize()];
                marcarEvitar(sitios, evitarPasarPor,marcas);
                dfs(sitios, v1, v2, lista,lisAct, marcas, 0);
            }
        }
    }
    public void marcarEvitar(Graph<String> sitios, List<String> evitarPasarPor, boolean[] marcas) {
        for (String nom: evitarPasarPor) {
            Vertex<String> v = sitios.search(nom);
            if (v != null) {
                marcas[v.getPosition()] = true;
            }
        }
    }
    public void dfs(Graph<String> sitios, Vertex<String> origen, Vertex<String> destino, List<Info> lista, List<String> listaAct, boolean[] marcas, int cuadras) {
        marcas[origen.getPosition()] = true;
        listaAct.add(origen.getData());
        if (origen == destino) {
            Info l = new Info(listaAct, cuadras);
            lista.add(l);
        } else {
            for (Edge<String> ady: sitios.getEdges(origen)) {
                Vertex<String> aux = ady.getTarget();
                int peso = ady.getWeight();
                if (!marcas[aux.getPosition()]) {
                    this.dfs(sitios, aux, destino, lista, listaAct, marcas, cuadras + peso);
                }
            }
        }
    }