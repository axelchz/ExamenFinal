 import controlP5.*;

ControlP5 buttomSave,buttomLoad;


class SaveAndLoad
{
  
  public SaveAndLoad (Editor_de_Niveles_Pro sketch)
  {
     
  buttomSave =new ControlP5(sketch);
  buttomLoad=new ControlP5(sketch);

  
  /*........................................................*/
  
  
  loadDefault=loadImage("ButtomLoad/ButtomLoadDefault.jpg");
  loadDefault.resize(anchoAplicacion/10,40);
  
  loadForeground=loadImage("ButtomLoad/ButtomLoadForeground.jpg");
  loadForeground.resize(anchoAplicacion/10,40);
  
  loadLabel=loadImage("ButtomLoad/ButtomLoadLabel.jpg");
  loadLabel.resize(anchoAplicacion/10,40);
  
    /*........................................................*/
    
    
    
  saveDefault=loadImage("ButtomSave/ButtomSaveDefault.jpg");
  saveDefault.resize(anchoAplicacion/10,40);
  
  saveForeground=loadImage("ButtomSave/ButtomSaveForeground.jpg");
  saveForeground.resize(anchoAplicacion/10,40);
  
  saveLabel=loadImage("ButtomSave/ButtomSaveLabel.jpg");
  saveLabel.resize(anchoAplicacion/10,40);
    
    buttomSave.addButton("Save")
     .setPosition(anchoAplicacion/2-200,0)
     .setSize(anchoAplicacion/10,40)
     .setLabel("Guardar")
     .setImages(saveDefault,saveForeground,saveLabel);
     
           
     buttomLoad.addButton("Load")
     .setPosition(anchoAplicacion/2-40,0)
     .setSize(anchoAplicacion/10,40)
     .setLabel("Cargar")
     .setImages(loadDefault,loadForeground,loadLabel);
  
  }
  

  
  
}
