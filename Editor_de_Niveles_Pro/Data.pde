//__________________________________________________________________________________________
//
//                           D         A         T         A
//__________________________________________________________________________________________
public class Data
{
  String name;
  int idCount;
  
  ArrayList<Asset> assets;
  ArrayList<Room> rooms;
  
  
  // Constructor de interfaz
  Data()
  {
    idCount = 0;
    assets = new ArrayList<Asset>();
    rooms = new ArrayList<Room>();
  }
  
  // Constructor de JSON
  Data(String JSONPath)
  {
    Data data = new Data();
    JSONObject dataInJSON = loadJSONObject(JSONPath);
    JSONArray assetsInJSON = dataInJSON.getJSONArray("assets");
    JSONArray roomsInJSON = dataInJSON.getJSONArray("rooms");
    
    data.name = dataInJSON.getString("name");
    data.idCount = dataInJSON.getInt("idCount");
    
    for (int i = 0; i < assetsInJSON.size(); i++)
    {
      addAsset(assetsInJSON.getJSONObject(i));
    }
    
    for (int i = 0; i < roomsInJSON.size(); i++)
    {
      addRoom(roomsInJSON.getJSONObject(i));
    }
  }
  
  // Usado para darle IDs a assets creados con el método 'addAsset'
  int giveId()
  {
    idCount++;
    return idCount;
  }
  
  // Agregar un ROOM mediante interfaz
  Room addRoom(String name)
  {
    Room tempRoom = new Room(name, "rooms/missingRoom.png");
    
    rooms.add (tempRoom);
    
    return tempRoom;
  }
  
  // Agregar un ROOM mediante JSON
  Room addRoom(JSONObject roomInJSON)
  {
    Room tempRoom = new Room(roomInJSON);
    
    rooms.add(tempRoom);
    
    return tempRoom;
  }
  
  // Agregar un ASSET mediante interfaz
  Asset addAsset(String name, String diffusePath)
  {
    Asset tempAsset = new Asset(giveId(), name, diffusePath);
    
    assets.add(tempAsset);
    
    return tempAsset;
  }
  
  // Agregar un ASSET mediante JSON
  Asset addAsset(JSONObject assetInJSON)
  {
    Asset tempAsset = new Asset(assetInJSON);
    
    assets.add(tempAsset);
    
    return tempAsset;
  }
  
  // String de debug
  String toString()
  {
    return (getClass() + " - Nombre: " + name + " - con " + assets.size() + " assets y " + rooms.size() + " cuartos.");
  }
  
  // Conversión a JSON
  JSONObject toJSONObject(String savePath)
  {
    JSONObject dataInJSON = new JSONObject();
    
    JSONArray assetsInJSON = new JSONArray();
    JSONArray roomsInJSON = new JSONArray();
    
    dataInJSON
      .setString("name", name)
      .setInt("IdCount", idCount)
      ;
    
    for (int i = 0; i < assets.size(); i++)
    { assetsInJSON.setJSONObject(i, assets.get(i).toJSONObject()); }
    
    for (int i = 0; i < rooms.size(); i++)
    { roomsInJSON.setJSONObject(i, rooms.get(i).toJSONObject()); }
    
    dataInJSON
      .setJSONArray("assets", assetsInJSON)
      .setJSONArray("rooms", roomsInJSON)
      ;
    
    if (savePath != "")
    {
      saveJSONObject(dataInJSON, savePath);
    }
    
    return dataInJSON;
  }
  
  JSONObject toJSONObject()
  {
    return this.toJSONObject("");
  }
  
  void createJSONDocument(String path)
  {
    saveJSONObject(toJSONObject(), path);
  }
  
  
  
  
  /*-----------------------------------------------------------------------
                       A      S      S      E      T
  -----------------------------------------------------------------------*/
  
  
  
  class Asset 
  {
    int id;
    String name;
    String diffusePath;
    PImage diffuseTexture;
    
    ArrayList<Sprite> sprites;
    
    //Cconstructor de interfaz
    Asset(int id, String name, String diffusePath)
    {
      this.id = id;
      this.name = name;
      
      setDiffuseTexture(diffusePath);
    }
    
    //Constructor de JSON
    Asset(JSONObject assetInJSON)
    {
      this(assetInJSON.getInt("id"), assetInJSON.getString("name"), assetInJSON.getString("diffusePath"));
    }
    
    //Método para definir la textura y su path a la vez. Usado por el constructor y la interfaz
    void setDiffuseTexture(String diffusePath)
    {
      this.diffusePath = diffusePath;
      diffuseTexture = loadImage(diffusePath);
    }
    
    //String de debug
    String toString()
    {
      return (getClass() + " - Nombre: " + name + " - Textura: " + diffusePath);
    }
    
    //Conversión a JSON
    JSONObject toJSONObject()
    {
      JSONObject assetInJSON = new JSONObject();
      
      assetInJSON
        .setString("name", name)
        .setString("diffusePath", diffusePath);
        ;
      
      return assetInJSON;
    }
  }
  
  
  
  
  /*-----------------------------------------------------------------------
                          R       O       O       M
  -----------------------------------------------------------------------*/
  
  
  
  class Room 
  {
    String name;
    String thumbnailPath;
    PImage thumbnail;
    
    ArrayList<LayerGroup> layerGroups;
    MainCollision mainCollision;
    ArrayList<CommonCollision> commonCollisions;
    MainScene mainScene;
    ArrayList<CommonScene> commonScenes;
    
    //Constructor de interfaz
    //Convocar SÓLO desde 'addRoom' en una instancia de DATA
    Room(String name, String thumbnailPath)
    {
      this.name = name;
      setThumbnail(thumbnailPath);
      
      mainCollision = new MainCollision("Colisión Principal");
      mainScene = new MainScene("Límites del cuarto");
      
      layerGroups = new ArrayList<LayerGroup>();
      commonCollisions = new ArrayList<CommonCollision>();
      commonScenes = new ArrayList<CommonScene>();
    }
    
    //Constructor de JSON
    Room(JSONObject roomInJSON)
    {
      this(roomInJSON.getString("name"), roomInJSON.getString("thumbnailPath"));
      
      JSONArray layerGroupsInJSON = roomInJSON.getJSONArray("layerGroups");
      JSONArray commonCollisionsInJSON = roomInJSON.getJSONArray("commonCollisions");
      JSONArray commonScenesInJSON = roomInJSON.getJSONArray("commonScenes");
      
      for (int i = 0; i < layerGroupsInJSON.size(); i++)
      {
        addLayerGroup(layerGroupsInJSON.getJSONObject(i));
      }
      
      for (int i = 0; i < commonCollisionsInJSON.size(); i++)
      {
        
      }

      for (int i = 0; i < commonScenesInJSON.size(); i++)
      {
        
      }
    }
    
    //Para definirt el thumbnail y su path a la vez
    void setThumbnail(String path)
    {
      thumbnailPath = path;
      thumbnail = loadImage(path);
    }
    
    //Agrega un LAYERGROUP desde la interfaz
    LayerGroup addLayerGroup(String name)
    {
      LayerGroup tempLayerGroup = new LayerGroup(name);
      
      layerGroups.add(tempLayerGroup);
      
      return tempLayerGroup;
    }
    
    //Agrega un LAYERGROUP desde JSON
    LayerGroup addLayerGroup(JSONObject layerGroupInJSON)
    {
      return this.addLayerGroup(layerGroupInJSON.getString("name"));
    }
    
    //Agrega un COMMONCOLLISION desde la interfaz
    CommonCollision addCommonCollision(String name) 
    {
      CommonCollision tempCommonCollision = new CommonCollision(name);
      
      commonCollisions.add(tempCommonCollision);
      
      return tempCommonCollision;
    }
    
    //Agrega un COMMONSCENE desde la interfaz
    CommonScene addCommonScene(String name)
    {
      CommonScene  tempCommonScene = new CommonScene(name);
      
      commonScenes.add(tempCommonScene);
      
      return tempCommonScene;
    }
    
    //String de debug
    String toString()
    {
      return (getClass() + " - Nombre: " + name + " - con " + layerGroups.size() + " grupos de capas, " + 
        commonCollisions.size() + " colisiones y " + commonScenes.size() + " escenas.");
    }
    
    //Conversión a JSON
    JSONObject toJSONObject()
    {
      JSONObject roomInJSON = new JSONObject();
      
      JSONArray layerGroupsInJSON = new JSONArray();
      JSONObject mainCollisionInJSON = new JSONObject();
      JSONArray commonCollisionsInJSON = new JSONArray();
      JSONObject mainSceneInJSON = new JSONObject();
      JSONArray commonScenesInJSON = new JSONArray();
      
      roomInJSON
        .setString("name", name)
        .setString("thumbnailPath", thumbnailPath)
        ;
      
      for (int i = 0; i < layerGroups.size(); i++)
      { layerGroupsInJSON.setJSONObject(i, layerGroups.get(i).toJSONObject()); }
      
      mainCollisionInJSON = mainCollision.toJSONObject();
      
      for (int i = 0; i < commonCollisions.size(); i++)
      { commonCollisionsInJSON.setJSONObject(i, commonCollisions.get(i).toJSONObject()); }
      
      mainSceneInJSON = mainScene.toJSONObject();
      
      for (int i = 0; i < commonScenes.size(); i++)
      { commonScenesInJSON.setJSONObject(i, commonScenes.get(i).toJSONObject()); }
      
      roomInJSON
        .setJSONArray("layerGroups", layerGroupsInJSON)
        .setJSONObject("mainCollision", mainCollisionInJSON)
        .setJSONArray("commonCollisions", commonCollisionsInJSON)
        .setJSONObject("mainScene", mainSceneInJSON)
        .setJSONArray("commonScenes", commonScenesInJSON)
        ;
      
      return roomInJSON;
    }
  }
  
  
  
  

  /*-----------------------------------------------------------------------
                       L      A      Y      E      R
  -----------------------------------------------------------------------*/
  
  
  
  //ABSTRACT: Padre de LAYERGROUP Y COMMONLAYER
  abstract class Layer
  {
    String name;
    Boolean unlocked, visible;
    
    //Constructor
    Layer(String name, Boolean unlocked, Boolean visible)
    {
      this.name = name;
      this.unlocked = unlocked;
      this.visible = visible;
    }
    
    Layer(String name)
    {
      this(name, true, true);
    }
    
    //Constructor de JSON
    Layer(JSONObject layerInJSON)
    {
      this(layerInJSON.getString("name"), layerInJSON.getBoolean("unlocked"), layerInJSON.getBoolean("visible"));
    }
    
    //Conversión a JSON
    JSONObject toJSONObject()
    {
      JSONObject layerInJSON = new JSONObject();
      
      layerInJSON
        .setString("name", name)
        .setBoolean("unlocked", unlocked)
        .setBoolean("visible", visible)
        ;
      
      return layerInJSON;
    }
  }
  
  
 
/*-----------------------------------------------------------------------
             L    A    Y    E    R    G    R    O    U    P
  -----------------------------------------------------------------------*/
  
  
  
  class LayerGroup extends Layer
  {
    ArrayList<CommonLayer> commonLayers;
    
    //Constructor para interfaz
    //Convocar SÓLO desde 'addLayerGroup' desde ROOM
    LayerGroup(String name, Boolean unlocked, Boolean visible)
    { super(name, unlocked, visible); commonLayers = new ArrayList<CommonLayer>(); }
    
    LayerGroup(String name)
    { this(name, true, true); }
    
    //Constructor de JSON
    LayerGroup(JSONObject layerGroupInJSON)
    { 
      super(layerGroupInJSON);
      commonLayers = new ArrayList<CommonLayer>();
      
      JSONArray commonLayersInJSON = layerGroupInJSON.getJSONArray("commonLayers");
      
      for (int i = 0; i < commonLayersInJSON.size(); i++)
      {
        addCommonLayer(commonLayersInJSON.getJSONObject(i));
      }
    }
    
    //Agrega un COMMONLAYER desde la interfaz
    CommonLayer addCommonLayer(String name)
    {
      CommonLayer tempCommonLayer = new CommonLayer(name);
      
      commonLayers.add(tempCommonLayer);
      
      return tempCommonLayer;
    }
    
    //Agrega un COMMONLAYER desde JSON
    CommonLayer addCommonLayer(JSONObject commonLayerInJSON)
    {
      CommonLayer tempCommonLayer = new CommonLayer(commonLayerInJSON);
      
      commonLayers.add(tempCommonLayer);
      
      return tempCommonLayer;
    }
    
    //Convierte a JSON
    JSONObject toJSONObject()
    {
      JSONObject layerGroupInJSON = super.toJSONObject();
      
      JSONArray commonLayersInJSON = new JSONArray();
      
      for (int i = 0; i < commonLayers.size(); i++)
      { commonLayersInJSON.setJSONObject(i, commonLayers.get(i).toJSONObject()); }
      
      layerGroupInJSON.setJSONArray("commonLayers", commonLayersInJSON);
      
      return layerGroupInJSON;
    }
  }




/*-----------------------------------------------------------------------
           C    O    M    M    O    N    L    A    Y    E    R
  -----------------------------------------------------------------------*/



  class CommonLayer extends Layer
  {
    ArrayList<Sprite> sprites;
    
    //Constructor para interfaz
    //Invocar SÓLO con 'addCommonLaye' desde GROUPLAYER
    CommonLayer(String name, Boolean unlocked, Boolean visible)
    { super(name, unlocked, visible); sprites = new ArrayList<Sprite>(); }
    
    CommonLayer(String name)
    { this(name, false, false); }
    
    //Constructor desde JSON
    CommonLayer(JSONObject commonLayerInJSON)
    { 
      super(commonLayerInJSON);
      sprites = new ArrayList<Sprite>();
      
      JSONArray spritesInJSON = commonLayerInJSON.getJSONArray("sprites");
      
      for (int i = 0; i < spritesInJSON.size(); i++)
      {
        addSprite(spritesInJSON.getJSONObject(i));
      }
    }
    
    //Agregar un SPRITE desde la interfaz
    Sprite addSprite(PVector position, Asset rootAsset, CommonLayer rootLayer)
    {
      Sprite tempSprite = new Sprite(position, rootAsset, rootLayer);
      
      sprites.add(tempSprite);
      
      return tempSprite;
    }
    
    Sprite addSprite(PVector position, float rotation, int rootAssetId, CommonLayer rootLayer)
    {
      Sprite tempSprite = new Sprite(position, rotation, rootAssetId, rootLayer);
      
      sprites.add(tempSprite);
      
      return tempSprite;
    }

    //Agregar un SPRITE desde JSON
    Sprite addSprite(JSONObject spriteInJSON)
    {
      Sprite tempSprite = new Sprite(spriteInJSON, this);
      
      sprites.add(tempSprite);
      
      return tempSprite;
    }
    
    //Convierte a JSON
    JSONObject toJSONObject()
    {
      JSONObject commonLayerInJSON = super.toJSONObject();
      
      JSONArray spritesInJSON = new JSONArray();
      
      for (int i = 0; i < sprites.size(); i++)
      { spritesInJSON.setJSONObject(i, sprites.get(i).toJSONObject()); }
      
      commonLayerInJSON.setJSONArray("sprites", spritesInJSON);
      
      return commonLayerInJSON;
    }
  }
  
  
  
  
/*-----------------------------------------------------------------------
                         S   P   R   I   T   E   S
  -----------------------------------------------------------------------*/
  
  
  
  class Sprite
  {
    PVector position;
    float rotation;
    int rootAssetId;
    
    Asset rootAsset;
    CommonLayer rootLayer;
    
    //Constructor para interfaz
    //Invocar SÓLO desde 'addSprite' desde COMMONLAYER
    Sprite(PVector position, Asset rootAsset, CommonLayer rootLayer)
    {
      this.position = position;
      this.rootAsset = rootAsset;
      this.rootLayer = rootLayer;
      
      this.rootAssetId = rootAsset.id;
    }
    
    Sprite(PVector position, float rotation, int rootAssetId, CommonLayer rootLayer)
    {
      this.position = position;
      this.rotation = rotation;
      this.rootLayer = rootLayer;
    }
    
    //Constructor desde JSON
    Sprite(JSONObject spriteInJSON, CommonLayer rootLayer)
    {
      this(JSONObjectToPVector(spriteInJSON.getJSONObject("position")), spriteInJSON.getFloat("rotation"), spriteInJSON.getInt("rootAssetId"), rootLayer);
    }
    
    //Convertir a JSON
    JSONObject toJSONObject()
    {
      JSONObject spriteInJSON = new JSONObject();
      JSONObject positionInJSON = PVectorToJSONObject(position);
      
      
      spriteInJSON
        .setJSONObject("position", positionInJSON)
        .setFloat("rotation", rotation)
        .setInt("rootAssetId", rootAssetId)
        ;
      
      return spriteInJSON;
    }
  }
  
  

/*-----------------------------------------------------------------------
                 C   O   L   L   I   S   I   O   N
  -----------------------------------------------------------------------*/
 
 
 
  ///ABSTRACT: Padre de MAINCOLLISION y COMMONCOLLISION
  abstract class Collision
  {
    String name;
    Boolean unlocked, visible;
    
    ArrayList<PVector> dots;
    
    //Constructor para interfaz
    Collision(String name, Boolean unlocked, Boolean visible, ArrayList<PVector> dots)
    {
      this.name = name;
      this.unlocked = unlocked;
      this.visible = visible;
      this.dots = dots;
    }
    
    Collision(String name)
    {
      this(name, true, true, new ArrayList<PVector>());
    }
    
    //Conversión a JSON
    JSONObject toJSONObject()
    {
      JSONObject collisionInJSON = new JSONObject();
      JSONArray dotsInJSON = new JSONArray();
      
      collisionInJSON
        .setString("name", name)
        .setBoolean("unlocked", unlocked)
        .setBoolean("visible", visible)
        ;
      
      for (int i = 0; i < dots.size(); i++)
      {
        JSONObject dotInJSON = PVectorToJSONObject(dots.get(i));
        
        dotsInJSON.setJSONObject(i, dotInJSON);
      }
      
      collisionInJSON.setJSONArray("Dots", dotsInJSON);
      
      return collisionInJSON;
    }
  }
  
  
  
  
/*-----------------------------------------------------------------------
                  M  A  I  N  C  O  L  L  I  S  I  O  N
  -----------------------------------------------------------------------*/
  
  
  
  
  class MainCollision extends Collision
  {
    MainCollision(String name, Boolean unlocked, Boolean visible, ArrayList<PVector> dots)
    { super(name, unlocked, visible, dots); }
    
    MainCollision(String name)
    { super(name); }
  }
  
  class CommonCollision extends Collision
  {
    CommonCollision(String name, Boolean unlocked, Boolean visible, ArrayList<PVector> dots)
    { super(name, unlocked, visible, dots); }
    
    CommonCollision(String name)
    { super(name); }
  }
  
  
  //ESCENAS
  abstract class Scene
  {
    final PVector defaultDimensions = new PVector(10, 10);
    
    String name;
    Boolean unlocked, visible;
    PVector position;
    
    Scene(String name, Boolean unlocked, Boolean visible, PVector position)
    {
      this.name = name;
      this.unlocked = unlocked;
      this.visible = visible;
      this.position = position;
    }
    
    Scene(String name)
    {
      this(name, true, true, new PVector());
    }
    
    JSONObject toJSONObject()
    {
      JSONObject sceneInJSON = new JSONObject();
      JSONObject positionInJSON = PVectorToJSONObject(position);
      
      sceneInJSON
        .setString("name", name)
        .setBoolean("unlocked", unlocked)
        .setBoolean("visible", visible)
        ;
      
      sceneInJSON.setJSONObject("position", positionInJSON);
      
      return sceneInJSON;
    }
  }
  
  class MainScene extends Scene
  {
    PVector dimensions;
    
    //Constructor completo para cargar y copiar
    MainScene(String name, Boolean unlocked, Boolean visible, PVector position, PVector dimensions)
    {
      super(name, unlocked, visible, position);
      this.dimensions = dimensions;
    }
    
    MainScene(String name)
    {
      super(name);
      dimensions = new PVector(defaultDimensions.x, defaultDimensions.y);
    }
    
    JSONObject toJSONObject()
    {
      JSONObject mainSceneInJSON = super.toJSONObject();
      JSONObject dimensionsInJSON = PVectorToJSONObject(dimensions);
      
      mainSceneInJSON.setJSONObject("dimensions", dimensionsInJSON);
      
      return mainSceneInJSON;
    }
  }
  
  class CommonScene extends Scene
  {
    float size;
    
    //Constructor completo para cargar y copiar
    CommonScene(String name, Boolean unlocked, Boolean visible, PVector position, float size)
    {
      super(name, unlocked, visible, position);
      this.size = size;
    }
    
    CommonScene(String name)
    {
      super(name);
      size = 1;
    }
    
    JSONObject toJSONObject()
    {
      JSONObject commonSceneInJSON = super.toJSONObject();
      
      commonSceneInJSON
        .setFloat("size", size)
        ;
        
      return commonSceneInJSON;
    }
  }
  
  //Usados para conversion a/desde JSON
  JSONObject PVectorToJSONObject(PVector myPVector)
  {
    JSONObject PVectorInJSON = new JSONObject();
    
    PVectorInJSON
      .setFloat("X", myPVector.x)
      .setFloat("Y", myPVector.y)
      ;
    
    return PVectorInJSON;
  }
  
  PVector JSONObjectToPVector(JSONObject myJSONObject)
  {
    return new PVector(myJSONObject.getFloat("X"), myJSONObject.getFloat("Y"));
  }
}
