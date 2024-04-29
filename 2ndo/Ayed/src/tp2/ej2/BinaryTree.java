package tp2.ej2;



public class BinaryTree <T> {
	
	private T data;
	private BinaryTree<T> leftChild;   
	private BinaryTree<T> rightChild; 

	
	public BinaryTree() {
		super();
	}

	public BinaryTree(T data) {
		this.data = data;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
	/**
	 * Preguntar antes de invocar si hasLeftChild()
	 * @return
	 */
	public BinaryTree<T> getLeftChild() {
		return leftChild;
	}
	/**
	 * Preguntar antes de invocar si hasRightChild()
	 * @return
	 */
	public BinaryTree<T> getRightChild() {
		return this.rightChild;
	}

	public void addLeftChild(BinaryTree<T> child) {
		this.leftChild = child;
	}

	public void addRightChild(BinaryTree<T> child) {
		this.rightChild = child;
	}

	public void removeLeftChild() {
		this.leftChild = null;
	}

	public void removeRightChild() {
		this.rightChild = null;
	}

	public boolean isEmpty(){
		return (this.isLeaf() && this.getData() == null);
	}

	public boolean isLeaf() {
		return (!this.hasLeftChild() && !this.hasRightChild());

	}
		
	public boolean hasLeftChild() {
		return this.leftChild!=null;
	}

	public boolean hasRightChild() {
		return this.rightChild!=null;
	}
	@Override
	public String toString() {
		return this.getData().toString();
	}
        public int contarHojas() {
            return contarHojas(this);
        }
	public  int contarHojas(BinaryTree<T> nodo) {
	   if (nodo == null) {
		return 0;
           } 
           if (nodo.isLeaf()){
               return 1;
           }
           int nodosDerecha = contarHojas(nodo.rightChild);
           int nodosIzquierda = contarHojas(nodo.leftChild);
           return nodosDerecha + nodosIzquierda;
	}
		
		
    	 
    public BinaryTree<T> espejo(BinaryTree<T> nodo){
           if (nodo == null) {
               return null;
           }
           BinaryTree<T> aux = nodo.getLeftChild();
           nodo.leftChild = nodo.getRightChild();
           nodo.rightChild = aux;
 	   
           espejo(nodo.rightChild);
           espejo(nodo.leftChild);
           return nodo;
    }

	// 0<=n<=m
	public void entreNiveles(int n, int m){
		
   }
		
}

