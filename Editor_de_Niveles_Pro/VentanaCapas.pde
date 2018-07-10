 import controlP5.*;
 
public ControlP5  buttomCapas,buttomColisiones,buttomEscenas;
public ControlP5  buttomAddLayer,buttomAddCommonLayer,buttomDeleteLayer,buttomNext,buttomPreview;
ControlP5 contentSlider;
Slider slider;

public PImage capasDefault,capasForeground,capasLabel,colisionDefault,colisionForeground,colisionLabel,sceneDefault,
sceneForeground,sceneLabel;
   
public PImage addDefault,addForeground,addLabel,addLcDefault,addLcForeground,addLcLabel,deleteDefault,deleteForeground,deleteLabel;
public PImage nextDefault,nextForeground,nextLabel, previewDefault, previewForeground, previewLabel;
   
public PImage saveDefault,saveForeground,saveLabel,loadDefault,loadForeground,loadLabel;
/*........................................................*/

  
   
   
class VentanaCapas 
{
  public PGraphics buffer1 , buffer2, buffer3, buffer4, bufferVentana1;
  


  
  //Varias publicas de todas las coordenadas de lso botones
   public int coordsVentana1X=0;
   public int coordsVentana1Y=altoAplicacion/3 ;
   public int buffer1X=0;
   public int buffer1Y=altoAplicacion/3;


   public int coordsSliderX=anchoAplicacion/12;
   public int coordsSliderY=altoAplicacion/3+80;

  
   
   /*..........................................*/
   
   //ancho y largo delos canvas los canvas
   
  public int anchoBufferVentana1 =anchoAplicacion/5;
  public int altoBufferVentana1 = altoAplicacion-(altoAplicacion/3 );
  public int anchoBuffer1 = anchoAplicacion/5;
  public int altoBuffer1=30;
  public int anchoBuffer3= anchoAplicacion/5-20;
  public int altoBuffer3=30;
  public int anchoBuffer4=anchoAplicacion/5-20;
  public int altoBuffer4=altoAplicacion-(altoAplicacion/2+90);
  
  
  
  
 
  public int anchoRectVentana1=anchoAplicacion/5;
  public int altoRectVentana1=altoAplicacion-(altoAplicacion/3 +5);

  
  /*...............................................................*/


//Creación de los canvas
public VentanaCapas(Editor_de_Niveles_Pro sketch)
{
     buttomCapas = new ControlP5(sketch);
     buttomColisiones = new ControlP5(sketch);
     buttomEscenas = new ControlP5(sketch);
     
     buttomAddLayer= new ControlP5(sketch);
     buttomAddCommonLayer= new ControlP5(sketch);
     buttomDeleteLayer= new ControlP5(sketch);
  
     buttomNext= new ControlP5(sketch);
     buttomPreview= new ControlP5(sketch);
     contentSlider= new ControlP5(sketch);
     
      bufferVentana1=createGraphics(anchoBufferVentana1,altoBufferVentana1);
      buffer1= createGraphics(anchoBuffer1,altoBuffer1);;
      buffer3= createGraphics(anchoBuffer3,altoBuffer3);
      buffer4= createGraphics(anchoBuffer4,altoBuffer4);
      
      //Cargando imagenes y cambiando de tamaños


  capasDefault=loadImage("ButtomsVentana/capa/capaDefault.jpg");
  capasDefault.resize(50,40);
       
       
  capasForeground=loadImage("ButtomsVentana/capa/capaForeground.jpg");
  capasForeground.resize(50,40);
    
  capasLabel=loadImage("ButtomsVentana/capa/capaLabel.jpg");
  capasLabel.resize(50,40);
  
  /*.................................................*/

  
  colisionDefault=loadImage("ButtomsVentana/colisiones/colisionDefault.jpg");
  colisionDefault.resize(50,40);
  
  colisionForeground=loadImage("ButtomsVentana/colisiones/colisionForeground.jpg");
  colisionForeground.resize(50,40);
    
  colisionLabel=loadImage("ButtomsVentana/colisiones/colisionLabel.jpg");
  colisionLabel.resize(50,40);
  
   /*........................................................*/
   
  sceneDefault=loadImage("ButtomsVentana/escena/escenaDefault.jpg");
  sceneDefault.resize(50,40);
  
  sceneForeground=loadImage("ButtomsVentana/escena/escenaForeground.jpg");
  sceneForeground.resize(50,40);
  
  sceneLabel=loadImage("ButtomsVentana/escena/escenaLabel.jpg");
  sceneLabel.resize(50,40);
  
  
  /*........................................................*/
  
   addDefault=loadImage("ButtomsVentana/agregarLayer/addLayerDefault.jpg");
  addDefault.resize(50,40);
  
  addForeground=loadImage("ButtomsVentana/agregarLayer/addLayerForeground.jpg");
  addForeground.resize(50,40);
  
  addLabel=loadImage("ButtomsVentana/agregarLayer/addLayerLabel.jpg");
  addLabel.resize(50,40);
  
  
  /*........................................................*/
  
   addLcDefault=loadImage("ButtomsVentana/agregarLayerComun/addLcDefault.jpg");
  addLcDefault.resize(50,40);
  
  addLcForeground=loadImage("ButtomsVentana/agregarLayerComun/addLcForeground.jpg");
  addLcForeground.resize(50,40);
   
  addLcLabel=loadImage("ButtomsVentana/agregarLayerComun/addLcLabel.jpg");
  addLcLabel.resize(50,40);
  
  /*........................................................*/
  
   
  deleteDefault=loadImage("ButtomsVentana/eliminar/deleteDefault.jpg");
  deleteDefault.resize(50,40);
  
  
  deleteForeground=loadImage("ButtomsVentana/eliminar/deleteForeground.jpg");
  deleteForeground.resize(50,40);
  

  deleteLabel=loadImage("ButtomsVentana/eliminar/deleteLabel.jpg");
  deleteLabel.resize(50,40);
  
  /*........................................................*/
  
  
  nextDefault=loadImage("ButtomsVentana/next/NextDefault.jpg");
  nextDefault.resize(50,40);
  
  nextForeground=loadImage("ButtomsVentana/next/NextForeground.jpg");
  nextForeground.resize(50,40);
  
  nextLabel=loadImage("ButtomsVentana/next/NextLabel.jpg");
  nextLabel.resize(50,40);
  
  /*........................................................*/
  
  previewDefault=loadImage("ButtomsVentana/preview/PreviewDefault.jpg");
  previewDefault.resize(50,40);
  
  previewForeground=loadImage("ButtomsVentana/preview/PreviewForeground.jpg");
  previewForeground.resize(50,40);
  
  previewLabel=loadImage("ButtomsVentana/preview/PreviewLabel.jpg");
  previewLabel.resize(50,40);
  
  /*........................................................*/

/*........................................................*/
 
 
 
   buttomCapas.addButton("irSeccionCapas")
     .setPosition(10,30+altoAplicacion/3)
     .setSize(50,40)
     .setLabel("Capas")
     .setImages(capasDefault,capasForeground,capasLabel);
     
     
   buttomColisiones.addButton("irSeccionColisiones")
     .setPosition(60,altoAplicacion/3+30)
     .setSize(50,40)
     .setLabel("Colisiones")
     .setImages(colisionDefault,colisionForeground,colisionLabel);
     
   buttomEscenas.addButton("irSeccionEscenas")
     .setPosition(110,altoAplicacion/3+30)
     .setSize(50,40)
     .setLabel("Escenas")
     .setImages(sceneDefault,sceneForeground,sceneLabel);
     
  
   /*..........................................................................................................*/
   
   
   buttomAddLayer.addButton("addLayer")
     .setPosition(anchoAplicacion/5-155,altoAplicacion/3+170)
     .setSize(50,40)
     .setLabel("AddLay")
     .setImages(addDefault,addForeground,addLabel);
     
     
    buttomAddCommonLayer.addButton("addCommonLayer")
     .setPosition(anchoAplicacion/5-105,altoAplicacion/3+170)
     .setSize(50,40)
     .setLabel("AddCom")
     .setImages(addLcDefault,addLcForeground,addLcLabel);
     
     buttomDeleteLayer.addButton("deleteLayer")
     .setPosition(anchoAplicacion/5-55,altoAplicacion/3+170)
     .setSize(50,40)
     .setLabel("Delete")
     .setImages(deleteDefault,deleteForeground,deleteLabel);
     
     
     buttomNext.addButton("irSeccionSIGUIENTE")
     .setPosition(10,altoAplicacion/3+120)
     .setSize(50,40)
     .setLabel("Preview")
     .setImages(previewDefault,previewForeground,previewLabel);
     
     
      buttomPreview.addButton("irSeccionANTERIOR")
     .setPosition(60,altoAplicacion/3+120)
     .setSize(50,40)
     .setLabel("Next")
     .setImages(nextDefault,nextForeground,nextLabel);
     
 
   /*..........................................................................................................*/
   
    
  //Creando Slider y Botones de cuartos sus propiedades
  slider = contentSlider.addSlider("",100,0).setPosition(coordsSliderX,coordsSliderY).setRange(0,100).scrolled(0);
  slider.setSize(anchoBuffer1/2+17,30);
  slider.setScrollSensitivity(.1);
    
}
  
 
 

 /*...............................................................*/
 
   
  
  
 
 
 

//función para dibujar los canvas
void draw()
{
  
  
  bufferVentana1.beginDraw();
  bufferVentana1.fill(56,96,151);
  bufferVentana1.rect(0,0,anchoRectVentana1,altoRectVentana1);
  bufferVentana1.strokeWeight(5);
  bufferVentana1.endDraw();
  image(bufferVentana1, coordsVentana1X, coordsVentana1Y);
  
  //Canvas de la Parte superior
  buffer1.beginDraw();
  buffer1.background(0,0,0);
  buffer1.fill(255,255,255);
  buffer1.textSize(anchoBuffer1/17);
  PFont font1;
  font1=loadFont("AGaramondPro-Bold-18.vlw");
  textFont(font1);
  buffer1.text("CAPAS - COLISIONES - ESCENAS ",anchoBuffer1/15-10 ,20);
  buffer1.endDraw();
  image(buffer1,buffer1X,buffer1Y );

  
    /*........................................................*/
  
  //Canvas del Slider
  buffer3.beginDraw();
  buffer3.background(0,0,0);
  buffer3.fill(255,255,255);
  buffer3.textSize(anchoBuffer3/17);
  buffer3.textFont(font1);
  buffer3.text(" OPACIDAD ",7,22);
  buffer3.endDraw();
  image(buffer3,10,80+altoAplicacion/3);
   /*........................................................*/
  
  //Canvas del Area de Layer Capas-Colsiones -Escenas
  buffer4.beginDraw();
  buffer4.background(0,0,0);
  buffer4.endDraw();
  image(buffer4,10,altoAplicacion/2+70);
   /*........................................................*/

  

}

/*..........Fin del metodo Draw...........*/



}
/*..........Fin de la Clase DrawCanavs...........*/
