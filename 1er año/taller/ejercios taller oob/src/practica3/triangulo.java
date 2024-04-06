/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practica3;

/**
 *
 * @author tinch
 */
public class triangulo {
    double l1;
    double l2;
    double l3;
    String color;
    String borde;

    public double getL1() {
        return l1;
    }

    public void setL1(double l1) {
        this.l1 = l1;
    }

    public double getL2() {
        return l2;
    }

    public void setL2(double l2) {
        this.l2 = l2;
    }

    public double getL3() {
        return l3;
    }

    public void setL3(double l3) {
        this.l3 = l3;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getBorde() {
        return borde;
    }

    public void setBorde(String borde) {
        this.borde = borde;
    }

    public triangulo(double l1, double l2, double l3, String color, String borde) {
        this.l1 = l1;
        this.l2 = l2;
        this.l3 = l3;
        this.color = color;
        this.borde = borde;
    }
    public triangulo() {
    }
    
    public double getPerimetro(){
        return (l1 + l2 + l3);
    }
    
    public double getArea(){
        double s = getPerimetro()/2;
        return Math.sqrt(s*(s-l1)*(s-l2)*(s-l3));
    }
}
      

