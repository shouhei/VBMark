$('.cs_table2 tr').each(function(index){
    var number = $(this).children().eq(1).text();
    for each(subject in ary){
        if(subject.id == number){
            $(this).children().eq(6).children().eq(0).val(subject.score);
        }
    }
});
