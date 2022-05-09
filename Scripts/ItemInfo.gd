extends Resource
class_name ItemInfo

export var name : String #where the name is going to be stored
export var texture : Texture #where the texture is going to be stored
export var src : Resource #where the actual scene is going to be stored

#different types
export (String, "weapon", "passive") var type #where the itemType is going to be stored

