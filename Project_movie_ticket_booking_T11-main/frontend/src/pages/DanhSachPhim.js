import {
  Typography,
  Button,
  Grid,
  Card,
  CardMedia,
  CardContent,
  CircularProgress,
  Box,
} from "@mui/material";
import { layDanhSachPhim } from "../services/phimService";
import { useEffect, useState } from "react";
import { useNavigate } from "react-router-dom";

// Component CardPhim
const CardPhim = ({ phim }) => {
  const navigate = useNavigate();

  const handleDatVe = () => {
    navigate(`/dat-ve/${phim.id}`, { state: { phim } });
  };

  const handleXemChiTiet = () => {
    navigate(`/chi-tiet-phim/${phim.id}`, { state: { phim } });
  };

  const defaultImage =
    "https://via.placeholder.com/300x450.png?text=Image+Not+Found";

  return (
    <Card
      sx={{
        position: "relative",
        borderRadius: 2,
        overflow: "hidden",
        boxShadow: 3,
        transition: "transform 0.3s",
        "&:hover": { transform: "scale(1.03)" },
        width: "100%",
        maxWidth: 250,
        minWidth: 250,
        height: 450,
        minHeight: 450,
        display: "flex",
        flexDirection: "column",
      }}
    >
      <Box
        sx={{
          position: "absolute",
          top: 8,
          left: 8,
          backgroundColor: "#000",
          color: "#ff6600",
          px: 1,
          py: "2px",
          fontSize: "12px",
          borderRadius: "3px",
          zIndex: 2,
        }}
      >
        T18
      </Box>

      <CardMedia
        component="img"
        sx={{
          width: "100%",
          height: 350,
          maxHeight: 350,
          objectFit: "cover",
          objectPosition: "center",
        }}
        image={phim.duong_dan_anh || defaultImage}
        alt={phim.ten}
        onError={(e) => (e.target.src = defaultImage)}
      />

      <CardContent
        sx={{
          textAlign: "center",
          py: 1,
          flexGrow: 1,
          display: "flex",
          flexDirection: "column",
          justifyContent: "space-between",
          height: "100px",
          maxHeight: "100px",
          overflow: "hidden",
        }}
      >
        <Typography
          variant="body1"
          fontWeight="bold"
          sx={{
            whiteSpace: "normal",
            overflow: "hidden",
            textOverflow: "ellipsis",
            display: "-webkit-box",
            WebkitLineClamp: 2,
            WebkitBoxOrient: "vertical",
            mb: 1,
          }}
        >
          {phim.ten}
        </Typography>

        <Box sx={{ display: "flex", justifyContent: "center", gap: 1 }}>
          {phim.dang_chieu ? (
            <>
              <Button
                variant="contained"
                sx={{
                  backgroundColor: "#ff6600",
                  color: "#fff",
                  fontWeight: "bold",
                  "&:hover": { backgroundColor: "#e65500" },
                  fontSize: "12px",
                }}
                onClick={handleDatVe}
              >
                Đặt vé
              </Button>
              <Button
                variant="outlined"
                sx={{
                  color: "#ff6600",
                  borderColor: "#ff6600",
                  "&:hover": { backgroundColor: "#ff6600", color: "#fff" },
                }}
                onClick={handleXemChiTiet}
              >
                Xem chi tiết
              </Button>
            </>
          ) : (
            <Button
              variant="contained"
              sx={{
                backgroundColor: "#ff6600",
                color: "#fff",
                fontWeight: "bold",
                "&:hover": { backgroundColor: "#e65500" },
              }}
              onClick={handleXemChiTiet}
            >
              Xem chi tiết
            </Button>
          )}
        </Box>
      </CardContent>
    </Card>
  );
};

// Component chính
export default function DanhSachPhim() {
  const [danhSachPhim, setDanhSachPhim] = useState([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchPhim = async () => {
      try {
        const data = await layDanhSachPhim();
        setDanhSachPhim(data);
      } catch (err) {
        console.error("Lỗi khi lấy danh sách phim:", err);
        setError("Không thể tải danh sách phim");
      } finally {
        setLoading(false);
      }
    };

    fetchPhim();
  }, []);

  const phimDangChieu = danhSachPhim.filter((phim) => phim.dang_chieu);
  const phimSapChieu = danhSachPhim.filter((phim) => !phim.dang_chieu);

  return (
    <div>
      {/* Tiêu đề "Danh Sách Phim" */}
      <Typography
        variant="h4"
        align="center"
        fontWeight="bold"
        sx={{ mt: 4, mb: 2 }}
      >
        Danh Sách Phim
      </Typography>

      {loading ? (
        <CircularProgress style={{ display: "block", margin: "20px auto" }} />
      ) : error ? (
        <Typography color="error" align="center">
          {error}
        </Typography>
      ) : (
        <>
          {/* Phim đang chiếu */}
          <Typography
            variant="h5"
            sx={{
              mt: 4,
              mb: 2,
              color: "#ff6600",
              maxWidth: "1200px",
              mx: "auto",
              px: 2,
              fontWeight: "bold",
            }}
          >
            Phim đang chiếu
          </Typography>
          <Grid
            container
            spacing={4}
            sx={{ maxWidth: "1200px", margin: "0 auto", padding: "0 20px" }}
          >
            {phimDangChieu.length > 0 ? (
              phimDangChieu.map((phim) => (
                <Grid item xs={6} sm={4} md={3} key={phim.id}>
                  <CardPhim phim={phim} />
                </Grid>
              ))
            ) : (
              <Typography sx={{ ml: 2 }}>Không có phim đang chiếu.</Typography>
            )}
          </Grid>

          {/* Phim sắp chiếu */}
          <Typography
            variant="h5"
            sx={{
              mt: 4,
              mb: 2,
              color: "#ff6600",
              maxWidth: "1200px",
              mx: "auto",
              px: 2,
              fontWeight: "bold",
            }}
          >
            Phim sắp chiếu
          </Typography>
          <Grid
            container
            spacing={4}
            sx={{ maxWidth: "1200px", margin: "0 auto", padding: "0 20px" }}
          >
            {phimSapChieu.length > 0 ? (
              phimSapChieu.map((phim) => (
                <Grid item xs={6} sm={4} md={3} key={phim.id}>
                  <CardPhim phim={phim} />
                </Grid>
              ))
            ) : (
              <Typography sx={{ ml: 2 }}>Không có phim sắp chiếu.</Typography>
            )}
          </Grid>
        </>
      )}
    </div>
  );
}
