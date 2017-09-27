//************************************************************************
//*		Systeme			:	新会計システム
//*		Program			:	日常処理仕訳指示
//*		ProgramID		:	MAS310000
//*		Name			:	K.Hattori
//*		Create			:	2001/03/31
//*		Comment			:	システムメニュー及び各集計表表示画面より呼び出され、
//*							仕訳入力、元帳表示、検証機能等のコントロールを行う。
//*
//*		History			:	XXXX/XX/XX	XX修正者XX（所属）
//*									 XXXXXXXXXX更新内容XXXXXXXXXX
//************************************************************************
(*♪♪♪♪♪　Ｓｐｅｃｉａｌ　！！！　*)

(*H0001	20010409 khattori 処理月による排他*)
(*H0002	20010511 khattori 月固定／月可変切替のデフォルト*)
(*H0003	20010511 khattori ＤＢのオープンに失敗した時の処理*)
(*H0004	20010531 khattori Ｃａｐｔｉｏｎの出し方変更*)
(*H0005	20010604 khattori Ａｌｔ＋ｘの時、ドリルダウンの修正フラグが渡らない*)
(*H0006	20010626 khattori 表示からの入力中等でマウスで指示に戻った時、指示が不正*)
(*H0007	20010628 khattori 初期処理中に他のアプリケーションを表示された時*)
(*H0008 20010703 khattori プレビュー中に裏画面にされた時！*)
(*H0009 20010709 khattori Ｃｏｍｂｏの動き調整*)
(*H0010 20010712 khattori やばすぎ２！！！*)

(*H0011 20010725 tyamaguchi 付箋ボタン対応*)
(*H0012 20010730 tyamaguchi 終了処理メッセージ変更(出納帳用作成)*)
(*H0013 20010731 tyamaguchi 入力不可区分、修正／削除区分対応*)
(*H0014 20010820 tyamaguchi コード拡大対応*)

(*H0015 20010921 tyamaguchi 定型仕訳対応*)
(*H0016 20010921 tyamaguchi インスタンスの解放をOnDestroyに移動*)
(*H0017 20010925 khattori	定型仕訳対応*)
(*H0018 20010926 khattori	定型仕訳排他対応*)
(*H0019 20010927 khattori	定型仕訳ＦＡＳ対応*)
(*H0020 20010927 khattori	復活！！！*)
(*H0021 20010928 khattori	更新確認のＣａｎｃｅｌボタン*)
(*H0022 20011009 khattori	Ｒｏｏｔ初期処理追加*)
(*H0023 20011024 khattori	初期値変更*)

(*Ver.x*)
(*H0025	20011217 khattori	マルチ入力*)
(*H0024	20011217 khattori	手形入力*)
(*H0026 20020111 khattori	第２指示もセットする。*)

(*Ver A121 M101*)
(*H0026 20020301 khattori	ＣＲ、００、０００　キー*)

(*H0027 20020307 khattori	ＦＡＳがめろめろ*)

(*Ver A122 M102*)
(*H0028 20020328 khattori	エスケープキーでドロップダウンを閉じる*)
(*Ver A123 M102*)
(*H0029 20020328 khattori	第１指示のＣａｐｔｉｏｎ切替*)

(*Ver A123 M102*)
(*H0030 20020415 khattori	メール会計本支店対応*)

(*Ver A123 M103*)
(*H0032 20020501 khattori	終了処理メッセージ変更(手形用作成)*)

(*H0033 20030129 khattori	切り出し→最小化→ツリーから選択→Ｅｎｔｅｒ→エラー*)

(*H0034 20030611 khattori	分散入力*)
(*H0035 20030825 khattori	MJSLINK <-> ACELINK 統一*)
(*H0036 20030825 khattori	syuusei 会社単独廃止対応*)

(*H0037 20030827 khattori	ＡＣＥＬＩＮＫ＜－＞ＭＪＳＬＩＮＫ統合*)

(*H0038 20030904 khattori	分散入力<単一入力>*)

(*H0043 20040616 khattori	クリック！*)

(*H0044 20041213 khattori	ＦｏｎｔＲｅｓｉｚｅ*)
(*H0045 20050210 A.Ando		切出／埋込処理の記述変更*)
(*H0046 20050302 T.Shimada  高解像度対応追加。*)
(*H0047 20050418 khattori	一括置換*)
(*H0048 20050516 khattori	操作ガイド番号通知*)

//<HIS-001> 2006/02/15 T.Yamaguchi	サブプログラムボタン ＆ Excel取込 対応
//<HIS-002> 2006/04/06 T.Yamaguchi	オプション採用有無チェックの機能追加
//<HIS-004> 2006/10/17 T.Yamaguchi	サブプログラム メニュー追加(他社データ取込 他)
//<HIS-005> 2006/10/25 T.Yamaguchi	マルチスクリーンでサブプログラムボタンの位置がおかしくなる
//<HIS-006> 2006/12/27 T.Yamaguchi	サブプログラム メニュー追加
//<HIS-007> 2006/12/28 T.Yamaguchi	サブプログラム呼び出し時に指示から排他(会社別処理単独)をかける
//<HIS-008> 2007/02/26 T.Yamaguchi	<HIS-005> 追加修正 高解像度が考慮されていない
//<HIS-009> 2007/02/26 T.Yamaguchi	フォームの DragKind を dkDrag に変更(Vista対応)
//<HIS-011> 2007/03/06 T.Yamaguchi	サブプログラム メニュー追加(IBEX出納帳)(ｺﾒﾝﾄ省略)
//<HIS-014> 2007/05/08 T.Yamaguchi	伝票 対応
//<HIS-015> 2007/05/31 T.Yamaguchi	画面サイズ可変 対応
//<HIS-016> 2007/08/24 T.Yamaguchi	サブプログラム メニュー追加(記帳くん07)
//<HIS-017> 2007/09/11 T.Yamaguchi	終了ボタン クリックと(&X)で微妙に動作が違う
//<HIS-018> 2007/09/12 T.Yamaguchi	伝票で付箋ボタンの位置がおかしい
//<HIS-019> 2007/10/05 T.Yamaguchi	ニーモニック(&x)論理変更(MjsBtnVisible を使用しない) [QZF-0790]
//<HIS-020> 2007/10/05 T.Yamaguchi	連想コンポーネントの初期化が正しく機能していない
//<HIS-022> 2007/10/11 T.Yamaguchi	<HIS-015>追加 Constraints は使用しない
//<HIS-023> 2007/11/01 T.Yamaguchi	ツリー表示後画面が縮んだままになるケースがある
//<HIS-024> 2007/11/14 T.Yamaguchi	<HIS-023> 追加修正 ドリルダウン時に子プログラムが縮んだまま
//<HIS-027> 2008/01/23 T.Yamaguchi	uses節 に Contnrs 追加 (仕訳更新の改良に伴い)
//<HIS-028> 2008/01/30 T.Yamaguchi	<HIS-015>追加 Align の設定タイミングを変更
//<HIS-029> 2008/01/30 T.Yamaguchi	<HIS-005>破棄 <HIS-028> の対応に伴い戻す
//<HIS-030> 2008/02/12 T.Yamaguchi	マウスクリックで月変更すると月固定ボタンが切り替わらない
//<HIS-032> 2008/03/19 T.Yamaguchi	取込処理 メール会計オフライン 対応
//<HIS-033> 2008/04/01 T.Yamaguchi	取込処理は、仕訳入力のみ
//<HIS-034> 2008/04/01 T.Yamaguchi	<HIS-028>追加 採用なし時の分散入力の考慮が不十分
//<HIS-035> 2008/05/20 T.Yamaguchi	<HIS-028>追加 仕訳入力のグリッドのスクロール位置がおかしくなる
//<HIS-037> 2008/06/10 T.Yamaguchi	定型Ｎｏ, 伝票Ｎｏ, 日付に負数が入力できてしまう(フォームのみ)
//<HIS-039> 2008/06/30 T.Yamaguchi	終了処理以降のエラーを吸収する(須藤会計)(ｺﾒﾝﾄ省略)
//<HIS-042> 2008/07/14 T.Yamaguchi	<HIS-035>追加 画面が切れる現象が再発(ドリルダウン時)
//<HIS-044> 2008/08/20 T.Yamaguchi	仕訳排他 対応
//<HIS-045> 2008/08/20 T.Yamaguchi	分散テーブル対応
//<HIS-047> 2008/09/11 T.Yamaguchi	MAS312100DSIParam 定義変更に伴う対応
//<HIS-049> 2008/10/03 T.Yamaguchi	指示コンボの切替に不具合
//<HIS-050> 2008/10/21 T.Yamaguchi	<HIS-044>追加 分散入力(採用なし)でエラー
//<HIS-052> 2009/01/09 T.Yamaguchi	翌期の月可変を可能にする
//<HIS-056> 2009/04/01 T.Yamaguchi	処理切替時、選択処理中のコンボが切り替わらない
//<HIS-059> 2009/08/19 T.Yamaguchi	取込処理 ＰＣＡ会計９対応
//<HIS-060> 2009/09/07 T.Yamaguchi	ウィンドウ コードによる絞り込み機能を追加
//<HIS-062> 2010/01/26 T.Yamaguchi	分散排他エラーのキャプション対応
//<HIS-063> 2010/04/01 T.Yamaguchi	取込処理 項目のEnabled,Visibleを一括設定できるようにする
//<HIS-064> 2010/04/01 T.Yamaguchi	取込処理 会計王11、勘定奉行i 対応

unit MAS310000u;

interface

uses
	//	Delphi Vcl
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	Buttons, ExtCtrls, ComCtrls, StdCtrls, FileCtrl, Contnrs, Menus, ImgList,
	Db, DBTables, DBCtrls, ToolWin, Imm,
	//	Mjs Vcl
	MJSPanel, MJSLabel, MJSEdits, MJSComboBox, MJSBitBtn, MJSSpeedButton,
	MJSFunctionBar, MJSSPFunctionBar, MJSStatusBar,
	MJSMemo, MJSAssocEdit, MjsQuery,
	MjsDispCtrl, MjsStrCtrl, MjsDateCtrl, MJSKeyDataState,
	//	Mjs Lib
	MjsCommonu, MjsCommon2u,
	MjsDBModuleu, MjsMsgStdu, MjsPreviewIFu,
	MasComu, MasMonth,
	//	Local
	MAS310000SwkExclusiveu,
	MAS310000Dlgu, MAS310000SubMenuu, MAS310000CldFormDlgu,
	VKZ310Cmnu;

const
	BPLMAX				= 29;
	HDRD0X_WIDTH		= 146;
	HDRD0X_LABEL_WIDTH	= 50;
	arStr:array[0..1] of String=('月固定','月可変');
	WM_ONPAINT	= WM_APP + 1;	// OnPaint 時の処理起動メッセージ用
//---<HIS-017>------------------------------------------------------------------
	WM_TERM		= WM_APP + 2;
//------------------------------------------------------------------<HIS-017>---

type
{$I ActionInterface.inc}	//	簡易メニュー共通インターフェイス

//{$I MASL310RootI.inc}		//	日常処理共通外部インターフェイス
{$I VKZL310EntryIF_VK07I.inc}
//{$I MASL310EntryIFI.inc}

{$I MASKoekiSetH.inc}		//	公益検証用

{$I MASL310RootH.inc}		//	日常処理共通関数

(*H0036 20030825 khattori	syuusei 会社単独廃止対応*)
{$I MASExceptIFI.inc}
{$I MASExceptIFH.inc}

//---<HIS-002>------------------------------------------------------------------
{$I MASL310SysOptionH.inc}
//------------------------------------------------------------------<HIS-002>---

(*H0048 20050516 khattori	操作ガイド番号通知*)
	rcHELPINFO = record
		Code1	:	Integer;
		Code2	:	Integer;
		Chm		:	String;
		Html	:	String;
	end;

	TMAS310000f = class(TForm)
		PMPanelAll			:	TMPanel;

		PMPanelHd			:	TMPanel;
		PMPanelWd			:	TMPanel;
		PMPanelHdSd			:	TMPanel;
		PMPanelHdRd			:	TMPanel;
		PMPanelHdSj			:	TMPanel;
		PMPanelHdOt			: 	TMPanel;

		PMPanelHdSjFst		:	TMPanel;
		PMPanelHdSjSnd		:	TMPanel;
		PMPanelAp			:	TMPanel;

		PMComboBox2			:	TMComboBox;
		PMComboBox3			:	TMComboBox;
		PMComboBox4			:	TMComboBox;

		LMLabelHdSj1		:	TMLabel;

		MStatusBar			:	TMStatusBar;

		MSPFunctionBar		:	TMSPFunctionBar;

		ColorDialog1		:	TColorDialog;
		PMPanelDev			:	TMPanel;
		MTxtEdit1			:	TMTxtEdit;
		MMemo1				:	TMMemo;

		PMPanelHdTop		:	TMPanel;
		BMSpBtnExit			:	TMSpeedButton;
		BMSpBtnChange		:	TMSpeedButton;
		BMSpBtnShowBalance	:	TMSpeedButton;
		LMLabelHd2			:	TMLabel;
		PMPanelHdBf			:	TMPanel;
		LMLabelHd1			:	TMLabel;
		EMNumEditInp		:	TMNumEdit;
		EMNumEditBalance	:	TMNumEdit;
		PMPanelSelMonth		:	TMPanel;
		LMLabelSelMonthVF	:	TMLabel;
		LMLabelSelMonthVN	:	TMLabel;
		PMPanelHdMonthFix	:	TMPanel;
		BMSpBtnMonthFix		:	TMSpeedButton;
		PopupMenu1			:	TPopupMenu;
	    Timer1				:	TTimer;
	    PopupMenu2			:	TPopupMenu;
	    R1					:	TMenuItem;
		B1					:	TMenuItem;
		G1					:	TMenuItem;
	    O1					:	TMenuItem;
		C1					:	TMenuItem;
		ImageList1			:	TImageList;
	    ImageList2			:	TImageList;
		ToolBar				:	TToolBar;
	    TMBtnFusen			:	TToolButton;
	    TMBtnOpen			:	TToolButton;
(*H0047 20050418 khattori	一括置換*)
	    TMBtnLump			:	TToolButton;

	    PMPanelHdFx			: 	TMPanel;
	    PMPanelFx_No		: 	TMPanel;
		PMPanelFx_NoN		: 	TMPanel;
	    EMNumEditFx_No		: 	TMNumEdit;
		PMPanelFx_Date		: 	TMPanel;
	    PMPanelFx_DateN		: 	TMPanel;
	    EMNumEditFx_Date	: 	TMNumEdit;
		PMPanelFx_Ren		:	TMPanel;
	    PMPanelFx_RenN		: 	TMPanel;
	    PMPanelFx_RenEnt	:	TMPanel;
		PMPanelFx_RenEntN	: 	TMPanel;
		MTxtFx_Ren			: 	TMAssocEdit;
		MTxtFx_RenEnt		:	TMTxtEdit;
	    PMPanelFx_Den		:	TMPanel;
	    EMNumEditFx_Den		:	TMNumEdit;
	    PMPanelFx_DenN		: 	TMPanel;
	    MTxtFx_Name			:	TMTxtEdit;
		MFurigana			:	TMFurigana;
	MPanel1: TMPanel;

		procedure FormCreate(Sender: TObject);
		procedure FormShow(Sender: TObject);
		procedure FormPaint(Sender: TObject);
		procedure FormClose(Sender: TObject; var Action: TCloseAction);
		procedure FormDestroy(Sender: TObject);
		procedure FormActivate(Sender: TObject);
		procedure FormHide(Sender: TObject);
		procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
//---<HIS-015>------------------------------------------------------------------
		procedure PMPanelAllResize(Sender: TObject);
//------------------------------------------------------------------<HIS-015>---
		procedure CMChildKey(var Msg: TCMChildKey); message CM_CHILDKEY;

		procedure PMPanelHdExit(Sender: TObject);
		procedure PMPanelHdEnter(Sender: TObject);

		procedure PMPanelHdRdExit(Sender: TObject);

		procedure PMComboBox2Enter(Sender: TObject);
		procedure PMComboBox2Exit(Sender: TObject);
		procedure PMComboBox2Click(Sender: TObject);
		procedure PMComboBox2Change(Sender: TObject);
		procedure PMComboBox2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
		procedure PMComboBox2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
		procedure PMComboBox2Select();

		procedure PMComboBox3Enter(Sender: TObject);
		procedure PMComboBox3Exit(Sender: TObject);
		procedure PMComboBox3Click(Sender: TObject);
		procedure PMComboBox3Change(Sender: TObject);
		procedure PMComboBox3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
		procedure PMComboBox3KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
		procedure PMComboBox3Select(rFunc:TMASL310IFunc);

		procedure PMComboBox4Enter(Sender: TObject);
		procedure PMComboBox4Exit(Sender: TObject);
		procedure PMComboBox4Click(Sender: TObject);
		procedure PMComboBox4Change(Sender: TObject);
		procedure PMComboBox4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
		procedure PMComboBox4KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
		procedure PMComboBox4Select(rFunc:TMASL310IFunc);

		procedure BMSpBtnExitClick(Sender: TObject);
		procedure BMSpBtnChangeClick(Sender: TObject);
		procedure BMSpBtnMonthFixClick(Sender: TObject);
		procedure BMSpBtnShowBalanceClick(Sender: TObject);

		procedure PMPanelSelMonthClick(Sender: TObject);
		procedure PMPanelHdSjFstClick(Sender: TObject);
		procedure PMPanelHdSjSndClick(Sender: TObject);

		procedure BMSpBtnDevxxClick(Sender: TObject);
		procedure Timer1Timer(Sender: TObject);
		procedure MIxxClick(Sender: TObject);

		//	定型仕訳関係処理(MASLFx.inc)
		procedure FxEnter(Sender: TObject);
		procedure FxExit(Sender: TObject);
		procedure FxChange(Sender: TObject);
		procedure FxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
		function GetSForm: Integer;		//  仕訳入力形式の取得
		function GetTClass: Integer;	//  出納帳定型種別の取得
		procedure FxSetHead;
		procedure FxRenAssocEvent(Sender: TObject; var Key: String);
		function FxGetFxFunc:TMASL310IFunc;
		procedure MFuriganaCompositionStr(Sender: TObject; Value: String);

		protected
			(* Private 宣言 *)
			g_pDrill		:	Pointer;			//	ドリルダウン構造体（指示用）
			g_miSystemCode	:	Integer;

(*Ver.x*)
(*H0024	20011217 khattori	手形入力*)
			g_miOptionCode	:	Integer;

			PMASLHdRd01		:	TMASL310HeadAc;
			PMASLHdRd02		:	TMASL310HeadOt;
			PMASLHdRd03		:	TMASL310HeadOt;
			PMASLHdRd04		:	TMASL310HeadOt;

			rParam			:	TWParam;
			SelWnd			:	TMAS310SelWndDB;	//	選択ウィンドウ

			Rt				:	TMASL310Root;		//	日常処理共通クラス
			Sm				:	TMASL310SelMonth;	//	処理月操作クラス
			Itm				:	TMASL310Item;		//	指示項目操作クラス
			Fnc				:	TMASL310Func;		//	ファンクションバー操作クラス
			Ind				:	TMASL310Ind;		//	指示ComboBox操作クラス
			Stb				:	TMASL310StatusBar;	//	ステータスバー操作クラス
//---<HIS-001>------------------------------------------------------------------
			SubPrg			:	TSubPrgBtn;			//	サブプログラム呼び出しボタン
//------------------------------------------------------------------<HIS-001>---

			gfg				:	Boolean;
			gfirst			:	Boolean;

			gcrCont			:	Array [0..59] of 	TWinControl;

			gMASLParam		:	TMASL310IParam;

			m_pRec			:	^TMjsAppRecord;		//	Bpl管理構造体

			m_cMDModule		:	TMDataModulef;

(*H0013 20010731 tyamaguchi 入力不可区分、修正／削除区分対応*)
			m_FixKbn16     :	Integer;			//  仕訳入力不可区分
(*H0017 20010925 khattori	定型仕訳対応*)
			m_FixKbn20		:	Integer;			//  定型仕訳採用区分（仕訳）
			m_FixKbn21		:	Integer;			//  定型仕訳採用区分（出納）
			m_FixKbn22		:	Integer;			//  定型仕訳ウィンドウ表示区分
			m_FixKbn23		:	Integer;			//  ウィンドウ内部コード表示区分
			m_FixKbn29		:	Integer;			//  定型仕訳採用区分（伝票）

(*H0034 20030611 khattori	分散入力*)
			m_BunKbn01		:	Integer;			//  分散入力採用区分

			m_cFixLock		:	TMASL310IFixLock;	//	定型仕訳排他パラメータ

			m_iFxRenLength	:	Integer;

(*H0043 20040616 khattori	クリック！*)
			m_iFxSwkInp		:	Integer;

//---<HIS-044>------------------------------------------------------------------
			m_cSwkExc		:	ISwkExclusive;		//	仕訳排他クラス(インターフェース)
//------------------------------------------------------------------<HIS-044>---
			m_iExclusive	:	Integer;		(*H0001	20010426	khattori	処理月による排他*)
			m_iClose		:	Integer;		(*H0001	20010409	khattori	処理月による排他*)
			m_bfirst		:	Boolean;

			m_stFlexInfo	:	TFlexInfo;

(*H0010 20010712 khattori やばすぎ２！！！*)
			m_bTerm			:	Boolean;

(*H0002	20010511 khattori 月固定／月可変切替のデフォルト*)
			m_iTukiDefault	:	Integer;			//	単一入力（年間）の時の初期値　0:月固定 1:月可変

(*H0003	20010511 khattori ＤＢのオープンに失敗した時の処理*)
			m_FCopDBMas		:	TDatabase;

			m_bCB2KeyEnter	:	Boolean;
			m_bCB2Select	:	Boolean;
			m_bCB2Index		:	Integer;
			m_bCB3KeyEnter	:	Boolean;
			m_bCB3Index		:	Integer;
			m_bCB4KeyEnter	:	Boolean;
			m_bCB4Index		:	Integer;

(*H0008 20010703 khattori プレビュー中に裏画面にされた時！*)
			MJSPreIf		:	TMjsPreviewIF;

(*H0015 20010921 tyamaguchi 定型仕訳対応*)
			m_iFxExists		:	Integer;			//  0：存在する(修正ﾓｰﾄﾞ)  -1：存在しない(新規ﾓｰﾄﾞ)  -2：使用不可

(*Ver A121 M101*)
(*H0026 20020301 khattori	ＣＲ、００、０００　キー*)
			m_bCRKey		:	boolean;
			m_iCRKey		:	Integer;
			m_i00Key		:	Integer;
			m_i000Key		:	Integer;
//---<HIS-060>------------------------------------------------------------------
			m_iCodeAssoc	:	Integer;			//	ｺｰﾄﾞによる連想絞込	(0:絞込なし 1:絞込あり)
//------------------------------------------------------------------<HIS-060>---

(*H0036 20030825 khattori	syuusei 会社単独廃止対応*)
			m_cExcept		:	TMASExceptIF;
			m_iRet			:	Integer;
			m_nReferMode	:	Integer;

(*H0038 20030904 khattori	分散入力<単一入力>*)
			m_iPMPanelDev	:	Integer;
//---<HIS-002>------------------------------------------------------------------
			m_cSubUse		:	TMASL310SubPrgUse;	//	サブプログラム採用判定クラス
//------------------------------------------------------------------<HIS-002>---

(*H0036 20030825 khattori	syuusei 会社単独廃止対応*)
			procedure	fnExceptCheck;
			procedure	fnExceptTerm;

			procedure	InitSelMonth; virtual;

			procedure	SetIndOnSelMonth;
			procedure	SetIndOnSiji(Sender: TObject;iFunc:enIfunc);

			procedure	SetCaptionBtnFix(iEnabled:Integer=0);
			procedure	SetFuncOnSelMonth;
			procedure	SetFuncOnSiji(iFunc:enIfunc);

			procedure	gMASL310RootVf( enPar:enVfunc;	pPar1:Pointer=nil;	pPar2:Pointer=nil;	pPar3:Pointer=nil)	;			// 戻り値なし
			function	gMASL310RootPf( enPar:enPfunc;	pPar1:Pointer=nil;	pPar2:Pointer=nil;	pPar3:Pointer=nil) : Pointer;	// 　〃　Pointer型
			function	gMASL310RootBf( enPar:enBfunc;	pPar1:Pointer=nil;	pPar2:Pointer=nil;	pPar3:Pointer=nil) : Boolean;	// 　〃　Boolean型
			function	gMASL310RootIf( enPar:enIfunc;	pPar1:Pointer=nil;	pPar2:Pointer=nil;	pPar3:Pointer=nil) : Integer;	// 　〃　Integer型
			function	gMASL310RootSf( enPar:enSfunc;	pPar1:Pointer=nil;	pPar2:Pointer=nil;	pPar3:Pointer=nil) : String;	// 　〃　String型
			function	gMASL310RootWf( enPar:enWfunc;	pPar1:Pointer=nil;	pPar2:Pointer=nil;	pPar3:Pointer=nil) : Pointer;	// 選択ウィンドウカバー関数

(*H0021 20010928 khattori	更新確認のＣａｎｃｅｌボタン*)
			function	EscKeyKeyDown(Sender: TObject; const Key: Word=0): Word; virtual;
//			procedure	EscKeyKeyDown(Sender: TObject; const Key: Word=0);
			procedure	WMOnPaint(var Msg: TMessage); message WM_ONPAINT;
//---<HIS-019>------------------------------------------------------------------
			procedure	CMDialogChar(var Msg: TCMDialogChar); message CM_DIALOGCHAR;
//------------------------------------------------------------------<HIS-019>---
//---<HIS-017>------------------------------------------------------------------
			procedure	WMTerm(var Msg: TMessage); message WM_TERM;
//------------------------------------------------------------------<HIS-017>---
//---<HIS-001>------------------------------------------------------------------
			procedure	SubMenuClick(idx: Integer);
//------------------------------------------------------------------<HIS-001>---
//---<HIS-006>------------------------------------------------------------------
			procedure	SetSubPrgUse;
//------------------------------------------------------------------<HIS-006>---


			procedure	MakeDevPanel;

			procedure	DisableComponent();

			//	定型仕訳関係処理(MASLFx.inc)
			procedure	FxReset			( iMode:  Integer = 0 );
			procedure   FxDsp			( iSjiNo: Integer = 0; iMode: Integer = 0 );
			procedure 	FxFocusMove		( Sender: TObject; const iMove : Integer );
			procedure	FxCallDoAction	( const iMode : Integer );
			procedure   FxAction_Parent	( iEvent: Integer; pPar1: Pointer = nil; pPar2: Pointer = nil );
			procedure   FxAction_No		( iEvent: Integer; pPar1: Pointer = nil; pPar2: Pointer = nil );
			procedure   FxAction_Ren	( iEvent: Integer; pPar1: Pointer = nil; pPar2: Pointer = nil );
			procedure   FxAction_RenEnt	( iEvent: Integer; pPar1: Pointer = nil; pPar2: Pointer = nil );
			procedure   FxAction_Date	( iEvent: Integer; pPar1: Pointer = nil; pPar2: Pointer = nil );
			procedure   FxAction_Den	( iEvent: Integer; pPar1: Pointer = nil; pPar2: Pointer = nil );
			procedure   FxAction_Name	( iEvent: Integer; pPar1: Pointer = nil; pPar2: Pointer = nil );
			procedure	SetFuncOnFix    ( const arsFuncCaption: array of String );
			function	FxWndDsp		( Sender: TObject ): Integer;
			procedure	FxFurigana		( sValue: String );
//---<HIS-020>------------------------------------------------------------------
			procedure	FxRenClear		();
//------------------------------------------------------------------<HIS-020>---

			function	IsBaseMode(iPrgCode:Integer=0):Boolean;		virtual;	//	入力制御

(*H0038 20030904 khattori	分散入力<単一入力>*)
			function	IsSuitouMode(iPrgCode:Integer=0):Boolean;	virtual;	//	出納帳

			function	IsSlipMode(iPrgCode:Integer=0):Boolean;		virtual;	//	伝票制御
			function	IsBunsanMode(iPrgCode:Integer=0):Boolean;	virtual;	//	分散入力

			function	Is_FASMODE		:	Boolean;	//	ＦＡＳ
			function	Is_JIMUSYO		:	Boolean;	//	事務所
			function	Is_ZAIMU		:	Boolean;	//	財務基本（本店）
			function	Is_SITEN		:	Boolean;	//	財務基本（支店）
			function	Is_ZFASCS		:	Boolean;	//	財務大将FAS（CS用）
			function	Is_ZFASMN		:	Boolean;	//	財務大将FAS（管理者用）

(*H0044 20041213 khattori	ＦｏｎｔＲｅｓｉｚｅ*)
			procedure	fnHighResolve;		//	高解像度対応

		public
			(* Public 宣言 *)
			constructor	CreateForm( pPar : Pointer );
	end;

//function AppEntry(pPar: Pointer) : Integer;
//
//exports
//	AppEntry;

implementation

uses
//---<HIS-007>------------------------------------------------------------------
	MjsExceptU,
//------------------------------------------------------------------<HIS-007>---
	VKZ310AppEntryu;

{$R *.DFM}

{$I MASKoekiSetB.inc}		//	公益検証用

{$I MASL310RootB.inc}		//	日常処理共通関数
{$I MASL310Fx.inc}			//	定型仕訳関係処理	2001/09/21 Ins

(*H0036 20030825 khattori	syuusei 会社単独廃止対応*)
{$I MASExceptIFB.inc}

//---<HIS-002>------------------------------------------------------------------
{$I MASL310SysOptionB.inc}
//------------------------------------------------------------------<HIS-002>---

////******************************************************************************
////	Proccess	:	AppEntry
////	Name		:	K.Hattori(MJS)
////	Date		:	2000/12/08
////	Parameter	:	pPar
////	Return		:	Integer
////******************************************************************************
//function AppEntry(pPar: Pointer) : Integer;
//var
//	pFrm		:	^TMAS310000f;
//	pRec		:	^TMjsAppRecord;
//
//(*H0004	20010531 khattori Ｃａｐｔｉｏｎの出し方変更*)
//	Exparam		:	TAppParam;
//begin
//	result	:= ACTID_RET_OK;
//	pRec	:= Pointer( TAppParam( pPar^ ).pRecord );
//
//	case TAppParam( pPar^ ).iAction of
//
//		//	Form Create要求
//		ACTID_FORMCREATESTART		:
//		begin
//			new( pFrm );
//			try
//				pFrm^ := TMAS310000f.CreateForm( pPar );
//				pRec^.m_pChildForm := pFrm;
//			except
//				Dispose( pFrm );
//				result := ACTID_RET_NG;
//			end;
//		end;
//
//		//	Form Create&Show要求
//		ACTID_FORMCREATESHOWSTART	:
//		begin
//			new( pFrm );
//			try
//				pFrm^ := TMAS310000f.CreateForm( pPar );
//				pFrm^.Show();
//				pRec^.m_pChildForm := pFrm;
//			except
//				Dispose( pFrm );
//				result := ACTID_RET_NG;
//			end;
//		end;
//
//		//	Form Close要求
//		ACTID_FORMCLOSESTART		:
//		begin
//			pFrm := Pointer( pRec^.m_pChildForm );
//			if	pRec^.m_iDelete<>1
//			then
//			begin
//(*H0021 20010928 khattori	更新確認のＣａｎｃｅｌボタン*)
//				result := ACTID_RET_NG;
//				if	pFrm^.EscKeyKeyDown(pFrm^,VK_F4+VK_MENU)=mrCancel	then	exit;
////				pFrm^.Close();
//				pFrm^.Free();
//				result	:= ACTID_RET_OK;
//			end;
//			Dispose( pFrm );
//		end;
//
//		//	Form CanClose要求
//		ACTID_FORMCANCLOSESTART		:
//		begin
//			pFrm	:=	Pointer(pRec^.m_pChildForm);
//			if pFrm^.CloseQuery() = False then
//				result := ACTID_RET_NG;
//		end;
//
//		//	Show要求
//		ACTID_SHOWSTART				:
//		begin
//			pFrm	:=	Pointer(pRec^.m_pChildForm);
//			pFrm^.Show();
//		end;
//
//		//	Hide要求
//		ACTID_HIDESTART				:
//		begin
//			pFrm	:=	Pointer(pRec^.m_pChildForm);
//			if pFrm^.Parent <> nil then	pFrm^.Hide();
//		end;
//
//		//	Form Close通知
//		ACTID_FORMCLOSEEND			:
//		begin
//			//	処理ﾘｽﾄから削除（UnLoadはしない）
//			result := ACTID_RET_OK;
//		end;
//
//(*H0004	20010531 khattori Ｃａｐｔｉｏｎの出し方変更*)
//		//	キャプション変更要求 ( AP -> Menu -> Desktop )
//		ACTID_ACTIVEEND:								// 子ﾌｫｰﾑのｱｸﾃｨﾌﾞ通知
//		begin
//			pFrm := Pointer(pRec^.m_pOwnerForm);		// 子供から発行される為親が自分になる
////---<HIS-056> 指示の Activate も実行する---------------------------------------
//			if Assigned(pFrm^.OnActivate) then pFrm^.OnActivate(pFrm^);
////------------------------------------------------------------------<HIS-056>---
//
//			Exparam.iAction := ACTID_FREESTART;
//			Exparam.pRecord := pointer( pFrm^.m_pRec );
//			Exparam.pActionParam := pointer( pRec );
//			TMjsAppRecord(pFrm^.m_pRec^).m_pOwnerEntry( @Exparam );				// 親を呼び出す!!
//
//			pRec^.m_pOwnerForm:=TMjsAppRecord(pFrm^.m_pRec^).m_pOwnerForm;
//			TMjsAppRecord(pFrm^.m_pRec^).m_pOwnerEntry(pPar);				// 親を呼び出す!!
//			pRec^.m_pOwnerForm:=TMjsAppRecord(pFrm^.m_pRec^).m_pChildForm;
//
//			//	20010209
//			if Assigned( TAppParam( pPar^ ).pActionParam ) then
//				pFrm^.Caption   := String(TAppParam( pPar^ ).pActionParam^);
//		end;
//
//(*H0048 20050516 khattori	操作ガイド番号通知*)
////	ＡＬⅡのみ動作
//{$IFDEF _WANTYPE_NEW_}
//
//		ACTID_HELPINDEXSET:
//		begin
//			// 子供から発行される為親が自分になる
//			pFrm			:=	Pointer(pRec^.m_pOwnerForm);
//			Exparam			:=	TAppParam( pPar^ );
//			Exparam.pRecord	:=	Pointer(pFrm^.m_pRec);
//
//			// メニューを呼び出す!!
//			TMjsAppRecord(pFrm^.m_pRec^).m_pOwnerEntry( @Exparam );
//		end;
//
//{$ENDIF}
//
//	end;
//end;

//******************************************************************************
//	Proccess	:	CreateForm (constructor)
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//	Parameter	:	pPar : Pointer
//	Return		:	Nothing
//******************************************************************************
constructor TMAS310000f.CreateForm( pPar : Pointer );
(*H0002	20010511 khattori 月固定／月可変切替のデフォルト*)
var
	DmqMas			:	TMQuery;
	infoRec			:	TMjsMsgRec;
//---<HIS-044><HIS-045>---------------------------------------------------------
	iTanNCode		:	Integer;
	iTanGCode		:	Integer;
	sBunTable		:	String;

//	//	テーブル操作クラス
//	cTCtlIF			:	TMASL311Trn_TblCtrlIF;
//	cTCtlInitParam	:	TMASL311Trn_TblCtrl_InitParam;
//	cCorpDB			:	TDatabase;
//---------------------------------------------------------<HIS-044><HIS-045>---
begin

	////////////////////////////////////////////////////////////////////////////////
	//	TMjsAppRecord	bpl 管理構造体
	//	メンバ			型		内容				備考
	//	m_iGroupCode	Integer	グループコード
	//	m_iSystemCode	Integer	システムコード
	//	m_iOptionCode	Integer	オプションコード
	//	m_iProgramCode	Integer	プログラムコード
	//	m_iCorpCode		Integer	会社コード
	//	m_iCorpSubCode	Integer	本支店コード
	//	m_iCorpID		Integer	会社DB ID			COPDBOpen時のﾊﾟﾗﾒｰﾀで使用。
	////////////////////////////////////////////////////////////////////////////////

(*H0010 20010712 khattori やばすぎ２！！！*)
	m_bTerm	:=	false;

	m_pRec	:= Pointer( TAppParam( pPar^ ).pRecord );
	if	m_pRec^.m_pDBModule	=nil
	then	m_cMDModule:=nil
	else	m_cMDModule:=TMDataModulef(m_pRec^.m_pDBModule^);
	g_pDrill	:= Pointer( TAppParam( pPar^ ).pActionParam );

(*Ver.x*)
(*H0025	20011217 khattori	マルチ入力*)

(*H0019 20010927 khattori	定型仕訳ＦＡＳ対応*)
	g_miSystemCode	:=	m_pRec^.m_iSystemCode;

(*Ver.x*)
(*H0024	20011217 khattori	手形入力*)
	g_miOptionCode	:=	m_pRec^.m_iOptionCode;

//---<HIS-002>------------------------------------------------------------------
	m_cSubUse := TMASL310SubPrgUse.Create(m_pRec);
//------------------------------------------------------------------<HIS-002>---

	//////////////////////////////////////////////////////////////////
	(*H0001	20010409	khattori	処理月による排他*)
	m_iClose	:=	0;
	m_iExclusive:=	0;

(*♪♪♪*)

(*Ver.x*)
(*H0024	20011217 khattori	手形入力*)
	if	not Is_FASMODE	then
	begin

(*H0036 20030825 khattori	syuusei 会社単独廃止対応*)
		m_cExcept		:=	nil;
		m_iRet			:=	EXCEPT_RET_OK;
		m_nReferMode	:=	0;

(*H0038 20030904 khattori	分散入力<単一入力>*)
		m_iPMPanelDev	:=	0;

		//	分散は対象外
		if	not	IsBunsanMode	then	fnExceptCheck;

		//	処理不能なら、例外を投げる
		if	m_nReferMode	< 0	then	raise Exception.Create('');

//---<HIS-044><HIS-045>---------------------------------------------------------
		//	分散排他
		if	IsBunsanMode	then
		begin
//			iTanNCode	:=	rcCOMMONAREA( m_pRec^.m_pCommonArea^ ).TantoNCD;
//			iTanGCode	:=	rcCOMMONAREA( m_pRec^.m_pCommonArea^ ).TantoGCD;
//			if	iTanGCode=-1	then	iTanGCode:=0;
//
//			cCorpDB	:=	m_cMDModule.COPDBOpen( 0, m_pRec^.m_iCorpID );
//
//			m_BunKbn01 := 0;
//			DmqMas:=TMQuery.Create(self);
//			m_cMDModule.SetDBInfoToQuery(cCorpDB,DmqMas);
//			with	DmqMas	do
//			begin
//				//	分散入力採用区分
//				Close;
//				SQL.Clear;
//				SQL.Add('select GnPuKbn1 from KbnInfo where reckbn=8');
//				if	Open	then
//					m_BunKbn01 := GetFld('GnPuKbn1').AsInteger;
//				Close;
//				Free;
//			end;
//			if	m_BunKbn01=0	then
//			begin
//				m_iClose:=1;
//				m_cMDModule.COPDBClose( cCorpDB );
//			end
//			else
//			begin
//				cTCtlIF	:=	TMASL311Trn_TblCtrlIF.Create();
//
//				//	分散テーブル作成
//				cTCtlInitParam.pMjsAppRecord	:=	Pointer(m_pRec);
//				cTCtlInitParam.CopDB			:=	cCorpDB;
//				cTCtlIF.Init(cTCtlInitParam );
//				cTCtlIF.CreateTable(1,iTanGCode,iTanNCode);
//				cTCtlIF.Free;
//				m_cMDModule.COPDBClose( cCorpDB );
//
//				sBunTable	:=	'BUN'+Format( '%0.8d', [iTanGCode] );
//
//				//	分散排他
//				m_cSwkExc	:=	TMAS310000SwkExcBun.Create();
//				m_iClose	:=	m_cSwkExc.Init(m_pRec, sBunTable);
//				if	m_iClose<>0	then	m_iExclusive:=	6	//	'排他制御エラーが発生しました。(Init)'
//				else
//				begin
//					m_iClose	:=	m_cSwkExc.InitExc();
//					if		m_iClose=1	then	m_iExclusive:=	12	//	'排他用テーブルがありません。分散仕訳データチェックを実行してください。'
//					else if	m_iClose=-1	then	m_iExclusive:=	10	//	'前回正常終了していません。分散仕訳データチェックを実行してください。'
//					else if	m_iClose<>0	then	m_iExclusive:=	6;	//	'排他制御エラーが発生しました。(InitExc)';
//				end;
//			end;
		end
		//	仕訳排他
		else
		begin
			m_cSwkExc	:= TMAS310000SwkExc.Create();
			m_iClose	:= m_cSwkExc.Init(m_pRec, '');
			if	m_iClose<>0	then	m_iExclusive:=	6	//	'排他制御エラーが発生しました。(Init)'
			else
			begin
				m_iClose	:=	m_cSwkExc.InitExc();
				if		m_iClose=-1	then	m_iExclusive:=	7	//	'前回正常終了していません。マスタ再計算を実行してください。'
				else if	m_iClose<>0	then	m_iExclusive:=	6;	//	'排他制御エラーが発生しました。(InitExc)';
			end;
		end;
//		m_cMASSwkExc:=TMASSwkExc.Create;
//		m_iClose	:=	m_cMASSwkExc.Init(m_pRec);
//		if	m_iClose<>0	then	m_iExclusive:=	6	//	'排他制御エラーが発生しました。(Init)'
//		else
//		begin
//			m_iClose	:=	m_cMASSwkExc.InitExc;
//			if		m_iClose=-1	then	m_iExclusive:=	7	//	'前回正常終了していません。マスタ再計算を実行してください。'
//			else if	m_iClose<>0	then	m_iExclusive:=	6;	//	'排他制御エラーが発生しました。(InitExc)';
//		end;
//---------------------------------------------------------<HIS-044><HIS-045>---

		if	m_iExclusive<>0	then
		begin
(*H0036 20030825 khattori	syuusei 会社単独廃止対応*)
			fnExceptTerm;		//	財務排他終了処理

			TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMSG(inforec,20,m_iExclusive);
//---<HIS-062> @_@ → 分散仕訳データチェック に変換-----------------------------
			if m_iExclusive in [10,12] then
				inforec.sMsg := TMASCom(m_pRec^.m_pSystemArea^).m_MsgStd.MsgChange(inforec.sMsg, '@_@', '分散仕訳データチェック');
//------------------------------------------------------------------<HIS-062>---
			with infoRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
			raise Exception.Create('');
		end;

(*♪♪♪*)
	end;

	m_bfirst:=true;
	//////////////////////////////////////////////////////////////////

(*♪♪♪*)

(*Ver.x*)
(*H0024	20011217 khattori	手形入力*)
	if	not Is_FASMODE	then
	begin

(*H0002	20010511 khattori 月固定／月可変切替のデフォルト*)//	from ->
	m_FCopDBMas:=m_cMDModule.COPDBOpen(0,TMASCom ( m_pRec^.m_pSystemArea^ ).m_iMasCommonNo);
	if m_FCopDBMas = nil then
	begin
(*H0036 20030825 khattori	syuusei 会社単独廃止対応*)
		fnExceptTerm;		//	財務排他終了処理

		TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMsg(infoRec,10000,m_cMDModule.GetStatus);
		with infoRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
//---<HIS-044><HIS-050>---------------------------------------------------------
		if Assigned(m_cSwkExc) then
		begin
			m_cSwkExc.TermExc();
			m_cSwkExc.Term();
			m_cSwkExc := nil;	//	インスタンス破棄(nil セットにより内部で破棄される)
		end;
//---------------------------------------------------------<HIS-044><HIS-050>---
		raise Exception.Create('');
	end
	else
	begin

(*Ver A121 M101*)
(*H0026 20020301 khattori	ＣＲ、００、０００　キー*)
		m_bCRKey		:=	false;
		m_iCRKey		:=	0;
		m_i00Key		:=	0;
		m_i000Key		:=	0;
//---<HIS-060>------------------------------------------------------------------
		m_iCodeAssoc	:=	0;
//------------------------------------------------------------------<HIS-060>---

		m_iTukiDefault	:=	0;

		DmqMas:=TMQuery.Create(self);
		m_cMDModule.SetDBInfoToQuery(m_FCopDBMas,DmqMas);
		with	DmqMas	do
		begin
			//	仕訳入力 月指定区分	0:月固定 1:月可変
			Close;
			SQL.BeginUpdate();
			SQL.Clear;
			SQL.Add('select * from UserInfo');
//---<HIS-060>------------------------------------------------------------------
			SQL.Add('where StaffCode=-1 and');
			SQL.Add('(');
			SQL.Add(	   'ItemNo=21');
			SQL.Add(	'or ItemNo=23');
			SQL.Add(	'or ItemNo=24');
			SQL.Add(	'or ItemNo=25');
			SQL.Add(	'or ItemNo=53');
			SQL.Add(')');
//			SQL.Add('where ((ItemNo=21) or (ItemNo=23) or (ItemNo=24) or (ItemNo=25)) and (StaffCode=-1)');
//------------------------------------------------------------------<HIS-060>---
			SQL.EndUpdate();
			Open;
			while not eof do
			begin
				case	GetFld('ItemNo').AsInteger	of
					21:	m_iTukiDefault	:=	GetFld('UserKbn').AsInteger;
					23:	m_iCRKey		:=	GetFld('UserKbn').AsInteger;
					24:	m_i00Key		:=	GetFld('UserKbn').AsInteger;
					25:	m_i000Key		:=	GetFld('UserKbn').AsInteger;
//---<HIS-060>------------------------------------------------------------------
					53:	m_iCodeAssoc	:=	GetFld('UserKbn').AsInteger;
//------------------------------------------------------------------<HIS-060>---
				end;
				NEXT;
			end;

			if	m_iCRKey=0	then	m_iCRKey:=	ord('+');

			Close;
			Free;
		end;
		m_cMDModule.COPDBClose(m_FCopDBMas);
	end;
(*H0002	20010511 khattori 月固定／月可変切替のデフォルト*)//	-> to

(*♪♪♪*)
	end;

(*H0003	20010511 khattori ＤＢのオープンに失敗した時の処理*)//	from ->
	//	チェックのみ
	m_FCopDBMas:=m_cMDModule.COPDBOpen(0,m_pRec^.m_iCorpID);
 	if m_FCopDBMas = nil then
	begin
(*H0036 20030825 khattori	syuusei 会社単独廃止対応*)
		fnExceptTerm;		//	財務排他終了処理

		TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMsg(infoRec,10000,m_cMDModule.GetStatus);
		with infoRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
//---<HIS-044><HIS-050>---------------------------------------------------------
		if Assigned(m_cSwkExc) then
		begin
			m_cSwkExc.TermExc();
			m_cSwkExc.Term();
			m_cSwkExc := nil;	//	インスタンス破棄(nil セットにより内部で破棄される)
		end;
//---------------------------------------------------------<HIS-044><HIS-050>---
		raise Exception.Create('');
	end
	else
	begin
		//	ＦＡＳから呼ばれた時は、定型仕訳が採用されていなければ動作不可

(*Ver.x*)
(*H0024	20011217 khattori	手形入力*)
		if	Is_FASMODE	then
		begin
			DmqMas:=TMQuery.Create(self);
			m_cMDModule.SetDBInfoToQuery(m_FCopDBMas,DmqMas);
			with	DmqMas	do
			begin
				//	仕訳入力 月指定区分	0:月固定 1:月可変
				Close;
				SQL.Clear;
				SQL.Add('select * from KbnInfo where reckbn=2');
				Open;
(*H0023 20011024 khattori	初期値変更*)
				if	((m_pRec^.m_sParameter = '')	and	(GetFld('GnPuKbn20').AsInteger=0))	or
					((m_pRec^.m_sParameter <>'')	and	(GetFld('GnPuKbn21').AsInteger=0))	then
//				if	((m_pRec^.m_sParameter = '')	and	(GetFld('GnPuKbn20').AsInteger=1))	or
//					((m_pRec^.m_sParameter <>'')	and	(GetFld('GnPuKbn21').AsInteger=1))	then
				begin
					Close;
					Free;
					m_cMDModule.COPDBClose(m_FCopDBMas);
					TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMsg(infoRec,10000,m_cMDModule.GetStatus);
					with infoRec do
					begin
						sMsg	:=	'定型仕訳が採用されていません。';
						MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
					end;
					raise Exception.Create('');
				end;
				Close;
				Free;
			end;
		end;
	end;

(*H0003	20010511 khattori ＤＢのオープンに失敗した時の処理*)//	-> to

	inherited Create( Application );
end;

//******************************************************************************
//	Proccess	:	Form処理
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//******************************************************************************

//******************************************************************************
//	Proccess	:	FormCreate (OnCreate)
//******************************************************************************
procedure TMAS310000f.FormCreate(Sender: TObject);
var
	iSlipCount		:	Integer;
	iWork			:	Integer;

(*Ver A123 M102*)
(*H0029 20020328 khattori	第１指示のＣａｐｔｉｏｎ切替*)
	arPointer		:	Array [0..50] of Pointer;
//	arPointer		:	Array [0..30] of Pointer;
	iAnalyzeCode	:	array of Integer;
	tlTblList		:	enTblList;
	pQuery			:	Pointer;
	iSijiCode		:	Integer;

//	inforec			:	TMjsMsgRec;
begin
	if	m_pRec^.m_pOwnerPanel=nil
	then	Parent := TForm( m_pRec^.m_pOwnerForm^ )
	else	Parent := TPanel( m_pRec^.m_pOwnerPanel^ );

//---<HIS-028> OnShow へ移動----------------------------------------------------
	Align := alNone;
//	Align := alClient;
//------------------------------------------------------------------<HIS-028>---

	// 10/24 New
	MjsColorChange(	TMAS310000f( Self ),
					TMASCom ( m_pRec^.m_pSystemArea^ ).SystemArea.SysColorB,
					TMASCom ( m_pRec^.m_pSystemArea^ ).SystemArea.SysColorD,
					TMASCom ( m_pRec^.m_pSystemArea^ ).SystemArea.SysBaseColorB,
					TMASCom ( m_pRec^.m_pSystemArea^ ).SystemArea.SysBaseColorD,
					rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysFocusColor		);

(*H0044 20041213 khattori	ＦｏｎｔＲｅｓｉｚｅ*)
//	// 10/25New
//	MjsFontResize(	TMAS310000f( Self )	,Pointer(m_pRec)	);

(*H0008 20010703 khattori プレビュー中に裏画面にされた時！*)
	MJSPreIf		:=	TMjsPreviewIF.Create();

	MTxtFx_Ren.Color	:=	rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysFocusColor;

	//	選択ウィンドウ操作クラス生成
	SelWnd:=TMAS310SelWndDB.Create(PMPanelWd);
	SelWnd.Parent:=PMPanelWd;
	SelWnd.Top:=0;
	SelWnd.Left:=5;
//	SelWnd.Init(m_pRec);

//---<HIS-001>------------------------------------------------------------------
	//	サブプログラム呼び出しボタン
	SubPrg:=TSubPrgBtn.Create(Self);
	SubPrg.Parent:=PMPanelHdTop;
//---<HIS-015>------------------------------------------------------------------
	SubPrg.Anchors:=[akTop,akRight];
//------------------------------------------------------------------<HIS-015>---
//---<HIS-029><HIS-008><HIS-005>------------------------------------------------
	SubPrg.Left		:= 464	* GetZoomRatio(Pointer(m_pRec)) div 100;
	SubPrg.Top		:= 2	* GetZoomRatio(Pointer(m_pRec)) div 100;
	SubPrg.Visible	:= True;
//------------------------------------------------<HIS-029><HIS-008><HIS-005>---
	SubPrg.OnItemClick:=SubMenuClick;
//------------------------------------------------------------------<HIS-001>---

	Itm	:=TMASL310Item.Create;					//	指示項目操作クラス生成
	Stb	:=TMASL310StatusBar.Create(MStatusBar);	//	ステータスバー操作クラス生成
	Fnc	:=TMASL310Func.Create(MSPFunctionBar);	//	ファンクション操作クラス生成
	Ind	:=TMASL310Ind.Create;					//	指示項目操作クラス生成
	Sm	:=TMASL310SelMonth.Create;				//	処理月操作クラス生成

	//	出納帳入力（単一入力以外）
(*H0038 20030904 khattori	分散入力<単一入力>*)
	if	IsSuitouMode	then
//	if	(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_TAXITU	)	and
//		(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_MONTHR	)	and
//		(not IsSlipMode									)		then
	begin
		//	ヘッダー項目入力パネル作成
		PMPanelHdSj.Width:=167;
		PMASLHdRd01	:= TMASL310HeadAc.Create
		(PMPanelHdRd,PMASLHdRd02,PMASLHdRd03,PMASLHdRd04,0,HdRd0X_WIDTH,HDRD0X_LABEL_WIDTH,
		rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysFocusColor,TMASCom( m_pRec^.m_pSystemArea^ ).SystemArea.SysColorD);
		PMPanelHdRd.Visible	:=	true;
		PMPanelHdMonthFix.Enabled:=false;			//	月固定のみ
		EMNumEditBalance.Visible:=false;
//---<HIS-060>------------------------------------------------------------------
		PMASLHdRd01.m_pCodeAssoc:=@m_iCodeAssoc;
//------------------------------------------------------------------<HIS-060>---
	end;

	//	日常処理共通関数クラス生成
	arPointer[ 0]:=@Self;
	arPointer[ 1]:=@PMPanelHd;
	arPointer[ 2]:=@PMPanelWd;
	arPointer[ 3]:=@PMPanelAp;
	arPointer[ 4]:=@PMComboBox2;
	arPointer[ 5]:=@PMComboBox3;
	arPointer[ 6]:=@PMComboBox4;
	arPointer[ 7]:=@EMNumEditInp;
	arPointer[ 8]:=@EMNumEditBalance;
	arPointer[ 9]:=@PMASLHdRd01;
	arPointer[10]:=@PMASLHdRd02;
	arPointer[11]:=@PMASLHdRd03;
	arPointer[12]:=@PMASLHdRd04;
	arPointer[13]:=@Sm;
	arPointer[14]:=@Itm;
	arPointer[15]:=@Fnc;
	arPointer[16]:=@Ind;
	arPointer[17]:=@Stb;
	arPointer[18]:=@rParam;
	arPointer[19]:=@SelWnd;
	arPointer[20]:=@m_cMDModule;
	arPointer[21]:=m_pRec;
	arPointer[22]:=@LMLabelSelMonthVF;
	arPointer[23]:=@LMLabelSelMonthVN;
	arPointer[24]:=@PMPanelSelMonth;
	arPointer[25]:=@LMLabelHd2;
//---<HIS-044>------------------------------------------------------------------
	arPointer[26]:=@m_cSwkExc;
//------------------------------------------------------------------<HIS-044>---
	arPointer[27]:=@TMBtnFusen;
	arPointer[28]:=@TMBtnOpen;
(*H0047 20050418 khattori	一括置換*)
	arPointer[29]:=@TMBtnLump;
	arPointer[30]:=@EMNumEditFx_No;

(*Ver A123 M102*)
(*H0029 20020328 khattori	第１指示のＣａｐｔｉｏｎ切替*)
	arPointer[31]:=@PMPanelHdSjFst;

	Rt:=TMASL310Root.Create(arPointer);
	Rt.BplList		:= TList.Create();

(*H0022 20011009 khattori	Ｒｏｏｔ初期処理追加*)
	Rt.Init;

	(*H0013 20010731 tyamaguchi 入力不可区分、修正／削除区分対応*)
(*H0017 20010925 khattori	定型仕訳対応*)
	m_FixKbn16	:=	0;
	m_FixKbn20	:=	0;
	m_FixKbn21	:=	0;
	m_FixKbn22	:=	0;
	m_FixKbn23	:=	0;
	m_FixKbn29	:=	0;

//---<HIS-045> 削除 排他テーブル作成前へ移動------------------------------------
//(*H0034 20030611 khattori	分散入力*)
//	m_BunKbn01	:=	0;			//  分散入力採用区分
//------------------------------------------------------------------<HIS-045>---

	tlTblList:=MASL_TLST_KbnInfo;
	pQuery:=Rt.Pfnc(MASL_PGET_TBL_LIST,@tlTblList);
	if	pQuery<>nil	then
	begin
		if	(TMQuery(pQuery^).Locate('RecKbn',2,[]))=true	then
		begin
			m_FixKbn16	:=	TMQuery(pQuery^).GetFld('GnPuKbn16').AsInteger;
			m_FixKbn20	:=	TMQuery(pQuery^).GetFld('GnPuKbn20').AsInteger;
			m_FixKbn21	:=	TMQuery(pQuery^).GetFld('GnPuKbn21').AsInteger;
			m_FixKbn22	:=	TMQuery(pQuery^).GetFld('GnPuKbn22').AsInteger;
			m_FixKbn23	:=	TMQuery(pQuery^).GetFld('GnPuKbn23').AsInteger;
			m_FixKbn29	:=	TMQuery(pQuery^).GetFld('GnPuKbn29').AsInteger;
		end;
//---<HIS-045> 削除 排他テーブル作成前へ移動------------------------------------
//(*H0034 20030611 khattori	分散入力*)
//		if	(TMQuery(pQuery^).Locate('RecKbn',8,[]))=true	then
//		begin
//			m_BunKbn01	:= TMQuery(pQuery^).GetFld('GnPuKbn1').AsInteger;	//  分散入力採用区分
//		end;
//------------------------------------------------------------------<HIS-045>---
	end;


	//	出納帳入力（単一入力以外）
(*H0038 20030904 khattori	分散入力<単一入力>*)
	if	IsSuitouMode	then
//	if	(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_TAXITU	)	and
//		(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_MONTHR	)	and
//		(not IsSlipMode									)		then
	begin
		SetLength(iAnalyzeCode,0);
		tlTblList:=MASL_TLST_CashPara;
		pQuery:=Rt.Pfnc(MASL_PGET_TBL_LIST,@tlTblList);
		if	pQuery<>nil	then
		begin
			with	TMQuery(pQuery^)	do
			begin
				while not eof do
				begin
					if	GetFld('ParaKbn').AsInteger=11	then
					begin
						SetLength(iAnalyzeCode,Length(iAnalyzeCode)+1);
						iAnalyzeCode[Length(iAnalyzeCode)-1]	:=GetFld('AnalyzeCode').AsInteger;
					end;
					NEXT;
				end;
			end;
		end;
		(*H0015 20010921 tyamaguchi 定型仕訳対応*)

(*Ver.x*)
(*H0024	20011217 khattori	手形入力*)
		if	Is_FASMODE	then
				PMASLHdRd01.SetBrother(Rt,EMNumEditFx_No,EMNumEditFx_No,PMComboBox3,iAnalyzeCode)
		else if PMPanelHdFx.Visible then
				PMASLHdRd01.SetBrother(Rt,PMComboBox3,EMNumEditFx_No,PMComboBox3,iAnalyzeCode)
		else	PMASLHdRd01.SetBrother(Rt,PMComboBox3,PMComboBox3,PMComboBox3,iAnalyzeCode);
	end;

(*H0037 20030827 khattori	ＡＣＥＬＩＮＫ＜－＞ＭＪＳＬＩＮＫ統合*)
	iWork:=1;
//	iWork:=0;
//	if	(Is_ZAIMU)or(Is_SITEN)	then	iWork:=1;

	arPointer[0]:=@Rt;
	arPointer[1]:=m_pRec;
	arPointer[2]:=@m_FixKbn20;
	arPointer[3]:=@m_FixKbn21;
	arPointer[4]:=@m_FixKbn29;
	arPointer[5]:=@iWork;
	iSlipCount:=Itm.SetRootAddress(arPointer);

	arPointer[0]:=@Rt;
	arPointer[1]:=@Itm;
	arPointer[2]:=@PMComboBox3;
	arPointer[3]:=@PMComboBox4;
	arPointer[4]:=@PMPanelHdSjFst;
	arPointer[5]:=@PMPanelHdSjSnd;
	Ind.SetRootAddress(arPointer);

	arPointer[0]:=@Rt;
	arPointer[1]:=m_pRec;
	Sm.SetRootAddress(arPointer);

(*H0038 20030904 khattori	分散入力<単一入力>*)
	if	IsSuitouMode
	then	iSijiCode:=311000
	else	iSijiCode:=MASL_PROC_CODE_TAXITU;

	//	処理コードセット
	gMASL310RootVf(MASL_VSET_SIJI_CODE,Pointer(@(iSijiCode)));

	//	処理モードセット
	iWork:=Itm.ReadIniInt(iSijiCode,'Type');
	gMASL310RootVf(MASL_VSET_SIJI_TYPE,@iWork);


(*H0038 20030904 khattori	分散入力<単一入力>*)
	iWork:=MASL_PROC_KIND_STANDARD;
	if	IsBunsanMode	then	iWork:=MASL_PROC_KIND_BUNSAN;
	gMASL310RootVf(MASL_VSET_PROC_KIND,@iWork);


	//	日常処理共通関数	外部呼出し関数
	gMASLParam.RVf:=gMASL310RootVf;		//	Void
	gMASLParam.RPf:=gMASL310RootPf;		//	Pointer
	gMASLParam.RBf:=gMASL310RootBf;		//	Boolean
	gMASLParam.RIf:=gMASL310RootIf;		//	Integer
	gMASLParam.RSf:=gMASL310RootSf;		//	String
	gMASLParam.RWf:=gMASL310RootWf;		// 選択ウィンドウカバー関数

	Rt.Vfnc(MASL_VINI_DRL_PARM,@gMASLParam);

	SelWnd.Init(m_pRec,gMASL310RootIf( MASL_IGET_SYORIKBN ),m_FixKbn23);

	//	定型ＮＯ表示
//	if 条件(定型仕訳採用)
	if	(m_pRec^.m_iOptionCode<>MASL_PROC_OPT_ZTEGATA)	then
	FxReset();
	EMNumEditFx_No.ParentColor := true;

	//	伝票入力
	if	IsSlipMode	then
	begin
		if	iSlipCount=0	then
		begin
			//	仮払精算伝票等で伝票情報が無い時、（ＦｏｒｍＳｈｏｗで）終了
			if	m_pRec^.m_iProgramCode=MASL_PROC_CODE_KARISSN	then
			begin
				m_iClose		:=	1;
				m_iExclusive	:=	7003;
			end;
		end;

		//第２指示を隠す
		if	iSlipCount<=1	then
		begin
			PMPanelHdSj.Width:=167;
			PMComboBox4.visible:=false;
			PMPanelHdSjSnd.visible:=false;
		end;

		BMSpBtnShowBalance.Width:=0;
		BMSpBtnShowBalance.Enabled:=false;
		EMNumEditBalance.Visible:=false;

		TMBtnOpen.visible:=false;
//---<HIS-018> 非表示にすると 他のﾂｰﾙﾎﾞﾀﾝの位置がずれる-------------------------
(*H0047 20050418 khattori	一括置換*)
//		TMBtnLump.visible:=false;
//------------------------------------------------------------------<HIS-018>---
	end;

(*H0044 20041213 khattori	ＦｏｎｔＲｅｓｉｚｅ*)
	fnHighResolve;

	gfirst:=false;
end;

//******************************************************************************
//	Proccess	:	FormShow (OnShow)
//******************************************************************************
procedure TMAS310000f.FormShow(Sender: TObject);
var
	pCurControl		:	Pointer;
	pMASL310IDrill	:	^TMASL310IDrill;
	bRetn			:	Boolean;
	iNMonth			:	Integer;
	rFunc			:	TMASL310IFunc;

(*H0008 20010703 khattori プレビュー中に裏画面にされた時！*)
	pRec			:	^TMjsAppRecord;
	stParam			:	MAS320100DSIParam;
//---<HIS-047>------------------------------------------------------------------
	stParam312		:	MAS312100DSIParam;
//------------------------------------------------------------------<HIS-047>---
	cDrilNew		:	TMASL310IDrill;

//---<HIS-024><HIS-035><HIS-042> -----------------------------------------------
	//**************************************************************************
	//  Proccess  :	Align 設定要求
	//  Parameter : None
	//  Return    : None
	//	Comment	  : これをしないと何故か Align がおかしい
	//**************************************************************************
	procedure fnRequestAlign();
	begin
		PMPanelAp.Align := alNone;
		PMPanelAp.Align := alClient;
	end;
//------------------------------------------------<HIS-024><HIS-035><HIS-042>---

(*H0048 20050516 khattori	操作ガイド番号通知*)
	//******************************************************************************
	//	Function	:	fnHelpIndexSet												<HELP>
	//******************************************************************************
	procedure fnHelpIndexSet;
	var
		AppPara	:	TAppParam;
		rcHLP	:	rcHELPINFO;
	begin
//	ＡＬⅡのみ動作
{$IFDEF _WANTYPE_NEW_}

		rcHLP.Code1 := m_pRec^.m_iProgramCode;
		rcHLP.Code2 := 0;
		AppPara.iAction := ACTID_HELPINDEXSET;
		AppPara.pRecord := Pointer(m_pRec);
		AppPara.pActionParam := @rcHLP;
		TMjsAppRecord( m_pRec^ ).m_pOwnerEntry( @AppPara );

{$ENDIF}
	end;
begin
(*♪♪♪*)
	if	not PMPanelAll.Visible	then	exit;

//---<HIS-029> 削除-------------------------------------------------------------
////---<HIS-005> OnShow で設定（マルチスクリーン時変わってしまう　Formの特性?）---
////---<HIS-008>------------------------------------------------------------------
//	SubPrg.Left		:= 464	* GetZoomRatio(Pointer(m_pRec)) div 100;
//	SubPrg.Top		:= 2	* GetZoomRatio(Pointer(m_pRec)) div 100;
////	SubPrg.Left		:= 464;
////	SubPrg.Top		:= 2;
////------------------------------------------------------------------<HIS-008>---
//	SubPrg.Visible	:= True;
////------------------------------------------------------------------<HIS-005>---
//------------------------------------------------------------------<HIS-029>---
//---<HIS-006>------------------------------------------------------------------
	//	サブプログラム採用有無を設定
	SetSubPrgUse();
//------------------------------------------------------------------<HIS-006>---

(*Ver.x*)
(*H0024	20011217 khattori	手形入力*)
	if	not Is_FASMODE	then
	begin
		//////////////////////////////////////////////////////////////////
		(*H0001	20010409	khattori	処理月による排他*)
		if	m_bfirst=true	then
		begin
			m_bfirst:=false;
			//	FormCreate でエラーが発生している可能性がある
			if	m_iClose=0	then
			begin
(*H0038 20030904 khattori	分散入力<単一入力>*)
				if	not	IsSuitouMode	then
				begin
					//	ドリルダウン以外
(*H0002	20010511 khattori 月固定／月可変切替のデフォルト*)
					if		(g_pDrill=nil)	then
					begin
						if	m_iTukiDefault<>0	then
						begin
							sm.Kotei:=1;
							SetCaptionBtnFix();
						end;
					end
					//	ドリルダウン　＆　月範囲指定
					else if	(TMASL310IDrill(g_pDrill^).ToCld^.Imnt[0]<>TMASL310IDrill(g_pDrill^).ToCld^.Imnt[1])	then
					begin
						sm.Kotei:=1;
						SetCaptionBtnFix();
					end;
				end;

//---<HIS-044>------------------------------------------------------------------
				m_iClose	:=	m_cSwkExc.SetExc(0);
//------------------------------------------------------------------<HIS-044>---
				if		m_iClose=-1	then	m_iExclusive:=	7001	//	'仕訳最大端末数に達したため処理できません。'
				else if	m_iClose=-2	then	m_iExclusive:=	7002	//	'他の端末で仕訳単独処理が実行中のため処理できません。';
				else if	m_iClose<>0	then	m_iExclusive:=	6;	//	'排他制御エラーが発生しました。(SetExc)';
			end;

			//	FormCreate で発生したエラーもここで判定
			if	m_iClose<>0	then
			begin
				PostMessage(Self.Handle, WM_ONPAINT, 0, 0);
				abort;
			end;
			//////////////////////////////////////////////////////////////////
		end;

(*♪♪♪*)
	end;

//	ｼｽﾃﾑ名（年度）‐処理名［画面NO］‐会社ｺｰﾄﾞ 簡略会社名 事業年度 その他附随事項
//	会計大将‐仕訳入力［010001］‐01001234 ＭＪＳ物産 12/04/01 ～ 13/03/31

//	MASSetCaption( m_pRec );
//---<HIS-019> MJSBtnVisible は使用しない(必要なボタンが消える現象があったので)-
//	MJSBtnVisible ( Self, true );
//------------------------------------------------------------------<HIS-019>---
//---<HIS-024><HIS-035><HIS-042>  復活------------------------------------------
	fnRequestAlign();
////---<HIS-023> Align が正しく機能しないｹｰｽがある--------------------------------
////	RequestAlign();
////------------------------------------------------------------------<HIS-023>---
//------------------------------------------------<HIS-024><HIS-035><HIS-042>---
//---<HIS-028>------------------------------------------------------------------
	if Parent = nil then
			Align := alNone
	else	Align := alClient;
//------------------------------------------------------------------<HIS-028>---

(*H0048 20050516 khattori	操作ガイド番号通知*)
	fnHelpIndexSet;

	pCurControl	:=	Rt.Pfnc(MASL_PGET_ACTV_CTRL);
	if	pCurControl=nil	then
	begin

(*♪♪♪*)

(*Ver.x*)
(*H0024	20011217 khattori	手形入力*)
		if	not Is_FASMODE	then
		begin
			PMComboBox3.Enabled:=false;
			PMComboBox4.Enabled:=false;
			PMComboBox2.SetFocus;

			//	ドリルダウン？
			if	g_pDrill<>nil	then
			begin
				pMASL310IDrill:=Rt.Pfnc(MASL_PGET_DRL_PARM);
				pMASL310IDrill^.Status	:=MASL_DRILL_FRM_PARENT;
				pMASL310IDrill^.ProcCd	:=TMASL310IDrill(g_pDrill^).ProcCd;
				pMASL310IDrill^.FrPar^	:=TMASL310IDrill(g_pDrill^).ToCld^;
				pMASL310IDrill^.ToCld^	:=TMASL310IDrill(g_pDrill^).ToCld^;

				PMPanelSelMonth.Enabled		:=false;
				PMComboBox2.Enabled			:=false;
				//	ドリルダウン　＆　単月指定
(*H0035 20030825 khattori	MJSLINK <-> ACELINK 統一*)
(*H0037 20030827 khattori	ＡＣＥＬＩＮＫ＜－＞ＭＪＳＬＩＮＫ統合*)
				if	(TMASL310IDrill(g_pDrill^).ToCld^.Imnt[0]=TMASL310IDrill(g_pDrill^).ToCld^.Imnt[1])	then
//				if	(Is_ZAIMU)or(Is_SITEN)or
//					(TMASL310IDrill(g_pDrill^).ToCld^.Imnt[0]=TMASL310IDrill(g_pDrill^).ToCld^.Imnt[1])	then
				PMPanelHdMonthFix.Enabled	:=false;
				BMSpBtnChange.Enabled		:=false;
//---<HIS-063>------------------------------------------------------------------
				SubPrg.SetAllItemEnabled(False);
////---<HIS-001><HIS-004><HIS-016><HIS-059>---------------------------------------
//				SubPrg.ItemEnabled[MASL_PROC_CODE_EXCEL]			:= False;	//	Excel取込
//				SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_YAYOI02]		:= False;	//	弥生会計02-04
//				SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_YAYOI05]		:= False;	//	弥生会計05-
//				SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_KANJYO]		:= False;	//	勘定奉行
//				SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_PCA]			:= False;	//	PCA会計
//				SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_PCA09]		:= False;	//	PCA会計9 V2
//				SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_KAIKEIOU]	:= False;	//	会計王
//				SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_IBEX]		:= False;	//	JDL IBEX出納帳
//				SubPrg.ItemEnabled[MASL_PROC_CODE_KANTAN]			:= False;	//	ミロクのかんたん！会計
//				SubPrg.ItemEnabled[MASL_PROC_CODE_HOUJIN_EXPORT]	:= False;	//	ミロク法人会計　データ抽出処理
//				SubPrg.ItemEnabled[MASL_PROC_CODE_HOUJIN_IMPORT]	:= False;	//	ミロク法人会計　データ受入処理
//				SubPrg.ItemEnabled[MASL_PROC_CODE_KAIKEI_EXPORT]	:= False;	//	iCompass会計/会計太郎　差分データ送信
//				SubPrg.ItemEnabled[MASL_PROC_CODE_KAIKEI_IMPORT]	:= False;	//	iCompass会計/会計太郎　差分データ受信
//				SubPrg.ItemEnabled[MASL_PROC_CODE_ZAIMU_EXPORT]		:= False;	//	ＣＥ会計　差分データ送信
//				SubPrg.ItemEnabled[MASL_PROC_CODE_ZAIMU_IMPORT]		:= False;	//	ＣＥ会計　差分データ受信
//				SubPrg.ItemEnabled[MASL_PROC_CODE_VK_EXPORT]		:= False;	//	記帳くん　差分データ送信
//				SubPrg.ItemEnabled[MASL_PROC_CODE_VK_IMPORT]		:= False;	//	記帳くん　差分データ受信
////---------------------------------------<HIS-001><HIS-004><HIS-016><HIS-059>---
//------------------------------------------------------------------<HIS-063>---
				BMSpBtnShowBalance.Enabled	:=false;
				PMPanelHdSd.Enabled			:=false;
				iNMonth	:=	pMASL310IDrill^.FrPar^.Imnt[0];
				Rt.Vfnc( MASL_VSET_CUR_MNTH,@iNMonth);
				PMComboBox2.Text:=Sm.CurMonth.sSelMonth;	//	Comboへの入力月
				rFunc:=Itm.ReadIniRec(pMASL310IDrill^.ProcCd);
				bRetn:=Rt.DoAction(rFunc,MASL_DRILL_FRM_PARENT);
				if	bRetn=false	then	Self.Close();
			end;

			m_bCB2KeyEnter	:=	false;
			m_bCB2Select	:=	false;
			m_bCB2Index		:=	-1;
			m_bCB3KeyEnter	:=	false;
			m_bCB3Index		:=	-1;
			m_bCB4KeyEnter	:=	false;
			m_bCB4Index		:=	-1;

	(*♪♪♪*)
		end
		else
		begin
			LMLabelHd2.Visible			:=false;
			BMSpBtnShowBalance.Visible	:=false;
			PMPanelHdBf.Visible			:=false;
			PMComboBox2.Visible			:=false;
			PMPanelSelMonth.Visible		:=false;
			PMPanelHdMonthFix.Visible	:=false;
			ToolBar.Visible				:=false;
			PMPanelHdSj.Visible			:=false;

			InitSelMonth;
			SetIndOnSelMonth;
			PMComboBox2.ItemIndex:=0;

			PMComboBox3.Items.Clear;
			SetIndOnSiji(PMComboBox3,MASL_IGET_SIJI_CODE);
			SetFuncOnSiji(MASL_IGET_SIJI_CODE);

			if	IsSuitouMode	then
			rFunc:=Itm.ReadIniRec(311801)
			else

			rFunc:=Itm.ReadIniRec(310801);
			PMComboBox3Select(rFunc);

	//		EMNumEditFx_No.SetFocus;
		end;
	end
	else
	begin
		//	自分の子供か？
		if	PMPanelHd.ContainsControl(TWinControl(pCurControl))
		then	TWinControl(pCurControl).SetFocus
(*H0008 20010703 khattori プレビュー中に裏画面にされた時！*)
		else	Rt.ProcSelect;
	end;

(*H0008 20010703 khattori プレビュー中に裏画面にされた時！*)
	//	ロードされていたら表示にする
	pRec:=@(TMjsAppRecord(rt.rp_DialogRec[Ord(MASL_Dlg_Siw)]^));
	if	pRec<>nil	then
	begin
		stParam.iAction	:= 11;
		rt.BplAction( ACTID_FREESTART+1, pRec, @stParam);
	end;

	//	ロードされていたら表示にする
	pRec:=@(TMjsAppRecord(rt.rp_DialogRec[Ord(MASL_Dlg_Mot)]^));
	if	pRec<>nil	then
	begin
		stParam.iAction	:= 11;
		rt.BplAction( ACTID_FREESTART+1, pRec, @stParam);
	end;

	//	ロードされていたら表示にする
	pRec:=@(TMjsAppRecord(rt.rp_DialogRec[Ord(MASL_Dlg_Sli)]^));
	if	pRec<>nil	then
	begin
//---<HIS-047>------------------------------------------------------------------
		stParam312.iAction	:= 11;
		rt.BplAction( ACTID_FREESTART+1, pRec, @stParam312);
//		stParam.iAction	:= 11;
//		rt.BplAction( ACTID_FREESTART+1, pRec, @stParam);
//------------------------------------------------------------------<HIS-047>---
	end;

	//	ロードされていたら表示にする
	pRec:=@(TMjsAppRecord(rt.rp_DialogRec[Ord(MASL_Dlg_Slp)]^));
	if	pRec<>nil	then
	begin
//---<HIS-047>------------------------------------------------------------------
		stParam312.iAction	:= 11;
		rt.BplAction( ACTID_FREESTART+1, pRec, @stParam312);
//		stParam.iAction	:= 11;
//		rt.BplAction( ACTID_FREESTART+1, pRec, @stParam);
//------------------------------------------------------------------<HIS-047>---
	end;

	//	ロードされていたら表示にする
	pRec:=@(TMjsAppRecord(rt.rp_DialogRec[Ord(MASL_Dlg_Bal)]^));
	if	pRec<>nil	then
	begin
		cDrilNew.ProcCd	:=	3;
		rt.BplAction( ACTID_FREESTART+1, pRec, @cDrilNew);
	end;

(*♪♪♪*)

(*Ver.x*)
(*H0024	20011217 khattori	手形入力*)
	if	not Is_FASMODE	then
	begin
		//	月選択リスト表示イベントをpost
		if	m_iExclusive=0	then	Timer1.Enabled:=true;
(*♪♪♪*)
	end;

	(*H0013 20030609 khattori 合併採用区分＝１の時、Ｗｉｎ９８でチェックされない*)
//	if  m_FixKbn16 = 1 then
	PostMessage(Self.Handle, WM_ONPAINT, 0, 0);
end;

//******************************************************************************
//	Proccess	:	FormPaint (OnPaint)
//******************************************************************************
procedure TMAS310000f.FormPaint(Sender: TObject);
var
	infoRec			:	TMjsMsgRec;
begin
	(*H0013 20030609 khattori 合併採用区分＝１の時、Ｗｉｎ９８でチェックされない*)
//	(*H0013 20010731 tyamaguchi 入力不可区分、修正／削除区分対応*)
//	if  m_FixKbn16 = 1 then
//    begin
//		TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMsg(infoRec,20,9);
//		with infoRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
//    	Close;
//        Exit;
//    end;

//	//	出納帳入力（単一入力以外）
//	if	(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_TAXITU	)	and
//		(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_MONTHR	)	and
//		(not IsSlipMode									)		then
//		BMSpBtnShowBalance.Visible:=false;
end;

//******************************************************************************
//	Proccess	:	FormClose (OnClose)
//******************************************************************************
procedure TMAS310000f.FormClose(Sender: TObject; var Action: TCloseAction);
var
	AppPrm:TAppParam;
	idx	:	Integer;
	cDrill		:	TMASL310IDrill;
begin
(*切り出した後ばってんなんか押すなよな～*)
		for idx := 1 to Rt.BplList.Count do
		begin
			cDrill	:=	TMASL310IDrill(Rt.GetDrillParam(@idx)^);
			if	cDrill.Mine^.bCall	then
			begin
				if	cDrill.Mine^.TCall=mrCancel	then	abort;
			end;
		end;

(*H0005	20010604 khattori Ａｌｔ＋ｘの時、ドリルダウンの修正フラグが渡らない*)
	if		(g_pDrill<>nil)
	then
	begin
		TMASL310IDrill(g_pDrill^).Status	:=	MASL_DRILL_FRM_CHILD;
		TMASL310IDrill(g_pDrill^).FrCld^	:=	TMASL310IDrill(Rt.Pfnc(MASL_PGET_DRL_PARM)^).ToPar^;
	end;

	for idx:=Ord(Low(enDialogID)) to Ord(High(enDialogID)) do
	begin
		//	ダイアログを呼んだか？
		if Rt.rp_DialogRec[idx]<>nil
		then
		begin
			try Rt.BplAction( ACTID_FORMCLOSESTART, Rt.rp_DialogRec[idx] ); except end;
//---<HIS-004>------------------------------------------------------------------
			try if	Rt.rp_DialogRec[idx]^.m_hChildBpl <> 0	then
//------------------------------------------------------------------<HIS-004>---
					UnLoadPackage( Rt.rp_DialogRec[idx]^.m_hChildBpl ); except end;
			try Dispose( Rt.rp_DialogRec[idx] ); except end;
			Rt.rp_DialogRec[idx]:=nil;
		end;
	end;

	try MJSPreIf	.Free; except end;
	try Rt			.Free; except end;	//	日常処理共通関数クラス破棄
	try PMASLHdRd01	.Free; except end;	//	ヘッダー項目入力パネル破棄
	try Sm			.Free; except end;	//	処理月操作クラス破棄
	try Ind			.Free; except end;	//	指示クラス破棄
	try Fnc			.Free; except end;	//	ファンクション操作クラス破棄
	try Stb			.Free; except end;	//	ステータスバー操作クラス破棄
	try Itm			.Free; except end;	//	指示項目操作クラス生成
	try SelWnd		.Free; except end;	//	選択ウィンドウクラス破棄

(*♪♪♪*)

//---<HIS-044><HIS-050>---------------------------------------------------------
	if	not Is_FASMODE	then
	begin
		if Assigned(m_cSwkExc) then
		begin
			try m_cSwkExc.TermExc();except end;
			try m_cSwkExc.Term();	except end;
			try m_cSwkExc := nil;	except end;	//	インスタンス破棄(nil セットにより内部で破棄される)
		end;
		m_iClose	:=	0;
	end;
//---------------------------------------------------------<HIS-044><HIS-050>---

	(*H0003	20010511 khattori ＤＢのオープンに失敗した時の処理*)
	if m_FCopDBMas <> nil then	m_cMDModule.COPDBClose(m_FCopDBMas);

(*H0010 20010712 khattori やばすぎ２！！！*)
	m_bTerm	:=	true;

	Action				:=	caFree;
	m_pRec^.m_iDelete	:=	1;
	AppPrm.iAction		:=	ACTID_FORMCLOSEEND;
	AppPrm.pRecord		:=	Pointer(m_pRec);
	AppPrm.pActionParam	:=	nil;
	TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);
end;

(*H0016 20010921 tyamaguchi インスタンスの解放をOnDestroyに移動*)
//******************************************************************************
//	Proccess	:	FormDestroy (OnDestroy)
//******************************************************************************
procedure TMAS310000f.FormDestroy(Sender: TObject);
begin
(*H0020 20010927 khattori	復活！！！*)
//---<HIS-001><>HIS-002---------------------------------------------------------
	SubPrg.Free();
	m_cSubUse.Free();
//---------------------------------------------------------<HIS-001><HIS-002>---
end;

//******************************************************************************
//	Proccess	:	FormActivate (OnActivate)
//******************************************************************************
procedure TMAS310000f.FormActivate(Sender: TObject);
var
		AppPrm	:	TAppParam;
begin
// 10/25 New
		AppPrm.iAction		:=	ACTID_ACTIVEEND;
		AppPrm.pRecord		:=	Pointer(m_pRec);
		AppPrm.pActionParam	:=	nil;
		TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);
end;

//******************************************************************************
//	Proccess	:	FormHide (OnHide)
//******************************************************************************
procedure TMAS310000f.FormHide(Sender: TObject);
var
	idx			:	Integer;
	pRec		:	^TMjsAppRecord;
	stParam		:	MAS320100DSIParam;
//---<HIS-047>------------------------------------------------------------------
	stParam312	:	MAS312100DSIParam;
//------------------------------------------------------------------<HIS-047>---
	cDrilNew	:	TMASL310IDrill;
begin
(*H0010 20010712 khattori やばすぎ２！！！*)
	if	not	m_bTerm	then
	begin
		for idx := Rt.BplList.Count - 1 downto 0 do
		begin
			pRec := Rt.BplList.Items[idx];
			if	pRec<>nil	then	Rt.BplAction( ACTID_HIDESTART, pRec );
		end;

	(*H0008 20010703 khattori プレビュー中に裏画面にされた時！*)
		//	ロードされていたら非表示にする
		pRec:=@(TMjsAppRecord(rt.rp_DialogRec[Ord(MASL_Dlg_Siw)]^));
		if	pRec<>nil	then
		begin
			stParam.iAction	:= 10;
			rt.BplAction( ACTID_FREESTART+1, pRec, @stParam);
		end;

		//	ロードされていたら非表示にする
		pRec:=@(TMjsAppRecord(rt.rp_DialogRec[Ord(MASL_Dlg_Mot)]^));
		if	pRec<>nil	then
		begin
			stParam.iAction	:= 10;
			rt.BplAction( ACTID_FREESTART+1, pRec, @stParam);
		end;

		//	ロードされていたら非表示にする
		pRec:=@(TMjsAppRecord(rt.rp_DialogRec[Ord(MASL_Dlg_Sli)]^));
		if	pRec<>nil	then
		begin
//---<HIS-047>------------------------------------------------------------------
			stParam312.iAction	:= 10;
			rt.BplAction( ACTID_FREESTART+1, pRec, @stParam312);
//			stParam.iAction	:= 10;
//			rt.BplAction( ACTID_FREESTART+1, pRec, @stParam);
//------------------------------------------------------------------<HIS-047>---
		end;

		//	ロードされていたら非表示にする
		pRec:=@(TMjsAppRecord(rt.rp_DialogRec[Ord(MASL_Dlg_Slp)]^));
		if	pRec<>nil	then
		begin
//---<HIS-047>------------------------------------------------------------------
			stParam312.iAction	:= 10;
			rt.BplAction( ACTID_FREESTART+1, pRec, @stParam312);
//			stParam.iAction	:= 10;
//			rt.BplAction( ACTID_FREESTART+1, pRec, @stParam);
//------------------------------------------------------------------<HIS-047>---
		end;

		//	ロードされていたら非表示にする
		pRec:=@(TMjsAppRecord(rt.rp_DialogRec[Ord(MASL_Dlg_Bal)]^));
		if	pRec<>nil	then
		begin
			cDrilNew.ProcCd	:=	2;
			rt.BplAction( ACTID_FREESTART+1, pRec, @cDrilNew);
		end;
	end;

//---<HIS-019> MJSBtnVisible は使用しない(必要なボタンが消える現象があったので)-
//	// 10/24 New
//	MjsBtnVisible ( Self, false );
//------------------------------------------------------------------<HIS-019>---
end;

//******************************************************************************
//	Proccess	:	FormCloseQuery (OnCloseQuery)
//******************************************************************************
procedure TMAS310000f.FormCloseQuery(Sender: TObject;	var CanClose: Boolean);
var
	idx	:	Integer;
begin
(*H0036 20030825 khattori	syuusei 会社単独廃止対応*)
	fnExceptTerm;		//	財務排他終了処理

	for idx:=Ord(Low(enDialogID)) to Ord(High(enDialogID)) do
	begin
		//	ダイアログを呼んだか？
		if Rt.rp_DialogRec[idx]<>nil
		then
		begin
			if	Rt.BplAction( ACTID_FORMCANCLOSESTART, Rt.rp_DialogRec[idx] ) <> ACTID_RET_OK then
			begin
				CanClose:=false;
				exit;
			end;
		end;
	end;
	CanClose := Rt.BplCanClose;
end;

//******************************************************************************
//  Component :	PMPanelAll  ( TMPanel )
//  Event     : OnResize
//******************************************************************************
procedure TMAS310000f.PMPanelAllResize(Sender: TObject);
begin
	MSPFunctionBar.ButtonWidth
		:= TControl(Sender).ClientWidth div MSPFunctionBar.ButtonCount - 1;
end;

//******************************************************************************
//  Proccess  : CM_CHILDKEY
//  Parameter : Msg         	TCMChildKey
//  Return    : None
//	Comment	  :
//
//		TCMChildKey = record
//			Msg			: Cardinal;
//			CharCode	: Word;
//			Unused		: Word;
//			Sender		: TWinControl;
//			Result		: Longint;
//		end;
//
//******************************************************************************
procedure TMAS310000f.CMChildKey(var Msg: TCMChildKey);
var
	sName	:	String;
	sMama	:	String;
	sGrma	:	String;
	idx		:	Integer;
	Shift	:	TShiftState;

(*Ver A121 M101*)
(*H0026 20020301 khattori	ＣＲ、００、０００　キー*)
	iAscii	:	Integer;
begin
	sName:='';
	sMama:='';
	sGrma:='';

(*H0033 20030129 khattori	切り出し→最小化→ツリーから選択→Ｅｎｔｅｒ→エラー*)
	if		Screen.ActiveControl<>nil				then	sName:=Screen.ActiveControl.Name
	else if	Screen.ActiveControl.Parent<>nil		then	sMama:=Screen.ActiveControl.Parent.Name
	else if	Screen.ActiveControl.Parent.Parent<>nil	then	sGrma:=Screen.ActiveControl.Parent.Parent.Name;
//	if	Screen.ActiveControl<>nil				then	sName:=Screen.ActiveControl.Name;
//	if	Screen.ActiveControl.Parent<>nil		then	sMama:=Screen.ActiveControl.Parent.Name;
//	if	Screen.ActiveControl.Parent.Parent<>nil	then	sGrma:=Screen.ActiveControl.Parent.Parent.Name;

	Shift:=MJSKeyDataToShiftState(0);

(*Ver A121 M101*)
(*H0026 20020301 khattori	ＣＲキー　－＞*)
	m_bCRKey:=false;

	if	(Shift<>[ssShift])	then
	begin
		//	連想？
		if	Screen.ActiveControl is TMAssocEdit	then
		begin
			//	仮想キーコード	ー＞	ASCIIコード　に変換
			iAscii:=Rt.Ifnc(MASL_IGET_ASCII_CODE,@Msg.CharCode);
			if	iAscii=m_iCRKey	then
			begin
				m_bCRKey		:=	true;
				Msg.CharCode	:=	VK_RETURN;
				Rt.Vfnc(MASL_VSET_WND_SELMODE,@m_bCRKey);
				Screen.ActiveControl.Parent.Tag:=1;
				TMAssocEdit(Screen.ActiveControl).OnKeyDown(Screen.ActiveControl,Msg.CharCode,Shift);
//				Screen.ActiveControl.Parent.Tag:=0;
				Msg.CharCode	:=	0;
				m_bCRKey		:=	false;
				Rt.Vfnc(MASL_VSET_WND_SELMODE,@m_bCRKey);
				abort;
			end;
		end;
	end;
(*H0026 20020301 khattori	－＞　ＣＲ、００、０００　キー*)

	//	ＴＡＢかコンボボックス＋Ｆ４
	if	(	Msg.CharCode=VK_TAB	)	or
		((	Msg.CharCode=VK_F4	)	and (Copy(sName,1,10)='PMComboBox'))then
	begin
		if	(sName='PMComboBox2') then	PMComboBox2KeyDown(PMComboBox2,Msg.CharCode,Shift);
		if	(sName='PMComboBox3') then	PMComboBox3KeyDown(PMComboBox3,Msg.CharCode,Shift);
		if	(sName='PMComboBox4') then	PMComboBox4KeyDown(PMComboBox4,Msg.CharCode,Shift);
		if  (sGrma='PMPanelHdRd') then
		begin
			idx:=StrToInt( Copy( sMama, 11, 1 ) );
			case idx of
				1:	PMASLHdRd01.EMNumEditCode.KeyDown(Msg.CharCode,Shift);
				2:	PMASLHdRd02.EMNumEditCode.KeyDown(Msg.CharCode,Shift);
				3:	PMASLHdRd03.EMNumEditCode.KeyDown(Msg.CharCode,Shift);
				4:	PMASLHdRd04.EMNumEditCode.KeyDown(Msg.CharCode,Shift);
			end;
		end;
		if  (sMama='PMPanelHdFx') then  FxKeyDown(Screen.ActiveControl,Msg.CharCode,Shift);
		if  (sGrma='PMPanelHdFx') then  FxKeyDown(Screen.ActiveControl,Msg.CharCode,Shift);
		Msg.CharCode := 0;
		abort;
	end;

	inherited;
end;

//******************************************************************************
//	Proccess	:	PMPanelHd処理
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//******************************************************************************

//******************************************************************************
//	procedure	:	PMPanelHdExit
//******************************************************************************
procedure TMAS310000f.PMPanelHdExit(Sender: TObject);
begin
//---<HIS-063>------------------------------------------------------------------
	SubPrg.SetAllItemEnabled(False);
////---<HIS-001><HIS-004><HIS-016><HIS-059>---------------------------------------
//	SubPrg.ItemEnabled[MASL_PROC_CODE_EXCEL]			:= False;	//	Excel取込
//	SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_YAYOI02]		:= False;	//	弥生会計02-04
//	SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_YAYOI05]		:= False;	//	弥生会計05-
//	SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_KANJYO]		:= False;	//	勘定奉行
//	SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_PCA]			:= False;	//	PCA会計
//	SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_PCA09]		:= False;	//	PCA会計9 V2
//	SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_KAIKEIOU]	:= False;	//	会計王
//	SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_IBEX]		:= False;	//	JDL IBEX出納帳
//	SubPrg.ItemEnabled[MASL_PROC_CODE_KANTAN]			:= False;	//	ミロクのかんたん！会計
//	SubPrg.ItemEnabled[MASL_PROC_CODE_HOUJIN_EXPORT]	:= False;	//	ミロク法人会計　データ抽出処理
//	SubPrg.ItemEnabled[MASL_PROC_CODE_HOUJIN_IMPORT]	:= False;	//	ミロク法人会計　データ受入処理
//	SubPrg.ItemEnabled[MASL_PROC_CODE_KAIKEI_EXPORT]	:= False;	//	iCompass会計/会計太郎　差分データ送信
//	SubPrg.ItemEnabled[MASL_PROC_CODE_KAIKEI_IMPORT]	:= False;	//	iCompass会計/会計太郎　差分データ受信
//	SubPrg.ItemEnabled[MASL_PROC_CODE_ZAIMU_EXPORT]		:= False;	//	ＣＥ会計　差分データ送信
//	SubPrg.ItemEnabled[MASL_PROC_CODE_ZAIMU_IMPORT]		:= False;	//	ＣＥ会計　差分データ受信
//	SubPrg.ItemEnabled[MASL_PROC_CODE_VK_EXPORT]		:= False;	//	記帳くん　差分データ送信
//	SubPrg.ItemEnabled[MASL_PROC_CODE_VK_IMPORT]		:= False;	//	記帳くん　差分データ受信
////---------------------------------------<HIS-001><HIS-004><HIS-016><HIS-059>---
//------------------------------------------------------------------<HIS-063>---
	BMSpBtnShowBalance.Enabled:=false;			//	Balance　表示不可
	PMPanelSelMonth.Color:=clWindow;
	PMPanelHdSjFst.Color:=clWindow;
	PMPanelHdSjSnd.Color:=clWindow;
end;

//******************************************************************************
//	procedure	:	PMPanelHdEnter
//******************************************************************************
procedure TMAS310000f.PMPanelHdEnter(Sender: TObject);
var
	rFunc:TMASL310IFunc;
begin
(*H0021 20010928 khattori	更新確認のＣａｎｃｅｌボタン*)
	if	Rt.DoAction(rFunc,MASL_DRILL_BASE)	then	//	ドリルダウンパラメーターセット
	begin
		if PMPanelAp.Enabled=true then PMPanelAp.Enabled:=false;
//---<HIS-063>------------------------------------------------------------------
		SubPrg.SetAllItemEnabled(True);
////---<HIS-001><HIS-004><HIS-016><HIS-059>---------------------------------------
//		SubPrg.ItemEnabled[MASL_PROC_CODE_EXCEL]			:= True;	//	Excel取込
//		SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_YAYOI02]		:= True;	//	弥生会計02-04
//		SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_YAYOI05]		:= True;	//	弥生会計05-
//		SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_KANJYO]		:= True;	//	勘定奉行
//		SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_PCA]			:= True;	//	PCA会計
//		SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_PCA09]		:= True;	//	PCA会計9 V2
//		SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_KAIKEIOU]	:= True;	//	会計王
//		SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_IBEX]		:= True;	//	JDL IBEX出納帳
//		SubPrg.ItemEnabled[MASL_PROC_CODE_KANTAN]			:= True;	//	ミロクのかんたん！会計
//		SubPrg.ItemEnabled[MASL_PROC_CODE_HOUJIN_EXPORT]	:= True;	//	ミロク法人会計　データ抽出処理
//		SubPrg.ItemEnabled[MASL_PROC_CODE_HOUJIN_IMPORT]	:= True;	//	ミロク法人会計　データ受入処理
//		SubPrg.ItemEnabled[MASL_PROC_CODE_KAIKEI_EXPORT]	:= True;	//	iCompass会計/会計太郎　差分データ送信
//		SubPrg.ItemEnabled[MASL_PROC_CODE_KAIKEI_IMPORT]	:= True;	//	iCompass会計/会計太郎　差分データ受信
//		SubPrg.ItemEnabled[MASL_PROC_CODE_ZAIMU_EXPORT]		:= True;	//	ＣＥ会計　差分データ送信
//		SubPrg.ItemEnabled[MASL_PROC_CODE_ZAIMU_IMPORT]		:= True;	//	ＣＥ会計　差分データ受信
//		SubPrg.ItemEnabled[MASL_PROC_CODE_VK_EXPORT]		:= True;	//	記帳くん　差分データ送信
//		SubPrg.ItemEnabled[MASL_PROC_CODE_VK_IMPORT]		:= True;	//	記帳くん　差分データ受信
////---------------------------------------<HIS-001><HIS-004><HIS-016><HIS-059>---
//------------------------------------------------------------------<HIS-063>---
		BMSpBtnShowBalance.Enabled:=true;	//	Balance　表示可能

		//	仕訳単独開放
//---<HIS-044><HIS-050>---------------------------------------------------------
		if Assigned(m_cSwkExc) then m_cSwkExc.SetExc(-2);
//---------------------------------------------------------<HIS-044><HIS-050>---
	end;
end;

//******************************************************************************
//	Proccess	:	PMPanelHdRd処理
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//******************************************************************************
procedure TMAS310000f.PMPanelHdRdExit(Sender: TObject);
begin
	Rt.Wfnc(MASL_WND_Clear);
end;

//******************************************************************************
//	Proccess	:	PMComboBox2処理
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//******************************************************************************

//******************************************************************************
//	procedure	:	PMComboBox2Enter
//******************************************************************************
procedure TMAS310000f.PMComboBox2Enter(Sender: TObject);
begin
	//	アクティヴコントロールに自分をセット
	Rt.Vfnc(MASL_VSET_ACTV_CTRL,@Sender);
	InitSelMonth;
	SetIndOnSelMonth;
	SetCaptionBtnFix;
	SetFuncOnSelMonth;

(*H0018 20010926 khattori	定型仕訳排他対応*)
	m_cFixLock.iAction	:=-1;
	Rt.GetFixLock(@m_cFixLock);

	//	定型ＮＯ表示	(*H0015 20010921 tyamaguchi 定型仕訳対応*)
	//	if 条件(定型仕訳採用)
	if	(m_pRec^.m_iOptionCode<>MASL_PROC_OPT_ZTEGATA)	then
	FxReset();
	EMNumEditFx_No.ParentColor := true;

    DisableComponent();

	//	この辺かな？
	if	(PMComboBox2.ItemIndex<0)	and	(m_bCB2Index>=0)	then	PMComboBox2.ItemIndex:=	m_bCB2Index;
	if PMComboBox2.ItemIndex <0	then	PMComboBox2.ItemIndex:=0;

	PMPanelSelMonth.Color:=rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysFocusColor;
	PMPanelHdSjFst.Color:=clWindow;
	PMPanelHdSjSnd.Color:=clWindow;
	PMPanelHdRd.Enabled:=false;
end;

//******************************************************************************
//	Proccess	:	PMComboBox2Exit
//******************************************************************************
procedure TMAS310000f.PMComboBox2Exit(Sender: TObject);
begin
	PMPanelSelMonth.Color:=clWindow;
//---<HIS-049> KeyDown でフォーカス移動すると KeyUp が発生しない----------------
	m_bCB2KeyEnter := False;
//------------------------------------------------------------------<HIS-049>---
end;

//******************************************************************************
//	procedure	:	PMComboBox2Click
//******************************************************************************
procedure TMAS310000f.PMComboBox2Click(Sender: TObject);
begin
	if	not m_bCB2KeyEnter
	then
	begin
		if PMComboBox2.ItemIndex >=0
		then
		begin
			PMComboBox2Select();
//---<HIS-030>------------------------------------------------------------------
			SetCaptionBtnFix();
//------------------------------------------------------------------<HIS-030>---
		end;
	end;
end;

//******************************************************************************
//	procedure	:	PMComboBox2Change
//******************************************************************************
procedure TMAS310000f.PMComboBox2Change(Sender: TObject);
var
	iNMonth:Integer;
begin
	if	m_bCB2Select	then
	begin
		PMComboBox2.ItemIndex	:=	m_bCB2Index;
	end
	else
	begin
		PMComboBox3.Enabled:=false;
	  	PMComboBox4.Enabled:=false;
		if PMComboBox2.ItemIndex >=0 then
		begin
			iNMonth	:=	TMASL310IMonth(Sm.Items[PMComboBox2.ItemIndex]^).iInner;
			Rt.Vfnc( MASL_VSET_CUR_MNTH,@iNMonth);
			SetCaptionBtnFix(1);
		end;
	end;

	m_bCB2Select	:=	false;
	m_bCB2KeyEnter	:=	false;
end;

//******************************************************************************
//	procedure	:	PMComboBox2KeyDown
//******************************************************************************
procedure TMAS310000f.PMComboBox2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
(*H0009 20010709 khattori Ｃｏｍｂｏの動き調整*)
	m_bCB2KeyEnter	:=	true;

	if (Key=VK_ESCAPE) or (Key=VK_END)
	then	EscKeyKeyDown(Sender,Key)
	else
	begin
//		m_bCB2KeyEnter	:=	true;
		m_bCB2Select	:=	false;
		if (Key>=VK_F1)and(Key<=VK_F12)
		then
		begin
			//	月固定／月可変切替ボタン
(*H0038 20030904 khattori	分散入力<単一入力>*)
			if	(not	IsSuitouMode)				and
//			if	((m_pRec^.m_iProgramCode=MASL_PROC_CODE_TAXITU)	or	IsSlipMode)	and
//			if	(m_pRec^.m_iProgramCode<>311000)	and
				(Sm.CurMonth.iInner<>0)				and
				(Sm.CurMonth.iInner<40)				and
				(Key=VK_F1)							then	BMSpBtnMonthFixClick(BMSpBtnMonthFix);
			//	ファンクショントグリ
			if (Key=VK_F9) then	Rt.Vfnc(MASL_VSET_FNC_NEXT);
		end;

////////////////////////
//	テスト用！！！！！
////////////////////////
			if	(Key=VK_F11)	then	inc(m_iPMPanelDev);
			if	(Key=VK_F12)	then
			begin
				if	PMPanelDev.Visible
				then	PMPanelDev.Visible:=false
				else if	(m_iPMPanelDev>10)	then
				begin
					m_iPMPanelDev:=0;
					if PMPanelDev.Caption='A'	then	MakeDevPanel;
					PMPanelDev.Top:=0;
					PMPanelDev.Left:=0;
					PMPanelDev.Height:=2;
					PMPanelDev.Width:=2;
					PMPanelDev.Visible:=true;
					PMPanelDev.BringToFront;
				end;
			end;

		//	Ｅｎｔｅｒ　ｏｒ　Ｔａｂ
		if ((Key=VK_RETURN) or (Key=VK_TAB)) and (Shift<>[ssShift])
		then
		begin
			if PMComboBox2.ItemIndex >=0
			then
			begin
				PMComboBox2Select();
			end;
		end;
	end;
end;

//******************************************************************************
//	procedure	:	PMComboBox2KeyUp
//******************************************************************************
procedure TMAS310000f.PMComboBox2KeyUp(Sender: TObject; var Key: Word;  Shift: TShiftState);
var
	idx1,idx2,idx3,idx4:Integer;
	sSelMonth	:String;
	sText		:String;
	sSelText	:String;
	sCompText	:String;
	iNMonth:Integer;
begin
	m_bCB2KeyEnter	:=	false;
	m_bCB2Select	:=	false;

////////////////////////////////////////////////////////////////////////////////////////////////////
//	処理月の選択を行う
//		1月と10月、2月と21月等、先頭数字が等しい月が混在する為、'月'＋'.'のように入力文字を作成し、
//		判別可能にする（　'1.' <-> '10'　'2.' <-> '20'　等）
//		翌年度第１四半期相当月の入力を可能にする為、'.'＋'月'のように入力文字を作成し、判別可能にする
//		（　'4' <-> '.4'　'20' <-> '.20'　等）
////////////////////////////////////////////////////////////////////////////////////////////////////

//	SelText プロパティは，編集領域内の選択された文字群を表します。

	idx2:=-1;idx3:=-1;idx4:=-1;
	sText:=PMComboBox2.Text;
	sSelText:=PMComboBox2.SelText;
	sCompText:=sText;
	Rt.RCnm(sCompText);		//	カンマ削除

	for idx1 := 0 to PMComboBox2.Items.Count-1 do
	begin
		sSelMonth:=TMASL310IMonth(Sm.Items[idx1]^).sSelMonth;
		if		(sCompText=sSelMonth)							then	idx2:=idx1	//	5,6,7,etc
		else if	((sCompText+'.')=sSelMonth)						then	idx3:=idx1	//	1.,9.,etc
		else if	(sCompText=Copy(sSelMonth,1,Length(sCompText)))	then	idx4:=idx1;	//	1,9,etc
	end;

	if		(idx2>=0)
	then
	begin
		if sText=sCompText
		then
		begin
			PMComboBox2.ItemIndex:=idx2;
			PMComboBox2.Text:=TMASL310IMonth(Sm.Items[idx2]^).sSelMonth+',';
			PMComboBox2.SelectAll;
		end;
	end
	else if	(idx3>=0)
	then
	begin
		PMComboBox2.ItemIndex:=idx3;
		PMComboBox2.Text:=TMASL310IMonth(Sm.Items[idx3]^).sSelMonth+',';
		if	(Copy(sCompText, 1, 1))='.'
		then
		begin
			PMComboBox2.SelStart:=2;
			PMComboBox2.SelLength:=2;
		end
		else
		begin
			PMComboBox2.SelStart:=1;
			PMComboBox2.SelLength:=2;
		end;
	end
	else if	(sSelText='.,') or (idx4<0)
	then
	begin
		PMComboBox2.SelectAll;
		beep;
	end;

	if PMComboBox2.ItemIndex >=0 then
	begin
		iNMonth	:=	TMASL310IMonth(Sm.Items[PMComboBox2.ItemIndex]^).iInner;
		Rt.Vfnc( MASL_VSET_CUR_MNTH,@iNMonth);
		SetCaptionBtnFix;
		SetFuncOnSelMonth;
	end;
end;

//******************************************************************************
//	procedure	:	PMComboBox2Select
//******************************************************************************
procedure TMAS310000f.PMComboBox2Select();
var
	cCompo:TWinControl;
	iNMonth:Integer;
	inforec		:	TMjsMsgRec;
begin
	//////////////////////////////////////////////////////////////////
	(*H0001	20010409	khattori	処理月による排他*)
	iNMonth	:=	TMASL310IMonth(Sm.Items[PMComboBox2.ItemIndex]^).iInner;

	if	m_iClose<>0	then
	begin
		TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMSG(inforec,20,8);
		MjsMessageBoxEx(inforec.sMsg,inforec.sTitle, inforec.icontype, inforec.btntype, inforec.btndef);
	end
	else
	begin
		PMComboBox3.Enabled:=true;
		cCompo:=FindNextControl(PMComboBox2, true, true,false);
		m_bCB2Select	:=	true;
		m_bCB2Index		:=	PMComboBox2.ItemIndex;

		Rt.Vfnc( MASL_VSET_CUR_MNTH,@iNMonth);

		PMComboBox2.Text:=TMASL310IMonth(Sm.Items[m_bCB2Index]^).sSelMonth+',';
		PMComboBox2.SelectAll;

		SetCaptionBtnFix(1);

		if	cCompo.CanFocus	then	cCompo.SetFocus;
		PMComboBox2.ItemIndex	:=	m_bCB2Index;
	end;
end;

//******************************************************************************
//	Proccess	:	PMComboBox3処理
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//******************************************************************************

//******************************************************************************
//	procedure	:	PMComboBox3Enter
//******************************************************************************
procedure TMAS310000f.PMComboBox3Enter(Sender: TObject);

(*H0006	20010626 khattori 表示からの入力中等でマウスで指示に戻った時、指示が不正*)
var
	iNumb:Integer;
	rFunc:TMASL310IFunc;
	pFunc:Pointer;
begin
	if	m_iExclusive=0	then
	begin
		//	アクティヴコントロールに自分をセット
		Rt.Vfnc(MASL_VSET_ACTV_CTRL,@Sender);
		PMComboBox3.Items.Clear;
		SetIndOnSiji(PMComboBox3,MASL_IGET_SIJI_CODE);
		SetFuncOnSiji(MASL_IGET_SIJI_CODE);

(*H0018 20010926 khattori	定型仕訳排他対応*)
		m_cFixLock.iAction	:=-1;
		Rt.GetFixLock(@m_cFixLock);

	    DisableComponent();

		//	定型ＮＯ表示	(*H0015 20010921 tyamaguchi 定型仕訳対応*)
		//	if 条件(定型仕訳採用)
		if	(m_pRec^.m_iOptionCode<>MASL_PROC_OPT_ZTEGATA)	then
		FxReset();
		EMNumEditFx_No.ParentColor := true;

		//	この辺かな？
		if	(PMComboBox3.ItemIndex<0)	and	(m_bCB3Index>=0)	then	PMComboBox3.ItemIndex:=	m_bCB3Index;
		if PMComboBox3.ItemIndex <0	then	PMComboBox3.ItemIndex:=0;

(*H0006	20010626 khattori 表示からの入力中等でマウスで指示に戻った時、指示が不正*)
			iNumb:=PMComboBox3.ItemIndex+1;
			pFunc:=Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb);
			rFunc:=TMASL310IFunc(pFunc^);	//	ファンクション情報
			PMPanelHdSjFst.Caption:=Format('  %2d ',[iNumb])+rFunc.sCaption;
//			PMComboBox3.Text:=IntToStr(iNumb)+',';
		

		PMComboBox3.SelectAll;

(*H0007	20010628 khattori 初期処理中に他のアプリケーションを表示された時*)
		//	１回目でない？
		if	gfirst	then
		PostMessage(PMComboBox3.Handle, CB_SHOWDROPDOWN, 1, 0);

		PMPanelSelMonth.Color:=clWindow;
		PMPanelHdSjFst.Color:=rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysFocusColor;
		PMPanelHdSjSnd.Color:=clWindow;
		PMPanelHdRd.Enabled:=false;
	end;
end;

//******************************************************************************
//	Proccess	:	PMComboBox3Exit
//******************************************************************************
procedure TMAS310000f.PMComboBox3Exit(Sender: TObject);
begin
	PMPanelHdSjFst.Color:=clWindow;
//---<HIS-049> KeyDown でフォーカス移動すると KeyUp が発生しない----------------
	m_bCB3KeyEnter := False;
//------------------------------------------------------------------<HIS-049>---
end;

//******************************************************************************
//	procedure	:	PMComboBox3Click
//******************************************************************************
procedure TMAS310000f.PMComboBox3Click(Sender: TObject);
var
	iNumb:Integer;
	rFunc:TMASL310IFunc;
	pFunc:Pointer;
begin
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=1	then	begin	//	ME,2000 で落ちる
	if	not m_bCB3KeyEnter
	then
	begin
		if (PMComboBox3.ItemIndex >=0) and (Rt.RChk(PMComboBox3.Text)<>2)
		then
		begin
			iNumb:=PMComboBox3.ItemIndex+1;
			pFunc:=Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb);
			rFunc:=TMASL310IFunc(pFunc^);	//	ファンクション情報
			PMPanelHdSjFst.Caption:=Format('  %2d ',[iNumb])+rFunc.sCaption;
			PMComboBox3.Text:=IntToStr(iNumb)+',';
			PMComboBox3.SelectAll;
			PMComboBox3Select(rFunc);
		end;
	end;
	end;	//	ME,2000 で落ちる
end;

//******************************************************************************
//	procedure	:	PMComboBox3Change
//		選択項目を表示する
//			標準的な動作では２桁のＮＯが取れない為、入力と表示を別コントロールでおこなう。
//			入力されたＮＯの項目を表示用コントロールにセットする。
//******************************************************************************
procedure TMAS310000f.PMComboBox3Change(Sender: TObject);
var
	iNumb:Integer;
	rFunc:TMASL310IFunc;
begin
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=1	then	begin	//	ME,2000 で落ちる
	if	gfg	then
	else
	begin
		if	m_bCB3KeyEnter
		then
		begin
			//	項目が選択されているか？
			if	(PMComboBox3.ItemIndex >=0) and (Rt.RChk(PMComboBox3.Items[PMComboBox3.ItemIndex])<>2)
			then
			begin
				iNumb:=PMComboBox3.ItemIndex+1;
				rFunc:=TMASL310IFunc(Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb)^);
				PMPanelHdSjFst.Caption:=Format('  %2d ',[iNumb])+rFunc.sCaption;
				if	rFunc.sProg<>'x'
				then
				begin
					PMPanelHdSjSnd.Caption:='';
					PMComboBox4.Enabled:=false;
					PMComboBox4.Items.Clear;
					PMComboBox4.Text:='';
				end;
			end;
			PMComboBox3.SelectAll;
		end;
	end;
	m_bCB3KeyEnter	:=	false;
	end;	//	ME,2000 で落ちる
end;

//******************************************************************************
//	procedure	:	PMComboBox3KeyDown
//******************************************************************************
procedure TMAS310000f.PMComboBox3KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
	sText:String;
	iNumb:Integer;
	rFunc:TMASL310IFunc;
	pFunc:Pointer;
begin
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=1	then	begin	//	ME,2000 で落ちる

(*H0009 20010709 khattori Ｃｏｍｂｏの動き調整*)
	m_bCB3KeyEnter	:=	true;

	if (Key=VK_ESCAPE) or (Key=VK_END)
	then	EscKeyKeyDown(Sender,Key)
	else
	begin
//		m_bCB3KeyEnter	:=	true;

		sText:=PMComboBox3.Text;
		(* ファンクションキー *)
		if (VK_F1<=Key)and (Key<=VK_F8)
		then
		begin
			iNumb:=Key-VK_F1+1;
			pFunc:=Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb);
			if	(pFunc=nil) or (Rt.RChk(PMComboBox3.Items[iNumb-1])=2)	//	処理が割り当てられていないファンクション
			then	beep
			else
			begin
				rFunc:=TMASL310IFunc(pFunc^);	//	ファンクション情報
				PMPanelHdSjFst.Caption:=Format('  %2d ',[iNumb])+rFunc.sCaption;
				PMComboBox3.ItemIndex:=iNumb-1;
				PMComboBox3.Text:=IntToStr(iNumb)+',';
				sText:=PMComboBox3.Text;
				PMComboBox3.SelectAll;
				PMComboBox3Select(rFunc);
			end;
		end;

		(* トグリ *)
		if (Key=VK_F9) then	Rt.Vfnc(MASL_VSET_FNC_NEXT);

		(* 確定 *)
		if (Key=VK_RETURN) or (Key=VK_TAB) or (Key=VK_LEFT)
		then
		begin
			if (Shift=[ssShift]) or (Key=VK_LEFT)	//	後退
			then
			begin
				if	PMComboBox2.CanFocus			then	PMComboBox2.SetFocus;
				//	出納帳入力（単一入力以外）
(*H0038 20030904 khattori	分散入力<単一入力>*)
				if	IsSuitouMode	then	PMComboBox3.Enabled:=false;
//				if	(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_TAXITU	)	and
//					(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_MONTHR	)	and
//					(not IsSlipMode									)		then	PMComboBox3.Enabled:=false;
			end
			else
			begin
				if	(PMComboBox3.ItemIndex >=0) and (Rt.RChk(PMComboBox3.Text)<>2)
				then
				begin
					iNumb:=PMComboBox3.ItemIndex+1;
					pFunc:=Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb);
					rFunc:=TMASL310IFunc(pFunc^);	//	ファンクション情報

(*H0009 20010709 khattori Ｃｏｍｂｏの動き調整*)
					PMPanelHdSjFst.Caption:=Format('  %2d ',[iNumb])+rFunc.sCaption;

					PMComboBox3Select(rFunc);
				end;
			end;
		end;
		PMComboBox3.Text:=sText;
	end;
	end;	//	ME,2000 で落ちる
end;

//******************************************************************************
//	procedure	:	PMComboBox3KeyUp
//******************************************************************************
procedure TMAS310000f.PMComboBox3KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
	iNumb:Integer;
	iChek:Integer;
	rFunc:TMASL310IFunc;
	sText:String;
begin
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=1	then	begin	//	ME,2000 で落ちる
	m_bCB3KeyEnter	:=	false;

////////////////////////////////////////////////////////////////////////////////////////////////////
//	選択項目を表示する
//		標準的な動作では２桁のＮＯが取れない為、入力と表示を別コントロールでおこなう。
//		入力されたＮＯの項目を表示用コントロールにセットする。
////////////////////////////////////////////////////////////////////////////////////////////////////
	if	TMComboBox(Sender).Name='PMComboBox3'
	then
	begin
		iChek:=0;
		sText:=PMComboBox3.Text;
		if sText<>''
		then
		begin
			Rt.RCnm(sText);		//	カンマ削除
			if	(Rt.RChk(sText)=1) and (Length(sText)>0)		//	不正文字検索
			then
			begin
				iNumb:=StrToInt(sText);
				if	(iNumb<=PMComboBox3.Items.Count) and (iNumb>=1)	//	範囲内
				then
				begin
					PMComboBox3.Text:=sText+',';
					if	iNumb*10>PMComboBox3.Items.Count	then	PMComboBox3.SelectAll
					else											PMComboBox3.SelStart:=1;
					PMComboBox3.ItemIndex:=iNumb-1;
					rFunc:=TMASL310IFunc(Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb)^);
					if	Rt.RChk(PMComboBox3.Items[iNumb-1])=2	//	選択不可
					then	PMPanelHdSjFst.Caption:='   - '+rFunc.sCaption
					else	PMPanelHdSjFst.Caption:=Format('  %2d ',[iNumb])+rFunc.sCaption;
					if	rFunc.sProg<>'x'
					then
					begin
						PMPanelHdSjSnd.Caption:='';
						PMComboBox4.Enabled:=false;
						PMComboBox4.Items.Clear;
					end;
					iChek:=1;
				end;
			end;
			if	iChek=0
			then
			begin
				if	(Rt.RChk(sText)=2) and (PMComboBox3.ItemIndex<>-1)	then
				begin
					iNumb:=PMComboBox3.ItemIndex+1;
					rFunc:=TMASL310IFunc(Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb)^);	//	ファンクション情報
					PMPanelHdSjFst.Caption:='   - '+rFunc.sCaption;
					MMemo1.Lines.Add('PMComboBox3KeyUp !!! '+sText);
				end
				else
				begin
					PMComboBox3.SelectAll;
					beep;
				end;
			end;
		end;
	end;
	end;	//	ME,2000 で落ちる
end;

//******************************************************************************
//	procedure	:	PMComboBox3Select
//******************************************************************************
procedure TMAS310000f.PMComboBox3Select(rFunc:TMASL310IFunc);
var
	cCompo  :   TWinControl;
	bChange :   Boolean;
	pQuery  :   ^TMQuery;
	Key     :   Word;
	Shift   :   TShiftState;
	infoRec	:	TMjsMsgRec;
	iClose	:	Integer;
begin
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=1	then	begin	//	ME,2000 で落ちる
	bChange:=false;
	gMASL310RootVf(MASL_VSET_FST_NUMB,@rFunc.iNumb);	//	第１指示の選択指示Ｎｏ
	gMASL310RootVf(MASL_VSET_FST_CODE,@rFunc.iOpCode);	//	第１指示の選択処理ｺｰﾄﾞ

	if	m_bCB3Index<>PMComboBox3.ItemIndex	then	bChange:=true;
	m_bCB3Index		:=	PMComboBox3.ItemIndex;

	//	Ｚ＝作成中
	if		rFunc.sProg='z'
	then	ShowMessage(IntToStr(rFunc.iOpCode)+' '+rFunc.sCaption+' Now Making!!!')
	//	''＝該当無し
	else if rFunc.sProg=''
	then	ShowMessage(IntToStr(rFunc.iOpCode)+' '+rFunc.sCaption+' Not Found!!!')
	//	Ｘ＝第二指示有り
	else if rFunc.sProg='x'
	then
	begin
		if	bChange	then
		begin
(*H0009 20010709 khattori Ｃｏｍｂｏの動き調整*)
			m_bCB4Index:=-1;

			PMPanelHdSjSnd.Caption:='';
			PMComboBox4.Enabled:=false;
			PMComboBox4.Items.Clear;
			PMComboBox4.Text:='';
		end;

		PostMessage(PMComboBox3.Handle, CB_SHOWDROPDOWN, 0, 0);
		PMComboBox4.Enabled:=true;
		gfg:=true;
		if	PMComboBox4.CanFocus	then	PMComboBox4.SetFocus;
		gfg:=false;
	end
	//	Ｙ＝使用不可
	else if rFunc.sProg<>'y'
	then
	begin
		PMPanelHdSjSnd.Caption:='';
		PMComboBox4.Enabled:=false;
		PMComboBox4.Items.Clear;

		gfg:=true;
		PMComboBox3.DroppedDown:=false;
		//	科目変更
		if rFunc.sProg='ac-change'
		then
		begin
			Rt.Vfnc(MASL_VSET_DEF_FUNC,nil);
			PMPanelHdRd.Enabled:=true;
			cCompo:=FindNextControl(PMComboBox3, true, true,false);
			if	cCompo.CanFocus	then	cCompo.SetFocus;
		end
		//	定型登録　定型ＮＯへ
		else if	( rFunc.iMode =MASL_PROC_MODE_TEIKEITOUROKU ) then
//		else if	( rFunc.iOpCode =310801 ) then
//		else if	( rFunc.iOpCode =310801 ) or ( rFunc.iOpCode =311801 ) then
		begin
			Rt.Vfnc(MASL_VSET_DEF_FUNC,@rFunc);
			if	(m_pRec^.m_iOptionCode<>MASL_PROC_OPT_ZTEGATA)	then
			FxDsp(rFunc.iOpCode);
			PMPanelHdFx.Enabled := True;
			EMNumEditFx_No.Color := clWindow;
			MTxtFx_Name.Color := clWindow;
			EMNumEditFx_No.SetFocus;
		end
		//	定型有りで入力
        else if	( PMPanelHdFx.Visible ) and ( rFunc.iMode =MASL_PROC_MODE_NYUURYOKU )	then
//		else if	( PMPanelHdFx.Visible ) and ( rFunc.iOpCode=310101 )	then
		begin
			Rt.Vfnc(MASL_VSET_DEF_FUNC,@rFunc);
			new( pQuery );
			Rt.GetFxHead( pQuery );				//  定型仕訳ヘッダ取得

			//	定型仕訳登録済み　定型ＮＯへ
			if	pQuery^.RecordCount > 0 then
			begin
				if	(m_pRec^.m_iOptionCode<>MASL_PROC_OPT_ZTEGATA)	then
				FxDsp(rFunc.iOpCode);
				PMPanelHdFx.Enabled := True;
				EMNumEditFx_No.Color := clWindow;
				MTxtFx_Name.ParentColor := true;
				EMNumEditFx_No.SetFocus;
			end
			//	定型仕訳登録無し　通常の入力へ
			else
			begin
				Key := VK_RETURN;	Shift := [];
				FxKeyDown( EMNumEditFx_No, Key, Shift );
				PMPanelHdFx.Enabled := False;
				EMNumEditFx_No.ParentColor := true;
				MTxtFx_Name.ParentColor := true;
			end;
		end
		//	出納帳で仕訳入力関連で当該未確定
(*H0038 20030904 khattori	分散入力<単一入力>*)
		else if	IsSuitouMode	and
//		else if (m_pRec^.m_iProgramCode<>MASL_PROC_CODE_TAXITU	)	and
//				(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_MONTHR	)	and
//				(not IsSlipMode									)	and
				(rFunc.iBrotherCode=310101) and (PMASLHdRd01.m_bEnable=false)
		then
		begin
			Rt.Vfnc(MASL_VSET_DEF_FUNC,@rFunc);
			//	当該へ
			PMPanelHdRd.Enabled:=true;
			cCompo:=FindNextControl(PMComboBox3, true, true,false);
			if	cCompo.CanFocus	then	cCompo.SetFocus;
		end
		//	その他（定型、当該に絡まない動作）
		else
		begin
			Rt.Vfnc(MASL_VSET_DEF_FUNC,@rFunc);
			//	出納帳で仕訳入力関連　ドリルダウンパラメータセット
(*H0038 20030904 khattori	分散入力<単一入力>*)
			if	IsSuitouMode	and
//			if	(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_TAXITU	)	and
//				(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_MONTHR	)	and
//				(not IsSlipMode									)	and
				(rFunc.iBrotherCode=310101)	then	PMASLHdRd01.SetDrillPar;

			iClose	:=	0;
//---<HIS-044>------------------------------------------------------------------
			//	一括削除
			if	rFunc.iOpCode=310301	then
				iClose	:=	m_cSwkExc.SetExc(-1);
//------------------------------------------------------------------<HIS-044>---

			if	iClose=0	then	Rt.DoAction( rFunc)
			else
			begin
				if		iClose=-1
				then	iClose:=	8	//	'他の端末で仕訳データ更新処理が実行されているため処理できません。'
				else	iClose:=	6;	//	'排他制御エラーが発生しました。(SetExc)';
				TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMSG(inforec,20,iClose);
				with infoRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
			end;
		end;
		gfg:=false;
	end;
	end;	//	ME,2000 で落ちる
end;

//******************************************************************************
//	Proccess	:	PMComboBox4処理
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//******************************************************************************

//******************************************************************************
//	procedure	:	PMComboBox4Enter
//******************************************************************************
procedure TMAS310000f.PMComboBox4Enter(Sender: TObject);
begin
	//	アクティヴコントロールに自分をセット
	Rt.Vfnc(MASL_VSET_ACTV_CTRL,@Sender);
	PMComboBox4.Items.Clear;
	SetIndOnSiji(PMComboBox4,MASL_IGET_FST_CODE);
	SetFuncOnSiji(MASL_IGET_FST_CODE);

(*H0018 20010926 khattori	定型仕訳排他対応*)
	m_cFixLock.iAction	:=-1;
	Rt.GetFixLock(@m_cFixLock);

    DisableComponent();

	//	伝票入力
	if	IsSlipMode	and	(Itm.m_iDefaultFunc>-1)	then
	begin
		PMComboBox4.ItemIndex	:=	Itm.m_iDefaultFunc-1;
		Itm.m_iDefaultFunc		:=	-1;
	end
	else
	begin

	//	この辺かな？
(*H0009 20010709 khattori Ｃｏｍｂｏの動き調整*)
	if	m_bCB4Index>=0	then	PMComboBox4.ItemIndex:=	m_bCB4Index;
	if	m_bCB4Index<0	then	PMComboBox4.ItemIndex:=0;
//	if PMComboBox4.ItemIndex <0	then	PMComboBox4.ItemIndex:=0;

	end;

	PMComboBox4.SelectAll;

(*H0007	20010628 khattori 初期処理中に他のアプリケーションを表示された時*)
	//	１回目でない？
	if	gfirst	then
	PostMessage(PMComboBox4.Handle, CB_SHOWDROPDOWN, 1, 0);

	PMPanelSelMonth.Color:=clWindow;
	PMPanelHdSjFst.Color:=clWindow;
	PMPanelHdSjSnd.Color:=rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysFocusColor;
end;

//******************************************************************************
//	Proccess	:	PMComboBox4Exit
//******************************************************************************
procedure TMAS310000f.PMComboBox4Exit(Sender: TObject);
begin
	PMPanelHdSjSnd.Color:=clWindow;
//---<HIS-049> KeyDown でフォーカス移動すると KeyUp が発生しない----------------
	m_bCB4KeyEnter := False;
//------------------------------------------------------------------<HIS-049>---
end;

//******************************************************************************
//	procedure	:	PMComboBox4Click
//******************************************************************************
procedure TMAS310000f.PMComboBox4Click(Sender: TObject);
var
	iNumb:Integer;
	rFunc:TMASL310IFunc;
	pFunc:Pointer;
begin
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=2	then	begin	//	ME,2000 で落ちる
	if	not m_bCB4KeyEnter
	then
	begin
		if (PMComboBox4.ItemIndex >=0) and (Rt.RChk(PMComboBox4.Text)<>2)
		then
		begin
			iNumb:=PMComboBox4.ItemIndex+1;
			pFunc:=Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb);
			rFunc:=TMASL310IFunc(pFunc^);	//	ファンクション情報
			PMComboBox4Select(rFunc);
		end;
	end;
	end;	//	ME,2000 で落ちる
end;

//******************************************************************************
//	procedure	:	PMComboBox4Change
//		選択項目を表示する
//			標準的な動作では２桁のＮＯが取れない為、入力と表示を別コントロールでおこなう。
//			入力されたＮＯの項目を表示用コントロールにセットする。
//******************************************************************************
procedure TMAS310000f.PMComboBox4Change(Sender: TObject);
begin
	//	ME,2000 で落ちる
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=2	then
	begin
		PMComboBox4.SelectAll;
		m_bCB4KeyEnter	:=	false;
	end;	//	ME,2000 で落ちる
end;

//******************************************************************************
//	procedure	:	PMComboBox4KeyDown
//******************************************************************************
procedure TMAS310000f.PMComboBox4KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
	sText:String;
	cCompo:TWinControl;
	iNumb:Integer;
	rFunc:TMASL310IFunc;
	pFunc:Pointer;
begin
	//	ME,2000 で落ちる
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=2	then
	begin
(*H0009 20010709 khattori Ｃｏｍｂｏの動き調整*)
		m_bCB4KeyEnter	:=	true;

		if (Key=VK_ESCAPE) or (Key=VK_END)
		then	EscKeyKeyDown(Sender,Key)
		else
		begin
//			m_bCB4KeyEnter	:=	true;

			sText:=PMComboBox4.Text;

			(* ファンクションキー *)
			if (Key>=VK_F1)and (Key<=VK_F8)
			then
			begin
				iNumb:=Key-VK_F1+1;
				pFunc:=Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb);
				if	(pFunc=nil) or (Rt.RChk(PMComboBox4.Items[iNumb-1])=2)	//	処理が割り当てられていないファンクション
				then	beep
				else
				begin
					rFunc:=TMASL310IFunc(pFunc^);	//	ファンクション情報
					PMPanelHdSjSnd.Caption:=Format('  %2d ',[iNumb])+rFunc.sCaption;
					PMComboBox4.ItemIndex:=iNumb-1;
					PMComboBox4.Text:=IntToStr(iNumb)+',';
					sText:=PMComboBox4.Text;
					PMComboBox4.SelectAll;
					PMComboBox4Select(rFunc);
				end;
			end;

			(* トグリ *)
			if (Key=VK_F9) then	Rt.Vfnc(MASL_VSET_FNC_NEXT);

			(* 確定 *)
			if (Key=VK_RETURN) or (Key=VK_TAB) or (Key=VK_LEFT)
			then
			begin
				if (Shift=[ssShift]) or (Key=VK_LEFT)
				then
				begin
					cCompo:=FindNextControl(TWinControl(Sender), false, true,false);
					if	cCompo.CanFocus	then	cCompo.SetFocus;
				end
				else
				begin
					if	(PMComboBox4.ItemIndex >=0) and (Rt.RChk(PMComboBox4.Text)<>2)
					then
					begin
						iNumb:=PMComboBox4.ItemIndex+1;
						pFunc:=Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb);
						rFunc:=TMASL310IFunc(pFunc^);	//	ファンクション情報
						PMComboBox4Select(rFunc);
					end;
				end;
			end;
			PMComboBox4.Text:=sText;
		end;
	end;	//	ME,2000 で落ちる
end;

//******************************************************************************
//	procedure	:	PMComboBox4KeyUp
//******************************************************************************
procedure TMAS310000f.PMComboBox4KeyUp(Sender: TObject; var Key: Word;  Shift: TShiftState);
var
	iNumb:Integer;
	iChek:Integer;
	rFunc:TMASL310IFunc;
	sText:String;
begin
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=2	then	begin	//	ME,2000 で落ちる
	m_bCB4KeyEnter	:=	false;

	////////////////////////////////////////////////////////////////////////////////////////////////////
	//	選択項目を表示する
	//		標準的な動作では２桁のＮＯが取れない為、入力と表示を別コントロールでおこなう。
	//		入力されたＮＯの項目を表示用コントロールにセットする。
	////////////////////////////////////////////////////////////////////////////////////////////////////
	if	TMComboBox(Sender).Name='PMComboBox4'
	then
	begin
		iChek:=0;
		sText:=PMComboBox4.Text;
		if sText<>''
		then
		begin
			Rt.RCnm(sText);		//	カンマ削除
			if	(Rt.RChk(sText)=1) and (Length(sText)>0)		//	不正文字検索
			then
			begin
				iNumb:=StrToInt(sText);
				if	(iNumb<=PMComboBox4.Items.Count) and (iNumb>=1)	//	範囲内
				then
				begin
					PMComboBox4.Text:=sText+',';
					if	iNumb*10>PMComboBox4.Items.Count then	PMComboBox4.SelectAll
					else										PMComboBox4.SelStart:=1;
					PMComboBox4.ItemIndex:=iNumb-1;
					rFunc:=TMASL310IFunc(Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb)^);
					if	Rt.RChk(PMComboBox4.Items[iNumb-1])=2	//	選択不可
					then	PMPanelHdSjSnd.Caption:='   - '+rFunc.sCaption//+' d'
					else	PMPanelHdSjSnd.Caption:=Format('  %2d ',[iNumb])+rFunc.sCaption;
					iChek:=1;
				end;
			end;
			if	iChek=0
			then
			begin
				if	(Rt.RChk(sText)=2) and (PMComboBox4.ItemIndex<>-1)	then
				begin
					iNumb:=PMComboBox4.ItemIndex+1;
					rFunc:=TMASL310IFunc(Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb)^);	//	ファンクション情報
					PMPanelHdSjSnd.Caption:='   - '+rFunc.sCaption;//;+' e';
					MMemo1.Lines.Add('PMComboBox4KeyUp !!! '+sText);
				end
				else
				begin
					PMComboBox4.SelectAll;
					beep;
				end;
			end;
		end;
	end;
	end;	//	ME,2000 で落ちる
end;

//******************************************************************************
//	procedure	:	PMComboBox4Select
//******************************************************************************
procedure TMAS310000f.PMComboBox4Select(rFunc:TMASL310IFunc);
var
	sText	:	String;
	iNumb	:	Integer;
	pQuery  :   ^TMQuery;
	Key     :   Word;
	Shift   :   TShiftState;

(*H0048 20050516 khattori	操作ガイド番号通知*)
	//******************************************************************************
	//	Function	:	fnHelpIndexSet												<HELP>
	//******************************************************************************
	procedure fnHelpIndexSet;
	var
		AppPara	:	TAppParam;
		rcHLP	:	rcHELPINFO;
	begin
//	ＡＬⅡのみ動作
{$IFDEF _WANTYPE_NEW_}

		rcHLP.Code1 := rFunc.iOpCode;
		rcHLP.Code2 := 0;
		AppPara.iAction := ACTID_HELPINDEXSET;
		AppPara.pRecord := Pointer(m_pRec);
		AppPara.pActionParam := @rcHLP;
		TMjsAppRecord( m_pRec^ ).m_pOwnerEntry( @AppPara );

{$ENDIF}
	end;
begin
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=2	then	begin	//	ME,2000 で落ちる
	m_bCB4Index		:=	PMComboBox4.ItemIndex;

	sText:=PMComboBox4.Text;
	Rt.RCnm(sText);		//	カンマ削除	20001023
	iNumb:=PMComboBox4.ItemIndex;

	gMASL310RootVf(MASL_VSET_SND_NUMB,@rFunc.iNumb);	//	第２指示の選択処理Ｎｏ
	gMASL310RootVf(MASL_VSET_SND_CODE,@rFunc.iOpCode);	//	第２指示の選択処理ｺｰﾄﾞ

	if		rFunc.sProg='z'
	then	ShowMessage(IntToStr(rFunc.iOpCode)+' '+rFunc.sCaption+' Now Making!!!')
	else if rFunc.sProg=''
	then	ShowMessage(IntToStr(rFunc.iOpCode)+' '+rFunc.sCaption+' Not Found!!!')
	else if rFunc.sProg<>'y'
	then
	begin
//		gfg:=true;

(*Ver.x*)
(*H0026 20020111 khattori	第２指示もセットする。*)
		Rt.Vfnc(MASL_VSET_DEF_FUNC,@rFunc);

		PMComboBox4.DroppedDown:=false;


		//	定型登録　定型ＮＯへ
		if	( rFunc.iMode =MASL_PROC_MODE_TEIKEITOUROKU ) then
		begin
			if	(m_pRec^.m_iOptionCode<>MASL_PROC_OPT_ZTEGATA)	then
			FxDsp(rFunc.iOpCode);
			PMPanelHdFx.Enabled := True;
			EMNumEditFx_No.Color := clWindow;
			MTxtFx_Name.Color := clWindow;
			EMNumEditFx_No.SetFocus;
		end
		//	定型有りで入力
        else if	( PMPanelHdFx.Visible ) and ( rFunc.iMode =MASL_PROC_MODE_NYUURYOKU )	then
		begin
			new( pQuery );
			Rt.GetFxHead( pQuery );				//  定型仕訳ヘッダ取得

			//	定型仕訳登録済み　定型ＮＯへ
			if	pQuery^.RecordCount > 0 then
			begin
				if	(m_pRec^.m_iOptionCode<>MASL_PROC_OPT_ZTEGATA)	then
				FxDsp(rFunc.iOpCode);
				PMPanelHdFx.Enabled := True;
				EMNumEditFx_No.Color := clWindow;
				MTxtFx_Name.ParentColor := true;
				EMNumEditFx_No.SetFocus;
			end
			//	定型仕訳登録無し　通常の入力へ
			else
			begin
				Key := VK_RETURN;	Shift := [];
				FxKeyDown( EMNumEditFx_No, Key, Shift );
				PMPanelHdFx.Enabled := False;
				EMNumEditFx_No.ParentColor := true;
				MTxtFx_Name.ParentColor := true;
			end;
		end
		else



		Rt.DoAction( rFunc);
//		gfg:=false;
	end;
	PMComboBox4.ItemIndex:=iNumb;
	PMComboBox4.Text:=sText+',';
//	PMComboBox4.Refresh;
	PMPanelHdSjSnd.Caption:=Format('  %2d ',[iNumb+1])+rFunc.sCaption;

(*H0048 20050516 khattori	操作ガイド番号通知*)
	fnHelpIndexSet;

	end;	//	ME,2000 で落ちる
end;

//******************************************************************************
//	Proccess	:	EscKeyKeyDown
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//	Parameter	:	Sender: TObject
//	Return		:	Nothing
//******************************************************************************
(*H0021 20010928 khattori	更新確認のＣａｎｃｅｌボタン*)
function TMAS310000f.EscKeyKeyDown(Sender: TObject; const Key: Word): Word;
var
	inforec		:	TMjsMsgRec;
	iBalance	:	Integer;
	tlTblList	:	enTblList;
	pQuery		:	Pointer;
	cDrill		:	TMASL310IDrill;
	idx			:	Integer;
begin
	//	メニューからの終了要求
	if	Key=(VK_F4+VK_MENU)	then	result:=mrYes
	else
	begin

		if	(Sender.ClassName='TMComboBox')	and
			(TComboBox(Sender).DroppedDown=true)	then
		begin

(*Ver A122 M101*)
(*H0026 20020328 khattori	エスケープキーでドロップダウンを閉じる*)
			if (Key=VK_ESCAPE) or (Key=VK_END)	then	TComboBox(Sender).DroppedDown:=false;
//			if	Key=VK_END	then	TComboBox(Sender).DroppedDown:=false;
			exit;
		end;

		iBalance	:=	0;

		//	出納帳以外でバランスエラー有り？
		if	((EMNumEditBalance.Value<>0)		or
			(EMNumEditBalance.Font.Color=clRed))	and
(*H0038 20030904 khattori	分散入力<単一入力>*)
			not	IsSuitouMode	then
//			(m_pRec^.m_iProgramCode=MASL_PROC_CODE_TAXITU)			then
		begin
			tlTblList:=MASL_TLST_KbnInfo;
			pQuery:=Rt.Pfnc(MASL_PGET_TBL_LIST,@tlTblList);
			if	pQuery<>nil	then
				if	(TMQuery(pQuery^).Locate('RecKbn',2,[]))=true	then
					iBalance	:=TMQuery(pQuery^).GetFld('GnPuKbn9').AsInteger;
		end;
		if	(iBalance=1)	then
		begin
			//	バランスエラーが起きています。よろしいですか？
			TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMSG(inforec,20,4);
			result:=MjsMessageBoxEx(inforec.sMsg,inforec.sTitle, inforec.icontype, inforec.btntype, inforec.btndef);
		end
		else
		begin
			//	仕訳入力を終了します。\nよろしいですか？
			TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMSG(inforec,20,5);
			(*H0012 20010730 tyamaguchi 終了処理メッセージ変更(出納帳用作成)*)

(*Ver A123 M103*)
(*H0032 20020501 khattori	終了処理メッセージ変更(手形用作成)*)
			if	(m_pRec^.m_iOptionCode=MASL_PROC_OPT_ZTEGATA)	then
    				inforec.sMsg := TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.MsgChange( inforec.sMsg, '@_@', '手形入力' )

			//	単一入力
(*H0038 20030904 khattori	分散入力<単一入力>*)
			else if	IsBaseMode	then
//			else if	(m_pRec^.m_iProgramCode=MASL_PROC_CODE_TAXITU)	or
//			if	(m_pRec^.m_iProgramCode=MASL_PROC_CODE_TAXITU)	or
//				(m_pRec^.m_iProgramCode=MASL_PROC_CODE_MONTHR)	then
    				inforec.sMsg := TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.MsgChange( inforec.sMsg, '@_@', '仕訳入力' )
			//	伝票入力
			else if	IsSlipMode	then
    				inforec.sMsg := TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.MsgChange( inforec.sMsg, '@_@', '伝票入力' )
			//	出納帳
			else	inforec.sMsg := TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.MsgChange( inforec.sMsg, '@_@', '出納帳入力' );
			result:=MjsMessageBoxEx(inforec.sMsg,inforec.sTitle, inforec.icontype, inforec.btntype, inforec.btndef);
		end;
	end;

	//	仕訳更新を実行してＦｏｒｍを閉じる。
	//	定型仕訳の更新でキャンセルされたときはＡｂｏｒｔされる為、Ｆｏｒｍは閉じない。
	if	result=mrYes	then
	begin
		for idx := 1 to Rt.BplList.Count do
		begin
			cDrill	:=	TMASL310IDrill(Rt.GetDrillParam(@idx)^);
			if	cDrill.Mine^.bCall	then
			begin
				if	cDrill.Mine^.TCall=mrCancel	then
				begin
					result := mrCancel;	//	仕訳更新
					exit;
				end;
			end;
		end;
		Self.Close();
	end;
end;

//******************************************************************************
//	Proccess	:	BMSpBtnExitClick
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//	Parameter	:	Sender: TObject
//	Return		:	Nothing
//******************************************************************************
procedure TMAS310000f.BMSpBtnExitClick(Sender: TObject);
begin
//---<HIS-017> Alt+X が微妙に動きが違うのでPostする(Alt押下のせい？) -----------
	PostMessage(Handle, WM_TERM, Integer(Self), 0);
//	EscKeyKeyDown(Sender);
//------------------------------------------------------------------<HIS-017>---
end;

//******************************************************************************
//	Proccess	:	BMSpBtnChangeClick
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//	Parameter	:	Sender: TObject
//	Return		:	Nothing
//******************************************************************************
procedure TMAS310000f.BMSpBtnChangeClick(Sender: TObject);
var
	AppPrm:TAppParam;
(*H0045 20050303 khattori	項目修正*)
	bChange:Boolean;
begin
	if	BMSpBtnChange.Enabled=true	then
	begin
(*H0045 20050303 khattori	項目修正*)
		bChange:=true;
		Rt.Bfnc(MASL_BGET_CHG_OWNER,@bChange);

(*H0048 20050516 khattori	操作ガイド番号通知*)
//---<HIS-019> 復活 (これをしないと埋込がおかしくなる)--------------------------
		PMPanelAll.Visible		:=	False;
//------------------------------------------------------------------<HIS-019>---
		Self.Visible			:=	False;

(*H0045 20050303 khattori	項目修正*)
		bChange:=false;
		Rt.Bfnc(MASL_BGET_CHG_OWNER,@bChange);

		if	Parent=nil	then
		begin
(*	---->	H0045	下に移動 (2005/02/10)
			// 10/24 New
			AppPrm.iAction			:=	ACTID_DOCKINGINEND;
			AppPrm.pRecord			:=	Pointer(m_pRec);
			AppPrm.pActionParam		:=	nil;
			TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);
//	---->	H0045	下に移動 (2005/02/10)	*)

			if	m_pRec^.m_pOwnerPanel=nil
			then	Self.Parent		:=	TForm( m_pRec^.m_pOwnerForm^ )
			else	Self.Parent		:=	TPanel( m_pRec^.m_pOwnerPanel^ );
			Self.Align				:=	alClient;
			Self.BorderStyle		:=	bsNone;
			Self.Position			:=	poDesigned;
			BMSpBtnChange.Caption	:=	'切出(&G)';

//	---->	H0045	上から移動 (2005/02/10)
			AppPrm.iAction			:=	ACTID_DOCKINGINEND;
			AppPrm.pRecord			:=	Pointer(m_pRec);
			AppPrm.pActionParam		:=	nil;
			TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);
//	---->	H0045	上から移動 (2005/02/10)
		end
		else
		begin
(*	---->	H0045	下に移動 (2005/02/10)
			// 10/24 New
			AppPrm.iAction			:=	ACTID_DOCKINGOUTEND;
			AppPrm.pRecord			:=	Pointer(m_pRec);
			AppPrm.pActionParam		:=	nil;
			TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);
//	---->	H0045	下に移動 (2005/02/10)	*)

			Self.BorderStyle		:=	bsSizeable;
			Self.Align				:=	alnone;
			Self.Parent				:=	nil;
			Self.Position			:=	poDefaultPosOnly;
//↓<H0046>
//			ClientWidth				:=	945;
//			ClientHeight			:=	622;
			ClientWidth				:=	Trunc(945 * GetZoomRatio(Pointer(m_pRec)) / 100);
			ClientHeight			:=	Trunc(622 * GetZoomRatio(Pointer(m_pRec)) / 100);
//---<HIS-022> 削除 <HIS-015> ここでもセットしないと効かないらしい--------------
//			PMPanelAll.Constraints.MinWidth		:= PMPanelAll.ClientWidth;
//---------------------------------------------------------<HIS-022><HIS-015>---

//↑
			BMSpBtnChange.Caption	:=	'埋込(&G)';

//	---->	H0045	上から移動 (2005/02/10)
			AppPrm.iAction			:=	ACTID_DOCKINGOUTEND;
			AppPrm.pRecord			:=	Pointer(m_pRec);
			AppPrm.pActionParam		:=	nil;
			TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);
//	---->	H0045	上から移動 (2005/02/10)
		end;

		PMComboBox2.Items.Clear;
		SetIndOnSelMonth();

		PMComboBox3.Items.Clear;
		SetIndOnSiji(PMComboBox3,MASL_IGET_SIJI_CODE);

		PMComboBox4.Items.Clear;
		SetIndOnSiji(PMComboBox4,MASL_IGET_FST_CODE);

		PMPanelAll.Visible		:=	True;
		Self.Visible			:=	True;
	end;
end;

//******************************************************************************
//	Proccess	:	BMSpBtnMonthFix(月固定／月可変)処理
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//	Parameter	:	Sender: TObject
//	Return		:	Nothing
//******************************************************************************
procedure TMAS310000f.BMSpBtnMonthFixClick(Sender: TObject);
begin
	sm.Kotei:=1-sm.Kotei;
	SetCaptionBtnFix();

(*♪♪♪♪♪　Ｓｐｅｃｉａｌ　！！！　*)
	if	Rt.Pfnc(MASL_PGET_ACTV_CTRL)=PMComboBox2	then
	SetFuncOnSelMonth;
end;

//******************************************************************************
//	Proccess	:	BMSpBtnShowBalanceClick(バランス表示)処理
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//	Parameter	:	Sender: TObject
//	Return		:	Nothing
//******************************************************************************
procedure TMAS310000f.BMSpBtnShowBalanceClick(Sender: TObject);
var
	rFunc:TMASL310IFunc;
begin
	rFunc:=Itm.ReadIniRec(MASL_PROC_CODE_BALANCE);
	Rt.DoAction(rFunc);
end;

//---<HIS-001>------------------------------------------------------------------
//******************************************************************************
//  Component : SubPrg ( TSubPrgBtn )
//  Event     : OnItemClick
//  Parameter : idx				Integer			MASL_PROC_CODE_xxxx
//	Comment	  :	サブプログラム の MenuItem を クリックした時に発生
//******************************************************************************
procedure TMAS310000f.SubMenuClick(idx: Integer);
var
	rFunc:TMASL310IFunc;
begin
	//	月が選択されていなかったら先頭の月を選択する(開始してすぐクリックされたケース)
	if PMPanelSelMonth.Caption = '' then
		PMComboBox2Change(PMComboBox2);

	rFunc:=Itm.ReadIniRec(idx);
	//	あれば実行(ダミーとしてないケースがある)
	if rFunc.iOpCode=idx then
		Rt.DoAction(rFunc);
end;
//------------------------------------------------------------------<HIS-001>---

//---<HIS-006>------------------------------------------------------------------
//******************************************************************************
//  Proccess  :	サブプログラムの採用を設定する
//  Parameter : None
//  Return    : None
//******************************************************************************
procedure TMAS310000f.SetSubPrgUse();
begin
	//**************//
	//	非表示設定  //
	//**************//

//---<HIS-033>------------------------------------------------------------------
	//	事務所以外(顧問先、FAS)は非表示
	//	出納帳、伝票入力、分散入力は非表示
	if not Is_JIMUSYO or not IsBaseMode or IsBunsanMode then
//	if not Is_JIMUSYO or IsBunsanMode then
//------------------------------------------------------------------<HIS-033>---
	begin
//---<HIS-063>------------------------------------------------------------------
		SubPrg.SetAllItemVisible(False);
//		SubPrg.ItemVisible[MASL_PROC_CODE_EXCEL]			:= False;
//		SubPrg.ItemVisible[MASL_PROC_CODE_DATA_YAYOI02]		:= False;
//		SubPrg.ItemVisible[MASL_PROC_CODE_DATA_YAYOI05]		:= False;
//		SubPrg.ItemVisible[MASL_PROC_CODE_DATA_KANJYO]		:= False;
//		SubPrg.ItemVisible[MASL_PROC_CODE_DATA_PCA]			:= False;
////---<HIS-059>------------------------------------------------------------------
//		SubPrg.ItemVisible[MASL_PROC_CODE_DATA_PCA09]		:= False;
////------------------------------------------------------------------<HIS-059>---
//		SubPrg.ItemVisible[MASL_PROC_CODE_DATA_KAIKEIOU]	:= False;
//		SubPrg.ItemVisible[MASL_PROC_CODE_DATA_IBEX]		:= False;
//		SubPrg.ItemVisible[MASL_PROC_CODE_KANTAN]			:= False;
//		SubPrg.ItemVisible[MASL_PROC_CODE_HOUJIN_EXPORT]	:= False;
//		SubPrg.ItemVisible[MASL_PROC_CODE_HOUJIN_IMPORT]	:= False;
//		SubPrg.ItemVisible[MASL_PROC_CODE_KAIKEI_EXPORT]	:= False;
//		SubPrg.ItemVisible[MASL_PROC_CODE_KAIKEI_IMPORT]	:= False;
//		SubPrg.ItemVisible[MASL_PROC_CODE_ZAIMU_EXPORT]		:= False;
//		SubPrg.ItemVisible[MASL_PROC_CODE_ZAIMU_IMPORT]		:= False;
////---<HIS-016>------------------------------------------------------------------
//		SubPrg.ItemVisible[MASL_PROC_CODE_VK_EXPORT]		:= False;
//		SubPrg.ItemVisible[MASL_PROC_CODE_VK_IMPORT]		:= False;
////------------------------------------------------------------------<HIS-016>---
//------------------------------------------------------------------<HIS-063>---
		exit;
	end
	//	オフライン
	else if g_miSystemCode = MASL_PROC_SYS_KAIKEI_OFFLINE then
	begin
//---<HIS-032> オフライン対応---------------------------------------------------
//		SubPrg.ItemVisible[MASL_PROC_CODE_KAIKEI_EXPORT]	:= False;			//	iCompass会計/会計太郎　差分データ送信
//		SubPrg.ItemVisible[MASL_PROC_CODE_KAIKEI_IMPORT]	:= False;			//	iCompass会計/会計太郎　差分データ受信
//		SubPrg.ItemVisible[MASL_PROC_CODE_ZAIMU_EXPORT]		:= False;			//	ＣＥ会計　差分データ送信
//		SubPrg.ItemVisible[MASL_PROC_CODE_ZAIMU_IMPORT]		:= False;			//	ＣＥ会計　差分データ受信
////---<HIS-016>------------------------------------------------------------------
//		SubPrg.ItemVisible[MASL_PROC_CODE_VK_EXPORT]		:= False;			//	記帳くん　差分データ送信
//		SubPrg.ItemVisible[MASL_PROC_CODE_VK_IMPORT]		:= False;			//	記帳くん　差分データ受信
////------------------------------------------------------------------<HIS-016>---
//------------------------------------------------------------------<HIS-032>---
	end;

	//************//
	//	採用設定  //
	//************//
	SubPrg.ItemUse[MASL_PROC_CODE_EXCEL]			:= m_cSubUse.IsUseExcel		();	//	Excel取込
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_YAYOI02]		:= m_cSubUse.IsUseYayoi02	();	//	弥生会計02-04
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_YAYOI05]		:= m_cSubUse.IsUseYayoi05	();	//	弥生会計05-
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_KANJYO]		:= m_cSubUse.IsUseKanjyo	();	//	勘定奉行
//---<HIS-064>------------------------------------------------------------------
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_KANJYOi]		:= m_cSubUse.IsUseKanjyoi	();	//	勘定奉行i
//------------------------------------------------------------------<HIS-064>---
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_PCA]			:= m_cSubUse.IsUsePca		();	//	PCA会計
//---<HIS-059>------------------------------------------------------------------
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_PCA09]		:= m_cSubUse.IsUsePca09		();	//	PCA会計9 V2
//------------------------------------------------------------------<HIS-059>---
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_KAIKEIOU]	:= m_cSubUse.IsUseKaikeiou	();	//	会計王
//---<HIS-064>------------------------------------------------------------------
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_KAIKEIOU11]	:= m_cSubUse.IsUseKaikeiou11();	//	会計王11
//------------------------------------------------------------------<HIS-064>---
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_IBEX]		:= m_cSubUse.IsUseIbex		();	//	JDL IBEX出納帳
	SubPrg.ItemUse[MASL_PROC_CODE_KANTAN]			:= m_cSubUse.IsUseKantan	();	//	ミロクのかんたん！会計
	SubPrg.ItemUse[MASL_PROC_CODE_HOUJIN_EXPORT]	:= m_cSubUse.IsUseHoujin	();	//	ミロク法人会計　データ抽出処理
	SubPrg.ItemUse[MASL_PROC_CODE_HOUJIN_IMPORT]	:= m_cSubUse.IsUseHoujin	();	//	ミロク法人会計　データ受入処理
	SubPrg.ItemUse[MASL_PROC_CODE_KAIKEI_EXPORT]	:= m_cSubUse.IsUseKaikei	();	//	iCompass会計/会計太郎　差分データ送信
	SubPrg.ItemUse[MASL_PROC_CODE_KAIKEI_IMPORT]	:= m_cSubUse.IsUseKaikei	();	//	iCompass会計/会計太郎　差分データ受信
	SubPrg.ItemUse[MASL_PROC_CODE_ZAIMU_EXPORT]		:= m_cSubUse.IsUseZaimu		();	//	ＣＥ会計　差分データ送信
	SubPrg.ItemUse[MASL_PROC_CODE_ZAIMU_IMPORT]		:= m_cSubUse.IsUseZaimu		();	//	ＣＥ会計　差分データ受信
//---<HIS-016>------------------------------------------------------------------
	SubPrg.ItemUse[MASL_PROC_CODE_VK_EXPORT]		:= m_cSubUse.IsUseVK		();	//	記帳くん　差分データ送信
	SubPrg.ItemUse[MASL_PROC_CODE_VK_IMPORT]		:= m_cSubUse.IsUseVK		();	//	記帳くん　差分データ受信
//------------------------------------------------------------------<HIS-016>---
end;
//------------------------------------------------------------------<HIS-006>---

//******************************************************************************
//	Proccess	:	PMPanel(for ComboBox)処理
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//	Parameter	:	Sender: TObject
//	Return		:	Nothing
//******************************************************************************
procedure TMAS310000f.PMPanelSelMonthClick(Sender: TObject);
begin
	if	PMComboBox2.CanFocus	then	PMComboBox2.SetFocus;
end;

procedure TMAS310000f.PMPanelHdSjFstClick(Sender: TObject);
begin
	if	PMComboBox3.CanFocus	then	PMComboBox3.SetFocus;
end;

procedure TMAS310000f.PMPanelHdSjSndClick(Sender: TObject);
begin
	if	PMComboBox4.CanFocus	then	PMComboBox4.SetFocus;
end;

//******************************************************************************
//	Component	:	Form
//	Event		:	InitSelMonth
//	Name		:	K.Hattori(MJS)
//******************************************************************************
procedure TMAS310000f.InitSelMonth();
var
	tlTblList	:	enTblList;
	pQuery		:	Pointer;
begin
	if PMComboBox2.Items.Count=0then
	begin
		tlTblList:=MASL_TLST_DTMAIN;
		pQuery:=Rt.Pfnc(MASL_PGET_TBL_LIST,@tlTblList);
		if	pQuery<>nil	then
		begin
			Sm.WaSei	:=TMQuery(pQuery^).GetFld('YearKbn').AsInteger;
			Sm.EntStr	:=TMQuery(pQuery^).GetFld('strmonth').AsInteger;
			Sm.TrmStr	:=StrToInt(FormatDateTime('yyyymmdd', TMQuery(pQuery^).GetFld('kstdate').AsDateTime));
			Sm.TrmEnd	:=StrToInt(FormatDateTime('yyyymmdd', TMQuery(pQuery^).GetFld('keddate').AsDateTime));
			Sm.Gettyuu	:=TMQuery(pQuery^).GetFld('mstday').AsInteger;
			Sm.Kessan	:=TMQuery(pQuery^).GetFld('middlekbn').AsInteger;
		end;

(*♪♪♪*)

(*Ver.x*)
(*H0024	20011217 khattori	手形入力*)
		if	not Is_FASMODE	then
			Sm.Init(PMComboBox2,m_cMDModule)
		else	Sm.Init;
	end;
end;

//******************************************************************************
//	Component	:	Form
//	Event		:	SetIndOnSelMonth
//	Name		:	K.Hattori(MJS)
//******************************************************************************
procedure TMAS310000f.SetIndOnSelMonth();
var
	idx1		:	Integer;
	sMonth		:	String;
begin
//	if PMComboBox2.Items.Count=0then
	if PMComboBox2.Items.Count=0	then
	begin
		PMComboBox2.Items.Clear;
		for idx1 := 0 to Sm.Count-1 do
		begin
			sMonth	:=
				TMASL310IMonth(Sm.Items[idx1]^).sSelMonth	+',"'+
				TMASL310IMonth(Sm.Items[idx1]^).sViewFix	+'","'+
				TMASL310IMonth(Sm.Items[idx1]^).sViewNext	+'","'+
				TMASL310IMonth(Sm.Items[idx1]^).sViewMonth	+'","　　　'+
				TMASL310IMonth(Sm.Items[idx1]^).sViewTerm	+'"';
			PMComboBox2.Items.Add(sMonth);
		end;
		TComboBox(PMComboBox2).MaxLength:=4;
	end;
end;

//******************************************************************************
//	Proccess	:	SetCaptionBtnFix(月固定／月可変)処理
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//	Parameter	:	Sender: TObject
//	Return		:	Nothing
//******************************************************************************
procedure TMAS310000f.SetCaptionBtnFix(iEnabled:Integer);
var
	bKotei	:	Boolean;
begin
	bKotei	:=	true;

	//	出納帳入力以外
(*H0038 20030904 khattori	分散入力<単一入力>*)
	if	not IsSuitouMode	then
//	if	(m_pRec^.m_iProgramCode=MASL_PROC_CODE_TAXITU	)	or
//		(IsSlipMode										)	then
	begin
		//	ドリルダウン以外　＆　当期
		if		(g_pDrill=nil)	then
		begin
//---<HIS-052>------------------------------------------------------------------
			if	(Sm.CurMonth.iInner<>0)	then	bKotei	:=	false
//			if	(Sm.CurMonth.iInner<>0) and (Sm.CurMonth.iInner<40)	then	bKotei	:=	false
//------------------------------------------------------------------<HIS-052>---
		end
		//	ドリルダウン　＆　月範囲指定
		else if	(TMASL310IDrill(g_pDrill^).ToCld^.Imnt[0]<>TMASL310IDrill(g_pDrill^).ToCld^.Imnt[1])	then
		begin
//			sm.Kotei:=	1;
			bKotei	:=	false;
		end;
	end;

	//	月固定
	if	bKotei
	then
	begin
		BMSpBtnMonthFix.Caption:=arStr[0];
		PMPanelHdMonthFix.Enabled:=false;
	end
	else
	begin
		BMSpBtnMonthFix.Caption:=arStr[sm.Kotei];
		if	iEnabled=0	then	PMPanelHdMonthFix.Enabled:=true;

(*H0035 20030825 khattori	MJSLINK <-> ACELINK 統一*)
(*H0037 20030827 khattori	ＡＣＥＬＩＮＫ＜－＞ＭＪＳＬＩＮＫ統合*)
//		if	not ((Is_ZAIMU)or(Is_SITEN))	then
		if	PMPanelHdMonthFix.Enabled	then	BMSpBtnMonthFix.Caption:=BMSpBtnMonthFix.Caption+'(&K)';
	end;
end;

//******************************************************************************
//	Component	:	Form
//	Event		:	SetFuncOnSelMonth
//	Name		:	K.Hattori(MJS)
//******************************************************************************
procedure TMAS310000f.SetFuncOnSelMonth();
var
	iOwner	:	Integer;
	iPage	:	Integer;
	prFunc	:	^TMASL310IFunc;	//	ファンクションセット
	cList	:	TList;
begin
	cList:=TList.Create;

	(* 月固定/月可変 *)

	//	出納帳入力以外	＆	当期
(*H0038 20030904 khattori	分散入力<単一入力>*)
	if	(not IsSuitouMode)	and
//	if	((m_pRec^.m_iProgramCode=MASL_PROC_CODE_TAXITU)	or	(IsSlipMode)) and
		(Sm.CurMonth.iInner<>0) and (Sm.CurMonth.iInner<40)
	then
	begin
		new(prFunc);
		prFunc^.sCaption		:=arStr[1-sm.Kotei];
		prFunc^.bEnabled		:=true;
		cList.Add(prFunc);							//	ファンクションセット
	end
	else	cList.Add(nil);

	iPage:=0;
	iOwner:=1;
	Rt.Vfnc(MASL_VSET_FNC_ITEMS,@cList,@iOwner);	//	ファンクション一括セット（セットのみ）
	Rt.Vfnc(MASL_VSET_FNC_PAGE,@iPage);		//	ファンクション頁セット
	cList.Clear;
	cList.Free;
end;

//******************************************************************************
//	Component	:	Form
//	Event		:	SetIndOnSiji
//	Name		:	K.Hattori(MJS)
//******************************************************************************
procedure TMAS310000f.SetIndOnSiji(Sender: TObject;iFunc:enIfunc);
var
	iIndex		:	Integer;
	iNumb		:	Integer;
	sIndex		:	String;
	iCode		:	Integer;
	rFunc		:	TMASL310IFunc;
	iHassei		:	Integer;
	iSearch		:	Integer;
	tlTblList	:	enTblList;
	pQuery		:	Pointer;
	iNotUpdateKbn:	Integer;
begin
	if TComboBox(Sender).Items.Count=0	then
	begin
		TComboBox(Sender).Items.Clear;
		iCode	:=	gMASL310RootIf(iFunc);

		iHassei:=0;
		tlTblList:=MASL_TLST_DTMAIN;
		pQuery:=Rt.Pfnc(MASL_PGET_TBL_LIST,@tlTblList);
		if	pQuery<>nil
		then
		begin
			iHassei	:=TMQuery(pQuery^).GetFld('DataKbn').AsInteger;
		end;

		iIndex	:=	1;
		iNumb	:=	1;
		iSearch	:=	1;	//	０でなければよい
		while true do
		begin
			rFunc:=Itm.ReadIniRec(iCode,iIndex);
			if	rFunc.iOpCode<=0	then break;

			//	ドリルダウン専用を除く
			if	rFunc.iLevl<>400	then
			begin
				sIndex:=Format('%d',[iNumb]);

/////////////////////////////////////////////////
				//	ランク外
				if	rFunc.sProg='y'	then	sIndex:='-';
/////////////////////////////////////////////////

				if	((rFunc.iMode=1) and
					(Rt.Ifnc(MASL_IGET_CHANGEABLE,@Sm.CurMonth.iInner,@iHassei)<>Ord(MASL_RET_MAIL_OK))	) or

					(((rFunc.iMode=2) or (rFunc.iMode=4) or (rFunc.iMode=6)) and
					(Rt.Ifnc(MASL_IGET_CHANGEABLE,@Sm.CurMonth.iInner,@iHassei,@iSearch)<>Ord(MASL_RET_MAIL_OK))	) or

					((Sm.CurMonth.iInner=0) and
					((rFunc.iStyl=1) or	(rFunc.iMode=12) or	(rFunc.iMode=13))	) then	sIndex:='-';

				(*H0013 20010731 tyamaguchi 修正／削除区分対応*)
				iNotUpdateKbn := 0;
				tlTblList:=MASL_TLST_KbnInfo;
				pQuery:=Rt.Pfnc(MASL_PGET_TBL_LIST,@tlTblList);
				if	pQuery<>nil	then
				begin
					if	(TMQuery(pQuery^).Locate('RecKbn',2,[]))=true	then
						iNotUpdateKbn	:= TMQuery(pQuery^).GetFld('GnPuKbn19').AsInteger;
				end;
				if  (rFunc.iMode in[2,4]) and (iNotUpdateKbn=1) then  sIndex:='-';

				TComboBox(Sender).Items.Add(sIndex+','+rFunc.sCaption);
				Inc(iNumb);
			end;

			iIndex:=iIndex+1;
		end;
		TComboBox(Sender).MaxLength:=3;
	end;
end;

//******************************************************************************
//	Component	:	Form
//	Event		:	SetFuncOnSiji
//	Name		:	K.Hattori(MJS)
//******************************************************************************
procedure TMAS310000f.SetFuncOnSiji(iFunc:enIfunc);
var
	cList		:	TList;
	iIndex		:	Integer;
	iCode		:	Integer;
	rFunc		:	TMASL310IFunc;
	prFunc		:	^TMASL310IFunc;	//	ファンクションセット
	iHassei		:	Integer;
	iSearch		:	Integer;
	tlTblList	:	enTblList;
	pQuery		:	Pointer;
	iOwner		:	Integer;
	iPage		:	Integer;
    iNotUpdateKbn:	Integer;
begin
	cList:=TList.Create;

	iHassei:=0;
	tlTblList:=MASL_TLST_DTMAIN;
	pQuery:=Rt.Pfnc(MASL_PGET_TBL_LIST,@tlTblList);
	if	pQuery<>nil
	then
	begin
		iHassei	:=TMQuery(pQuery^).GetFld('DataKbn').AsInteger;
	end;

	iCode:=gMASL310RootIf(iFunc);
	iIndex := 1;
(*♪♪♪♪♪*)
		iSearch	:=	1;	//	０でなければよい
	while true do
	begin
		rFunc:=Itm.ReadIniRec(iCode,iIndex);
		if	rFunc.iOpCode<=0	then break;

		//	ドリルダウン専用を除く
		if	rFunc.iLevl<>400	then
		begin
/////////////////////////////////////////////////
			//	ランク外
			if	rFunc.sProg='y'	then	rFunc.bEnabled:=false;
/////////////////////////////////////////////////
			(* 指示ファンクション *)
			if	((rFunc.iMode=1) and
				(Rt.Ifnc(MASL_IGET_CHANGEABLE,@Sm.CurMonth.iInner,@iHassei)<>Ord(MASL_RET_MAIL_OK))	) or

				(((rFunc.iMode=2) or (rFunc.iMode=4) or (rFunc.iMode=6)) and
				(Rt.Ifnc(MASL_IGET_CHANGEABLE,@Sm.CurMonth.iInner,@iHassei,@iSearch)<>Ord(MASL_RET_MAIL_OK))	) or

				((Sm.CurMonth.iInner=0) and
				((rFunc.iStyl=1) or	(rFunc.iMode=12) or	(rFunc.iMode=13))	) then	rFunc.bEnabled:=false;

			(*H0013 20010731 tyamaguchi 修正／削除区分対応*)
			iNotUpdateKbn := 0;
			tlTblList:=MASL_TLST_KbnInfo;
			pQuery:=Rt.Pfnc(MASL_PGET_TBL_LIST,@tlTblList);
			if	pQuery<>nil	then
			begin
				if	(TMQuery(pQuery^).Locate('RecKbn',2,[]))=true	then
					iNotUpdateKbn	:= TMQuery(pQuery^).GetFld('GnPuKbn19').AsInteger;
			end;
			if  (rFunc.iMode in[2,4]) and (iNotUpdateKbn=1) then  rFunc.bEnabled:=false;

			new(prFunc);
			prFunc^	:=rFunc;
			cList.Add(prFunc);
		end;

		iIndex:=iIndex+1;
	end;

	iPage:=0;
	if	iFunc=MASL_IGET_SIJI_CODE	then	iOwner:=1	else	iOwner:=2;
	Rt.Vfnc(MASL_VSET_FNC_ITEMS,@cList,@iOwner);
	Rt.Vfnc(MASL_VSET_FNC_PAGE,@iPage);
	cList.Clear;
	cList.Free;
end;

procedure TMAS310000f.WMOnPaint(var Msg: TMessage);
var
	iMessageId	:	integer;
	inforec		:	TMjsMsgRec;
begin
//---<HIS-034>------------------------------------------------------------------
	if Parent = nil then
			Align := alNone
	else	Align := alClient;
//------------------------------------------------------------------<HIS-034>---

	//	出納帳入力（単一入力以外）
(*H0038 20030904 khattori	分散入力<単一入力>*)
	if	IsSuitouMode	then
//	if	(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_TAXITU	)	and
//		(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_MONTHR	)	and
//		(not IsSlipMode									)		then
		BMSpBtnShowBalance.Visible:=false;

	if	m_iExclusive<>0	then
	begin
		iMessageId	:=	m_iExclusive;
		if	m_iExclusive>7000	then	iMessageId	:=	8;
		TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMSG(inforec,20,iMessageId);

		if	m_iExclusive=7001	then	inforec.sMsg	:=	'仕訳最大端末数に達したため処理できません。';
		if	m_iExclusive=7002	then	inforec.sMsg	:=	'他の端末で仕訳単独処理が実行中のため処理できません。';
		if	m_iExclusive=7003	then	inforec.sMsg	:=	'伝票情報が登録されていない為、処理できません。';

		MjsMessageBoxEx(inforec.sMsg,inforec.sTitle, inforec.icontype, inforec.btntype, inforec.btndef);
		close;
		exit;
	end;

	(*H0013 20030609 khattori 合併採用区分＝１の時、Ｗｉｎ９８でチェックされない*)
	if  m_FixKbn16 = 1 then
	begin
		TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMsg(infoRec,20,9);
		with infoRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
		Close;
		exit;
	end;

(*H0034 20030611 khattori	分散入力*)
	//  分散入力採用区分
	if	(m_BunKbn01=0) and IsBunsanMode	then
	begin
		TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMsg(infoRec,20,9);
		Beep ();
		with infoRec do	MjsMessageBoxEx('分散入力が採用されていません。',sTitle,icontype,btntype,btndef,LogType);
//		with infoRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
		Close;
		exit;
	end;

(*H0038 20030904 khattori	分散入力<単一入力>*)
//						iTanGCode:=rcCOMMONAREA( m_pRec^.m_pCommonArea^ ).TantoGCD;
	//  分散単一入力時、担当者管理必須
	if	IsBaseMode and IsBunsanMode and (rcCOMMONAREA( m_pRec^.m_pCommonArea^ ).TantoNCD=-1)	then
	begin
		TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMsg(infoRec,20,9);
		Beep ();
		with infoRec do	MjsMessageBoxEx('担当者管理が採用されていません。',sTitle,icontype,btntype,btndef,LogType);
//		with infoRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
		Close;
		exit;
	end;

end;

//******************************************************************************
//  Proccess  :	CM_DIALOGCHAR
//  Parameter : Msg			TCMDialogChar	(= TWMKey)
//  Return    : None
//	Comment	  :	ﾆｰﾓﾆｯｸ (&x) の制御をする	MJSBtnVisible の代替処理
//	History	  : <HIS-019>
//******************************************************************************
procedure TMAS310000f.CMDialogChar(var Msg: TCMDialogChar);
begin
	//	ｱｸﾃｨﾌﾞでない場合(裏に隠れているなど)は無効
	if ContainsControl(Screen.ActiveControl) then inherited;
end;

//******************************************************************************
//  Proccess  :	終了処理
//  Parameter : Msg.WParam		TObject			Sender ｺﾝﾎﾟｰﾈﾝﾝﾄ
//  Return    : None
//	History	  :	<HIS-017>
//******************************************************************************
procedure TMAS310000f.WMTerm(var Msg: TMessage);
begin
	EscKeyKeyDown(TObject(Msg.WParam));
end;

////////////////////////////////////////////////////////////////////////////////////////////////////
//	日常処理共通関数
////////////////////////////////////////////////////////////////////////////////////////////////////

//	戻り値なし
procedure TMAS310000f.gMASL310RootVf
(enPar:enVfunc;pPar1:Pointer=nil;pPar2:Pointer=nil;pPar3:Pointer=nil);
begin
	case	enPar of
		MASL_VSET_FCS_FSIJI:
			begin
				if	(g_pDrill<>nil)	and	(Rt.m_pDrillLevel=1)	then
				begin
(*H0005	20010604 khattori Ａｌｔ＋ｘの時、ドリルダウンの修正フラグが渡らない*)
					Self.Close();
					abort;
				end;

				//	仕訳単独開放
//---<HIS-044><HIS-050>---------------------------------------------------------
				if Assigned(m_cSwkExc) then m_cSwkExc.SetExc(-2);
//---------------------------------------------------------<HIS-044><HIS-050>---
			end;
	end;
	Rt.Vfnc(enPar,pPar1,pPar2,pPar3)
end;
//	戻り値Pointer型
function TMAS310000f.gMASL310RootPf
(enPar:enPfunc;pPar1:Pointer=nil;pPar2:Pointer=nil;pPar3:Pointer=nil):Pointer;
begin
	try
	result:=Rt.Pfnc(enPar,pPar1,pPar2,pPar3)
	except
		Rt.LogWrite('TMAS310000f.gMASL310RootPf で例外発生！');
	end;
end;
//	戻り値Boolean型
function TMAS310000f.gMASL310RootBf
(enPar:enBfunc;pPar1:Pointer=nil;pPar2:Pointer=nil;pPar3:Pointer=nil):Boolean;
begin
	try
	result:=Rt.Bfnc(enPar,pPar1,pPar2,pPar3)
	except
		Rt.LogWrite('TMAS310000f.gMASL310RootBf で例外発生！');
	end;
end;
//	戻り値Integer型
function TMAS310000f.gMASL310RootIf
(enPar:enIfunc;pPar1:Pointer=nil;pPar2:Pointer=nil;pPar3:Pointer=nil):Integer;
begin
	try
	result:=Rt.Ifnc(enPar,pPar1,pPar2,pPar3)
	except
		Rt.LogWrite('TMAS310000f.gMASL310RootIf で例外発生！');
	end;
end;
//	戻り値String型
function TMAS310000f.gMASL310RootSf
(enPar:enSfunc;pPar1:Pointer=nil;pPar2:Pointer=nil;pPar3:Pointer=nil):String;
begin
	try
	result:=Rt.Sfnc(enPar,pPar1,pPar2,pPar3)
	except
		Rt.LogWrite('TMAS310000f.gMASL310RootSf で例外発生！');
	end;
end;
// 選択ウィンドウカバー関数
function TMAS310000f.gMASL310RootWf
(enPar:enWfunc;pPar1:Pointer=nil;pPar2:Pointer=nil;pPar3:Pointer=nil):Pointer;
begin
	try
	result:=Rt.Wfnc(enPar,pPar1,pPar2,pPar3)
	except
		Rt.LogWrite('TMAS310000f.gMASL310RootWf で例外発生！');
	end;
end;

////////////////////////////////////////////
//	テスト用ボタン制御部

//******************************************************************************
//	MakeDevPanel
//******************************************************************************
procedure	TMAS310000f.MakeDevPanel;
var
	idx:Integer;
	Btn:TMSpeedButton;
	Num:TMNumEdit;
	Txt:TMTxtEdit;
begin
	for idx := 0 to 19 do
	begin
		Btn:=TMSpeedButton.Create(PMPanelDev);
		Btn.Parent			:=	PMPanelDev;
        Btn.Tag				:=	idx+1;
		Btn.Left			:=	14+(idx mod 5)*80;
		Btn.Top				:=	14+(idx div 5)*20;
		Btn.Width			:=	80;
		Btn.Height			:=	20;
		Btn.Caption			:=	IntToStr(idx+1);
        Btn.OnClick			:=	BMSpBtnDevxxClick;
        Btn.Flat			:=	True;
		gcrCont[idx]		:=	TWinControl(Btn);

		Num:=TMNumEdit.Create(PMPanelDev);
		Num.Parent			:=	PMPanelDev;
		Num.Left			:=	14+(idx mod 5)*80;
		Num.Top				:=	104+(idx div 5)*20;
		Num.Width			:=	80;
		Num.Height			:=	20;
        Num.TabStop			:=	False;
		gcrCont[idx+20]		:=	TWinControl(Num);

		Txt:=TMTxtEdit.Create(PMPanelDev);
		Txt.Parent			:=	PMPanelDev;
		Txt.Left			:=	14+(idx mod 5)*80;
		Txt.Top				:=	194+(idx div 5)*20;
		Txt.Width			:=	80;
		Txt.Height			:=	20;
        Txt.TabStop			:=	False;
		gcrCont[idx+40]		:=	TWinControl(Txt);
	end;
end;

//******************************************************************************
//	Proccess	:	BMSpBtnDevxxClick
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//	Parameter	:	Sender
//	Return		:	Nothing
//******************************************************************************
procedure TMAS310000f.BMSpBtnDevxxClick(Sender: TObject);
var
	m_FdqInfo	:	^TMQuery;
	m_FdqInfo2	:	^TMQuery;
	infoRec		:	TMjsMsgRec;

	m_KoekiSet	:	TMASKoekiSet;
	sText		:	string;

	iIndex		:	Integer;
	iWork		:	Integer;
	irAcc		:	array[0..1] of	Integer;

	tlTblList	:	enTblList;
	pQuery		:	Pointer;

	pParam		:	^TMASL310IDrParam;
begin
	case	TMSpeedButton(Sender).Tag of
		1:
			begin
				if MessageDlg('drop optimizer ok?',
				mtConfirmation, [mbYes, mbNo], 0) = mrYes then
				begin
					new(m_FdqInfo);
					m_FdqInfo^:=TMQuery.Create(self);
					m_cMDModule.SetDBInfoToQuery(m_FCopDBMas,m_FdqInfo^);
					with	m_FdqInfo^	do
					begin
						Close;
						SQL.Clear;
						SQL.Add('drop optimizer statistics;');
						Open;
					end;
				end;
			end;
		2:
			begin
			end;
		3:
			begin
			end;
		4:
        	begin
            end;
		5:
			begin
			end;
		6:
        	begin
            end;
		7:
        	begin
            end;
		8:
        	begin
            end;
		9:
        	begin
				iWork:=trunc(TMNumEdit(gcrCont[23]).value);
				gMASL310RootVf(MASL_VSET_PROC_KIND,@iWork);
            end;
		10:
			begin
				TMNumEdit(gcrCont[20]).value:=g_miSystemCode;
				TMNumEdit(gcrCont[21]).value:=TMASL310IFunc(Rt.Pfnc(MASL_PGET_DEF_FUNC)^).iOpCode;
				TMNumEdit(gcrCont[22]).value:=TMASL310IFunc(Rt.Pfnc(MASL_PGET_DEF_FUNC)^).iMode;
				TMNumEdit(gcrCont[23]).value:=gMASL310RootIf( MASL_IGET_PROC_KIND );
				TMNumEdit(gcrCont[24]).value:=777;
				TMTxtEdit(gcrCont[42]).text:=TMASL310IFunc(Rt.Pfnc(MASL_PGET_DEF_FUNC)^).sCaption;
				TMTxtEdit(gcrCont[43]).text:='777';
			end;
		11:
			begin
			end;
		12:
			begin
			end;
		13:
			begin
			end;
		14:
			begin
			end;
		15:
			begin
			end;
		16:
			begin
			end;
		17:
			begin
			end;
		18:
			begin
			end;
		19:
			begin
			end;
		20:
			begin
				PMPanelSelMonth	.Left	:=438	-PMPanelSelMonth.Left;
				PMPanelHdSjFst	.Left	:=94	-PMPanelHdSjFst	.Left;
				PMPanelHdSjFst	.Width	:=198	-PMPanelHdSjFst	.Width;
				PMPanelHdSjSnd	.Left	:=358	-PMPanelHdSjSnd	.Left;
				PMPanelHdSjSnd	.Width	:=198	-PMPanelHdSjSnd	.Width;
			end;
   	end;
end;

procedure TMAS310000f.Timer1Timer(Sender: TObject);
begin
(*H0007	20010628 khattori 初期処理中に他のアプリケーションを表示された時*)
	Timer1.Enabled:=false;
	//	１回目＆ＭＪＳデスクトップがアクティブ＆ドリルダウンでない？
	if	(gfirst=false) and Application.Active	and	(g_pDrill=nil)	then
		if	(Screen.ActiveControl=PMComboBox2)or
			(Screen.ActiveControl=PMComboBox3)or
			(Screen.ActiveControl=PMComboBox4)	then
			if	not	TMComboBox(Screen.ActiveControl).DroppedDown	then
				TMComboBox(Screen.ActiveControl).DroppedDown:=true;
	gfirst:=true;
end;

procedure TMAS310000f.MIxxClick(Sender: TObject);
begin
    TMBtnFusen.ImageIndex	:= TMenuItem(Sender).ImageIndex;

    //  下１桁目：ユーザー選択付箋　下２桁目：ｶﾚﾝﾄの付箋区分　それ以上：ｶﾚﾝﾄｺﾝﾎﾟｰﾈﾝﾄのTag
	//  ユーザー選択付箋のセット
    TMBtnFusen.Tag			:= TMBtnFusen.Tag div 10 * 10 + TMenuItem(Sender).ImageIndex;
end;

//******************************************************************************
//	Proccess	:	DisableComponent
//	Name		:	T.Yamaguchi(MJS)
//	Date		:	2001/08/21
//	Parameter	:	Nothing
//	Return		:	Nothing
//******************************************************************************
procedure TMAS310000f.DisableComponent();
begin
	TMBtnFusen.Enabled 	:= False;
	TMBtnOpen.Enabled 	:= False;
	TMBtnOpen.Down	 	:= False;
(*H0047 20050418 khattori	一括置換*)
	TMBtnLump.Enabled 	:= False;
end;

//**************************************************************************
//  Component  :   MFurigana ( TMFurigana )
//              フリガナコンポーネント
//  Event      :   CompositionStr
//  Name       :   T.Yamaguchi
//**************************************************************************
procedure TMAS310000f.MFuriganaCompositionStr(Sender: TObject; Value: String);
begin
	FxFurigana( Value );
end;

//******************************************************************************
//	Proccess	:	入力制御
//******************************************************************************
function TMAS310000f.IsBaseMode(iPrgCode:Integer):Boolean;
var
	iCode	:	Integer;
	bBase	:	Boolean;
begin
	iCode	:=	iPrgCode;
	if	iCode=0	then	iCode	:=	m_pRec^.m_iProgramCode;
	bBase	:=	false;

	case	iCode	of
		MASL_PROC_CODE_TAXITU,
(*H0038 20030904 khattori	分散入力<単一入力>*)
		MASL_PROC_CODE_TAXITU_BUN:	bBase	:=	true;
//		MASL_PROC_CODE_MONTHR:		bBase	:=	true;
	end;
	result:=bBase;
end;

(*H0038 20030904 khattori	分散入力<単一入力>*)
//******************************************************************************
//	Proccess	:	出納帳
//******************************************************************************
function TMAS310000f.IsSuitouMode(iPrgCode:Integer):Boolean;
var
	iCode	:	Integer;
	bBase	:	Boolean;
begin
	iCode	:=	iPrgCode;
	if	iCode=0	then	iCode	:=	m_pRec^.m_iProgramCode;
	bBase	:=	false;

(*H0038 20030904 khattori	分散入力<単一入力>*)
	if	(not IsBaseMode										)	and
//	if	(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_TAXITU		)	and
//		(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_MONTHR		)	and
		(not IsSlipMode										)		then
		bBase	:=	true;

	result:=bBase;
end;

//******************************************************************************
//	Proccess	:	伝票制御
//******************************************************************************
function TMAS310000f.IsSlipMode(iPrgCode:Integer):Boolean;
var
	iCode	:	Integer;
	bSlip	:	Boolean;
begin
	iCode	:=	iPrgCode;
	if	iCode=0	then	iCode	:=	m_pRec^.m_iProgramCode;
	bSlip	:=	false;

	case	iCode	of
		MASL_PROC_CODE_MIROKU		,		//	ミロク型指示
		MASL_PROC_CODE_KOKUYO		,		//	コクヨ型指示
		MASL_PROC_CODE_NYUUKIN		,		//	入金伝票指示
		MASL_PROC_CODE_SYUKKIN		,		//	出金伝票指示
		MASL_PROC_CODE_KARISSN		,		//	仮払精算指示
		MASL_PROC_CODE_MIROKU_BUN	,		//	ミロク型指示
		MASL_PROC_CODE_KOKUYO_BUN	,		//	コクヨ型指示
		MASL_PROC_CODE_NYUUKIN_BUN	,		//	入金伝票指示
		MASL_PROC_CODE_SYUKKIN_BUN	,		//	出金伝票指示
		MASL_PROC_CODE_KARISSN_BUN	:		//	仮払精算指示
			bSlip	:=	true;
	end;
	result:=bSlip;
end;

//******************************************************************************
//	Proccess	:	分散
//******************************************************************************
function TMAS310000f.IsBunsanMode(iPrgCode:Integer):Boolean;
var
	iCode	:	Integer;
	bSlip	:	Boolean;
begin
	iCode	:=	iPrgCode;
	if	iCode=0	then	iCode	:=	m_pRec^.m_iProgramCode;
	bSlip	:=	false;

	case	iCode	of
(*H0038 20030904 khattori	分散入力<単一入力>*)
		MASL_PROC_CODE_TAXITU_BUN	,		//	単一入力分散仕訳指示

		MASL_PROC_CODE_MIROKU_BUN	,		//	ミロク型指示
		MASL_PROC_CODE_KOKUYO_BUN	,		//	コクヨ型指示
		MASL_PROC_CODE_NYUUKIN_BUN	,		//	入金伝票指示
		MASL_PROC_CODE_SYUKKIN_BUN	,		//	出金伝票指示
		MASL_PROC_CODE_KARISSN_BUN	:		//	仮払精算指示
			bSlip	:=	true;
	end;
	result:=bSlip;
end;

//******************************************************************************
//	Proccess	:	ＦＡＳ
//******************************************************************************
function TMAS310000f.Is_FASMODE:Boolean;
var
	bSlip	:	Boolean;
begin
	bSlip	:=	false;
	if	(g_miSystemCode=MASL_PROC_SYS_FASENTRY)	or	Is_ZFASCS	or	Is_ZFASMN
	then		bSlip	:=	true;
	result:=bSlip;
end;

//******************************************************************************
//	Proccess	:	財務基本（事務所）
//******************************************************************************
function TMAS310000f.Is_JIMUSYO:Boolean;
var
	bSlip	:	Boolean;
begin
	bSlip	:=	false;
	if	(g_miSystemCode=MASL_PROC_SYS_KAIKEI)			or
		(g_miSystemCode=MASL_PROC_SYS_KAIKEI_OFFLINE)
	then		bSlip	:=	true;
	result:=bSlip;
end;

//******************************************************************************
//	Proccess	:	財務基本（本店）
//******************************************************************************
function TMAS310000f.Is_ZAIMU:Boolean;
var
	bSlip	:	Boolean;
begin
	bSlip	:=	false;
	if	(g_miSystemCode=MASL_PROC_SYS_ZAIMU)	or
		(g_miSystemCode=MASL_PROC_SYS_ZAIMU_K)	or
		(g_miSystemCode=MASL_PROC_SYS_ZAIMU_G)	or
		(g_miSystemCode=MASL_PROC_SYS_ZAIMU_S)	or
		(g_miSystemCode=MASL_PROC_SYS_ZAIMU_H)
	then		bSlip	:=	true;
	result:=bSlip;
end;

//******************************************************************************
//	Proccess	:	財務基本（支店）
//******************************************************************************
function TMAS310000f.Is_SITEN:Boolean;
var
	bSlip	:	Boolean;
begin
	bSlip	:=	false;
	if	(g_miSystemCode=MASL_PROC_SYS_SITEN)	or
		(g_miSystemCode=MASL_PROC_SYS_SITEN_K)	or
		(g_miSystemCode=MASL_PROC_SYS_SITEN_G)	or
		(g_miSystemCode=MASL_PROC_SYS_SITEN_S)	or
		(g_miSystemCode=MASL_PROC_SYS_SITEN_H)
	then		bSlip	:=	true;
	result:=bSlip;
end;

//******************************************************************************
//	Proccess	:	財務大将FAS（CS用）
//******************************************************************************
function TMAS310000f.Is_ZFASCS:Boolean;
var
	bSlip	:	Boolean;
begin
	bSlip	:=	false;
	if	(g_miSystemCode=MASL_PROC_SYS_ZFASCS)	or
		(g_miSystemCode=MASL_PROC_SYS_ZFASCS_K)	or
		(g_miSystemCode=MASL_PROC_SYS_ZFASCS_G)	or
		(g_miSystemCode=MASL_PROC_SYS_ZFASCS_S)	or
		(g_miSystemCode=MASL_PROC_SYS_ZFASCS_H)
	then		bSlip	:=	true;
	result:=bSlip;
end;

//******************************************************************************
//	Proccess	:	財務大将FAS（管理者用）
//******************************************************************************
function TMAS310000f.Is_ZFASMN:Boolean;
var
	bSlip	:	Boolean;
begin
	bSlip	:=	false;
	if	(g_miSystemCode=MASL_PROC_SYS_ZFASMN)	or
		(g_miSystemCode=MASL_PROC_SYS_ZFASMN_K)	or
		(g_miSystemCode=MASL_PROC_SYS_ZFASMN_G)	or
		(g_miSystemCode=MASL_PROC_SYS_ZFASMN_S)	or
		(g_miSystemCode=MASL_PROC_SYS_ZFASMN_H)
	then		bSlip	:=	true;
	result:=bSlip;
end;

(*H0036 20030825 khattori	syuusei 会社単独廃止対応*)
//**********************************************************************
//*		Proccess	:	財務排他処理
//*		Name		:	K.Hattori
//*		Date		:	2003/08/20
//**********************************************************************
procedure	TMAS310000f.fnExceptCheck;
var
	stMessageRec: TMJSMsgRec;
begin
	try
		m_cExcept := TMASExceptIF.Init(m_pRec);

		m_nReferMode	:=	1;

		//	500番の排他
		m_iRet := m_cExcept.SetExcept(500);
		if		m_iRet <> EXCEPT_RET_OK			then	m_nReferMode	:= -1	//	初期処理失敗
		else if	(m_cExcept.Status100 <> 0)		then	m_nReferMode	:= -2;	//	他で排他中
	except
				m_nReferMode	:= -1;				//	初期処理失敗
	end;

	case	m_nReferMode	of
		-1:
		begin
			Beep ();
			MjsMessageBox('排他制御処理の初期処理に失敗しました。', mjError, mjDefOk);
		end;
		-2:
		begin
			m_cExcept.ResetTerm;
			Beep ();
			TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMSG(stMessageRec,10,112);
			with stMessageRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
		end;
	end;
end;

//**********************************************************************
//*		Proccess	:	財務排他終了処理
//*		Name		:	K.Hattori
//*		Date		:	2003/08/20
//**********************************************************************
procedure	TMAS310000f.fnExceptTerm;
begin
	if	m_cExcept<>nil	then
	begin
		m_cExcept.ResetTerm;
		m_cExcept.Free;
		m_cExcept		:=	nil;
		m_iRet			:=	EXCEPT_RET_OK;
		m_nReferMode	:=	0;
	end;
end;

(*H0044 20041213 khattori	ＦｏｎｔＲｅｓｉｚｅ*)
//**********************************************************************
//*		Proccess	:	高解像度対応
//*		Name		:	K.Hattori
//*		Date		:	2004/12/13
//**********************************************************************
procedure	TMAS310000f.fnHighResolve;
var
	itemp:integer;

	function fnConvert(iBase: Integer):Integer;
	begin
		result	:=	iBase	*	GetZoomRatio(Pointer(m_pRec))	div	100;
	end;
begin
	MjsFontResize(	TMAS310000f( Self )	,Pointer(m_pRec)	);

//---<HIS-015>------------------------------------------------------------------
//---<HIS-022> 削除(標準サイズより小さくするのを認める)-------------------------
//	//	標準サイズより小さくさせない(横幅のみ)
//	PMPanelAll.Constraints.MinWidth		:= fnConvert(945);
//------------------------------------------------------------------<HIS-022>---
	//	ここで設定しないとサイズがずれる(OnCreateイベントではNG)
	SelWnd.Anchors	:= [akLeft,akTop,akRight,akBottom];
//------------------------------------------------------------------<HIS-015>---

	PMPanelSelMonth.Top		:=	PMComboBox2.Top+3;
	PMPanelSelMonth.Left	:=	PMComboBox2.Left+2;
	PMPanelHdSjFst.Top		:=	PMComboBox3.Top+3;
	PMPanelHdSjFst.Left		:=	PMComboBox3.Left+2;
	PMPanelHdSjSnd.Top		:=	PMComboBox4.Top+3;
	PMPanelHdSjSnd.Left		:=	PMComboBox4.Left+2;

	ToolBar.Left			:=	fnConvert(ToolBar.Left);
	ToolBar.Top				:=	fnConvert(ToolBar.Top);
	ToolBar.Height			:=	fnConvert(ToolBar.Height);
	ToolBar.Width			:=	fnConvert(ToolBar.Width);
	ToolBar.ButtonHeight	:=	fnConvert(ToolBar.ButtonHeight);
	ToolBar.ButtonWidth		:=	fnConvert(ToolBar.ButtonWidth);
end;

end.
