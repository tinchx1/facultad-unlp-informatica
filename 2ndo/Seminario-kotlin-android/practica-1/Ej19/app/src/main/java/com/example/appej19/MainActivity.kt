package com.example.appej19

import android.annotation.SuppressLint
import android.os.Bundle
import android.view.View
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import android.content.Intent
import android.util.Log
import android.widget.TextView

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)

        val number = intent.getIntExtra("number", 0)
        val txtContador = findViewById<TextView>(R.id.txtContador)
        txtContador.text = number.toString()
    }

    fun handleClick(view: View) {
        val txtContador = findViewById<TextView>(R.id.txtContador)
        val number = txtContador.text.toString().toInt()
        val i = Intent(Intent.ACTION_VIEW)
        i.putExtra("number", number)
        startActivity(i)
    }
}