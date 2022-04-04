
window.onload = function(){
    $('.step-1').click(function(event){
        $('.step-1').removeClass('active');
        $(this).addClass('active');
        $('.step-2').hide();
        $('#'+$(this).data('id')).show();
    });

    $('.reason-btn').click(function(event){
        $('.reason-btn').removeClass('active');
        $(this).addClass('active');
    });
}
