import axios from 'axios';

const API_URL = 'http://localhost:8000/api';

const baivietService = {
  getBaiVietById: async (id) => {
    try {
      const response = await axios.get(`${API_URL}/bai_viet/${id}/`);
      return response;
    } catch (error) {
      console.error('Lỗi khi gọi API chi tiết bài viết:', error.response || error.message);
      throw error;
    }
  },
  getAllBaiViet: async () => {
    try {
      const response = await axios.get(`${API_URL}/bai_viet/`);
      console.log('Dữ liệu từ API:', response.data); // Debug
      return response;
    } catch (error) {
      console.error('Lỗi khi gọi API danh sách bài viết:', error.response || error.message);
      throw error;
    }
  },
};

export default baivietService;