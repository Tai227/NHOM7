import ThanhDieuHuong from "../components/ThanhDieuHuong";

export default function BoCucChung({ children, onSearch }) {
  return (
    <div>
      <ThanhDieuHuong onSearch={onSearch} /> {/* Truyền prop onSearch xuống ThanhDieuHuong */}
      <main>{children}</main> {/* Hiển thị các trang con (TrangChu, DanhSachPhim, DatVe) */}
    </div>
  );
}