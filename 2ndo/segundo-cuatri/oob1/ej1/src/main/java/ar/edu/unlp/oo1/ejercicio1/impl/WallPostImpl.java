package ar.edu.unlp.oo1.ejercicio1.impl;

import ar.edu.unlp.oo1.ejercicio1.WallPost;

/**
 * Completar esta clase de acuerdo a lo especificado en el cuadernillo
 *
 */
public class WallPostImpl implements WallPost {
    private int likes;
    private String text;
    private boolean featured;

    /**
     * Complete con su implementación
     */

    @Override
    public void dislike() {
        // TODO Auto-generated method stub
        if (this.getLikes() > 0) {
            this.likes--;
        }
    }

    @Override
    public int getLikes() {
        // TODO Auto-generated method stub
        return this.likes;
    }

    @Override
    public String getText() {
        return this.text;
    }
    @Override
    public boolean isFeatured() {
        // TODO Auto-generated method stub
        return this.featured;
    }
    @Override
    public void like() {
        // TODO Auto-generated method stub
        this.likes++;    
    }
    @Override
    public void setText(String text) {
        // TODO Auto-generated method stub
        this.text = text;
    }
    @Override
    public void toggleFeatured() {
        // TODO Auto-generated method stub
    this.featured = !this.featured;    
    }
    

    /*
     * Este mensaje se utiliza para que una instancia de Wallpost se muestre de
     * forma adecuada
     */
    @Override
    public String toString() {
        return "WallPost {" +
                "text: " + getText() +
                ", likes: '" + getLikes() + "'" +
                ", featured: '" + isFeatured() + "'" +
                "}";
    }

}
