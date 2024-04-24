
    //검색
    $("#chkSearch").click(function () {
        var teamFilter = [];
        let teamName = $("#input_tname").val();
        $("input[type=checkbox]").each(function () {
            if ($(this).is(":checked") == true) {
                teamFilter += $(this).val();
            }
        });
        console.log(teamName + teamFilter);
    });

    //팀 마우스오버
    $("#teamlists").on("mouseenter", ".team", function () {
        $(this).css({ "filter": "brightness(70%)" });
    });
    $("#teamlists").on("mouseleave", ".team", function () {
        $(this).css({ "filter": "brightness(100%)" });
    });


    //jQuery Ui 항목
/*    $("input").checkboxradio({
        icon: false,
    });*/

