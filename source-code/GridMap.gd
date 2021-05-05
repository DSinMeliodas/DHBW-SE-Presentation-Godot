extends GridMap

const width = 64
const length = 64

func _ready():
	for x in (width+1):
		for z in (length+1):
			set_cell_item(x-width, 0, z-length, 0)
