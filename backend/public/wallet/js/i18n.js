var lang;
$(function($) {

  var url_string = window.location.href;
  var url = new URL(url_string);
  lang = url.searchParams.get("lang");
  if (lang == null) {
    lang = 'en';
  }
  $.i18n().load('./js/i18n/' + lang + '.json', lang).done(function() {
        console.log("jQuery.i18n is loaded");
        $.i18n().locale = lang;
        $('body').i18n();

        $('.usage-step').html($.i18n('usage-step'));
        $('#span_agree_tos').html($.i18n('agree_tos'));

        $('#mnemonic_phase_desc').html($.i18n('mnemonic_phase_desc'));
        $('#deposit_desc').html($.i18n('deposit_desc'));
    });
});
