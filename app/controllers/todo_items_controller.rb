class TodoItemsController < ApplicationController
	before_action :set_todo_list

	
	def create
		@todo_item = @todo_list.todo_items.create(todo_item_params)
		redirect_to @todo_list
	end

	def destroy
		@todo_list.todo_items.find(params[:id]).destroy

	    respond_to do |format|
	      format.html { redirect_to todo_list_todo_items_path, notice: "Todo item was successfully destroyed." }
	      format.json { head :no_content }
	    end
	end

	def update
	    respond_to do |format|
	      if @todo_list.todo_items.find(params[:id]).update('completed' => true)
	        format.html { redirect_to todo_lists_url, notice: "Todo list was successfully updated." }
	        format.json { render :show, status: :ok, location: @todo_list }
	      else
	        format.html { render :edit, status: :unprocessable_entity }
	        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	  def revert
	    respond_to do |format|
	      if @todo_list.todo_items.find(params[:id]).update('completed' => false)
	        format.html { redirect_to todo_lists_url, notice: "Todo list was successfully reverted." }
	        format.json { render :show, status: :ok, location: @todo_list }
	      else
	        format.html { render :edit, status: :unprocessable_entity }
	        format.json { render json: @todo_list.errors, status: :unprocessable_entity }
	      end
	    end
	  end

	private

	def set_todo_list
		@todo_list = TodoList.find(params[:todo_list_id])
	end

	def todo_item_params
		params[:todo_item].permit(:content)
	end
end
