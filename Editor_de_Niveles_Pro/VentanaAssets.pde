import controlP5.*;

public ControlP5 buttomAddAssets,buttomDeleteAssets,buttomNextAssets,buttomPreviewAssets;
public PImage  addAssetsDefault,addAssetsForeground,addAssetsLabel,deleteAssetsDefault,deleteAssetsForeground,deleteAssetsLabel,
nextAssetsDefault,nextAssetsForeground,nextAssetsLabel,previewAssetsDefault,previewAssetsForeground,previewAssetsLabel;


class VentanaAssets
{
  
     
     public PGraphics ventanaAssets,bufferNombre;
     
     public int coordsVentanaAssetsX=anchoAplicacion-anchoAplicacion/5 ;
     public int coordsVentanaAssetsY=0 ;
     public int coordsBufferNombreX=coordsVentanaAssetsX;
     public int coordsBufferNombreY=coordsVentanaAssetsY;
     
     
     public int anchoVentanaAssets=anchoAplicacion/5;
     public int altoVentanaAssets= altoAplicacion-(2*altoAplicacion/3 );
     public int anchoBufferNombre= anchoAplicacion/5;
     public int altoBufferNombre = 30;


    public VentanaAssets (Editor_de_Niveles_Pro sketch)
    {
       buttomAddAssets=new ControlP5(sketch);
       buttomDeleteAssets= new ControlP5(sketch);
       buttomNextAssets= new ControlP5(sketch);
       buttomPreviewAssets= new ControlP5(sketch);
      
      
      ventanaAssets=createGraphics(anchoVentanaAssets,altoVentanaAssets);
      bufferNombre=createGraphics(anchoBufferNombre,altoBufferNombre);
      
      
  addAssetsDefault=loadImage("ButtomsAssets/ButtomsAddAssets/AddDefault.jpg");
  addAssetsDefault.resize(50,40);
  
  addAssetsForeground=loadImage("ButtomsAssets/ButtomsAddAssets/AddForeground.jpg");
  addAssetsForeground.resize(50,40);
  
  addAssetsLabel=loadImage("ButtomsAssets/ButtomsAddAssets/AddLabel.jpg");
  addAssetsLabel.resize(50,40);
  
  /*........................................................*/
  
  
  
  deleteAssetsDefault=loadImage("ButtomsAssets/ButtomsDeleteAssets/deleteDefault.jpg");
  deleteAssetsDefault.resize(50,40);
  
  deleteAssetsForeground=loadImage("ButtomsAssets/ButtomsDeleteAssets/deleteForeground.jpg");
  deleteAssetsForeground.resize(50,40);
  
  deleteAssetsLabel=loadImage("ButtomsAssets/ButtomsDeleteAssets/deleteLabel.jpg");
  deleteAssetsLabel.resize(50,40);
  
  /*........................................................*/

 
  nextAssetsDefault=loadImage("ButtomsAssets/ButtomsNextAssets/NextDefault.jpg");
  nextAssetsDefault.resize(50,40);
  
  nextAssetsForeground=loadImage("ButtomsAssets/ButtomsNextAssets/NextForeground.jpg");
  nextAssetsForeground.resize(50,40);
  
  nextAssetsLabel=loadImage("ButtomsAssets/ButtomsNextAssets/NextLabel.jpg");
  nextAssetsLabel.resize(50,40);
  
  /*........................................................*/
 
  previewAssetsDefault=loadImage("ButtomsAssets/ButtomsPreviewAssets/PreviewDefault.jpg");
  previewAssetsDefault.resize(50,40);
  
  previewAssetsForeground=loadImage("ButtomsAssets/ButtomsPreviewAssets/PreviewForeground.jpg");
  previewAssetsForeground.resize(50,40);
  
  previewAssetsLabel=loadImage("ButtomsAssets/ButtomsPreviewAssets/PreviewLabel.jpg");
  previewAssetsLabel.resize(50,40);
  
  /*........................................................*/
  
      
     
  buttomAddAssets.addButton("agregarAssets")
     .setPosition(coordsVentanaAssetsX,coordsVentanaAssetsY+30)
     .setSize(50,40)
     .setLabel("Add")
     .setImages(addAssetsDefault,addAssetsForeground,addAssetsLabel);

  
  
  buttomDeleteAssets.addButton("eliminarAssets")
     .setPosition(coordsVentanaAssetsX+50,coordsVentanaAssetsY+30)
     .setSize(50,40)
     .setLabel("Delete")
     .setImages(deleteAssetsDefault,deleteAssetsForeground,deleteAssetsLabel);
     
     
  buttomNextAssets.addButton("PassNextAssets")
     .setPosition(anchoAplicacion-51,coordsVentanaAssetsY+30)
     .setSize(50,40)
     .setLabel("Next")
     .setImages(nextAssetsDefault,nextAssetsForeground,nextAssetsLabel);
     
     
  buttomPreviewAssets.addButton("PassPreviewAssets")
     .setPosition(anchoAplicacion-101,coordsVentanaAssetsY+30)
     .setSize(50,40)
     .setLabel("Preview")
     .setImages(previewAssetsDefault,previewAssetsForeground,previewAssetsLabel);
     
   /*..........................................................................................................*/
  
      
    }




void draw()
{
  
  ventanaAssets.beginDraw();
  ventanaAssets.background(255,255,125);
  ventanaAssets.fill(255,255,125);
  ventanaAssets.endDraw();
  image(ventanaAssets, coordsVentanaAssetsX, coordsVentanaAssetsY);
  
  
  
  bufferNombre.beginDraw();
  bufferNombre.background(0,0,0);
  bufferNombre.fill(255,255,255);
  bufferNombre.textSize(anchoBufferNombre/16);
  PFont font1;
  font1=loadFont("AGaramondPro-Bold-18.vlw");
  textFont(font1);
  bufferNombre.text(" ASSETS ",120,20);
  bufferNombre.endDraw();
  image(bufferNombre,coordsBufferNombreX,coordsBufferNombreY );
  
 
  

}



}
