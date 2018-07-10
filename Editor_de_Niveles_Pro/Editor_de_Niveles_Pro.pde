import controlP5.*;
import java.awt.Dimension;
import java.awt.Toolkit;

VentanaCuartos ventanaCuartos1;
VentanaAssets ventanaAssets1;
VentanaCapas ventanaCapas1;
SaveAndLoad saveAndLoad;



//Variables para obtener el alcho y largo de la aplicación
public int anchoAplicacion;
public int altoAplicacion;




void setup()
{
  Data exampleData = createExampleData(4, 1, 2, 2, 2, 2, 2);
  saveJSONObject(exampleData.toJSONObject(), "dataInJSON.json");

  Toolkit tk = Toolkit.getDefaultToolkit();
  Dimension tamanio=tk.getScreenSize();
  int ancho = (int)tamanio.getWidth();
  int alto =  (int)tamanio.getHeight();
 
  anchoAplicacion = 28*ancho/30;
  altoAplicacion = 5*alto/6;
  
  surface.setSize( anchoAplicacion , altoAplicacion);

  
 //Creación de Nuevos Objetos
 
  ventanaCuartos1= new VentanaCuartos(this);
  ventanaAssets1 = new VentanaAssets(this);
  ventanaCapas1 = new VentanaCapas(this);
  saveAndLoad = new SaveAndLoad(this);    

/*.....................Fin de la función Setup...................................*/
}


//Dibujando en Ventana
void draw()
{ 
  
  background(255,255,255);
  ventanaCuartos1.draw();
  ventanaAssets1.draw();
  ventanaCapas1.draw();;
}  
  
