class NotesController < ApplicationController
  def create
    @notable = find_notable
    @note = @notable.notes.build(params[:note])
    respond_to do |format|
      if @note.save
        format.html { redirect_to @notable, notice: 'Note was successfully created.' }
        format.js
      else
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    @note = Note.find(params[:id])
    @note.destroy
    respond_to do |format|
      format.html { redirect_to @note.notable }
      format.js
    end
  end


  def find_notable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
