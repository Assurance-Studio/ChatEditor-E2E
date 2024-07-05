from AutoItLibrary import AutoItLibrary
from robot.api.deco import keyword


@keyword
def click_left_button_at_position(x, y):
    AutoItLibrary().MouseClick("left", x, y)

