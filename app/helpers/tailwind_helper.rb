# 他のメソッド名と判別するために頭文字にtw_をつける
module TailwindHelper
  def tw_form_container
    'bg-white rounded shadow-md px-4 py-6 mt-2 w-full lg:px-8 lg:mt-12 lg:w-4/6 lg:mx-auto'
  end

  def tw_form_label
    'inline-block text-gray-700 text-sm font-bold mt-3 mb-1'
  end

  def tw_form_input
    'appearance-none block w-full bg-gray-200 text-gray-700 border rounded py-3 px-4 leading-tight
     focus:outline-none focus:bg-white'
  end

  def tw_btn_primary
    'bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline'
  end

  def tw_btn_green
    'bg-green-500 hover:bg-green-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline'
  end

  def tw_btn_gray
    'bg-gray-500 hover:bg-gray-700 text-white font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline'
  end

  def tw_required
    content_tag(:span,
                '必須',
                style: 'vertical-align: 1px;',
                class: 'inline bg-red-500 text-white text-xs font-bold py-1 px-2 rounded')
  end
end
