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
import { Swiper, SwiperSlide } from "swiper/react";
import { Navigation, Pagination, Autoplay } from "swiper/modules";

import "swiper/css";
import "swiper/css/navigation";
import "swiper/css/pagination";

import { useNavigate } from "react-router-dom";

// Component tiêu đề có gạch cam
const TieuDePhan = ({ text }) => (
  <div
    style={{
      display: "flex",
      alignItems: "center",
      margin: "40px auto 20px",
      maxWidth: "1200px",
      padding: "0 20px",
    }}
  >
    <div
      style={{
        width: "5px",
        height: "25px",
        backgroundColor: "#ff6600",
        marginRight: "10px",
      }}
    />
    <Typography variant="h5" style={{ color: "#ff6600", fontWeight: "bold" }}>
      {text}
    </Typography>
  </div>
);

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
        T16
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

        <Box
          sx={{
            display: "flex",
            justifyContent: "center",
            gap: 1,
          }}
        >
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

export default function TrangChu({ searchTerm = "" }) {
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

  const filteredPhim = danhSachPhim.filter((phim) =>
    phim.ten.toLowerCase().includes(searchTerm.toLowerCase())
  );

  return (
    <div>
      {/* Banner */}
      <div
        style={{
          margin: "20px auto",
          maxWidth: "1400px",
          position: "relative",
          padding: "0 20px",
        }}
      >
        <Swiper
          className="banner-swiper"
          spaceBetween={50}
          slidesPerView={1}
          loop={true}
          autoplay={{ delay: 3000, disableOnInteraction: false }}
          navigation={true}
          pagination={{
            clickable: true,
            bulletClass: "custom-bullet", // Áp dụng lớp custom cho các chấm
            bulletActiveClass: "custom-bullet-active", // Áp dụng lớp active
          }}
          modules={[Navigation, Pagination, Autoplay]}
          style={{ paddingBottom: "40px" }}
        >
          {danhSachPhim.length > 0 ? (
            danhSachPhim.slice(0, 4).map((phim) => (
              <SwiperSlide key={phim.id}>
                <CardMedia
                  component="img"
                  height="400"
                  image={phim.banner}
                  alt={`Banner phim ${phim.ten}`}
                  sx={{ borderRadius: "10px", width: "100%" }}
                />
              </SwiperSlide>
            ))
          ) : (
            [1, 2, 3].map((i) => (
              <SwiperSlide key={i}>
                <CardMedia
                  component="img"
                  height="400"
                  image=""
                  alt={`Banner phim ${i}`}
                  sx={{ borderRadius: "10px", width: "100%" }}
                />
              </SwiperSlide>
            ))
          )}
        </Swiper>
      </div>

      {/* Loading / Error */}
      {loading ? (
        <CircularProgress style={{ display: "block", margin: "20px auto" }} />
      ) : error ? (
        <Typography color="error" align="center">
          {error}
        </Typography>
      ) : (
        <>
          {searchTerm ? (
            <>
              <TieuDePhan text={`Kết quả tìm kiếm cho "${searchTerm}"`} />
              {filteredPhim.length > 0 ? (
                <Grid
                  container
                  spacing={4}
                  sx={{ maxWidth: "1200px", margin: "0 auto", padding: "0 20px" }}
                >
                  {filteredPhim.map((phim) => (
                    <Grid item xs={6} sm={4} md={3} key={phim.id}>
                      <CardPhim phim={phim} />
                    </Grid>
                  ))}
                </Grid>
              ) : (
                <Typography align="center" style={{ padding: "20px" }}>
                  Không tìm thấy phim nào phù hợp.
                </Typography>
              )}
            </>
          ) : (
            <>
              <TieuDePhan text="Phim đang chiếu" />
              <Swiper
                className="phim-swiper"
                spaceBetween={20}
                slidesPerView={4}
                navigation={true}
                modules={[Navigation]}
                style={{
                  maxWidth: "1200px",
                  margin: "0 auto",
                  padding: "0 20px 40px",
                }}
                breakpoints={{
                  320: { slidesPerView: 1 },
                  640: { slidesPerView: 2 },
                  960: { slidesPerView: 3 },
                  1200: { slidesPerView: 4 },
                }}
              >
                {danhSachPhim
                  .filter((phim) => phim.dang_chieu)
                  .map((phim) => (
                    <SwiperSlide key={phim.id}>
                      <CardPhim phim={phim} />
                    </SwiperSlide>
                  ))}
              </Swiper>

              <TieuDePhan text="Phim sắp chiếu" />
              <Swiper
                className="phim-swiper"
                spaceBetween={20}
                slidesPerView={4}
                navigation={true}
                modules={[Navigation]}
                style={{
                  maxWidth: "1200px",
                  margin: "0 auto",
                  padding: "0 20px 40px",
                }}
                breakpoints={{
                  320: { slidesPerView: 1 },
                  640: { slidesPerView: 2 },
                  960: { slidesPerView: 3 },
                  1200: { slidesPerView: 4 },
                }}
              >
                {danhSachPhim
                  .filter((phim) => !phim.dang_chieu)
                  .map((phim) => (
                    <SwiperSlide key={phim.id}>
                      <CardPhim phim={phim} />
                    </SwiperSlide>
                  ))}
              </Swiper>
            </>
          )}
        </>
      )}
      {/* Custom CSS cho Swiper */}
      <style>{`
       /* CSS cho mũi tên của Swiper (giữ nguyên cho banner) */
.swiper-button-prev,
.swiper-button-next {
  background-color: #ff6600; /* Màu cam cho tất cả, bao gồm banner */
  color: white; /* Màu trắng cho biểu tượng mũi tên */
  width: 54px;
  height: 46px;
  border-radius: 50%;
  top: 50%;
  transform: translateY(-50%);
  z-index: 10;
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
  display: flex;
  justify-content: center;
  align-items: center;
}

/* CSS cho mũi tên của phim đang chiếu và phim sắp chiếu (đổi thành màu đen) */
.phim-swiper .swiper-button-prev,
.phim-swiper .swiper-button-next {
  background-color: #ffffff; /* Màu đen */
  color: #000000; /* Giữ màu trắng cho biểu tượng mũi tên để dễ nhìn */
}

/* CSS chung cho biểu tượng mũi tên */
.swiper-button-prev::after,
.swiper-button-next::after {
  font-size: 24px;
}

/* Các chấm pagination (giữ nguyên) */
.custom-bullet {
  background-color: #d3d3d3 !important; /* Màu xám nhạt cho chấm không active */
  width: 8px; /* Giảm kích thước chấm */
  height: 8px;
  border-radius: 50%;
  margin: 0 3px !important; /* Giảm khoảng cách giữa các chấm */
  display: inline-block;
  opacity: 1;
  transition: background-color 0.3s;
}

/* Chấm active có màu cam (giữ nguyên) */
.custom-bullet-active {
  background-color: #ff6600 !important; /* Màu cam cho chấm active */
  opacity: 1 !important;
}
      `}</style>
    </div>
  );
}