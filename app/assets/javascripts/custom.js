$(document).ready(function () {

    //This is to remove the validation message if no poster image is present
    $('.trigger-btn').click(function () {
        $("#display_name").text("");
        $("#username").text("");
        var name = $("#username").val();
        $("#display_name").append(name);
        $('#LoginConfirmModal').modal('show');
    });

    // Submit form once the user confirmed
    $('#submit').click(function () {
        //alert($("#username").val());
        var username = $("#username").val();
        $.ajax({
            type: 'POST',
            url: ('/login'),
            data: { username: username },
            success: function(data) {
                window.location.href = "/movies";
             }
        });
    });



    // Load data from server
    // Load data from server



    var getJSON = function (url, callback) {

        var xhr = new XMLHttpRequest();
        xhr.open('GET', url, true);
        xhr.responseType = 'json';
        xhr.onload = function () {
            var status = xhr.status;
            if (status == 200) {
                callback(null, xhr.response);
            } else {
                callback(status);
            }
        };
        xhr.send();
    };

    getJSON('movie_data.json', function (err, json) {
        if (err != null) {
            console.error(err);
        } else {
            var data = json.data.movies;
            var divsToAppend = "";
            $.each(data, function (i, val) {
                //alert(data[i].name);
                divsToAppend += '<div class="col-md-4">'
                    + '<div class="card mb-4 box-shadow">'
                    + '<img class="card-img-top" data-src="' + data[i].thumbnail + 'text=' + data[i].name + '" alt="' + data[i].name + '" style="height: 225px; width: 100%; display: block;" src="' + data[i].thumbnail + '" data-holder-rendered="true">'
                    + '<div class="card-body">'
                    + '<div class="row">'
                    + '<div class="column text-left" style="padding: 0 60px 0 10px"> Name: ' + data[i].name + '</div>'
                    + '<div class="column text-left" style="padding: 0 0 0 60px"></div>'
                    + '<div class="column text-right" style="padding: 0 60px 0 10px;"> Year: ' + data[i].year + '</div>'
                    + '<div class="column text-right" style="padding: 0 0 0 120px;"><button type="button" class="btn btn-sm btn-outline-secondary pop" id=' + data[i].id + '||' + data[i].thumbnail + '||' + data[i].name.trim() + '||' + data[i].description + '||' + data[i].director.trim() + '||' + data[i].main_star.trim() + '||' + data[i].description.trim() + '|| onClick="MovieDetailModel(this.id)">View</button></div>'
                    + '</div>'
                    + '</div>'
                    + '</div>'
                    + '</div>'

            });
            $('.element-head').append(divsToAppend);
        }
    });


});


function MovieDetailModel(values){
    // Modal window with movie details
    var dataArr = values.split('||');
    $('#imagepreview').attr('src', dataArr[1]); // here asign the image to the modal when the user click the enlarge link
    $('#media-heading').text(dataArr[2]);
    $('#director').text(dataArr[4]);
    $('#main').text(dataArr[5]);
    $('#intro').text(dataArr[3]);
    $('#myModal').modal('show'); // imagemodal is the id attribute assigned to the bootstrap modal, then i use the show function
    }
    
    