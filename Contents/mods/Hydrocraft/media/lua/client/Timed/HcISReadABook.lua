require "ISReadABook"
HcISReadABook = ISReadABook:derive("HcISReadABook");

local original_perform = ISReadABook.perform
function ISReadABook:perform()
	original_perform(self)
	
	if self.item:getTeachedRecipes() and not self.item:getTeachedRecipes():isEmpty() then
        HcISCraftingUI.hasNewRecipes = true;
    end
end