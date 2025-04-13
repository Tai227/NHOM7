import React, { useState, useEffect } from "react";
import { useParams, useLocation, useNavigate } from "react-router-dom";
import {
  Container,
  Grid,
  Typography,
  Card,
  CardMedia,
  Button,
  CircularProgress,
  Alert,
  Box,
} from "@mui/material";
import { layPhimTheoId } from "../services/phimService";

const ChiTietPhim = () => {
  const { id: phimId } = useParams();
  const location = useLocation();
  const navigate = useNavigate();
  const phimFromState = location.state?.phim;

  const [phim, setPhim] = useState(phimFromState || null);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (!phimFromState) {
      const fetchPhim = async () => {
        try {
          setLoading(true);
          setError(null);
          const phimData = await layPhimTheoId(phimId);
          setPhim(phimData);
        } catch (err) {
          setError("Không thể tải thông tin phim: " + err.message);
        } finally {
          setLoading(false);
        }
      };
      fetchPhim();
    }
  }, [phimId, phimFromState]);

  const handleDatVe = () => {
    navigate(`/dat-ve/${phimId}`, { state: { phim } });
  };

  // Function to extract YouTube video ID from the URL
  const getYouTubeVideoId = (url) => {
    const regExp = /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch?v=|&v=)([^#&?]*).*/;
    const match = url?.match(regExp);
    return match && match[2].length === 11 ? match[2] : null;
  };

  const videoId = phim?.trailer ? getYouTubeVideoId(phim.trailer) : null;

  if (loading) {
    return (
      <Box sx={{ textAlign: "center", mt: 4, backgroundColor: "#FFFFFF", minHeight: "100vh" }}>
        <CircularProgress sx={{ color: "#FF6200" }} />
        <Typography variant="h6" sx={{ mt: 2, color: "#000000" }}>
          Đang tải...
        </Typography>
      </Box>
    );
  }

  if (error || !phim) {
    return (
      <Box sx={{ textAlign: "center", mt: 4, backgroundColor: "#FFFFFF", minHeight: "100vh" }}>
        {error && (
          <Alert severity="error" sx={{ mb: 2, backgroundColor: "#FFF3F3", color: "#D32F2F" }}>
            {error}
          </Alert>
        )}
        <Typography variant="h4" sx={{ color: "#000000" }}>
          Không tìm thấy thông tin phim
        </Typography>
        <Typography variant="body1" sx={{ mt: 2, color: "#666666" }}>
          Vui lòng quay lại trang chủ và thử lại.
        </Typography>
      </Box>
    );
  }

  return (
    <Box sx={{ backgroundColor: "#FFFFFF", minHeight: "100vh", color: "#000000" }}>
      {/* Nội dung chính */}
      <Container sx={{ pt: 4, pb: 4, maxWidth: "1200px" }}>
        {/* Tiêu đề phim */}
        <Typography
          variant="h4"
          sx={{
            mb: 3,
            color: "#000000",
            fontWeight: "bold",
            textTransform: "uppercase",
            borderBottom: "1px solid #CCCCCC",
            pb: 1,
          }}
        >
          {phim.ten}
        </Typography>

        {/* Nội dung chính: Hình ảnh và thông tin chi tiết */}
        <Grid container spacing={4}>
          {/* Hình ảnh phim */}
          <Grid item xs={12} md={3}>
            <Card
              sx={{
                backgroundColor: "transparent",
                boxShadow: "none",
                width: "250px", // Fixed width for the card
                maxWidth: "250px",
              }}
            >
              <CardMedia
                component="img"
                sx={{
                  width: "250px", // Fixed width
                  height: "350px", // Fixed height
                  maxWidth: "250px", // Ensure it doesn't exceed
                  maxHeight: "350px", // Ensure it doesn't exceed
                  objectFit: "cover", // Scale the image to fit within the dimensions
                  objectPosition: "center", // Center the image
                  borderRadius: "8px",
                }}
                image={phim.duong_dan_anh}
                alt={phim.ten}
              />
              {phim.dang_chieu && (
                <Button
                  variant="contained"
                  sx={{
                    mt: 2,
                    backgroundColor: "#FF6200",
                    color: "#FFFFFF",
                    fontWeight: "bold",
                    "&:hover": { backgroundColor: "#E05500" },
                    width: "100%",
                    borderRadius: "20px",
                    py: 1.5,
                  }}
                  onClick={handleDatVe}
                >
                  Đặt vé
                </Button>
              )}
            </Card>
          </Grid>

         {/* Thông tin chi tiết của phim */}
         <Grid item xs={12} md={9}>
            <Box
              sx={{
                mt: 8, // Dịch phần thông tin chi tiết (âm để dịch lên)
              }}
            >
              <Typography
                variant="body1"
                sx={{
                  mb: 1,
                  color: "#000000",
                  fontSize: "1.1rem",
                }}
              >
                <strong>Đạo diễn:</strong>{" "}
                <span style={{ color: "#666666" }}>{phim.dao_dien || "Không có"}</span>
              </Typography>
              <Typography
                variant="body1"
                sx={{
                  mb: 1,
                  color: "#000000",
                  fontSize: "1.1rem",
                }}
              >
                <strong>Diễn viên:</strong>{" "}
                <span style={{ color: "#666666" }}>{phim.dien_vien || "Không có"}</span>
              </Typography>
              <Typography
                variant="body1"
                sx={{
                  mb: 1,
                  color: "#000000",
                  fontSize: "1.1rem",
                }}
              >
                <strong>Thể loại:</strong>{" "}
                <span style={{ color: "#666666" }}>{phim.the_loai || "Không có"}</span>
              </Typography>
              <Typography
                variant="body1"
                sx={{
                  mb: 1,
                  color: "#000000",
                  fontSize: "1.1rem",
                }}
              >
                <strong>Khởi chiếu:</strong>{" "}
                <span style={{ color: "#666666" }}>
                  {phim.ngay_phat_hanh
                    ? new Date(phim.ngay_phat_hanh).toLocaleDateString("vi-VN", {
                        day: "2-digit",
                        month: "2-digit",
                        year: "numeric",
                      })
                    : "Không có"}
                </span>
              </Typography>
              <Typography
                variant="body1"
                sx={{
                  mb: 1,
                  color: "#000000",
                  fontSize: "1.1rem",
                }}
              >
                <strong>Ngôn ngữ:</strong>{" "}
                <span style={{ color: "#666666" }}>{phim.ngon_ngu || "Không có"}</span>
              </Typography>
              <Typography
                variant="body1"
                sx={{
                  mb: 1,
                  color: "#000000",
                  fontSize: "1.1rem",
                }}
              >
                <strong>Đánh giá:</strong>{" "}
                <span style={{ color: "#666666" }}>{phim.danh_gia || "Không có"}</span>
              </Typography>
            </Box>
          </Grid>
        </Grid>


        {/* Phần tóm tắt phim */}
        <Box sx={{ mt: 4 }}>
  <Typography variant="h6" sx={{ mb: 2, color: "#000000", fontWeight: "bold" }}>
    Tóm tắt phim:
  </Typography>
  <Typography variant="body1" sx={{ color: "#666666", lineHeight: 1.6 }}>
    {phim.mo_ta_ngan ? phim.mo_ta_ngan : "Không có mô tả ngắn."}
  </Typography>
  {phim.mo_ta_dai && (
    <Typography variant="body1" sx={{ color: "#666666", lineHeight: 1.6, mt: 1 }}>
      {phim.mo_ta_dai}
    </Typography>
  )}
  {!phim.mo_ta_ngan && !phim.mo_ta_dai && (
    <Typography variant="body1" sx={{ color: "#666666", lineHeight: 1.6 }}>
      Không có mô tả.
    </Typography>
  )}
</Box>
        {/* Phần trailer */}
        {videoId && (
          <Box sx={{ mt: 4 }}>
            <Typography variant="h6" sx={{ mb: 2, color: "#000000", fontWeight: "bold" }}>
              Trailer:
            </Typography>
            <Box sx={{ position: "relative", paddingBottom: "56.25%", height: 0, overflow: "hidden" }}>
              <iframe
                src={`https://www.youtube.com/embed/${videoId}`}
                title="Trailer"
                frameBorder="0"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowFullScreen
                style={{
                  position: "absolute",
                  top: 0,
                  left: 0,
                  width: "100%",
                  height: "100%",
                  borderRadius: "8px",
                }}
              />
            </Box>
          </Box>
        )}
      </Container>
    </Box>
  );
};

export default ChiTietPhim;