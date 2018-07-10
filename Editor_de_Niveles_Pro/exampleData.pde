Data createExampleData(int assets, int rooms, int layerGroups, int commonLayers, int sprites, int commonCollisions, int commonScenes) 
{
  Data exampleData = new Data();
  
  for (int i = 0; i < assets; i++)
  { exampleData.addAsset("AssetName" + i, "assets/missingAsset.png"); }
  
  for (int i = 0; i < rooms; i++)
  {
    Data.Room myRoom = exampleData.addRoom("RoomName" + i);
    
    for (int j = 0; j < layerGroups; j++)
    {
      Data.LayerGroup myLayerGroup = myRoom.addLayerGroup("LayerGroupName" + j);
      
      for (int k = 0; k < commonLayers; k++)
      {
        Data.CommonLayer myCommonLayer = myLayerGroup.addCommonLayer("CommonLayerName" + k);
        
        for (int l = 0; l < sprites; l++)
        {
          myCommonLayer.addSprite(new PVector(), 0f, 0, myCommonLayer);
        }
      }
    }
    
    for (int j = 0; j < commonCollisions; j++)
    {
      myRoom.addCommonCollision("CommonCollisionName" + j);
    }
    
    for (int j = 0; j < commonScenes; j++)
    {
      myRoom.addCommonScene("CommonSceneName" + j);
    }
  }
  
  return exampleData;
}
