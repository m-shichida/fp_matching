import React, { useState } from "react"
import Modal from 'react-modal';

const customStyles = {
  content : {
    top                   : '50%',
    left                  : '50%',
    right                 : 'auto',
    bottom                : 'auto',
    marginRight           : '-50%',
    transform             : 'translate(-50%, -50%)'
  }
};

Modal.setAppElement('#appointment-statement')

const CustomerDetail = ({ customer }) => {
  const [modalIsOpen,setIsOpen] = React.useState(false);
  const openModal = () => {
    setIsOpen(true);
  };
  const closeModal = () => {
    setIsOpen(false);
  };

  return (
    <div>
      <button
        onClick={ openModal }
        className='text-sm font-bold p-1 rounded focus:outline-none focus:shadow-outline bg-green-500 hover:bg-green-700 text-white'
      >
        詳細
      </button>
      <Modal
        isOpen={ modalIsOpen }
        onRequestClose={ closeModal }
        style={ customStyles }
        contentLabel="Customer Modal"
      >
        <div className='w-full lg:6/12 px-4 py-6 lg:px-8 text-gray-700'>
          <h1 className='text-xl font-bold'>{`${ customer.first_name }${ customer.last_name }`}</h1>
          <table>
            <tbody>
              { customer.nick_name ?
                <tr>
                  <th className='text-left p-1'>ニックネーム</th>
                  <td className='text-center p-1'>{ customer.nick_name }</td>
                </tr>
              : '' }
              <tr>
                <th className='text-left p-1'>年齢</th>
                <td className='text-center p-1'>{ customer.age }歳</td>
              </tr>
              <tr>
                <th className='text-left p-1'>性別</th>
                <td className='text-center p-1'>{ customer.gender == 0 ? '男性' : '女性' }</td>
              </tr>
              <tr>
                <th className='text-left p-1'>結婚しているか</th>
                <td className='text-center p-1'>{ customer.married ? '既婚' : '未婚' }</td>
              </tr>
              { customer.job_name ?
                <tr>
                  <th className='text-left p-1'>職業</th>
                  <td className='text-center p-1'>{ customer.job_name }</td>
                </tr>
              : '' }
              { customer.household_income ?
                <tr>
                  <th className='text-left p-1'>世帯年収</th>
                  <td className='text-center p-1'>{ customer.household_income }万円</td>
                </tr>
              : '' }
              { customer.savings ?
                <tr>
                  <th className='text-left p-1'>貯蓄</th>
                  <td className='text-center p-1'>{ customer.savings }万円</td>
                </tr>
              : '' }
              { customer.housemate_count ?
                <tr>
                  <th className='text-left p-1'>同居人数</th>
                  <td className='text-center p-1'>{ customer.housemate_count }人</td>
                </tr>
              : '' }
              { customer.dependent_count ?
                <tr>
                  <th className='text-left p-1'>扶養人数</th>
                  <td className='text-center p-1'>{ customer.dependent_count }人</td>
                </tr>
              : '' }
            </tbody>
          </table>
          <div className='flex justify-end'>
            <button
              onClick={closeModal}
              className='font-bold py-2 px-4 rounded focus:outline-none focus:shadow-outline bg-blue-500 hover:bg-blue-700 text-white mt-2'
            >
              閉じる
            </button>
          </div>
        </div>
      </Modal>
    </div>
  );
};

export default CustomerDetail
