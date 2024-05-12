package com.example.myapplication

import android.graphics.Color
import android.os.Bundle
import android.os.Handler
import android.widget.Button
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

class MainActivity : AppCompatActivity() {
    private var counter = 0
    private lateinit var handler: Handler
    private lateinit var runnable: Runnable
    private lateinit var stopButton: Button
    private var isTimerRunning = false
    private lateinit var handlerColorChange: Handler
    private lateinit var runnableColorChange: Runnable
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContentView(R.layout.activity_main)
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)) { v, insets ->
            val systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars())
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom)
            insets
        }
        val textView = findViewById<TextView>(R.id.counter)
        handler = Handler()
        handlerColorChange = Handler()
        runnable = Runnable {
            counter++
            textView.text = counter.toString()
            textView.setTextColor(Color.BLACK)
            handler.postDelayed(runnableColorChange, 500)
        }
        runnableColorChange = Runnable {
            textView.setTextColor(Color.RED)
            handler.postDelayed(runnable, 500)        }
        stopButton = findViewById(R.id.stopButton)

        stopButton.setOnClickListener {
            if (isTimerRunning) {
                stopTimer()
            } else {
                startTimer()
            }
        }

        startTimer()
    }
    private fun startTimer() {
        handlerColorChange.post(runnableColorChange)
        isTimerRunning = true
        stopButton.text = "Detener Temporizador"
    }

    private fun stopTimer() {
        handler.removeCallbacks(runnable)
        isTimerRunning = false
        stopButton.text = "Reanudar Temporizador"
    }

    override fun onDestroy() {
        super.onDestroy()
        stopTimer()
    }

}