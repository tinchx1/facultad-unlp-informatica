package com.example.lifecycleactivity

import android.annotation.SuppressLint
import android.content.Intent
import android.os.Bundle
import android.view.View
import android.widget.TextView
import androidx.activity.enableEdgeToEdge
import androidx.appcompat.app.AppCompatActivity
import androidx.core.view.ViewCompat
import androidx.core.view.WindowInsetsCompat

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
    @SuppressLint("SetTextI18n")
    override fun onDestroy() {
        super.onDestroy()
        (findViewById<View>(R.id.texto) as TextView).text = "HOLA MUNDO!"
        val i = Intent(this, MainActivity::class.java)
        this.startActivity(i)
    }
/*a) No, el mensaje "HOLA MUNDO!" no se verá en el TextView. Esto se debe a que la actividad está siendo destruida
justo después de cambiar el texto, y una nueva instancia se inicia inmediatamente después. Por lo tanto, el usuario
no tendrá tiempo de ver el cambio.

b) No, el uso de saveInstanceState / restoreInstanceState no resolverá este problema. Estos métodos se
utilizan para guardar y restaurar el estado de la actividad cuando se detiene y se reinicia, por ejemplo,
 cuando la actividad se recrea después de una rotación de pantalla. No afectarán al comportamiento actual,
 donde la actividad se destruye y se crea una nueva instancia.

c) Con respecto a la instancia de LifeCycleActivity, cada vez que inicias una nueva instancia
de MainActivity en el método onDestroy(), estás creando una nueva instancia de la actividad sin finalizar
la instancia actual. Esto puede causar una acumulación de instancias de MainActivity, lo que puede llevar a
problemas de rendimiento y memoria si no se gestionan correctamente. En general, iniciar una nueva actividad en el
método onDestroy() no es una práctica común y puede llevar a comportamientos inesperados en la aplicación.*/

}