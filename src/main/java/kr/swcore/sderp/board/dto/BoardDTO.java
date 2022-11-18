package kr.swcore.sderp.board.dto;

public class BoardDTO {
	
	private int boardNo;
	private String boardDept;
	private String boardCode;
	private String boardNum;
	private String boardOpen;
	private String boardAdmin;
	private String boardTitle;
	private String boardType;
	private String boardRead;
	private String boardWrite;
	private String boardReply;
	private String boardDesc;
	private String boardDownyn;
	private String boardMoveyn;
	private String regDatetime;
	private String modDatetime;
	private String attrib;
	private int compNo;
	
	public String getBoardRead() {
		return boardRead;
	}
	public void setBoardRead(String boardRead) {
		this.boardRead = boardRead;
	}
	public String getBoardWrite() {
		return boardWrite;
	}
	public void setBoardWrite(String boardWrite) {
		this.boardWrite = boardWrite;
	}
	public String getBoardReply() {
		return boardReply;
	}
	public void setBoardReply(String boardReply) {
		this.boardReply = boardReply;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardDept() {
		return boardDept;
	}
	public void setBoardDept(String boardDept) {
		this.boardDept = boardDept;
	}
	public String getBoardCode() {
		return boardCode;
	}
	public void setBoardCode(String boardCode) {
		this.boardCode = boardCode;
	}
	public String getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(String boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardOpen() {
		return boardOpen;
	}
	public void setBoardOpen(String boardOpen) {
		this.boardOpen = boardOpen;
	}
	public String getBoardAdmin() {
		return boardAdmin;
	}
	public void setBoardAdmin(String boardAdmin) {
		this.boardAdmin = boardAdmin;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getBoardDesc() {
		return boardDesc;
	}
	public void setBoardDesc(String boardDesc) {
		this.boardDesc = boardDesc;
	}
	public String getBoardDownyn() {
		return boardDownyn;
	}
	public void setBoardDownyn(String boardDownyn) {
		this.boardDownyn = boardDownyn;
	}
	public String getBoardMoveyn() {
		return boardMoveyn;
	}
	public void setBoardMoveyn(String boardMoveyn) {
		this.boardMoveyn = boardMoveyn;
	}
	public String getRegDatetime() {
		return regDatetime;
	}
	public void setRegDatetime(String regDatetime) {
		this.regDatetime = regDatetime;
	}
	public String getModDatetime() {
		return modDatetime;
	}
	public void setModDatetime(String modDatetime) {
		this.modDatetime = modDatetime;
	}
	public String getAttrib() {
		return attrib;
	}
	public void setAttrib(String attrib) {
		this.attrib = attrib;
	}	
	public int getCompNo() {
		return compNo;
	}
	public void setCompNo(int compNo) {
		this.compNo = compNo;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [boardNo=" + boardNo + ", boardDept=" + boardDept + ", boardCode=" + boardCode + ", boardNum="
				+ boardNum + ", boardOpen=" + boardOpen + ", boardAdmin=" + boardAdmin + ", boardTitle=" + boardTitle
				+ ", boardType=" + boardType + ", boardRead=" + boardRead + ", boardWrite=" + boardWrite
				+ ", boardDesc=" + boardDesc + ", boardDownyn=" + boardDownyn + ", boardMoveyn=" + boardMoveyn
				+ ", regDatetime=" + regDatetime + ", modDatetime=" + modDatetime + ", attrib=" + attrib + "]";
	}
	public BoardDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
