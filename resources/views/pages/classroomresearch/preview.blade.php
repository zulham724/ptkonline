<!doctype html>
<html lang="en">
<head>
    <title>Title</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
    <style>
        #page{
            line-height: 20px;
        }
        hr{
            margin:10px
        }
    </style>
</head>

<body>
    <div class="container-fluid" id="page">
        <div class="row" style="text-align:center">
            <div class="col">
                <div class="form">
                    <!-- <h5>RENCANA PELAKSANAAN PEMBELAJARAN</h5> -->
                    <h4>{{$title}}</h4>
                </div>
            </div>
        </div>
        <hr style="visibility: hidden;">
        <div class="row">
            <table width="100%" style="border-collapse:separate;
            border-spacing:-10px;" cellspacing="0">
            
              
                <tr>
                    <td style="width:20%"><h4>Penyusun</h4></td>
                    <td style="width:5%">:</td>
                    <td><h4>{{$user['name']}}</h4></td>
                </tr>
                <tr>
                    <td style="width:20%"><h4>Asal Sekolah</h4></td>
                    <td style="width:5%">:</td>
                    <td><h4>{{$school_name}}</h4></td>
                </tr>
                <tr>
                    <td><h4>Tahun</h4></td>
                    <td>:</td>
                    <td><h4>{{$year}}</h4></td>
                </tr>
               
            </table>
        </div>
        <hr> @foreach ($classroom_research_contents as $content)
        <div class="rowddss">
            <div class="forssssm">
                <h3>{{$content['name']}}</h3>
                {!!$content['value']!!}
            </div>
        </div>
        @endforeach
        <hr>
       
    </div>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script> -->
    <!-- <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script> -->
</body>

</html>
