function shortUrl()
{
	original_url = $("#short-url").val();
    debugger;
    $.ajax({
    type: "GET",
    url: "/url/customize_url/",
    data: {"og_url": original_url},
    success: function(data, textStatus, jqXHR){
        if(data["status"] == "success")
        {
         $(".label-show").text("Here's your short URL")
         $(".short-url-show").text(data["short_url"])
        }
         else
        {
            $("#error_msg_label").text(data["error_msg"])
        }
    }
});
}