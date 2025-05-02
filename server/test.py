# THIS IS TO TEST WITH NORMAL IMAGE UPLOAD

import json
import util

# Load the model before testing
util.load_saved_artifacts()


image_path = "/Users/williams/Documents/superImages/Tom/10001.jpg"

# Call the classify_image function with the file path
result = util.classify_image(None, image_path)

# Print classification result
print(json.dumps(result, indent=4))
