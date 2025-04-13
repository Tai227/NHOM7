import React from "react";
import {
  Typography,
  Box,
  Card,
  CardMedia,
  Divider,
} from "@mui/material";
import { useLocation, useNavigate } from "react-router-dom";

const ThongTinVe = () => {
  const location = useLocation();
  const navigate = useNavigate();

  const {
    veIds = [],
    phim = { ten: "Không có thông tin", duong_dan_anh: "", id: "", dang_chieu: false, gia_ve: 0 },
    chiNhanhTen = "Không có thông tin",
    lichChieuText = "Không có thông tin",
    phong = "Không có thông tin",
    gheDaChon = "Không có thông tin",
    tongGiaVe = 0,
  } = location.state || {};

  if (!location.state) {
    return (
      <Box
        sx={{
          padding: "20px",
          backgroundColor: "#FFFFFF",
          color: "#000000",
          minHeight: "100vh",
          textAlign: "center",
        }}
      >
        <Typography variant="h5" sx={{ color: "#000000", mb: 2 }}>
          Không tìm thấy thông tin vé!
        </Typography>
        <Typography variant="body1" sx={{ color: "#000000", mb: 2 }}>
          Vui lòng đặt vé trước khi xem thông tin.
        </Typography>
        <button
          onClick={() => navigate("/")}
          style={{
            padding: "10px 20px",
            backgroundColor: "#FF6200",
            color: "#FFFFFF",
            border: "none",
            borderRadius: "5px",
            cursor: "pointer",
          }}
        >
          Quay lại trang chủ
        </button>
      </Box>
    );
  }

  return (
    <Box
      sx={{
        padding: "20px",
        backgroundColor: "#FFFFFF",
        color: "#000000",
        minHeight: "100vh",
      }}
    >
      <Box sx={{ maxWidth: 600, margin: "0 auto" }}>
        <Typography
          variant="h4"
          gutterBottom
          sx={{
            textAlign: "center",
            color: "#000000",
          }}
        >
          Hóa Đơn Đặt Vé
        </Typography>

        <Box
          sx={{
            backgroundColor: "#FFFFFF",
            color: "#000000",
            padding: "20px",
            borderRadius: "8px",
            border: "1px solid #000000",
            boxShadow: "0 2px 8px rgba(0, 0, 0, 0.1)",
          }}
        >
          <Card
            sx={{
              maxWidth: 200,
              margin: "0 auto",
              mb: 2,
              border: "1px solid #000000",
            }}
          >
            <CardMedia
              component="img"
              height="200"
              image={phim.duong_dan_anh || "https://via.placeholder.com/200x300?text=Không+có+ảnh"}
              alt={phim.ten}
            />
          </Card>

          <Typography variant="h5" sx={{ textAlign: "center", fontWeight: "bold", mb: 1, color: "#000000" }}>
            {phim.ten.toUpperCase()}
          </Typography>
          <Typography variant="body1" sx={{ textAlign: "center", fontWeight: "bold", mb: 1, color: "#000000" }}>
            {chiNhanhTen}
          </Typography>
          <Typography variant="body2" sx={{ textAlign: "center", mb: 1, color: "#000000" }}>
            {lichChieuText}
          </Typography>
          <Typography variant="body2" sx={{ textAlign: "center", mb: 2, color: "#000000" }}>
            2D Phụ Đề - {phong}
          </Typography>

          <Divider sx={{ mb: 2, borderColor: "#000000" }} />
          <Box sx={{ display: "flex", justifyContent: "space-between", mb: 1 }}>
            <Typography variant="body2" sx={{ color: "#000000" }}>Mã vé</Typography>
            <Typography variant="body2" sx={{ color: "#000000" }}>{veIds.join(", ")}</Typography>
          </Box>
          <Box sx={{ display: "flex", justifyContent: "space-between", mb: 1 }}>
            <Typography variant="body2" sx={{ color: "#000000" }}>Số lượng</Typography>
            <Typography variant="body2" sx={{ color: "#000000" }}>{veIds.length}</Typography>
          </Box>
          <Box sx={{ display: "flex", justifyContent: "space-between", mb: 1 }}>
            <Typography variant="body2" sx={{ color: "#000000" }}>Số ghế</Typography>
            <Typography variant="body2" sx={{ color: "#000000" }}>{gheDaChon}</Typography>
          </Box>
          <Box sx={{ display: "flex", justifyContent: "space-between", mb: 2 }}>
            <Typography variant="body2" sx={{ color: "#000000" }}>Giá</Typography>
            <Typography variant="body2" sx={{ color: "#000000" }}>
              {tongGiaVe ? tongGiaVe.toLocaleString("vi-VN") + " đ" : "0 đ"}
            </Typography>
          </Box>

          <Divider sx={{ mb: 2, borderColor: "#000000" }} />
          <Typography variant="body2" sx={{ mb: 1, fontWeight: "bold", color: "#000000" }}>
            CineGo
          </Typography>
        </Box>

        <Box sx={{ textAlign: "center", mt: 4 }}>
          <button
            onClick={() => navigate("/")}
            style={{
              padding: "10px 20px",
              backgroundColor: "#FF6200",
              color: "#FFFFFF",
              border: "1px solid #000000",
              borderRadius: "5px",
              cursor: "pointer",
            }}
          >
            Quay lại trang chủ
          </button>
        </Box>
      </Box>
    </Box>
  );
};

export default ThongTinVe;