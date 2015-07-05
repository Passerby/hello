var uploader = Qiniu.uploader({
    runtimes: 'html5,flash,html4',
    browse_button: 'pickfiles',
    uptoken_url: '../../uploader/img',
    domain: 'http://7xk15s.com1.z0.glb.clouddn.com/',
 //   container: 'container',
    drop_element: 'container',
    max_file_size: '100mb',
    flash_swf_url: 'js/plupload/Moxie.swf',
    dragdrop: false,
    chunk_size: '4mb',



    auto_start: true, //选择文件后自动上传，若关闭需要自己绑定事件触发上传,
    //x_vars : {
    //    自定义变量，参考http://developer.qiniu.com/docs/v6/api/overview/up/response/vars.html
    //    'time' : function(up,file) {
    //        var time = (new Date()).getTime();
    // do something with 'time'
    //        return time;
    //    },
    //    'size' : function(up,file) {
    //        var size = file.size;
    // do something with 'size'
    //        return size;
    //    }
    //},
    init: {
        'FilesAdded': function(up, files) {
            plupload.each(files, function(file) {
                // 文件添加进队列后,处理相关的事情
            });
        },
        'BeforeUpload': function(up, file) {
            // 每个文件上传前,处理相关的事情
        },
        'UploadProgress': function(up, file) {
            // 每个文件上传时,处理相关的事情
        },
        'FileUploaded': function(up, file, info) {
            // 每个文件上传成功后,处理相关的事情
            // 其中 info 是文件上传成功后，服务端返回的json，形式如
            // {
            //    "hash": "Fh8xVqod2MQ1mocfI4S4KpRL6D98",
            //    "key": "gogopher.jpg"
            //  }
            // 参考http://developer.qiniu.com/docs/v6/api/overview/up/response/simple-response.html

            // var domain = up.getOption('domain');
            // var res = parseJSON(info);
            // var sourceLink = domain + res.key; 获取上传成功后的文件的Url
           // rusume[path]:工程师
            var responce = JSON.parse(info);
            $.post("../resume/create", {
                    resume: {
                        path: responce.key
                    }
                })
                .done(function(data) {
                    $("#resumeId").val(data.id);
                    var index = data.path.lastIndexOf("_");
                    var name = data.path.substr(0, index);
                    $("#resumeName").html(name);
                  //  alert("Data Loaded: " + data);
                });


        },
        'Error': function(up, err, errTip) {
            //上传出错时,处理相关的事情
        },
        'UploadComplete': function() {
            //队列文件处理完毕后,处理相关的事情
        },
        'Key': function(up, file) {
            // 若想在前端对每个文件的key进行个性化处理，可以配置该函数
            // 该配置必须要在 unique_names: false , save_key: false 时才生效
            var key = file.name + "_" + new Date().getTime();
            // do something with key here
            return key
        }
    }
});
