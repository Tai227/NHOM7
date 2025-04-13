import { Card, CardMedia, CardContent, Typography, Button, Box } from "@mui/material"; // Import các thành phần giao diện từ Material-UI
import { useNavigate } from "react-router-dom"; // Import useNavigate để điều hướng

export default function ThePhim({ phim, loai, onAction }) {
  const navigate = useNavigate(); // Khởi tạo useNavigate để điều hướng

  // Hàm xử lý khi nhấn nút "Xem chi tiết"
  const handleXemChiTiet = () => {
    navigate(`/chi-tiet-phim/${phim.id}`, { state: { phim } }); // Điều hướng đến trang chi tiết phim với ID phim
  };

  // Hình ảnh mặc định nếu hình ảnh không tải được
  const defaultImage = "https://via.placeholder.com/250x350.png?text=Image+Not+Found";

  return (
    <Card
      sx={{
        position: "relative",
        width: 250, // Cố định chiều rộng của thẻ
        height: 450, // Cố định chiều cao của thẻ
        display: "flex",
        flexDirection: "column",
        borderRadius: 2,
        overflow: "hidden",
        boxShadow: 3,
        transition: "transform 0.3s",
        "&:hover": { transform: "scale(1.03)" },
      }}
    >
      {/* Hình ảnh phim */}
      <CardMedia
        component="img"
        sx={{
          width: "100%", // Đảm bảo hình ảnh lấp đầy chiều rộng của thẻ
          height: 350, // Cố định chiều cao của hình ảnh
          objectFit: "cover", // Giữ tỷ lệ hình ảnh, cắt bớt nếu cần
          objectPosition: "center", // Căn giữa hình ảnh
        }}
        image={phim.duong_dan_anh || defaultImage} // Sử dụng hình ảnh mặc định nếu không có
        alt={phim.ten} // Alt text cho hình ảnh
        onError={(e) => (e.target.src = defaultImage)} // Xử lý lỗi hình ảnh
      />

      {/* Nhãn T18 */}
      <Box
        sx={{
          position: "absolute",
          top: 8,
          left: 8,
          backgroundColor: "#ff6600",
          color: "#fff",
          px: 1,
          py: "2px",
          fontSize: "12px",
          borderRadius: "3px",
          zIndex: 2, // Đảm bảo nhãn T18 nằm trên cùng
        }}
      >
        T18 {/* Nhãn độ tuổi */}
      </Box>

      {/* Tên phim và các nút (dưới ảnh) */}
      <CardContent
        sx={{
          textAlign: "center",
          py: 1,
          flexGrow: 1, // Đảm bảo CardContent chiếm không gian còn lại
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
        }}
      >
        {/* Tên phim */}
        <Typography
          variant="h6"
          sx={{
            whiteSpace: "normal", // Cho phép tên phim xuống dòng nếu dài
            overflow: "hidden",
            textOverflow: "ellipsis",
            display: "-webkit-box",
            WebkitLineClamp: 2, // Giới hạn tối đa 2 dòng
            WebkitBoxOrient: "vertical",
            mb: 1, // Khoảng cách giữa tên phim và các nút
            fontSize: "1rem", // Điều chỉnh kích thước chữ để vừa với thẻ
          }}
        >
          {phim.ten}
        </Typography>

        {/* Các nút "Đặt vé" và "Xem chi tiết" */}
        <Box
          sx={{
            display: "flex",
            justifyContent: "center", // Căn giữa các nút
            gap: 1, // Khoảng cách giữa hai nút
          }}
        >
          {/* Nút "Đặt vé" hoặc "Xem chi tiết" chính */}
          <Button
            variant="contained"
            sx={{
              backgroundColor: "#ff6600",
              color: "#fff",
              fontWeight: "bold",
              "&:hover": { backgroundColor: "#e65500" },
              fontSize: "0.9rem", // Điều chỉnh kích thước chữ của nút
              px: 2,
            }}
            onClick={loai === "dang_chieu" ? onAction : handleXemChiTiet} // Nếu là phim đang chiếu thì gọi onAction (đặt vé), nếu không thì điều hướng đến chi tiết phim
          >
            {loai === "dang_chieu" ? "Đặt vé" : "Xem chi tiết"} {/* Hiển thị text nút dựa trên loại phim */}
          </Button>

          {/* Nút "Xem chi tiết" cho phim đang chiếu */}
          {loai === "dang_chieu" && (
            <Button
              variant="outlined"
              sx={{
                color: "#ff6600",
                borderColor: "#ff6600",
                "&:hover": { backgroundColor: "#ff6600", color: "#fff" },
                fontSize: "0.8rem", // Điều chỉnh kích thước chữ của nút
                px: 2,
              }}
              onClick={handleXemChiTiet} // Gọi hàm handleXemChiTiet khi nhấn nút
            >
              Xem chi tiết
            </Button>
          )}
        </Box>
      </CardContent>
    </Card>
  );
}