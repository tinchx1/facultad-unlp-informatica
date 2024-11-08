package com.example.myapplication

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.view.View
import androidx.activity.enableEdgeToEdge
import androidx.annotation.RequiresApi
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat
import java.text.SimpleDateFormat
import java.time.LocalTime
import java.util.Date

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
    }
    @RequiresApi(Build.VERSION_CODES.O)
    fun handleTime(view: View) {
        val currentTime = LocalTime.now()
        Log.d("MainActivity", currentTime.toString())
    }

    @SuppressLint("SimpleDateFormat")
    fun handleDate(view: View) {
        val currentDate = Date()
        val sdf = SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
        val formattedDate = sdf.format(currentDate)
        val i = Intent(this,MainActivity2::class.java)
        i.putExtra("date", formattedDate)
        startActivity(i)
    }
}