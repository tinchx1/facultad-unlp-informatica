package tp3.ej12y3;

import java.util.LinkedList;
import java.util.List;
import tp1.ej8.Queue;

public class GeneralTree<T>{

	private T data;
	private List<GeneralTree<T>> children = new LinkedList<GeneralTree<T>>(); 

	public GeneralTree() {
		
	}
	public GeneralTree(T data) {
		this.data = data;
	}

	public GeneralTree(T data, List<GeneralTree<T>> children) {
		this(data);
		this.children = children;
	}	
	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}

	public List<GeneralTree<T>> getChildren() {
		return this.children;
	}
	
	public void setChildren(List<GeneralTree<T>> children) {
		if (children != null)
			this.children = children;
	}
	
	public void addChild(GeneralTree<T> child) {
		this.getChildren().add(child);
	}

	public boolean isLeaf() {
		return !this.hasChildren();
	}
	
	public boolean hasChildren() {
		return !this.children.isEmpty();
	}
	
	public boolean isEmpty() {
		return this.data == null && !this.hasChildren();
	}

	public void removeChild(GeneralTree<T> child) {
		if (this.hasChildren())
			children.remove(child);
	}
	
public int altura() {
    if (this.isEmpty()) {
        return 0; 
    } else {
        int maxAltura = 0;
        for (GeneralTree<T> hijo : this.getChildren()) {
            int alturaHijo = hijo.altura();
            if (alturaHijo > maxAltura) {
                maxAltura = alturaHijo;
            }
        }
        return maxAltura + 1;
    }
}

        
	public int nivel(T dato){
                if (this.getData() == dato) {
                    return 0;
                } else {
                    for (GeneralTree<T> hijo: this.getChildren()) {
                        int aux = hijo.nivel(dato);
                        if (aux != -1) {
                            return aux + 1;
                        }
                    }
                }
		return -1;
	  }
          
	public int ancho(){
		if (this.data == null) {
	        return 0;
	    }
	     Queue<GeneralTree<T>> queue = new Queue<>();
	    queue.enqueue(this);
	    int maxAncho = 0;
	    while (!queue.isEmpty()) {
	        int size = queue.Size();
	        maxAncho = Math.max(maxAncho, size);

	        for (int i = 0; i < size; i++) {
	            GeneralTree<T> current = queue.deenqueue();
	            for (GeneralTree<T> child : current.getChildren()) {
	                queue.enqueue(child);
	            }
	        }
	    }
	    return maxAncho;
	}
}