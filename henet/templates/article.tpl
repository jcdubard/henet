<div class="page-header">
  <h1>Edition du fichier "{{ filename }}"</h1>
</div>


<form role="form">
 <div class="form-group">
   <label for="title">Titre:</label>
   <input class="form-control" id="title" type="text" value="{{ article['title'] }}"></input>
 </div>

 <div class="form-group">
   <label for="title">Lieu:</label>
   <input class="form-control" id="location" type="text" value="{{ article['metadata'].get('location', '') }}"></input>
 </div>

 <div class="form-group">
   <label for="date">Date:</label>
   <input class="form-control" id="date" type="text" value="{{article['metadata']['date'].strftime('%d/%m/%Y') }}"></input>
 </div>

 <div class="form-group">
   <label for="eventdate">Date Evenement:</label>
   <input class="form-control" id="eventdate" type="text" value="{{article['metadata'].get('eventdate', article['metadata']['date']).strftime('%d/%m/%Y') }}"></input>
 </div>


 <div class="form-group">
    <textarea id="body" rows="5" id="content">{{article['body']}}</textarea>
    <iframe id="preview" src="/category/{{ category }}/{{filename}}/preview">
     Preview
    </iframe>
    <span style="clear: both"></span>
 </div>

 <button type="submit" class="btn btn-default">Sauvegarder</button>

</form>

<script src="/resources/js/editor.js"></script>
<script src="/resources/js/jquery-linedtextarea.js"></script>

<script>
 $('#date').datepicker({
   format: "dd/mm/yyyy",
   language: "fr"
 });

 $('#eventdate').datepicker({
   format: "dd/mm/yyyy",
   language: "fr"
 });


 $("#body").linedtextarea();

 window.baseTitle = $('head title').text();

 $('textarea#body').bind('change', genPreview);
 timerId = window.setInterval(genPreview, 900);

 //$('textarea#body').scroll(syncScrollPosition);
 $("#preview").height($("div.linedwrap").outerHeight());
 $("#preview").width($("div.linedwrap").outerWidth());

</script>

% rebase('base.tpl', page_title=article['title'], actionbar=False, span=12)