import React, { useState, useEffect } from 'react';
import { useParams, Link } from 'react-router-dom';
import { Container, Typography, Box, CardMedia, Button } from '@mui/material';
import AccessTimeIcon from '@mui/icons-material/AccessTime';
import VisibilityIcon from '@mui/icons-material/Visibility';
import ArrowBackIcon from '@mui/icons-material/ArrowBack';
import baiVietService from '../services/baivietService';

const BaiViet = () => {
  const { id } = useParams();
  const [baiViet, setBaiViet] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchBaiViet = async () => {
      try {
        const response = await baiVietService.getBaiVietById(id);
        console.log('Dữ liệu bài viết:', response.data);
        if (response.data) {
          setBaiViet(response.data);
        } else {
          setError('Không tìm thấy bài viết.');
        }
      } catch (error) {
        console.error('Lỗi khi lấy chi tiết bài viết:', error);
        setError('Không thể tải bài viết. Vui lòng kiểm tra API hoặc thử lại sau.');
      }
    };
    fetchBaiViet();
  }, [id]);

  if (error) return <Typography color="error">{error}</Typography>;
  if (!baiViet) return <Typography>Loading...</Typography>;

  return (
    <Container sx={{ py: 4 }}>
      <Box sx={{ maxWidth: '800px', mx: 'auto' }}>
        {/* Nút quay lại */}
        <Button
          component={Link}
          to="/danh-sach-bai-viet"
          startIcon={<ArrowBackIcon />}
          sx={{ mb: 2, color: 'primary.main' }}
        >
          Quay lại danh sách bài viết
        </Button>

        <Typography variant="h4" gutterBottom>
          {baiViet.tieu_de || 'Không có tiêu đề'}
        </Typography>

        <CardMedia
          component="img"
          image={baiViet.anh_chinh || 'https://via.placeholder.com/800x400'}
          alt={baiViet.tieu_de || 'Bài viết'}
          sx={{ width: '100%', height: 'auto', borderRadius: 2, mb: 2 }}
        />

        <Box sx={{ display: 'flex', alignItems: 'center', mb: 2 }}>
          <AccessTimeIcon fontSize="small" sx={{ mr: 1 }} />
          <Typography variant="caption" color="text.secondary">
            Đăng ngày: {baiViet.ngay_tao ? new Date(baiViet.ngay_tao).toLocaleDateString('vi-VN') : 'Không rõ'}
          </Typography>
          <VisibilityIcon fontSize="small" sx={{ ml: 2, mr: 1 }} />
          <Typography variant="caption" color="text.secondary">
            {Math.floor(Math.random() * 10000)} {/* Giả lập số lượt xem */}
          </Typography>
        </Box>

        <Typography variant="body1" color="text.secondary" paragraph>
          {baiViet.tom_tat || 'Không có tóm tắt'}
        </Typography>

        {/* Nếu có thêm nội dung chi tiết (nếu API hỗ trợ) */}
        {/* <Typography variant="body1" paragraph>
          {baiViet.noi_dung || 'Không có nội dung chi tiết.'}
        </Typography> */}
      </Box>
    </Container>
  );
};

export default BaiViet;