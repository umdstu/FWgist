$(document).ready(function () {
  $(".gist-language-select").select2();
  
  $(".copy-input").on('click', function() {
    $(this).select();
  });
  
  $('.gtooltip').tooltip();

  $("#added-files").on("click", ".ace-enable", function (e) {
    var editor;
    var parent = $($(e.target).closest('.bubble')[0])
    var entered_text = parent.find('textarea').val();
    var content = parent.find(".file-content");
    var plaintext = parent.find('textarea');
    if (e.target.checked) {
      plaintext.hide();
      content.css("display", "block");
      editor = ace.edit(content[0]);
      editor.getSession().setMode("ace/mode-html");
      editor.setValue(entered_text,1);
      editor.focus();
    } else {
      editor = ace.edit(content[0]);
      plaintext.show();
      plaintext.val(editor.getValue());
      plaintext.focus();
      content.css("display", "none");
    }
    
  });

  function rmBlob() {
    // TODO: implment "undo"
    $(this).parents('.gist-file:first').remove();

  }

  function addBlob() {
    // TODO: implment "undo"
    var t = $('#template');
    var filesParent = $("#added-files");
    var template = t.html();
    var added = filesParent.append(template);
    added.find('.input textarea').val("");
    $('html, body').animate({
        scrollTop: filesParent.children().last().offset().top
    }, 750);
    added.find('#gist_gist_blob_name').focus();
  }

  $('form a[rel=rmBlob]').click(rmBlob)
  $('form a[rel=addBlob]').click(addBlob)

  $("#submit-public").on('click', function (e) {
    var parent = $("#added-files");
    $.each(parent, function (child) {
      var ace_on = $(this).find('.ace-enable')[0].checked;
      var textarea = $(this).find('textarea');
      if (ace_on) {
        var content = $(this).find('.file-content')[0],
            editor = ace.edit(content),
            ace_value = editor.getValue();
        textarea.val(ace_value);
      }
    });
  });
});