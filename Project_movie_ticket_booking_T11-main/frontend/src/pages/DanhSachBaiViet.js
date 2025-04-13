import React, { useState, useEffect } from 'react';
import { Link } from 'react-router-dom';
import { Container, Grid, Card, CardMedia, CardContent, Typography, Box } from '@mui/material';
import AccessTimeIcon from '@mui/icons-material/AccessTime';
import VisibilityIcon from '@mui/icons-material/Visibility';
import baiVietService from '../services/baivietService';

const DanhSachBaiViet = () => {
  const [baiVietList, setBaiVietList] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await baiVietService.getAllBaiViet();
        console.log('Danh sách bài viết:', response.data);

        const uniqueBaiVietList = Array.from(
          new Map(response.data.map(item => [item.id, item])).values()
        );
        console.log('Danh sách bài viết sau khi loại bỏ trùng lặp:', uniqueBaiVietList);
        setBaiVietList(uniqueBaiVietList);
      } catch (error) {
        console.error('Lỗi khi lấy danh sách bài viết:', error);
        setError('Không thể tải danh sách bài viết. Vui lòng thử lại sau.');
      }
    };
    fetchData();
  }, []);

  if (error) return <Typography color="error">{error}</Typography>;
  if (baiVietList.length === 0) return <Typography>Không có bài viết nào.</Typography>;

  return (
    <Container sx={{ py: 4, maxWidth: 'lg' }}>
      <Typography variant="h4" gutterBottom align="center">
        Blog Phim
      </Typography>
      <Grid container spacing={3}>
        {baiVietList.map((baiViet) => (
          <Grid item xs={12} sm={6} md={6} key={baiViet.id}> {/* Điều chỉnh kích thước Grid */}
            <Card
              sx={{
                display: 'flex',
                flexDirection: 'row',
                height: '100%',
                boxShadow: 3,
                '&:hover': { boxShadow: 6 },
                width: '100%',
                maxWidth: '90%', // Giới hạn chiều rộng tối đa thay vì minWidth
                margin: '0 auto', // Căn giữa Card
              }}
            >
              <CardMedia
                component="img"
                sx={{
                  width: '40%', // Giảm tỷ lệ hình ảnh để cân đối hơn
                  height: 200, // Giảm chiều cao để phù hợp
                  objectFit: 'cover',
                }}
                image={baiViet.anh_chinh || 'https://via.placeholder.com/300x200'}
                alt={baiViet.tieu_de}
              />
              <CardContent
                sx={{
                  flexGrow: 1,
                  display: 'flex',
                  flexDirection: 'column',
                  justifyContent: 'space-between',
                  padding: 2, // Đảm bảo padding đồng đều
                }}
              >
                <Box>
                  <Typography
                    variant="h6" // Giảm kích thước tiêu đề để phù hợp
                    component={Link}
                    to={`/bai-viet/${baiViet.id}`}
                    sx={{
                      textDecoration: 'none',
                      color: 'error.main',
                      '&:hover': { color: 'primary.main' },
                    }}
                  >
                    {baiViet.tieu_de}
                  </Typography>
                  <Box sx={{ display: 'flex', alignItems: 'center', mt: 1, mb: 1 }}>
                    <AccessTimeIcon fontSize="small" sx={{ mr: 1 }} />
                    <Typography variant="caption" color="text.secondary">
                      {new Date(baiViet.ngay_tao).toLocaleDateString('vi-VN')}
                    </Typography>
                    <VisibilityIcon fontSize="small" sx={{ ml: 2, mr: 1 }} />
                    <Typography variant="caption" color="text.secondary">
                      {Math.floor(Math.random() * 10000)}
                    </Typography>
                  </Box>
                  <Typography
                    variant="body2"
                    color="text.secondary"
                    sx={{
                      display: '-webkit-box',
                      WebkitBoxOrient: 'vertical',
                      WebkitLineClamp: 2, // Giảm số dòng tóm tắt để gọn hơn
                      overflow: 'hidden',
                    }}
                  >
                    {baiViet.tom_tat.length > 80 ? `${baiViet.tom_tat.substring(0, 80)}...` : baiViet.tom_tat}
                  </Typography>
                </Box>
                <Typography
                  component={Link}
                  to={`/bai-viet/${baiViet.id}`}
                  sx={{
                    mt: 1,
                    display: 'inline-block',
                    textDecoration: 'none',
                    color: 'primary.main',
                    '&:hover': { textDecoration: 'underline' },
                  }}
                >
                  Xem thêm
                </Typography>
              </CardContent>
            </Card>
          </Grid>
        ))}
      </Grid>
    </Container>
  );
};

export default DanhSachBaiViet;