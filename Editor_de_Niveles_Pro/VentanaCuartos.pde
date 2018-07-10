import controlP5.*;

public ControlP5 buttomAddRooms,buttomDeleteRooms,buttomNextRooms,buttomPreviewRooms;
public PImage  addRoomsDefault,addRoomsForeground,addRoomsLabel,deleteRoomsDefault,deleteRoomsForeground,deleteRoomsLabel,
nextRoomsDefault,nextRoomsForeground,nextRoomsLabel,previewRoomsDefault,previewRoomsForeground,previewRoomsLabel;

class VentanaCuartos
{
  
     
     public PGraphics ventanaCuartos,bufferNombre;
     
     public int coordsVentanaCuartosX=0 ;
     public int coordsVentanaCuartosY=0 ;
     public int coordsBufferNombreX=coordsVentanaCuartosX;
     public int coordsBufferNombreY=coordsVentanaCuartosY;
     
     
     public int anchoVentanaCuartos=anchoAplicacion/5;
     public int altoVentanaCuartos= altoAplicacion-(2*altoAplicacion/3 );
     public int anchoBufferNombre= anchoAplicacion/5;
     public int altoBufferNombre = 30;


    public VentanaCuartos(Editor_de_Niveles_Pro sketch)
    {
      
 buttomAddRooms=new ControlP5(sketch);
  buttomDeleteRooms= new ControlP5(sketch);
  buttomNextRooms= new ControlP5(sketch);
  buttomPreviewRooms= new ControlP5(sketch);
      
  ventanaCuartos=createGraphics(anchoVentanaCuartos,altoVentanaCuartos);
  bufferNombre=createGraphics(anchoBufferNombre,altoBufferNombre);
      
  addRoomsDefault=loadImage("ButtomsRooms/ButtomsAddRooms/AddDefault.jpg");
  addRoomsDefault.resize(50,40);
  
  addRoomsForeground=loadImage("ButtomsRooms/ButtomsAddRooms/AddForeground.jpg");
  addRoomsForeground.resize(50,40);
  
  addRoomsLabel=loadImage("ButtomsRooms/ButtomsAddRooms/AddLabel.jpg");
  addRoomsLabel.resize(50,40);
  
  /*........................................................*/

  
  deleteRoomsDefault=loadImage("ButtomsRooms/ButtomsDeleteRooms/deleteDefault.jpg");
  deleteRoomsDefault.resize(50,40);
  
  deleteRoomsForeground=loadImage("ButtomsRooms/ButtomsDeleteRooms/deleteForeground.jpg");
  deleteRoomsForeground.resize(50,40);
  
  deleteRoomsLabel=loadImage("ButtomsRooms/ButtomsDeleteRooms/deleteLabel.jpg");
  deleteRoomsLabel.resize(50,40);
  
  /*........................................................*/

  
  nextRoomsDefault=loadImage("ButtomsRooms/ButtomsNextRooms/NextDefault.jpg");
  nextRoomsDefault.resize(50,40);
  
  nextRoomsForeground=loadImage("ButtomsRooms/ButtomsNextRooms/NextForeground.jpg");
  nextRoomsForeground.resize(50,40);
  
  nextRoomsLabel=loadImage("ButtomsRooms/ButtomsNextRooms/NextLabel.jpg");
  nextRoomsLabel.resize(50,40);
  
  /*........................................................*/

  
  previewRoomsDefault=loadImage("ButtomsRooms/ButtomsPreviewRooms/PreviewDefault.jpg");
  previewRoomsDefault.resize(50,40);
  
  previewRoomsForeground=loadImage("ButtomsRooms/ButtomsPreviewRooms/PreviewForeground.jpg");
  previewRoomsForeground.resize(50,40);
  
  previewRoomsLabel=loadImage("ButtomsRooms/ButtomsPreviewRooms/PreviewLabel.jpg");
  previewRoomsLabel.resize(50,40);
  
  
  /*........................................................*/
  
  /*..........................................................................................................*/

  buttomAddRooms.addButton("agregarCuartos")
     .setPosition(coordsVentanaCuartosX,coordsVentanaCuartosY+30)
     .setSize(50,40)
     .setLabel("Add")
     .setImages(addRoomsDefault,addRoomsForeground,addRoomsLabel);
     
  
  buttomDeleteRooms.addButton("eliminarCuartos")
     .setPosition(coordsVentanaCuartosX+50,coordsVentanaCuartosY+30)
     .setSize(50,40)
     .setLabel("Delete")
     .setImages(deleteRoomsDefault,deleteRoomsForeground,deleteRoomsLabel);
     
     
  buttomNextRooms.addButton("PassNextRooms")
     .setPosition(anchoVentanaCuartos-53,coordsVentanaCuartosY+30)
     .setSize(50,40)
     .setLabel("Next")
     .setImages(nextRoomsDefault,nextRoomsForeground,nextRoomsLabel);
     
     
  buttomPreviewRooms.addButton("PassPreviewRooms")
     .setPosition(anchoVentanaCuartos-103,coordsVentanaCuartosY+30)
     .setSize(50,40)
     .setLabel("Preview")
     .setImages(previewRoomsDefault,previewRoomsForeground,previewRoomsLabel);
      
  
    /*..........................................................................................................*/
      
    }




void draw()
{
  
  ventanaCuartos.beginDraw();
  ventanaCuartos.background(0,255,0);
  ventanaCuartos.fill(35,192,84);
  ventanaCuartos.rect(coordsVentanaCuartosX,coordsVentanaCuartosY,anchoVentanaCuartos,altoVentanaCuartos);
  ventanaCuartos.strokeWeight(8);
  ventanaCuartos.endDraw();
  image(ventanaCuartos, coordsVentanaCuartosX, coordsVentanaCuartosY);
  
  
  
  bufferNombre.beginDraw();
  bufferNombre.background(0,0,0);
  bufferNombre.fill(255,255,255);
  bufferNombre.textSize(anchoBufferNombre/16);
  PFont font1;
  font1=loadFont("AGaramondPro-Bold-18.vlw");
  textFont(font1);
  bufferNombre.text(" CUARTOS ",100,20);
  bufferNombre.endDraw();
  image(bufferNombre,coordsBufferNombreX,coordsBufferNombreY );
  

}





}
