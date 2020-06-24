var thumbnum = 0;
var html = "";
var thumbs = [];

function changeIMG(classs, pic) {
    if (!Array.isArray(thumbs[classs])) {
        thumbs[classs] = []
    }
    thumbnum = $("." + classs + " .fc-upload-btn").data("num");
    let v = (!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(pic)) ? '<video autoplay muted src=' + pic + '></video>' : '<img src=' + pic + '>';
    html = '<div class="fc-files">' + v + '<div class="fc-upload-cover"><i class="layui-icon layui-icon-delete"></i></div></div>';
    if (thumbs[classs].length < thumbnum) {

        thumbs[classs].push(pic);
        $("." + classs + " .fc-upload").prepend(html);
        $("." + classs + " .fc-upload .thumb").val(thumbs[classs].join(","))
        if(thumbs[classs].length >= thumbnum){
            $("." + classs + " .fc-upload .fc-upload-btn").hide()
        }
        if(typeof callbackupload === "function") {
            callbackupload(pic,classs);
        }
    } else {
        layer.msg("只能上传 " + thumbnum + " 张图片")
    }
}
function upload_edit() {
    var edit = $(".fc-upload").parent();
    $.each(edit, function(key, val) {
        var classs = $(val).attr("class");
        if (typeof(edit_thumb) != "undefined") {
            if (edit_thumb) {
                var edit_thumbs = edit_thumb.split(",");
                $.each(edit_thumbs, function(key, val) {
                    changeIMG(classs, val)
                })
            }
        }
    })
}

$(function() {
    $(".fc-upload").on("click", ".fc-files", function() {
        var that = $(this).parent(".fc-upload");
        var del = $(this).find("img").attr("src");
        var classs = that.parent().attr("class");
        var val = thumbs[classs];
        val.splice($.inArray(del, val), 1);
        that.find(".thumb").val(val);
        $(this).remove()
        $("." + classs + " .fc-upload .fc-upload-btn").show()
    });
    upload_edit();
});