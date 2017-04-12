$(document).ready(function(){


    var myPlaylist = new jPlayerPlaylist({
        jPlayer: "#jplayer_N",
        cssSelectorAncestor: "#jp_container_N"
    }, $('a.jp-play-me').map(function (i, element) {
        return {
            'mp3': $(element).data('track-preview-url'),
            'poster': $(element).data('track-poster'),
            'title': $(element).data('track-artist') + ' - ' + $(this).data('track-name')
        }
    }), {
        playlistOptions: {
            enableRemoveControls: true,
            autoPlay: true
        },
        swfPath: "js/jPlayer",
        supplied: "mp3",
        smoothPlayBar: true,
        keyEnabled: true,
        audioFullScreen: false
    });

    $(document).on($.jPlayer.event.pause, myPlaylist.cssSelector.jPlayer,  function(){
        $('.musicbar').removeClass('animate');
        $('.jp-play-me').removeClass('active');
        $('.jp-play-me').parent('li').removeClass('active');
    });

    $(document).on($.jPlayer.event.play, myPlaylist.cssSelector.jPlayer,  function(){
        $('.musicbar').addClass('animate');
    });

    $(document).on('click', '.jp-play-me', function(e){
        e && e.preventDefault();
        var $this = $(e.target);
        if (!$this.is('a')) $this = $this.closest('a');

        $('.jp-play-me').not($this).removeClass('active');
        $('.jp-play-me').parent('li').not($this.parent('li')).removeClass('active');

        $this.toggleClass('active');
        $this.parent('li').toggleClass('active');
        if( !$this.hasClass('active') ){
            myPlaylist.pause();
        }else{
            var i = Math.floor(Math.random() * (1 + 7 - 1));
            myPlaylist.play(i);
        }


    });

    $('.jplayer-play').on('click', function(e){
        e.preventDefault();
        $('#jplayer_N')
            .jPlayer('setMedia', {
                'mp3': $(this).data('track-preview-url'),
                'poster': $(this).data('track-poster'),
                'title': $(this).data('track-artist') + ' - ' + $(this).data('track-name')
            })
            .jPlayer('play');

    });



  // video

  $("#jplayer_1").jPlayer({
    swfPath: "/js",
    supplied: "webmv, ogv, m4v",
    size: {
      width: "100%",
      height: "auto",
      cssClass: "jp-video-360p"
    },
    globalVolume: true,
    smoothPlayBar: true,
    keyEnabled: true
  });

});