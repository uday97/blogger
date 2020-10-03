module TagsHelper
    def tag_params
		params.require(:tag).permit(:title, :body, :tag_list)
	end
end
