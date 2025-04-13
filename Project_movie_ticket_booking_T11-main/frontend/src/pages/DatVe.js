import React, { useState, useEffect } from "react";
import {
  Typography,
  Card,
  CardMedia,
  CardContent,
  Button,
  Box,
  Grid,
  CircularProgress,
  Alert,
} from "@mui/material";
import { useParams, useLocation, useNavigate } from "react-router-dom";
import {
  layDanhSachChiNhanh,
  layDanhSachPhong,
  layLichChieuTheoPhim,
  layDanhSachGhe,
  datVe,
} from "../services/veService";

const DatVe = () => {
  const { id: phimId } = useParams();
  const location = useLocation();
  const navigate = useNavigate();
  const phim = location.state?.phim;

  const [chiNhanhList, setChiNhanhList] = useState([]);
  const [phongList, setPhongList] = useState([]);
  const [lichChieuList, setLichChieuList] = useState([]);
  const [gheList, setGheList] = useState([]);
  const [veList, setVeList] = useState([]);
  const [selectedChiNhanh, setSelectedChiNhanh] = useState("");
  const [selectedNgay, setSelectedNgay] = useState("");
  const [selectedGio, setSelectedGio] = useState("");
  const [selectedLichChieu, setSelectedLichChieu] = useState("");
  const [selectedPhong, setSelectedPhong] = useState("");
  const [selectedPhongId, setSelectedPhongId] = useState(null);
  const [selectedGhe, setSelectedGhe] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  useEffect(() => {
    const fetchInitialData = async () => {
      try {
        setLoading(true);
        setError(null);
        const chiNhanhData = await layDanhSachChiNhanh();
        const phongData = await layDanhSachPhong();
        setChiNhanhList(chiNhanhData);
        setPhongList(phongData);
        if (chiNhanhData.length === 0) {
          setError("Không có chi nhánh nào khả dụng");
        }
      } catch (err) {
        setError("Không thể tải dữ liệu chi nhánh hoặc phòng");
      } finally {
        setLoading(false);
      }
    };
    fetchInitialData();
  }, []);

  useEffect(() => {
    if (selectedChiNhanh) {
      const fetchLichChieu = async () => {
        try {
          setLoading(true);
          setError(null);
          const data = await layLichChieuTheoPhim(phimId);
          const filteredLichChieu = data.filter(
            (lich) => (lich.chi_nhanh_id || lich.chi_nhanh) === selectedChiNhanh
          );
          setLichChieuList(filteredLichChieu);
          if (filteredLichChieu.length === 0) {
            setError(`Không có lịch chiếu nào cho chi nhánh ID: ${selectedChiNhanh}`);
          }
        } catch (err) {
          setError("Không thể tải lịch chiếu: " + err.message);
        } finally {
          setLoading(false);
        }
      };
      fetchLichChieu();
    } else {
      setLichChieuList([]);
      setSelectedNgay("");
      setSelectedGio("");
      setSelectedLichChieu("");
      setSelectedPhong("");
      setSelectedPhongId(null);
    }
  }, [phimId, selectedChiNhanh]);

  useEffect(() => {
    if (selectedLichChieu) {
      const fetchGheAndVe = async () => {
        try {
          setLoading(true);
          setError(null);
          const gheData = await layDanhSachGhe(selectedLichChieu);
          const uniqueGheData = [];
          const seen = new Set();
          gheData.forEach((ghe) => {
            const key = `${ghe.ten}-${ghe.phong}`;
            if (!seen.has(key)) {
              seen.add(key);
              uniqueGheData.push(ghe);
            }
          });
          setGheList(uniqueGheData);
          const veData = await fetch("http://localhost:8000/api/ve/").then((res) =>
            res.json()
          );
          setVeList(veData);
          if (uniqueGheData.length === 0) {
            setError(`Không có ghế nào khả dụng cho lịch chiếu ID: ${selectedLichChieu}`);
          }
        } catch (err) {
          setError("Không thể tải danh sách ghế hoặc vé: " + err.message);
        } finally {
          setLoading(false);
        }
      };
      fetchGheAndVe();
    } else {
      setGheList([]);
      setVeList([]);
    }
  }, [selectedLichChieu]);

  const handleGheSelection = (ghe) => {
    const isBooked = veList.some(
      (ve) => ve.lich_chieu === selectedLichChieu && ve.ghe === ghe.id
    );
    if (isBooked) return;

    setSelectedGhe((prev) =>
      prev.includes(ghe.id)
        ? prev.filter((id) => id !== ghe.id)
        : [...prev, ghe.id]
    );
  };

  const handleConfirmBooking = async () => {
    if (!selectedChiNhanh || !selectedLichChieu || selectedGhe.length === 0) {
      alert("Vui lòng chọn chi nhánh, lịch chiếu và ít nhất một ghế!");
      return;
    }

    try {
      setLoading(true);
      setError(null);

      const veIds = [];
      for (const gheId of selectedGhe) {
        const veData = {
          lich_chieu: parseInt(selectedLichChieu),
          ghe: gheId,
        };
        const response = await datVe(veData);
        veIds.push(response.id);
      }
      const chiNhanhTen =
        chiNhanhList.find((cn) => cn.id === selectedChiNhanh)?.ten || "Chưa chọn";
      const lichChieuText =
        selectedNgay && selectedGio ? `${selectedNgay} ${selectedGio}` : "Chưa chọn";
      const gheDaChon = selectedGhe
        .map((gheId) => {
          const ghe = gheList.find((g) => g.id === gheId);
          return ghe ? (ghe.ten || ghe.ma_ghe || ghe.so_ghe || ghe.seat_number) : null;
        })
        .filter(Boolean)
        .join(", ");

      alert("Đặt vé thành công!");
      navigate("/thanh-toan", {
        state: {
          veIds,
          phim,
          chiNhanhTen,
          lichChieuText,
          phong: selectedPhong,
          gheDaChon,
        },
      });
    } catch (err) {
      setError("Đặt vé thất bại: " + err.message);
    } finally {
      setLoading(false);
    }
  };

  const getUniqueDays = () => {
    const days = new Set();
    lichChieuList.forEach((lich) => {
      const date = new Date(lich.ngay_bat_dau);
      const today = new Date();
      const dayLabel =
        date.toDateString() === today.toDateString()
          ? `Hôm nay ${date.toLocaleDateString("vi-VN", {
              day: "2-digit",
              month: "2-digit",
            })}`
          : `Thứ ${date.getDay() + 1} (${date.toLocaleDateString("vi-VN", {
              day: "2-digit",
              month: "2-digit",
            })})`;
      days.add(dayLabel);
    });
    return Array.from(days);
  };

  const getHoursForDay = (dayLabel) => {
    const hours = [];
    lichChieuList.forEach((lich) => {
      const date = new Date(lich.ngay_bat_dau);
      const today = new Date();
      const currentDayLabel =
        date.toDateString() === today.toDateString()
          ? `Hôm nay ${date.toLocaleDateString("vi-VN", {
              day: "2-digit",
              month: "2-digit",
            })}`
          : `Thứ ${date.getDay() + 1} (${date.toLocaleDateString("vi-VN", {
              day: "2-digit",
              month: "2-digit",
            })})`;
      if (currentDayLabel === dayLabel) {
        const hour = lich.gio_bat_dau.slice(0, 5);
        hours.push({ hour, lichId: lich.id, phongId: lich.phong });
      }
    });
    return [...new Set(hours.map((h) => h.hour))].map((hour) => ({
      hour,
      lichId: hours.find((h) => h.hour === hour).lichId,
      phongId: hours.find((h) => h.hour === hour).phongId,
    }));
  };

  useEffect(() => {
    if (selectedNgay && selectedGio) {
      const selectedDateTime = lichChieuList.find((lich) => {
        const date = new Date(lich.ngay_bat_dau);
        const today = new Date();
        const dayLabel =
          date.toDateString() === today.toDateString()
            ? `Hôm nay ${date.toLocaleDateString("vi-VN", {
                day: "2-digit",
                month: "2-digit",
              })}`
            : `Thứ ${date.getDay() + 1} (${date.toLocaleDateString("vi-VN", {
                day: "2-digit",
                month: "2-digit",
              })})`;
        const hour = lich.gio_bat_dau.slice(0, 5);
        return dayLabel === selectedNgay && hour === selectedGio;
      });

      if (selectedDateTime) {
        setSelectedLichChieu(selectedDateTime.id);
        const phong = phongList.find((p) => p.id === selectedDateTime.phong);
        setSelectedPhong(phong ? phong.ten : "Phòng không xác định");
        setSelectedPhongId(selectedDateTime.phong);
      } else {
        setSelectedLichChieu("");
        setSelectedPhong("");
        setSelectedPhongId(null);
      }
    } else {
      setSelectedLichChieu("");
      setSelectedPhong("");
      setSelectedPhongId(null);
    }
  }, [selectedNgay, selectedGio, lichChieuList, phongList]);

  if (!phim) {
    return (
      <Box sx={{ padding: "20px", textAlign: "center", backgroundColor: "#FFFFFF", color: "#000000" }}>
        <Typography variant="h4">Không tìm thấy thông tin phim</Typography>
        <Typography variant="body1">
          Vui lòng quay lại trang chủ và thử lại.
        </Typography>
      </Box>
    );
  }

  const uniqueDays = getUniqueDays();
  const availableHours = selectedNgay ? getHoursForDay(selectedNgay) : [];

  return (
    <Box sx={{ padding: "20px", backgroundColor: "#FFFFFF", color: "#000000", minHeight: "100vh" }}>
      <Box sx={{ maxWidth: 1000, margin: "0 auto" }}>
        <Typography variant="h6" gutterBottom sx={{ textAlign: "center",fontWeight: "bold", color: "#000000", mb: 2 }}>
          ĐẶT VÉ CHO PHIM: <span style={{ fontWeight: "bold", color: "#000000" }}>{phim.ten}</span>
        </Typography>

        {loading && (
          <Box sx={{ display: "flex", justifyContent: "center", my: 2 }}>
            <CircularProgress sx={{ color: "#FF6200" }} />
          </Box>
        )}

        {error && (
          <Box sx={{ my: 2 }}>
            <Alert severity="error" sx={{ backgroundColor: "#FFF3E0", color: "#FF6200" }}>
              {error}
            </Alert>
          </Box>
        )}

        <Card sx={{ maxWidth: 300, margin: "0 auto", mb: 4, backgroundColor: "#FFFFFF", color: "#000000", boxShadow: "0 2px 8px rgba(0,0,0,0.1)" }}>
          <CardMedia
            component="img"
            height="27%"
            width="40%"
            image={phim.duong_dan_anh}
            alt={phim.ten}
          />
          <CardContent sx={{ textAlign: "center" }}>
            <Typography variant="body1" fontWeight="bold" color="#000000">
              {phim.ten}
            </Typography>
          </CardContent>
        </Card>

        <Box sx={{ maxWidth: 800, margin: "0 auto" }}>
          <Box sx={{ mb: 4 }}>
            <Typography variant="h6" gutterBottom fontWeight="bold" sx={{ color: "#000000" }}>
              Chọn rạp:
            </Typography>
            <Grid container spacing={1} direction="column">
              {chiNhanhList.length > 0 ? (
                chiNhanhList.map((chiNhanh) => (
                  <Grid item key={chiNhanh.id}>
                    <Button
                      variant="contained"
                      sx={{
                        maxWidth: "300px",
                        backgroundColor: selectedChiNhanh === chiNhanh.id ? "#FF6200" : "#E0E0E0",
                        color: selectedChiNhanh === chiNhanh.id ? "#FFFFFF" : "#000000",
                        "&:hover": {
                          backgroundColor: selectedChiNhanh === chiNhanh.id ? "#FF6200" : "#D0D0D0",
                        },
                        justifyContent: "flex-start",
                        textAlign: "left",
                      }}
                      onClick={() => {
                        setSelectedChiNhanh(chiNhanh.id);
                        setSelectedNgay("");
                        setSelectedGio("");
                        setSelectedLichChieu("");
                        setSelectedPhong("");
                        setSelectedPhongId(null);
                      }}
                    >
                      {chiNhanh.ten}
                    </Button>
                  </Grid>
                ))
              ) : (
                <Typography sx={{ color: "#000000" }}>Không có chi nhánh</Typography>
              )}
            </Grid>
          </Box>

          {selectedChiNhanh && (
            <Box sx={{ mb: 4 }}>
              <Grid container spacing={2}>
                <Grid item xs={5}>
                  <Typography variant="h6" gutterBottom fontWeight="bold" sx={{ color: "#000000" }}>
                    Chọn suất:
                  </Typography>
                  <Grid container spacing={1} direction="column">
                    {uniqueDays.length > 0 ? (
                      uniqueDays.map((day) => (
                        <Grid item key={day}>
                          <Button
                            variant="contained"
                            sx={{
                              width: "100%",
                              backgroundColor: selectedNgay === day ? "#FF6200" : "#E0E0E0",
                              color: selectedNgay === day ? "#FFFFFF" : "#000000",
                              "&:hover": {
                                backgroundColor: selectedNgay === day ? "#FF6200" : "#D0D0D0",
                              },
                            }}
                            onClick={() => {
                              setSelectedNgay(day);
                              setSelectedGio("");
                              setSelectedLichChieu("");
                              setSelectedPhong("");
                              setSelectedPhongId(null);
                            }}
                          >
                            {day}
                          </Button>
                        </Grid>
                      ))
                    ) : (
                      <Typography sx={{ color: "#000000" }}>Không có ngày</Typography>
                    )}
                  </Grid>
                </Grid>
                {/* Thanh dọc màu đen */}
                <Box
  sx={{
    borderRight: "2px solid #000000",
    height: "auto",
    alignSelf: "stretch",
    marginTop: "40px", // Tạo khoảng cách 10px từ phía trên
  }}
/>
                <Grid item xs={5}>
                  <Typography variant="h6" gutterBottom fontWeight="bold" sx={{ color: "#000000", visibility: "hidden" }}>
                    Giờ chiếu:
                  </Typography>
                  <Grid container spacing={1} direction="column">
                    {availableHours.length > 0 ? (
                      availableHours.map(({ hour, lichId, phongId }) => (
                        <Grid item key={hour}>
                          <Button
                            variant="contained"
                            sx={{
                              width: "100%",
                              backgroundColor: selectedGio === hour ? "#FF6200" : "#E0E0E0",
                              color: selectedGio === hour ? "#FFFFFF" : "#000000",
                              "&:hover": {
                                backgroundColor: selectedGio === hour ? "#FF6200" : "#D0D0D0",
                              },
                            }}
                            onClick={() => {
                              setSelectedGio(hour);
                              setSelectedLichChieu(lichId);
                              const phong = phongList.find((p) => p.id === phongId);
                              setSelectedPhong(phong ? phong.ten : "Phòng không xác định");
                              setSelectedPhongId(phongId);
                            }}
                          >
                            {hour}
                          </Button>
                        </Grid>
                      ))
                    ) : (
                      <Typography sx={{ color: "#000000" }}>
                        {selectedNgay ? "Không có giờ" : "Vui lòng chọn ngày"}
                      </Typography>
                    )}
                  </Grid>
                </Grid>
              </Grid>
            </Box>
          )}

          {selectedGio && (
            <Box sx={{ mb: 4 }}>
              <Typography variant="body1" fontWeight="bold" sx={{ color: "#000000" }}>
                Phòng: {selectedPhong || "Chưa xác định"}
              </Typography>
            </Box>
          )}

          {selectedLichChieu && selectedPhongId && (
            <Box sx={{ mb: 4 }}>
              <Typography variant="h6" gutterBottom fontWeight="bold" sx={{ color: "#000000" }}>
                Chọn ghế:
              </Typography>
              <Grid container spacing={1} justifyContent="center">
                {gheList.length > 0 ? (
                  gheList
                    .filter((ghe) => ghe.phong === selectedPhongId)
                    .map((ghe) => {
                      const isBooked = veList.some(
                        (ve) => ve.lich_chieu === selectedLichChieu && ve.ghe === ghe.id
                      );
                      return (
                        <Grid item key={ghe.id}>
                          <Button
                            variant="contained"
                            sx={{
                              backgroundColor: isBooked
                                ? "#FF0000"
                                : selectedGhe.includes(ghe.id)
                                ? "#FF6200"
                                : "#E0E0E0",
                              color: "#000000",
                              "&:hover": {
                                backgroundColor: isBooked
                                  ? "#FF0000"
                                  : selectedGhe.includes(ghe.id)
                                  ? "#FF6200"
                                  : "#D0D0D0",
                              },
                            }}
                            onClick={() => handleGheSelection(ghe)}
                            disabled={isBooked}
                          >
                            {ghe.ten || ghe.ma_ghe || ghe.so_ghe || ghe.seat_number || "Ghế không xác định"}
                          </Button>
                        </Grid>
                      );
                    })
                ) : (
                  <Typography sx={{ color: "#000000" }}>Không có ghế khả dụng</Typography>
                )}
              </Grid>
            </Box>
          )}

          <Box sx={{ mb: 4, textAlign: "center" }}>
            <Typography variant="body1" sx={{ color: "#000000" }}>
              Chi nhánh đã chọn:{" "}
              {selectedChiNhanh
                ? chiNhanhList.find((cn) => cn.id === selectedChiNhanh)?.ten
                : "Chưa chọn"}
            </Typography>
            <Typography variant="body1" sx={{ color: "#000000" }}>
              Lịch chiếu đã chọn:{" "}
              {selectedNgay && selectedGio
                ? `${selectedNgay} ${selectedGio}`
                : "Chưa chọn"}
            </Typography>
            <Typography variant="body1" sx={{ color: "#000000" }}>
              Phòng: {selectedPhong || "Chưa chọn"}
            </Typography>
            <Typography variant="body1" sx={{ color: "#000000" }}>
              Ghế đã chọn:{" "}
              {selectedGhe.length > 0
                ? selectedGhe
                    .map((gheId) => {
                      const ghe = gheList.find((g) => g.id === gheId);
                      return ghe ? (ghe.ten || ghe.ma_ghe || ghe.so_ghe || ghe.seat_number) : null;
                    })
                    .filter(Boolean)
                    .join(", ")
                : "Chưa chọn"}
            </Typography>
          </Box>

          <Box sx={{ textAlign: "center" }}>
            <Button
              variant="contained"
              sx={{
                backgroundColor: "#FF6200",
                color: "#FFFFFF",
                "&:hover": {
                  backgroundColor: "#E65500",
                },
              }}
              onClick={handleConfirmBooking}
              disabled={loading}
            >
              Xác nhận đặt vé
            </Button>
          </Box>
        </Box>
      </Box>
    </Box>
  );
};

export default DatVe;