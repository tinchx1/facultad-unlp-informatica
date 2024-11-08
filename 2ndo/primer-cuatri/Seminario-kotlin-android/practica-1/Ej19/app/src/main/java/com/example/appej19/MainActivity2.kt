package com.example.appej19

import android.os.Bundle
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import android.content.Intent
import android.view.View
import android.widget.Toast
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity2 : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main2)
    }

    fun handleClick(view: View) {
        var number = intent.getIntExtra("number", 0)
        if (view.id == R.id.btnIncrementar) {
            number++
        } else if (view.id == R.id.btnDecrementar) {
            number--
        }
        if (number == -1) {
            Toast.makeText(this, "Error el numero no puede ser menor a 0", Toast.LENGTH_SHORT).show()
        } else {
            val i = Intent(this, MainActivity::class.java)
            i.putExtra("number", number)
            startActivity(i)
        }
    }
}
