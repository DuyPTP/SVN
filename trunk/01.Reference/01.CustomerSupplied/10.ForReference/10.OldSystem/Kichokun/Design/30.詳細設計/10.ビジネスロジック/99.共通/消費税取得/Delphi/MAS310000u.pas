//************************************************************************
//*		Systeme			:	�V��v�V�X�e��
//*		Program			:	���폈���d��w��
//*		ProgramID		:	MAS310000
//*		Name			:	K.Hattori
//*		Create			:	2001/03/31
//*		Comment			:	�V�X�e�����j���[�y�ъe�W�v�\�\����ʂ��Ăяo����A
//*							�d����́A�����\���A���؋@�\���̃R���g���[�����s���B
//*
//*		History			:	XXXX/XX/XX	XX�C����XX�i�����j
//*									 XXXXXXXXXX�X�V���eXXXXXXXXXX
//************************************************************************
(*������@�r�������������@�I�I�I�@*)

(*H0001	20010409 khattori �������ɂ��r��*)
(*H0002	20010511 khattori ���Œ�^���ϐؑւ̃f�t�H���g*)
(*H0003	20010511 khattori �c�a�̃I�[�v���Ɏ��s�������̏���*)
(*H0004	20010531 khattori �b�������������̏o�����ύX*)
(*H0005	20010604 khattori �`�����{���̎��A�h�����_�E���̏C���t���O���n��Ȃ�*)
(*H0006	20010626 khattori �\������̓��͒����Ń}�E�X�Ŏw���ɖ߂������A�w�����s��*)
(*H0007	20010628 khattori �����������ɑ��̃A�v���P�[�V������\�����ꂽ��*)
(*H0008 20010703 khattori �v���r���[���ɗ���ʂɂ��ꂽ���I*)
(*H0009 20010709 khattori �b���������̓�������*)
(*H0010 20010712 khattori ��΂����Q�I�I�I*)

(*H0011 20010725 tyamaguchi �tⳃ{�^���Ή�*)
(*H0012 20010730 tyamaguchi �I���������b�Z�[�W�ύX(�o�[���p�쐬)*)
(*H0013 20010731 tyamaguchi ���͕s�敪�A�C���^�폜�敪�Ή�*)
(*H0014 20010820 tyamaguchi �R�[�h�g��Ή�*)

(*H0015 20010921 tyamaguchi ��^�d��Ή�*)
(*H0016 20010921 tyamaguchi �C���X�^���X�̉����OnDestroy�Ɉړ�*)
(*H0017 20010925 khattori	��^�d��Ή�*)
(*H0018 20010926 khattori	��^�d��r���Ή�*)
(*H0019 20010927 khattori	��^�d��e�`�r�Ή�*)
(*H0020 20010927 khattori	�����I�I�I*)
(*H0021 20010928 khattori	�X�V�m�F�̂b�����������{�^��*)
(*H0022 20011009 khattori	�q���������������ǉ�*)
(*H0023 20011024 khattori	�����l�ύX*)

(*Ver.x*)
(*H0025	20011217 khattori	�}���`����*)
(*H0024	20011217 khattori	��`����*)
(*H0026 20020111 khattori	��Q�w�����Z�b�g����B*)

(*Ver A121 M101*)
(*H0026 20020301 khattori	�b�q�A�O�O�A�O�O�O�@�L�[*)

(*H0027 20020307 khattori	�e�`�r���߂�߂�*)

(*Ver A122 M102*)
(*H0028 20020328 khattori	�G�X�P�[�v�L�[�Ńh���b�v�_�E�������*)
(*Ver A123 M102*)
(*H0029 20020328 khattori	��P�w���̂b�������������ؑ�*)

(*Ver A123 M102*)
(*H0030 20020415 khattori	���[����v�{�x�X�Ή�*)

(*Ver A123 M103*)
(*H0032 20020501 khattori	�I���������b�Z�[�W�ύX(��`�p�쐬)*)

(*H0033 20030129 khattori	�؂�o�����ŏ������c���[����I�����d�����������G���[*)

(*H0034 20030611 khattori	���U����*)
(*H0035 20030825 khattori	MJSLINK <-> ACELINK ����*)
(*H0036 20030825 khattori	syuusei ��ВP�Ɣp�~�Ή�*)

(*H0037 20030827 khattori	�`�b�d�k�h�m�j���|���l�i�r�k�h�m�j����*)

(*H0038 20030904 khattori	���U����<�P�����>*)

(*H0043 20040616 khattori	�N���b�N�I*)

(*H0044 20041213 khattori	�e�������q����������*)
(*H0045 20050210 A.Ando		�؏o�^���������̋L�q�ύX*)
(*H0046 20050302 T.Shimada  ���𑜓x�Ή��ǉ��B*)
(*H0047 20050418 khattori	�ꊇ�u��*)
(*H0048 20050516 khattori	����K�C�h�ԍ��ʒm*)

//<HIS-001> 2006/02/15 T.Yamaguchi	�T�u�v���O�����{�^�� �� Excel�捞 �Ή�
//<HIS-002> 2006/04/06 T.Yamaguchi	�I�v�V�����̗p�L���`�F�b�N�̋@�\�ǉ�
//<HIS-004> 2006/10/17 T.Yamaguchi	�T�u�v���O���� ���j���[�ǉ�(���Ѓf�[�^�捞 ��)
//<HIS-005> 2006/10/25 T.Yamaguchi	�}���`�X�N���[���ŃT�u�v���O�����{�^���̈ʒu�����������Ȃ�
//<HIS-006> 2006/12/27 T.Yamaguchi	�T�u�v���O���� ���j���[�ǉ�
//<HIS-007> 2006/12/28 T.Yamaguchi	�T�u�v���O�����Ăяo�����Ɏw������r��(��Еʏ����P��)��������
//<HIS-008> 2007/02/26 T.Yamaguchi	<HIS-005> �ǉ��C�� ���𑜓x���l������Ă��Ȃ�
//<HIS-009> 2007/02/26 T.Yamaguchi	�t�H�[���� DragKind �� dkDrag �ɕύX(Vista�Ή�)
//<HIS-011> 2007/03/06 T.Yamaguchi	�T�u�v���O���� ���j���[�ǉ�(IBEX�o�[��)(���ďȗ�)
//<HIS-014> 2007/05/08 T.Yamaguchi	�`�[ �Ή�
//<HIS-015> 2007/05/31 T.Yamaguchi	��ʃT�C�Y�� �Ή�
//<HIS-016> 2007/08/24 T.Yamaguchi	�T�u�v���O���� ���j���[�ǉ�(�L������07)
//<HIS-017> 2007/09/11 T.Yamaguchi	�I���{�^�� �N���b�N��(&X)�Ŕ����ɓ��삪�Ⴄ
//<HIS-018> 2007/09/12 T.Yamaguchi	�`�[�ŕtⳃ{�^���̈ʒu����������
//<HIS-019> 2007/10/05 T.Yamaguchi	�j�[���j�b�N(&x)�_���ύX(MjsBtnVisible ���g�p���Ȃ�) [QZF-0790]
//<HIS-020> 2007/10/05 T.Yamaguchi	�A�z�R���|�[�l���g�̏��������������@�\���Ă��Ȃ�
//<HIS-022> 2007/10/11 T.Yamaguchi	<HIS-015>�ǉ� Constraints �͎g�p���Ȃ�
//<HIS-023> 2007/11/01 T.Yamaguchi	�c���[�\�����ʂ��k�񂾂܂܂ɂȂ�P�[�X������
//<HIS-024> 2007/11/14 T.Yamaguchi	<HIS-023> �ǉ��C�� �h�����_�E�����Ɏq�v���O�������k�񂾂܂�
//<HIS-027> 2008/01/23 T.Yamaguchi	uses�� �� Contnrs �ǉ� (�d��X�V�̉��ǂɔ���)
//<HIS-028> 2008/01/30 T.Yamaguchi	<HIS-015>�ǉ� Align �̐ݒ�^�C�~���O��ύX
//<HIS-029> 2008/01/30 T.Yamaguchi	<HIS-005>�j�� <HIS-028> �̑Ή��ɔ����߂�
//<HIS-030> 2008/02/12 T.Yamaguchi	�}�E�X�N���b�N�Ō��ύX����ƌ��Œ�{�^�����؂�ւ��Ȃ�
//<HIS-032> 2008/03/19 T.Yamaguchi	�捞���� ���[����v�I�t���C�� �Ή�
//<HIS-033> 2008/04/01 T.Yamaguchi	�捞�����́A�d����͂̂�
//<HIS-034> 2008/04/01 T.Yamaguchi	<HIS-028>�ǉ� �̗p�Ȃ����̕��U���͂̍l�����s�\��
//<HIS-035> 2008/05/20 T.Yamaguchi	<HIS-028>�ǉ� �d����͂̃O���b�h�̃X�N���[���ʒu�����������Ȃ�
//<HIS-037> 2008/06/10 T.Yamaguchi	��^�m��, �`�[�m��, ���t�ɕ��������͂ł��Ă��܂�(�t�H�[���̂�)
//<HIS-039> 2008/06/30 T.Yamaguchi	�I�������ȍ~�̃G���[���z������(�{����v)(���ďȗ�)
//<HIS-042> 2008/07/14 T.Yamaguchi	<HIS-035>�ǉ� ��ʂ��؂�錻�ۂ��Ĕ�(�h�����_�E����)
//<HIS-044> 2008/08/20 T.Yamaguchi	�d��r�� �Ή�
//<HIS-045> 2008/08/20 T.Yamaguchi	���U�e�[�u���Ή�
//<HIS-047> 2008/09/11 T.Yamaguchi	MAS312100DSIParam ��`�ύX�ɔ����Ή�
//<HIS-049> 2008/10/03 T.Yamaguchi	�w���R���{�̐ؑւɕs�
//<HIS-050> 2008/10/21 T.Yamaguchi	<HIS-044>�ǉ� ���U����(�̗p�Ȃ�)�ŃG���[
//<HIS-052> 2009/01/09 T.Yamaguchi	�����̌��ς��\�ɂ���
//<HIS-056> 2009/04/01 T.Yamaguchi	�����ؑ֎��A�I���������̃R���{���؂�ւ��Ȃ�
//<HIS-059> 2009/08/19 T.Yamaguchi	�捞���� �o�b�`��v�X�Ή�
//<HIS-060> 2009/09/07 T.Yamaguchi	�E�B���h�E �R�[�h�ɂ��i�荞�݋@�\��ǉ�
//<HIS-062> 2010/01/26 T.Yamaguchi	���U�r���G���[�̃L���v�V�����Ή�
//<HIS-063> 2010/04/01 T.Yamaguchi	�捞���� ���ڂ�Enabled,Visible���ꊇ�ݒ�ł���悤�ɂ���
//<HIS-064> 2010/04/01 T.Yamaguchi	�捞���� ��v��11�A�����si �Ή�

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
	arStr:array[0..1] of String=('���Œ�','����');
	WM_ONPAINT	= WM_APP + 1;	// OnPaint ���̏����N�����b�Z�[�W�p
//---<HIS-017>------------------------------------------------------------------
	WM_TERM		= WM_APP + 2;
//------------------------------------------------------------------<HIS-017>---

type
{$I ActionInterface.inc}	//	�ȈՃ��j���[���ʃC���^�[�t�F�C�X

//{$I MASL310RootI.inc}		//	���폈�����ʊO���C���^�[�t�F�C�X
{$I VKZL310EntryIF_VK07I.inc}
//{$I MASL310EntryIFI.inc}

{$I MASKoekiSetH.inc}		//	���v���ؗp

{$I MASL310RootH.inc}		//	���폈�����ʊ֐�

(*H0036 20030825 khattori	syuusei ��ВP�Ɣp�~�Ή�*)
{$I MASExceptIFI.inc}
{$I MASExceptIFH.inc}

//---<HIS-002>------------------------------------------------------------------
{$I MASL310SysOptionH.inc}
//------------------------------------------------------------------<HIS-002>---

(*H0048 20050516 khattori	����K�C�h�ԍ��ʒm*)
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
(*H0047 20050418 khattori	�ꊇ�u��*)
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

		//	��^�d��֌W����(MASLFx.inc)
		procedure FxEnter(Sender: TObject);
		procedure FxExit(Sender: TObject);
		procedure FxChange(Sender: TObject);
		procedure FxKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
		function GetSForm: Integer;		//  �d����͌`���̎擾
		function GetTClass: Integer;	//  �o�[����^��ʂ̎擾
		procedure FxSetHead;
		procedure FxRenAssocEvent(Sender: TObject; var Key: String);
		function FxGetFxFunc:TMASL310IFunc;
		procedure MFuriganaCompositionStr(Sender: TObject; Value: String);

		protected
			(* Private �錾 *)
			g_pDrill		:	Pointer;			//	�h�����_�E���\���́i�w���p�j
			g_miSystemCode	:	Integer;

(*Ver.x*)
(*H0024	20011217 khattori	��`����*)
			g_miOptionCode	:	Integer;

			PMASLHdRd01		:	TMASL310HeadAc;
			PMASLHdRd02		:	TMASL310HeadOt;
			PMASLHdRd03		:	TMASL310HeadOt;
			PMASLHdRd04		:	TMASL310HeadOt;

			rParam			:	TWParam;
			SelWnd			:	TMAS310SelWndDB;	//	�I���E�B���h�E

			Rt				:	TMASL310Root;		//	���폈�����ʃN���X
			Sm				:	TMASL310SelMonth;	//	����������N���X
			Itm				:	TMASL310Item;		//	�w�����ڑ���N���X
			Fnc				:	TMASL310Func;		//	�t�@���N�V�����o�[����N���X
			Ind				:	TMASL310Ind;		//	�w��ComboBox����N���X
			Stb				:	TMASL310StatusBar;	//	�X�e�[�^�X�o�[����N���X
//---<HIS-001>------------------------------------------------------------------
			SubPrg			:	TSubPrgBtn;			//	�T�u�v���O�����Ăяo���{�^��
//------------------------------------------------------------------<HIS-001>---

			gfg				:	Boolean;
			gfirst			:	Boolean;

			gcrCont			:	Array [0..59] of 	TWinControl;

			gMASLParam		:	TMASL310IParam;

			m_pRec			:	^TMjsAppRecord;		//	Bpl�Ǘ��\����

			m_cMDModule		:	TMDataModulef;

(*H0013 20010731 tyamaguchi ���͕s�敪�A�C���^�폜�敪�Ή�*)
			m_FixKbn16     :	Integer;			//  �d����͕s�敪
(*H0017 20010925 khattori	��^�d��Ή�*)
			m_FixKbn20		:	Integer;			//  ��^�d��̗p�敪�i�d��j
			m_FixKbn21		:	Integer;			//  ��^�d��̗p�敪�i�o�[�j
			m_FixKbn22		:	Integer;			//  ��^�d��E�B���h�E�\���敪
			m_FixKbn23		:	Integer;			//  �E�B���h�E�����R�[�h�\���敪
			m_FixKbn29		:	Integer;			//  ��^�d��̗p�敪�i�`�[�j

(*H0034 20030611 khattori	���U����*)
			m_BunKbn01		:	Integer;			//  ���U���͍̗p�敪

			m_cFixLock		:	TMASL310IFixLock;	//	��^�d��r���p�����[�^

			m_iFxRenLength	:	Integer;

(*H0043 20040616 khattori	�N���b�N�I*)
			m_iFxSwkInp		:	Integer;

//---<HIS-044>------------------------------------------------------------------
			m_cSwkExc		:	ISwkExclusive;		//	�d��r���N���X(�C���^�[�t�F�[�X)
//------------------------------------------------------------------<HIS-044>---
			m_iExclusive	:	Integer;		(*H0001	20010426	khattori	�������ɂ��r��*)
			m_iClose		:	Integer;		(*H0001	20010409	khattori	�������ɂ��r��*)
			m_bfirst		:	Boolean;

			m_stFlexInfo	:	TFlexInfo;

(*H0010 20010712 khattori ��΂����Q�I�I�I*)
			m_bTerm			:	Boolean;

(*H0002	20010511 khattori ���Œ�^���ϐؑւ̃f�t�H���g*)
			m_iTukiDefault	:	Integer;			//	�P����́i�N�ԁj�̎��̏����l�@0:���Œ� 1:����

(*H0003	20010511 khattori �c�a�̃I�[�v���Ɏ��s�������̏���*)
			m_FCopDBMas		:	TDatabase;

			m_bCB2KeyEnter	:	Boolean;
			m_bCB2Select	:	Boolean;
			m_bCB2Index		:	Integer;
			m_bCB3KeyEnter	:	Boolean;
			m_bCB3Index		:	Integer;
			m_bCB4KeyEnter	:	Boolean;
			m_bCB4Index		:	Integer;

(*H0008 20010703 khattori �v���r���[���ɗ���ʂɂ��ꂽ���I*)
			MJSPreIf		:	TMjsPreviewIF;

(*H0015 20010921 tyamaguchi ��^�d��Ή�*)
			m_iFxExists		:	Integer;			//  0�F���݂���(�C��Ӱ��)  -1�F���݂��Ȃ�(�V�KӰ��)  -2�F�g�p�s��

(*Ver A121 M101*)
(*H0026 20020301 khattori	�b�q�A�O�O�A�O�O�O�@�L�[*)
			m_bCRKey		:	boolean;
			m_iCRKey		:	Integer;
			m_i00Key		:	Integer;
			m_i000Key		:	Integer;
//---<HIS-060>------------------------------------------------------------------
			m_iCodeAssoc	:	Integer;			//	���ނɂ��A�z�i��	(0:�i���Ȃ� 1:�i������)
//------------------------------------------------------------------<HIS-060>---

(*H0036 20030825 khattori	syuusei ��ВP�Ɣp�~�Ή�*)
			m_cExcept		:	TMASExceptIF;
			m_iRet			:	Integer;
			m_nReferMode	:	Integer;

(*H0038 20030904 khattori	���U����<�P�����>*)
			m_iPMPanelDev	:	Integer;
//---<HIS-002>------------------------------------------------------------------
			m_cSubUse		:	TMASL310SubPrgUse;	//	�T�u�v���O�����̗p����N���X
//------------------------------------------------------------------<HIS-002>---

(*H0036 20030825 khattori	syuusei ��ВP�Ɣp�~�Ή�*)
			procedure	fnExceptCheck;
			procedure	fnExceptTerm;

			procedure	InitSelMonth; virtual;

			procedure	SetIndOnSelMonth;
			procedure	SetIndOnSiji(Sender: TObject;iFunc:enIfunc);

			procedure	SetCaptionBtnFix(iEnabled:Integer=0);
			procedure	SetFuncOnSelMonth;
			procedure	SetFuncOnSiji(iFunc:enIfunc);

			procedure	gMASL310RootVf( enPar:enVfunc;	pPar1:Pointer=nil;	pPar2:Pointer=nil;	pPar3:Pointer=nil)	;			// �߂�l�Ȃ�
			function	gMASL310RootPf( enPar:enPfunc;	pPar1:Pointer=nil;	pPar2:Pointer=nil;	pPar3:Pointer=nil) : Pointer;	// �@�V�@Pointer�^
			function	gMASL310RootBf( enPar:enBfunc;	pPar1:Pointer=nil;	pPar2:Pointer=nil;	pPar3:Pointer=nil) : Boolean;	// �@�V�@Boolean�^
			function	gMASL310RootIf( enPar:enIfunc;	pPar1:Pointer=nil;	pPar2:Pointer=nil;	pPar3:Pointer=nil) : Integer;	// �@�V�@Integer�^
			function	gMASL310RootSf( enPar:enSfunc;	pPar1:Pointer=nil;	pPar2:Pointer=nil;	pPar3:Pointer=nil) : String;	// �@�V�@String�^
			function	gMASL310RootWf( enPar:enWfunc;	pPar1:Pointer=nil;	pPar2:Pointer=nil;	pPar3:Pointer=nil) : Pointer;	// �I���E�B���h�E�J�o�[�֐�

(*H0021 20010928 khattori	�X�V�m�F�̂b�����������{�^��*)
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

			//	��^�d��֌W����(MASLFx.inc)
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

			function	IsBaseMode(iPrgCode:Integer=0):Boolean;		virtual;	//	���͐���

(*H0038 20030904 khattori	���U����<�P�����>*)
			function	IsSuitouMode(iPrgCode:Integer=0):Boolean;	virtual;	//	�o�[��

			function	IsSlipMode(iPrgCode:Integer=0):Boolean;		virtual;	//	�`�[����
			function	IsBunsanMode(iPrgCode:Integer=0):Boolean;	virtual;	//	���U����

			function	Is_FASMODE		:	Boolean;	//	�e�`�r
			function	Is_JIMUSYO		:	Boolean;	//	������
			function	Is_ZAIMU		:	Boolean;	//	������{�i�{�X�j
			function	Is_SITEN		:	Boolean;	//	������{�i�x�X�j
			function	Is_ZFASCS		:	Boolean;	//	�����叫FAS�iCS�p�j
			function	Is_ZFASMN		:	Boolean;	//	�����叫FAS�i�Ǘ��җp�j

(*H0044 20041213 khattori	�e�������q����������*)
			procedure	fnHighResolve;		//	���𑜓x�Ή�

		public
			(* Public �錾 *)
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

{$I MASKoekiSetB.inc}		//	���v���ؗp

{$I MASL310RootB.inc}		//	���폈�����ʊ֐�
{$I MASL310Fx.inc}			//	��^�d��֌W����	2001/09/21 Ins

(*H0036 20030825 khattori	syuusei ��ВP�Ɣp�~�Ή�*)
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
//(*H0004	20010531 khattori �b�������������̏o�����ύX*)
//	Exparam		:	TAppParam;
//begin
//	result	:= ACTID_RET_OK;
//	pRec	:= Pointer( TAppParam( pPar^ ).pRecord );
//
//	case TAppParam( pPar^ ).iAction of
//
//		//	Form Create�v��
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
//		//	Form Create&Show�v��
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
//		//	Form Close�v��
//		ACTID_FORMCLOSESTART		:
//		begin
//			pFrm := Pointer( pRec^.m_pChildForm );
//			if	pRec^.m_iDelete<>1
//			then
//			begin
//(*H0021 20010928 khattori	�X�V�m�F�̂b�����������{�^��*)
//				result := ACTID_RET_NG;
//				if	pFrm^.EscKeyKeyDown(pFrm^,VK_F4+VK_MENU)=mrCancel	then	exit;
////				pFrm^.Close();
//				pFrm^.Free();
//				result	:= ACTID_RET_OK;
//			end;
//			Dispose( pFrm );
//		end;
//
//		//	Form CanClose�v��
//		ACTID_FORMCANCLOSESTART		:
//		begin
//			pFrm	:=	Pointer(pRec^.m_pChildForm);
//			if pFrm^.CloseQuery() = False then
//				result := ACTID_RET_NG;
//		end;
//
//		//	Show�v��
//		ACTID_SHOWSTART				:
//		begin
//			pFrm	:=	Pointer(pRec^.m_pChildForm);
//			pFrm^.Show();
//		end;
//
//		//	Hide�v��
//		ACTID_HIDESTART				:
//		begin
//			pFrm	:=	Pointer(pRec^.m_pChildForm);
//			if pFrm^.Parent <> nil then	pFrm^.Hide();
//		end;
//
//		//	Form Close�ʒm
//		ACTID_FORMCLOSEEND			:
//		begin
//			//	����ؽĂ���폜�iUnLoad�͂��Ȃ��j
//			result := ACTID_RET_OK;
//		end;
//
//(*H0004	20010531 khattori �b�������������̏o�����ύX*)
//		//	�L���v�V�����ύX�v�� ( AP -> Menu -> Desktop )
//		ACTID_ACTIVEEND:								// �q̫�т̱�è�ޒʒm
//		begin
//			pFrm := Pointer(pRec^.m_pOwnerForm);		// �q�����甭�s�����אe�������ɂȂ�
////---<HIS-056> �w���� Activate �����s����---------------------------------------
//			if Assigned(pFrm^.OnActivate) then pFrm^.OnActivate(pFrm^);
////------------------------------------------------------------------<HIS-056>---
//
//			Exparam.iAction := ACTID_FREESTART;
//			Exparam.pRecord := pointer( pFrm^.m_pRec );
//			Exparam.pActionParam := pointer( pRec );
//			TMjsAppRecord(pFrm^.m_pRec^).m_pOwnerEntry( @Exparam );				// �e���Ăяo��!!
//
//			pRec^.m_pOwnerForm:=TMjsAppRecord(pFrm^.m_pRec^).m_pOwnerForm;
//			TMjsAppRecord(pFrm^.m_pRec^).m_pOwnerEntry(pPar);				// �e���Ăяo��!!
//			pRec^.m_pOwnerForm:=TMjsAppRecord(pFrm^.m_pRec^).m_pChildForm;
//
//			//	20010209
//			if Assigned( TAppParam( pPar^ ).pActionParam ) then
//				pFrm^.Caption   := String(TAppParam( pPar^ ).pActionParam^);
//		end;
//
//(*H0048 20050516 khattori	����K�C�h�ԍ��ʒm*)
////	�`�k�U�̂ݓ���
//{$IFDEF _WANTYPE_NEW_}
//
//		ACTID_HELPINDEXSET:
//		begin
//			// �q�����甭�s�����אe�������ɂȂ�
//			pFrm			:=	Pointer(pRec^.m_pOwnerForm);
//			Exparam			:=	TAppParam( pPar^ );
//			Exparam.pRecord	:=	Pointer(pFrm^.m_pRec);
//
//			// ���j���[���Ăяo��!!
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
(*H0002	20010511 khattori ���Œ�^���ϐؑւ̃f�t�H���g*)
var
	DmqMas			:	TMQuery;
	infoRec			:	TMjsMsgRec;
//---<HIS-044><HIS-045>---------------------------------------------------------
	iTanNCode		:	Integer;
	iTanGCode		:	Integer;
	sBunTable		:	String;

//	//	�e�[�u������N���X
//	cTCtlIF			:	TMASL311Trn_TblCtrlIF;
//	cTCtlInitParam	:	TMASL311Trn_TblCtrl_InitParam;
//	cCorpDB			:	TDatabase;
//---------------------------------------------------------<HIS-044><HIS-045>---
begin

	////////////////////////////////////////////////////////////////////////////////
	//	TMjsAppRecord	bpl �Ǘ��\����
	//	�����o			�^		���e				���l
	//	m_iGroupCode	Integer	�O���[�v�R�[�h
	//	m_iSystemCode	Integer	�V�X�e���R�[�h
	//	m_iOptionCode	Integer	�I�v�V�����R�[�h
	//	m_iProgramCode	Integer	�v���O�����R�[�h
	//	m_iCorpCode		Integer	��ЃR�[�h
	//	m_iCorpSubCode	Integer	�{�x�X�R�[�h
	//	m_iCorpID		Integer	���DB ID			COPDBOpen�������Ұ��Ŏg�p�B
	////////////////////////////////////////////////////////////////////////////////

(*H0010 20010712 khattori ��΂����Q�I�I�I*)
	m_bTerm	:=	false;

	m_pRec	:= Pointer( TAppParam( pPar^ ).pRecord );
	if	m_pRec^.m_pDBModule	=nil
	then	m_cMDModule:=nil
	else	m_cMDModule:=TMDataModulef(m_pRec^.m_pDBModule^);
	g_pDrill	:= Pointer( TAppParam( pPar^ ).pActionParam );

(*Ver.x*)
(*H0025	20011217 khattori	�}���`����*)

(*H0019 20010927 khattori	��^�d��e�`�r�Ή�*)
	g_miSystemCode	:=	m_pRec^.m_iSystemCode;

(*Ver.x*)
(*H0024	20011217 khattori	��`����*)
	g_miOptionCode	:=	m_pRec^.m_iOptionCode;

//---<HIS-002>------------------------------------------------------------------
	m_cSubUse := TMASL310SubPrgUse.Create(m_pRec);
//------------------------------------------------------------------<HIS-002>---

	//////////////////////////////////////////////////////////////////
	(*H0001	20010409	khattori	�������ɂ��r��*)
	m_iClose	:=	0;
	m_iExclusive:=	0;

(*����*)

(*Ver.x*)
(*H0024	20011217 khattori	��`����*)
	if	not Is_FASMODE	then
	begin

(*H0036 20030825 khattori	syuusei ��ВP�Ɣp�~�Ή�*)
		m_cExcept		:=	nil;
		m_iRet			:=	EXCEPT_RET_OK;
		m_nReferMode	:=	0;

(*H0038 20030904 khattori	���U����<�P�����>*)
		m_iPMPanelDev	:=	0;

		//	���U�͑ΏۊO
		if	not	IsBunsanMode	then	fnExceptCheck;

		//	�����s�\�Ȃ�A��O�𓊂���
		if	m_nReferMode	< 0	then	raise Exception.Create('');

//---<HIS-044><HIS-045>---------------------------------------------------------
		//	���U�r��
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
//				//	���U���͍̗p�敪
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
//				//	���U�e�[�u���쐬
//				cTCtlInitParam.pMjsAppRecord	:=	Pointer(m_pRec);
//				cTCtlInitParam.CopDB			:=	cCorpDB;
//				cTCtlIF.Init(cTCtlInitParam );
//				cTCtlIF.CreateTable(1,iTanGCode,iTanNCode);
//				cTCtlIF.Free;
//				m_cMDModule.COPDBClose( cCorpDB );
//
//				sBunTable	:=	'BUN'+Format( '%0.8d', [iTanGCode] );
//
//				//	���U�r��
//				m_cSwkExc	:=	TMAS310000SwkExcBun.Create();
//				m_iClose	:=	m_cSwkExc.Init(m_pRec, sBunTable);
//				if	m_iClose<>0	then	m_iExclusive:=	6	//	'�r������G���[���������܂����B(Init)'
//				else
//				begin
//					m_iClose	:=	m_cSwkExc.InitExc();
//					if		m_iClose=1	then	m_iExclusive:=	12	//	'�r���p�e�[�u��������܂���B���U�d��f�[�^�`�F�b�N�����s���Ă��������B'
//					else if	m_iClose=-1	then	m_iExclusive:=	10	//	'�O�񐳏�I�����Ă��܂���B���U�d��f�[�^�`�F�b�N�����s���Ă��������B'
//					else if	m_iClose<>0	then	m_iExclusive:=	6;	//	'�r������G���[���������܂����B(InitExc)';
//				end;
//			end;
		end
		//	�d��r��
		else
		begin
			m_cSwkExc	:= TMAS310000SwkExc.Create();
			m_iClose	:= m_cSwkExc.Init(m_pRec, '');
			if	m_iClose<>0	then	m_iExclusive:=	6	//	'�r������G���[���������܂����B(Init)'
			else
			begin
				m_iClose	:=	m_cSwkExc.InitExc();
				if		m_iClose=-1	then	m_iExclusive:=	7	//	'�O�񐳏�I�����Ă��܂���B�}�X�^�Čv�Z�����s���Ă��������B'
				else if	m_iClose<>0	then	m_iExclusive:=	6;	//	'�r������G���[���������܂����B(InitExc)';
			end;
		end;
//		m_cMASSwkExc:=TMASSwkExc.Create;
//		m_iClose	:=	m_cMASSwkExc.Init(m_pRec);
//		if	m_iClose<>0	then	m_iExclusive:=	6	//	'�r������G���[���������܂����B(Init)'
//		else
//		begin
//			m_iClose	:=	m_cMASSwkExc.InitExc;
//			if		m_iClose=-1	then	m_iExclusive:=	7	//	'�O�񐳏�I�����Ă��܂���B�}�X�^�Čv�Z�����s���Ă��������B'
//			else if	m_iClose<>0	then	m_iExclusive:=	6;	//	'�r������G���[���������܂����B(InitExc)';
//		end;
//---------------------------------------------------------<HIS-044><HIS-045>---

		if	m_iExclusive<>0	then
		begin
(*H0036 20030825 khattori	syuusei ��ВP�Ɣp�~�Ή�*)
			fnExceptTerm;		//	�����r���I������

			TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMSG(inforec,20,m_iExclusive);
//---<HIS-062> @_@ �� ���U�d��f�[�^�`�F�b�N �ɕϊ�-----------------------------
			if m_iExclusive in [10,12] then
				inforec.sMsg := TMASCom(m_pRec^.m_pSystemArea^).m_MsgStd.MsgChange(inforec.sMsg, '@_@', '���U�d��f�[�^�`�F�b�N');
//------------------------------------------------------------------<HIS-062>---
			with infoRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
			raise Exception.Create('');
		end;

(*����*)
	end;

	m_bfirst:=true;
	//////////////////////////////////////////////////////////////////

(*����*)

(*Ver.x*)
(*H0024	20011217 khattori	��`����*)
	if	not Is_FASMODE	then
	begin

(*H0002	20010511 khattori ���Œ�^���ϐؑւ̃f�t�H���g*)//	from ->
	m_FCopDBMas:=m_cMDModule.COPDBOpen(0,TMASCom ( m_pRec^.m_pSystemArea^ ).m_iMasCommonNo);
	if m_FCopDBMas = nil then
	begin
(*H0036 20030825 khattori	syuusei ��ВP�Ɣp�~�Ή�*)
		fnExceptTerm;		//	�����r���I������

		TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMsg(infoRec,10000,m_cMDModule.GetStatus);
		with infoRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
//---<HIS-044><HIS-050>---------------------------------------------------------
		if Assigned(m_cSwkExc) then
		begin
			m_cSwkExc.TermExc();
			m_cSwkExc.Term();
			m_cSwkExc := nil;	//	�C���X�^���X�j��(nil �Z�b�g�ɂ������Ŕj�������)
		end;
//---------------------------------------------------------<HIS-044><HIS-050>---
		raise Exception.Create('');
	end
	else
	begin

(*Ver A121 M101*)
(*H0026 20020301 khattori	�b�q�A�O�O�A�O�O�O�@�L�[*)
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
			//	�d����� ���w��敪	0:���Œ� 1:����
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
(*H0002	20010511 khattori ���Œ�^���ϐؑւ̃f�t�H���g*)//	-> to

(*����*)
	end;

(*H0003	20010511 khattori �c�a�̃I�[�v���Ɏ��s�������̏���*)//	from ->
	//	�`�F�b�N�̂�
	m_FCopDBMas:=m_cMDModule.COPDBOpen(0,m_pRec^.m_iCorpID);
 	if m_FCopDBMas = nil then
	begin
(*H0036 20030825 khattori	syuusei ��ВP�Ɣp�~�Ή�*)
		fnExceptTerm;		//	�����r���I������

		TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMsg(infoRec,10000,m_cMDModule.GetStatus);
		with infoRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
//---<HIS-044><HIS-050>---------------------------------------------------------
		if Assigned(m_cSwkExc) then
		begin
			m_cSwkExc.TermExc();
			m_cSwkExc.Term();
			m_cSwkExc := nil;	//	�C���X�^���X�j��(nil �Z�b�g�ɂ������Ŕj�������)
		end;
//---------------------------------------------------------<HIS-044><HIS-050>---
		raise Exception.Create('');
	end
	else
	begin
		//	�e�`�r����Ă΂ꂽ���́A��^�d�󂪍̗p����Ă��Ȃ���Γ���s��

(*Ver.x*)
(*H0024	20011217 khattori	��`����*)
		if	Is_FASMODE	then
		begin
			DmqMas:=TMQuery.Create(self);
			m_cMDModule.SetDBInfoToQuery(m_FCopDBMas,DmqMas);
			with	DmqMas	do
			begin
				//	�d����� ���w��敪	0:���Œ� 1:����
				Close;
				SQL.Clear;
				SQL.Add('select * from KbnInfo where reckbn=2');
				Open;
(*H0023 20011024 khattori	�����l�ύX*)
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
						sMsg	:=	'��^�d�󂪍̗p����Ă��܂���B';
						MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
					end;
					raise Exception.Create('');
				end;
				Close;
				Free;
			end;
		end;
	end;

(*H0003	20010511 khattori �c�a�̃I�[�v���Ɏ��s�������̏���*)//	-> to

	inherited Create( Application );
end;

//******************************************************************************
//	Proccess	:	Form����
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
(*H0029 20020328 khattori	��P�w���̂b�������������ؑ�*)
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

//---<HIS-028> OnShow �ֈړ�----------------------------------------------------
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

(*H0044 20041213 khattori	�e�������q����������*)
//	// 10/25New
//	MjsFontResize(	TMAS310000f( Self )	,Pointer(m_pRec)	);

(*H0008 20010703 khattori �v���r���[���ɗ���ʂɂ��ꂽ���I*)
	MJSPreIf		:=	TMjsPreviewIF.Create();

	MTxtFx_Ren.Color	:=	rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysFocusColor;

	//	�I���E�B���h�E����N���X����
	SelWnd:=TMAS310SelWndDB.Create(PMPanelWd);
	SelWnd.Parent:=PMPanelWd;
	SelWnd.Top:=0;
	SelWnd.Left:=5;
//	SelWnd.Init(m_pRec);

//---<HIS-001>------------------------------------------------------------------
	//	�T�u�v���O�����Ăяo���{�^��
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

	Itm	:=TMASL310Item.Create;					//	�w�����ڑ���N���X����
	Stb	:=TMASL310StatusBar.Create(MStatusBar);	//	�X�e�[�^�X�o�[����N���X����
	Fnc	:=TMASL310Func.Create(MSPFunctionBar);	//	�t�@���N�V��������N���X����
	Ind	:=TMASL310Ind.Create;					//	�w�����ڑ���N���X����
	Sm	:=TMASL310SelMonth.Create;				//	����������N���X����

	//	�o�[�����́i�P����͈ȊO�j
(*H0038 20030904 khattori	���U����<�P�����>*)
	if	IsSuitouMode	then
//	if	(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_TAXITU	)	and
//		(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_MONTHR	)	and
//		(not IsSlipMode									)		then
	begin
		//	�w�b�_�[���ړ��̓p�l���쐬
		PMPanelHdSj.Width:=167;
		PMASLHdRd01	:= TMASL310HeadAc.Create
		(PMPanelHdRd,PMASLHdRd02,PMASLHdRd03,PMASLHdRd04,0,HdRd0X_WIDTH,HDRD0X_LABEL_WIDTH,
		rcCOMMONAREA(m_pRec^.m_pCommonArea^).SysFocusColor,TMASCom( m_pRec^.m_pSystemArea^ ).SystemArea.SysColorD);
		PMPanelHdRd.Visible	:=	true;
		PMPanelHdMonthFix.Enabled:=false;			//	���Œ�̂�
		EMNumEditBalance.Visible:=false;
//---<HIS-060>------------------------------------------------------------------
		PMASLHdRd01.m_pCodeAssoc:=@m_iCodeAssoc;
//------------------------------------------------------------------<HIS-060>---
	end;

	//	���폈�����ʊ֐��N���X����
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
(*H0047 20050418 khattori	�ꊇ�u��*)
	arPointer[29]:=@TMBtnLump;
	arPointer[30]:=@EMNumEditFx_No;

(*Ver A123 M102*)
(*H0029 20020328 khattori	��P�w���̂b�������������ؑ�*)
	arPointer[31]:=@PMPanelHdSjFst;

	Rt:=TMASL310Root.Create(arPointer);
	Rt.BplList		:= TList.Create();

(*H0022 20011009 khattori	�q���������������ǉ�*)
	Rt.Init;

	(*H0013 20010731 tyamaguchi ���͕s�敪�A�C���^�폜�敪�Ή�*)
(*H0017 20010925 khattori	��^�d��Ή�*)
	m_FixKbn16	:=	0;
	m_FixKbn20	:=	0;
	m_FixKbn21	:=	0;
	m_FixKbn22	:=	0;
	m_FixKbn23	:=	0;
	m_FixKbn29	:=	0;

//---<HIS-045> �폜 �r���e�[�u���쐬�O�ֈړ�------------------------------------
//(*H0034 20030611 khattori	���U����*)
//	m_BunKbn01	:=	0;			//  ���U���͍̗p�敪
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
//---<HIS-045> �폜 �r���e�[�u���쐬�O�ֈړ�------------------------------------
//(*H0034 20030611 khattori	���U����*)
//		if	(TMQuery(pQuery^).Locate('RecKbn',8,[]))=true	then
//		begin
//			m_BunKbn01	:= TMQuery(pQuery^).GetFld('GnPuKbn1').AsInteger;	//  ���U���͍̗p�敪
//		end;
//------------------------------------------------------------------<HIS-045>---
	end;


	//	�o�[�����́i�P����͈ȊO�j
(*H0038 20030904 khattori	���U����<�P�����>*)
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
		(*H0015 20010921 tyamaguchi ��^�d��Ή�*)

(*Ver.x*)
(*H0024	20011217 khattori	��`����*)
		if	Is_FASMODE	then
				PMASLHdRd01.SetBrother(Rt,EMNumEditFx_No,EMNumEditFx_No,PMComboBox3,iAnalyzeCode)
		else if PMPanelHdFx.Visible then
				PMASLHdRd01.SetBrother(Rt,PMComboBox3,EMNumEditFx_No,PMComboBox3,iAnalyzeCode)
		else	PMASLHdRd01.SetBrother(Rt,PMComboBox3,PMComboBox3,PMComboBox3,iAnalyzeCode);
	end;

(*H0037 20030827 khattori	�`�b�d�k�h�m�j���|���l�i�r�k�h�m�j����*)
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

(*H0038 20030904 khattori	���U����<�P�����>*)
	if	IsSuitouMode
	then	iSijiCode:=311000
	else	iSijiCode:=MASL_PROC_CODE_TAXITU;

	//	�����R�[�h�Z�b�g
	gMASL310RootVf(MASL_VSET_SIJI_CODE,Pointer(@(iSijiCode)));

	//	�������[�h�Z�b�g
	iWork:=Itm.ReadIniInt(iSijiCode,'Type');
	gMASL310RootVf(MASL_VSET_SIJI_TYPE,@iWork);


(*H0038 20030904 khattori	���U����<�P�����>*)
	iWork:=MASL_PROC_KIND_STANDARD;
	if	IsBunsanMode	then	iWork:=MASL_PROC_KIND_BUNSAN;
	gMASL310RootVf(MASL_VSET_PROC_KIND,@iWork);


	//	���폈�����ʊ֐�	�O���ďo���֐�
	gMASLParam.RVf:=gMASL310RootVf;		//	Void
	gMASLParam.RPf:=gMASL310RootPf;		//	Pointer
	gMASLParam.RBf:=gMASL310RootBf;		//	Boolean
	gMASLParam.RIf:=gMASL310RootIf;		//	Integer
	gMASLParam.RSf:=gMASL310RootSf;		//	String
	gMASLParam.RWf:=gMASL310RootWf;		// �I���E�B���h�E�J�o�[�֐�

	Rt.Vfnc(MASL_VINI_DRL_PARM,@gMASLParam);

	SelWnd.Init(m_pRec,gMASL310RootIf( MASL_IGET_SYORIKBN ),m_FixKbn23);

	//	��^�m�n�\��
//	if ����(��^�d��̗p)
	if	(m_pRec^.m_iOptionCode<>MASL_PROC_OPT_ZTEGATA)	then
	FxReset();
	EMNumEditFx_No.ParentColor := true;

	//	�`�[����
	if	IsSlipMode	then
	begin
		if	iSlipCount=0	then
		begin
			//	�������Z�`�[���œ`�[��񂪖������A�i�e�������r�������Łj�I��
			if	m_pRec^.m_iProgramCode=MASL_PROC_CODE_KARISSN	then
			begin
				m_iClose		:=	1;
				m_iExclusive	:=	7003;
			end;
		end;

		//��Q�w�����B��
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
//---<HIS-018> ��\���ɂ���� ����°����݂̈ʒu�������-------------------------
(*H0047 20050418 khattori	�ꊇ�u��*)
//		TMBtnLump.visible:=false;
//------------------------------------------------------------------<HIS-018>---
	end;

(*H0044 20041213 khattori	�e�������q����������*)
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

(*H0008 20010703 khattori �v���r���[���ɗ���ʂɂ��ꂽ���I*)
	pRec			:	^TMjsAppRecord;
	stParam			:	MAS320100DSIParam;
//---<HIS-047>------------------------------------------------------------------
	stParam312		:	MAS312100DSIParam;
//------------------------------------------------------------------<HIS-047>---
	cDrilNew		:	TMASL310IDrill;

//---<HIS-024><HIS-035><HIS-042> -----------------------------------------------
	//**************************************************************************
	//  Proccess  :	Align �ݒ�v��
	//  Parameter : None
	//  Return    : None
	//	Comment	  : ��������Ȃ��Ɖ��̂� Align ����������
	//**************************************************************************
	procedure fnRequestAlign();
	begin
		PMPanelAp.Align := alNone;
		PMPanelAp.Align := alClient;
	end;
//------------------------------------------------<HIS-024><HIS-035><HIS-042>---

(*H0048 20050516 khattori	����K�C�h�ԍ��ʒm*)
	//******************************************************************************
	//	Function	:	fnHelpIndexSet												<HELP>
	//******************************************************************************
	procedure fnHelpIndexSet;
	var
		AppPara	:	TAppParam;
		rcHLP	:	rcHELPINFO;
	begin
//	�`�k�U�̂ݓ���
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
(*����*)
	if	not PMPanelAll.Visible	then	exit;

//---<HIS-029> �폜-------------------------------------------------------------
////---<HIS-005> OnShow �Őݒ�i�}���`�X�N���[�����ς���Ă��܂��@Form�̓���?�j---
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
	//	�T�u�v���O�����̗p�L����ݒ�
	SetSubPrgUse();
//------------------------------------------------------------------<HIS-006>---

(*Ver.x*)
(*H0024	20011217 khattori	��`����*)
	if	not Is_FASMODE	then
	begin
		//////////////////////////////////////////////////////////////////
		(*H0001	20010409	khattori	�������ɂ��r��*)
		if	m_bfirst=true	then
		begin
			m_bfirst:=false;
			//	FormCreate �ŃG���[���������Ă���\��������
			if	m_iClose=0	then
			begin
(*H0038 20030904 khattori	���U����<�P�����>*)
				if	not	IsSuitouMode	then
				begin
					//	�h�����_�E���ȊO
(*H0002	20010511 khattori ���Œ�^���ϐؑւ̃f�t�H���g*)
					if		(g_pDrill=nil)	then
					begin
						if	m_iTukiDefault<>0	then
						begin
							sm.Kotei:=1;
							SetCaptionBtnFix();
						end;
					end
					//	�h�����_�E���@���@���͈͎w��
					else if	(TMASL310IDrill(g_pDrill^).ToCld^.Imnt[0]<>TMASL310IDrill(g_pDrill^).ToCld^.Imnt[1])	then
					begin
						sm.Kotei:=1;
						SetCaptionBtnFix();
					end;
				end;

//---<HIS-044>------------------------------------------------------------------
				m_iClose	:=	m_cSwkExc.SetExc(0);
//------------------------------------------------------------------<HIS-044>---
				if		m_iClose=-1	then	m_iExclusive:=	7001	//	'�d��ő�[�����ɒB�������ߏ����ł��܂���B'
				else if	m_iClose=-2	then	m_iExclusive:=	7002	//	'���̒[���Ŏd��P�Ə��������s���̂��ߏ����ł��܂���B';
				else if	m_iClose<>0	then	m_iExclusive:=	6;	//	'�r������G���[���������܂����B(SetExc)';
			end;

			//	FormCreate �Ŕ��������G���[�������Ŕ���
			if	m_iClose<>0	then
			begin
				PostMessage(Self.Handle, WM_ONPAINT, 0, 0);
				abort;
			end;
			//////////////////////////////////////////////////////////////////
		end;

(*����*)
	end;

//	���і��i�N�x�j�]�������m���NO�n�]��к��� �ȗ���Ж� ���ƔN�x ���̑���������
//	��v�叫�]�d����́m010001�n�]01001234 �l�i�r���Y 12/04/01 �` 13/03/31

//	MASSetCaption( m_pRec );
//---<HIS-019> MJSBtnVisible �͎g�p���Ȃ�(�K�v�ȃ{�^���������錻�ۂ��������̂�)-
//	MJSBtnVisible ( Self, true );
//------------------------------------------------------------------<HIS-019>---
//---<HIS-024><HIS-035><HIS-042>  ����------------------------------------------
	fnRequestAlign();
////---<HIS-023> Align ���������@�\���Ȃ����������--------------------------------
////	RequestAlign();
////------------------------------------------------------------------<HIS-023>---
//------------------------------------------------<HIS-024><HIS-035><HIS-042>---
//---<HIS-028>------------------------------------------------------------------
	if Parent = nil then
			Align := alNone
	else	Align := alClient;
//------------------------------------------------------------------<HIS-028>---

(*H0048 20050516 khattori	����K�C�h�ԍ��ʒm*)
	fnHelpIndexSet;

	pCurControl	:=	Rt.Pfnc(MASL_PGET_ACTV_CTRL);
	if	pCurControl=nil	then
	begin

(*����*)

(*Ver.x*)
(*H0024	20011217 khattori	��`����*)
		if	not Is_FASMODE	then
		begin
			PMComboBox3.Enabled:=false;
			PMComboBox4.Enabled:=false;
			PMComboBox2.SetFocus;

			//	�h�����_�E���H
			if	g_pDrill<>nil	then
			begin
				pMASL310IDrill:=Rt.Pfnc(MASL_PGET_DRL_PARM);
				pMASL310IDrill^.Status	:=MASL_DRILL_FRM_PARENT;
				pMASL310IDrill^.ProcCd	:=TMASL310IDrill(g_pDrill^).ProcCd;
				pMASL310IDrill^.FrPar^	:=TMASL310IDrill(g_pDrill^).ToCld^;
				pMASL310IDrill^.ToCld^	:=TMASL310IDrill(g_pDrill^).ToCld^;

				PMPanelSelMonth.Enabled		:=false;
				PMComboBox2.Enabled			:=false;
				//	�h�����_�E���@���@�P���w��
(*H0035 20030825 khattori	MJSLINK <-> ACELINK ����*)
(*H0037 20030827 khattori	�`�b�d�k�h�m�j���|���l�i�r�k�h�m�j����*)
				if	(TMASL310IDrill(g_pDrill^).ToCld^.Imnt[0]=TMASL310IDrill(g_pDrill^).ToCld^.Imnt[1])	then
//				if	(Is_ZAIMU)or(Is_SITEN)or
//					(TMASL310IDrill(g_pDrill^).ToCld^.Imnt[0]=TMASL310IDrill(g_pDrill^).ToCld^.Imnt[1])	then
				PMPanelHdMonthFix.Enabled	:=false;
				BMSpBtnChange.Enabled		:=false;
//---<HIS-063>------------------------------------------------------------------
				SubPrg.SetAllItemEnabled(False);
////---<HIS-001><HIS-004><HIS-016><HIS-059>---------------------------------------
//				SubPrg.ItemEnabled[MASL_PROC_CODE_EXCEL]			:= False;	//	Excel�捞
//				SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_YAYOI02]		:= False;	//	�퐶��v02-04
//				SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_YAYOI05]		:= False;	//	�퐶��v05-
//				SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_KANJYO]		:= False;	//	�����s
//				SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_PCA]			:= False;	//	PCA��v
//				SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_PCA09]		:= False;	//	PCA��v9 V2
//				SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_KAIKEIOU]	:= False;	//	��v��
//				SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_IBEX]		:= False;	//	JDL IBEX�o�[��
//				SubPrg.ItemEnabled[MASL_PROC_CODE_KANTAN]			:= False;	//	�~���N�̂��񂽂�I��v
//				SubPrg.ItemEnabled[MASL_PROC_CODE_HOUJIN_EXPORT]	:= False;	//	�~���N�@�l��v�@�f�[�^���o����
//				SubPrg.ItemEnabled[MASL_PROC_CODE_HOUJIN_IMPORT]	:= False;	//	�~���N�@�l��v�@�f�[�^�������
//				SubPrg.ItemEnabled[MASL_PROC_CODE_KAIKEI_EXPORT]	:= False;	//	iCompass��v/��v���Y�@�����f�[�^���M
//				SubPrg.ItemEnabled[MASL_PROC_CODE_KAIKEI_IMPORT]	:= False;	//	iCompass��v/��v���Y�@�����f�[�^��M
//				SubPrg.ItemEnabled[MASL_PROC_CODE_ZAIMU_EXPORT]		:= False;	//	�b�d��v�@�����f�[�^���M
//				SubPrg.ItemEnabled[MASL_PROC_CODE_ZAIMU_IMPORT]		:= False;	//	�b�d��v�@�����f�[�^��M
//				SubPrg.ItemEnabled[MASL_PROC_CODE_VK_EXPORT]		:= False;	//	�L������@�����f�[�^���M
//				SubPrg.ItemEnabled[MASL_PROC_CODE_VK_IMPORT]		:= False;	//	�L������@�����f�[�^��M
////---------------------------------------<HIS-001><HIS-004><HIS-016><HIS-059>---
//------------------------------------------------------------------<HIS-063>---
				BMSpBtnShowBalance.Enabled	:=false;
				PMPanelHdSd.Enabled			:=false;
				iNMonth	:=	pMASL310IDrill^.FrPar^.Imnt[0];
				Rt.Vfnc( MASL_VSET_CUR_MNTH,@iNMonth);
				PMComboBox2.Text:=Sm.CurMonth.sSelMonth;	//	Combo�ւ̓��͌�
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

	(*����*)
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
		//	�����̎q�����H
		if	PMPanelHd.ContainsControl(TWinControl(pCurControl))
		then	TWinControl(pCurControl).SetFocus
(*H0008 20010703 khattori �v���r���[���ɗ���ʂɂ��ꂽ���I*)
		else	Rt.ProcSelect;
	end;

(*H0008 20010703 khattori �v���r���[���ɗ���ʂɂ��ꂽ���I*)
	//	���[�h����Ă�����\���ɂ���
	pRec:=@(TMjsAppRecord(rt.rp_DialogRec[Ord(MASL_Dlg_Siw)]^));
	if	pRec<>nil	then
	begin
		stParam.iAction	:= 11;
		rt.BplAction( ACTID_FREESTART+1, pRec, @stParam);
	end;

	//	���[�h����Ă�����\���ɂ���
	pRec:=@(TMjsAppRecord(rt.rp_DialogRec[Ord(MASL_Dlg_Mot)]^));
	if	pRec<>nil	then
	begin
		stParam.iAction	:= 11;
		rt.BplAction( ACTID_FREESTART+1, pRec, @stParam);
	end;

	//	���[�h����Ă�����\���ɂ���
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

	//	���[�h����Ă�����\���ɂ���
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

	//	���[�h����Ă�����\���ɂ���
	pRec:=@(TMjsAppRecord(rt.rp_DialogRec[Ord(MASL_Dlg_Bal)]^));
	if	pRec<>nil	then
	begin
		cDrilNew.ProcCd	:=	3;
		rt.BplAction( ACTID_FREESTART+1, pRec, @cDrilNew);
	end;

(*����*)

(*Ver.x*)
(*H0024	20011217 khattori	��`����*)
	if	not Is_FASMODE	then
	begin
		//	���I�����X�g�\���C�x���g��post
		if	m_iExclusive=0	then	Timer1.Enabled:=true;
(*����*)
	end;

	(*H0013 20030609 khattori �����̗p�敪���P�̎��A�v�����X�W�Ń`�F�b�N����Ȃ�*)
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
	(*H0013 20030609 khattori �����̗p�敪���P�̎��A�v�����X�W�Ń`�F�b�N����Ȃ�*)
//	(*H0013 20010731 tyamaguchi ���͕s�敪�A�C���^�폜�敪�Ή�*)
//	if  m_FixKbn16 = 1 then
//    begin
//		TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMsg(infoRec,20,9);
//		with infoRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
//    	Close;
//        Exit;
//    end;

//	//	�o�[�����́i�P����͈ȊO�j
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
(*�؂�o������΂��Ă�Ȃ񂩉����Ȃ�ȁ`*)
		for idx := 1 to Rt.BplList.Count do
		begin
			cDrill	:=	TMASL310IDrill(Rt.GetDrillParam(@idx)^);
			if	cDrill.Mine^.bCall	then
			begin
				if	cDrill.Mine^.TCall=mrCancel	then	abort;
			end;
		end;

(*H0005	20010604 khattori �`�����{���̎��A�h�����_�E���̏C���t���O���n��Ȃ�*)
	if		(g_pDrill<>nil)
	then
	begin
		TMASL310IDrill(g_pDrill^).Status	:=	MASL_DRILL_FRM_CHILD;
		TMASL310IDrill(g_pDrill^).FrCld^	:=	TMASL310IDrill(Rt.Pfnc(MASL_PGET_DRL_PARM)^).ToPar^;
	end;

	for idx:=Ord(Low(enDialogID)) to Ord(High(enDialogID)) do
	begin
		//	�_�C�A���O���Ă񂾂��H
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
	try Rt			.Free; except end;	//	���폈�����ʊ֐��N���X�j��
	try PMASLHdRd01	.Free; except end;	//	�w�b�_�[���ړ��̓p�l���j��
	try Sm			.Free; except end;	//	����������N���X�j��
	try Ind			.Free; except end;	//	�w���N���X�j��
	try Fnc			.Free; except end;	//	�t�@���N�V��������N���X�j��
	try Stb			.Free; except end;	//	�X�e�[�^�X�o�[����N���X�j��
	try Itm			.Free; except end;	//	�w�����ڑ���N���X����
	try SelWnd		.Free; except end;	//	�I���E�B���h�E�N���X�j��

(*����*)

//---<HIS-044><HIS-050>---------------------------------------------------------
	if	not Is_FASMODE	then
	begin
		if Assigned(m_cSwkExc) then
		begin
			try m_cSwkExc.TermExc();except end;
			try m_cSwkExc.Term();	except end;
			try m_cSwkExc := nil;	except end;	//	�C���X�^���X�j��(nil �Z�b�g�ɂ������Ŕj�������)
		end;
		m_iClose	:=	0;
	end;
//---------------------------------------------------------<HIS-044><HIS-050>---

	(*H0003	20010511 khattori �c�a�̃I�[�v���Ɏ��s�������̏���*)
	if m_FCopDBMas <> nil then	m_cMDModule.COPDBClose(m_FCopDBMas);

(*H0010 20010712 khattori ��΂����Q�I�I�I*)
	m_bTerm	:=	true;

	Action				:=	caFree;
	m_pRec^.m_iDelete	:=	1;
	AppPrm.iAction		:=	ACTID_FORMCLOSEEND;
	AppPrm.pRecord		:=	Pointer(m_pRec);
	AppPrm.pActionParam	:=	nil;
	TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);
end;

(*H0016 20010921 tyamaguchi �C���X�^���X�̉����OnDestroy�Ɉړ�*)
//******************************************************************************
//	Proccess	:	FormDestroy (OnDestroy)
//******************************************************************************
procedure TMAS310000f.FormDestroy(Sender: TObject);
begin
(*H0020 20010927 khattori	�����I�I�I*)
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
(*H0010 20010712 khattori ��΂����Q�I�I�I*)
	if	not	m_bTerm	then
	begin
		for idx := Rt.BplList.Count - 1 downto 0 do
		begin
			pRec := Rt.BplList.Items[idx];
			if	pRec<>nil	then	Rt.BplAction( ACTID_HIDESTART, pRec );
		end;

	(*H0008 20010703 khattori �v���r���[���ɗ���ʂɂ��ꂽ���I*)
		//	���[�h����Ă������\���ɂ���
		pRec:=@(TMjsAppRecord(rt.rp_DialogRec[Ord(MASL_Dlg_Siw)]^));
		if	pRec<>nil	then
		begin
			stParam.iAction	:= 10;
			rt.BplAction( ACTID_FREESTART+1, pRec, @stParam);
		end;

		//	���[�h����Ă������\���ɂ���
		pRec:=@(TMjsAppRecord(rt.rp_DialogRec[Ord(MASL_Dlg_Mot)]^));
		if	pRec<>nil	then
		begin
			stParam.iAction	:= 10;
			rt.BplAction( ACTID_FREESTART+1, pRec, @stParam);
		end;

		//	���[�h����Ă������\���ɂ���
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

		//	���[�h����Ă������\���ɂ���
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

		//	���[�h����Ă������\���ɂ���
		pRec:=@(TMjsAppRecord(rt.rp_DialogRec[Ord(MASL_Dlg_Bal)]^));
		if	pRec<>nil	then
		begin
			cDrilNew.ProcCd	:=	2;
			rt.BplAction( ACTID_FREESTART+1, pRec, @cDrilNew);
		end;
	end;

//---<HIS-019> MJSBtnVisible �͎g�p���Ȃ�(�K�v�ȃ{�^���������錻�ۂ��������̂�)-
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
(*H0036 20030825 khattori	syuusei ��ВP�Ɣp�~�Ή�*)
	fnExceptTerm;		//	�����r���I������

	for idx:=Ord(Low(enDialogID)) to Ord(High(enDialogID)) do
	begin
		//	�_�C�A���O���Ă񂾂��H
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
(*H0026 20020301 khattori	�b�q�A�O�O�A�O�O�O�@�L�[*)
	iAscii	:	Integer;
begin
	sName:='';
	sMama:='';
	sGrma:='';

(*H0033 20030129 khattori	�؂�o�����ŏ������c���[����I�����d�����������G���[*)
	if		Screen.ActiveControl<>nil				then	sName:=Screen.ActiveControl.Name
	else if	Screen.ActiveControl.Parent<>nil		then	sMama:=Screen.ActiveControl.Parent.Name
	else if	Screen.ActiveControl.Parent.Parent<>nil	then	sGrma:=Screen.ActiveControl.Parent.Parent.Name;
//	if	Screen.ActiveControl<>nil				then	sName:=Screen.ActiveControl.Name;
//	if	Screen.ActiveControl.Parent<>nil		then	sMama:=Screen.ActiveControl.Parent.Name;
//	if	Screen.ActiveControl.Parent.Parent<>nil	then	sGrma:=Screen.ActiveControl.Parent.Parent.Name;

	Shift:=MJSKeyDataToShiftState(0);

(*Ver A121 M101*)
(*H0026 20020301 khattori	�b�q�L�[�@�|��*)
	m_bCRKey:=false;

	if	(Shift<>[ssShift])	then
	begin
		//	�A�z�H
		if	Screen.ActiveControl is TMAssocEdit	then
		begin
			//	���z�L�[�R�[�h	�[��	ASCII�R�[�h�@�ɕϊ�
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
(*H0026 20020301 khattori	�|���@�b�q�A�O�O�A�O�O�O�@�L�[*)

	//	�s�`�a���R���{�{�b�N�X�{�e�S
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
//	Proccess	:	PMPanelHd����
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
//	SubPrg.ItemEnabled[MASL_PROC_CODE_EXCEL]			:= False;	//	Excel�捞
//	SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_YAYOI02]		:= False;	//	�퐶��v02-04
//	SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_YAYOI05]		:= False;	//	�퐶��v05-
//	SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_KANJYO]		:= False;	//	�����s
//	SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_PCA]			:= False;	//	PCA��v
//	SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_PCA09]		:= False;	//	PCA��v9 V2
//	SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_KAIKEIOU]	:= False;	//	��v��
//	SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_IBEX]		:= False;	//	JDL IBEX�o�[��
//	SubPrg.ItemEnabled[MASL_PROC_CODE_KANTAN]			:= False;	//	�~���N�̂��񂽂�I��v
//	SubPrg.ItemEnabled[MASL_PROC_CODE_HOUJIN_EXPORT]	:= False;	//	�~���N�@�l��v�@�f�[�^���o����
//	SubPrg.ItemEnabled[MASL_PROC_CODE_HOUJIN_IMPORT]	:= False;	//	�~���N�@�l��v�@�f�[�^�������
//	SubPrg.ItemEnabled[MASL_PROC_CODE_KAIKEI_EXPORT]	:= False;	//	iCompass��v/��v���Y�@�����f�[�^���M
//	SubPrg.ItemEnabled[MASL_PROC_CODE_KAIKEI_IMPORT]	:= False;	//	iCompass��v/��v���Y�@�����f�[�^��M
//	SubPrg.ItemEnabled[MASL_PROC_CODE_ZAIMU_EXPORT]		:= False;	//	�b�d��v�@�����f�[�^���M
//	SubPrg.ItemEnabled[MASL_PROC_CODE_ZAIMU_IMPORT]		:= False;	//	�b�d��v�@�����f�[�^��M
//	SubPrg.ItemEnabled[MASL_PROC_CODE_VK_EXPORT]		:= False;	//	�L������@�����f�[�^���M
//	SubPrg.ItemEnabled[MASL_PROC_CODE_VK_IMPORT]		:= False;	//	�L������@�����f�[�^��M
////---------------------------------------<HIS-001><HIS-004><HIS-016><HIS-059>---
//------------------------------------------------------------------<HIS-063>---
	BMSpBtnShowBalance.Enabled:=false;			//	Balance�@�\���s��
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
(*H0021 20010928 khattori	�X�V�m�F�̂b�����������{�^��*)
	if	Rt.DoAction(rFunc,MASL_DRILL_BASE)	then	//	�h�����_�E���p�����[�^�[�Z�b�g
	begin
		if PMPanelAp.Enabled=true then PMPanelAp.Enabled:=false;
//---<HIS-063>------------------------------------------------------------------
		SubPrg.SetAllItemEnabled(True);
////---<HIS-001><HIS-004><HIS-016><HIS-059>---------------------------------------
//		SubPrg.ItemEnabled[MASL_PROC_CODE_EXCEL]			:= True;	//	Excel�捞
//		SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_YAYOI02]		:= True;	//	�퐶��v02-04
//		SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_YAYOI05]		:= True;	//	�퐶��v05-
//		SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_KANJYO]		:= True;	//	�����s
//		SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_PCA]			:= True;	//	PCA��v
//		SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_PCA09]		:= True;	//	PCA��v9 V2
//		SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_KAIKEIOU]	:= True;	//	��v��
//		SubPrg.ItemEnabled[MASL_PROC_CODE_DATA_IBEX]		:= True;	//	JDL IBEX�o�[��
//		SubPrg.ItemEnabled[MASL_PROC_CODE_KANTAN]			:= True;	//	�~���N�̂��񂽂�I��v
//		SubPrg.ItemEnabled[MASL_PROC_CODE_HOUJIN_EXPORT]	:= True;	//	�~���N�@�l��v�@�f�[�^���o����
//		SubPrg.ItemEnabled[MASL_PROC_CODE_HOUJIN_IMPORT]	:= True;	//	�~���N�@�l��v�@�f�[�^�������
//		SubPrg.ItemEnabled[MASL_PROC_CODE_KAIKEI_EXPORT]	:= True;	//	iCompass��v/��v���Y�@�����f�[�^���M
//		SubPrg.ItemEnabled[MASL_PROC_CODE_KAIKEI_IMPORT]	:= True;	//	iCompass��v/��v���Y�@�����f�[�^��M
//		SubPrg.ItemEnabled[MASL_PROC_CODE_ZAIMU_EXPORT]		:= True;	//	�b�d��v�@�����f�[�^���M
//		SubPrg.ItemEnabled[MASL_PROC_CODE_ZAIMU_IMPORT]		:= True;	//	�b�d��v�@�����f�[�^��M
//		SubPrg.ItemEnabled[MASL_PROC_CODE_VK_EXPORT]		:= True;	//	�L������@�����f�[�^���M
//		SubPrg.ItemEnabled[MASL_PROC_CODE_VK_IMPORT]		:= True;	//	�L������@�����f�[�^��M
////---------------------------------------<HIS-001><HIS-004><HIS-016><HIS-059>---
//------------------------------------------------------------------<HIS-063>---
		BMSpBtnShowBalance.Enabled:=true;	//	Balance�@�\���\

		//	�d��P�ƊJ��
//---<HIS-044><HIS-050>---------------------------------------------------------
		if Assigned(m_cSwkExc) then m_cSwkExc.SetExc(-2);
//---------------------------------------------------------<HIS-044><HIS-050>---
	end;
end;

//******************************************************************************
//	Proccess	:	PMPanelHdRd����
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//******************************************************************************
procedure TMAS310000f.PMPanelHdRdExit(Sender: TObject);
begin
	Rt.Wfnc(MASL_WND_Clear);
end;

//******************************************************************************
//	Proccess	:	PMComboBox2����
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//******************************************************************************

//******************************************************************************
//	procedure	:	PMComboBox2Enter
//******************************************************************************
procedure TMAS310000f.PMComboBox2Enter(Sender: TObject);
begin
	//	�A�N�e�B���R���g���[���Ɏ������Z�b�g
	Rt.Vfnc(MASL_VSET_ACTV_CTRL,@Sender);
	InitSelMonth;
	SetIndOnSelMonth;
	SetCaptionBtnFix;
	SetFuncOnSelMonth;

(*H0018 20010926 khattori	��^�d��r���Ή�*)
	m_cFixLock.iAction	:=-1;
	Rt.GetFixLock(@m_cFixLock);

	//	��^�m�n�\��	(*H0015 20010921 tyamaguchi ��^�d��Ή�*)
	//	if ����(��^�d��̗p)
	if	(m_pRec^.m_iOptionCode<>MASL_PROC_OPT_ZTEGATA)	then
	FxReset();
	EMNumEditFx_No.ParentColor := true;

    DisableComponent();

	//	���̕ӂ��ȁH
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
//---<HIS-049> KeyDown �Ńt�H�[�J�X�ړ������ KeyUp ���������Ȃ�----------------
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
(*H0009 20010709 khattori �b���������̓�������*)
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
			//	���Œ�^���ϐؑփ{�^��
(*H0038 20030904 khattori	���U����<�P�����>*)
			if	(not	IsSuitouMode)				and
//			if	((m_pRec^.m_iProgramCode=MASL_PROC_CODE_TAXITU)	or	IsSlipMode)	and
//			if	(m_pRec^.m_iProgramCode<>311000)	and
				(Sm.CurMonth.iInner<>0)				and
				(Sm.CurMonth.iInner<40)				and
				(Key=VK_F1)							then	BMSpBtnMonthFixClick(BMSpBtnMonthFix);
			//	�t�@���N�V�����g�O��
			if (Key=VK_F9) then	Rt.Vfnc(MASL_VSET_FNC_NEXT);
		end;

////////////////////////
//	�e�X�g�p�I�I�I�I�I
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

		//	�d���������@�����@�s����
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
//	�������̑I�����s��
//		1����10���A2����21�����A�擪�������������������݂���ׁA'��'�{'.'�̂悤�ɓ��͕������쐬���A
//		���ʉ\�ɂ���i�@'1.' <-> '10'�@'2.' <-> '20'�@���j
//		���N�x��P�l�����������̓��͂��\�ɂ���ׁA'.'�{'��'�̂悤�ɓ��͕������쐬���A���ʉ\�ɂ���
//		�i�@'4' <-> '.4'�@'20' <-> '.20'�@���j
////////////////////////////////////////////////////////////////////////////////////////////////////

//	SelText �v���p�e�B�́C�ҏW�̈���̑I�����ꂽ�����Q��\���܂��B

	idx2:=-1;idx3:=-1;idx4:=-1;
	sText:=PMComboBox2.Text;
	sSelText:=PMComboBox2.SelText;
	sCompText:=sText;
	Rt.RCnm(sCompText);		//	�J���}�폜

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
	(*H0001	20010409	khattori	�������ɂ��r��*)
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
//	Proccess	:	PMComboBox3����
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//******************************************************************************

//******************************************************************************
//	procedure	:	PMComboBox3Enter
//******************************************************************************
procedure TMAS310000f.PMComboBox3Enter(Sender: TObject);

(*H0006	20010626 khattori �\������̓��͒����Ń}�E�X�Ŏw���ɖ߂������A�w�����s��*)
var
	iNumb:Integer;
	rFunc:TMASL310IFunc;
	pFunc:Pointer;
begin
	if	m_iExclusive=0	then
	begin
		//	�A�N�e�B���R���g���[���Ɏ������Z�b�g
		Rt.Vfnc(MASL_VSET_ACTV_CTRL,@Sender);
		PMComboBox3.Items.Clear;
		SetIndOnSiji(PMComboBox3,MASL_IGET_SIJI_CODE);
		SetFuncOnSiji(MASL_IGET_SIJI_CODE);

(*H0018 20010926 khattori	��^�d��r���Ή�*)
		m_cFixLock.iAction	:=-1;
		Rt.GetFixLock(@m_cFixLock);

	    DisableComponent();

		//	��^�m�n�\��	(*H0015 20010921 tyamaguchi ��^�d��Ή�*)
		//	if ����(��^�d��̗p)
		if	(m_pRec^.m_iOptionCode<>MASL_PROC_OPT_ZTEGATA)	then
		FxReset();
		EMNumEditFx_No.ParentColor := true;

		//	���̕ӂ��ȁH
		if	(PMComboBox3.ItemIndex<0)	and	(m_bCB3Index>=0)	then	PMComboBox3.ItemIndex:=	m_bCB3Index;
		if PMComboBox3.ItemIndex <0	then	PMComboBox3.ItemIndex:=0;

(*H0006	20010626 khattori �\������̓��͒����Ń}�E�X�Ŏw���ɖ߂������A�w�����s��*)
			iNumb:=PMComboBox3.ItemIndex+1;
			pFunc:=Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb);
			rFunc:=TMASL310IFunc(pFunc^);	//	�t�@���N�V�������
			PMPanelHdSjFst.Caption:=Format('  %2d ',[iNumb])+rFunc.sCaption;
//			PMComboBox3.Text:=IntToStr(iNumb)+',';
		

		PMComboBox3.SelectAll;

(*H0007	20010628 khattori �����������ɑ��̃A�v���P�[�V������\�����ꂽ��*)
		//	�P��ڂłȂ��H
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
//---<HIS-049> KeyDown �Ńt�H�[�J�X�ړ������ KeyUp ���������Ȃ�----------------
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
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=1	then	begin	//	ME,2000 �ŗ�����
	if	not m_bCB3KeyEnter
	then
	begin
		if (PMComboBox3.ItemIndex >=0) and (Rt.RChk(PMComboBox3.Text)<>2)
		then
		begin
			iNumb:=PMComboBox3.ItemIndex+1;
			pFunc:=Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb);
			rFunc:=TMASL310IFunc(pFunc^);	//	�t�@���N�V�������
			PMPanelHdSjFst.Caption:=Format('  %2d ',[iNumb])+rFunc.sCaption;
			PMComboBox3.Text:=IntToStr(iNumb)+',';
			PMComboBox3.SelectAll;
			PMComboBox3Select(rFunc);
		end;
	end;
	end;	//	ME,2000 �ŗ�����
end;

//******************************************************************************
//	procedure	:	PMComboBox3Change
//		�I�����ڂ�\������
//			�W���I�ȓ���ł͂Q���̂m�n�����Ȃ��ׁA���͂ƕ\����ʃR���g���[���ł����Ȃ��B
//			���͂��ꂽ�m�n�̍��ڂ�\���p�R���g���[���ɃZ�b�g����B
//******************************************************************************
procedure TMAS310000f.PMComboBox3Change(Sender: TObject);
var
	iNumb:Integer;
	rFunc:TMASL310IFunc;
begin
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=1	then	begin	//	ME,2000 �ŗ�����
	if	gfg	then
	else
	begin
		if	m_bCB3KeyEnter
		then
		begin
			//	���ڂ��I������Ă��邩�H
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
	end;	//	ME,2000 �ŗ�����
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
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=1	then	begin	//	ME,2000 �ŗ�����

(*H0009 20010709 khattori �b���������̓�������*)
	m_bCB3KeyEnter	:=	true;

	if (Key=VK_ESCAPE) or (Key=VK_END)
	then	EscKeyKeyDown(Sender,Key)
	else
	begin
//		m_bCB3KeyEnter	:=	true;

		sText:=PMComboBox3.Text;
		(* �t�@���N�V�����L�[ *)
		if (VK_F1<=Key)and (Key<=VK_F8)
		then
		begin
			iNumb:=Key-VK_F1+1;
			pFunc:=Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb);
			if	(pFunc=nil) or (Rt.RChk(PMComboBox3.Items[iNumb-1])=2)	//	���������蓖�Ă��Ă��Ȃ��t�@���N�V����
			then	beep
			else
			begin
				rFunc:=TMASL310IFunc(pFunc^);	//	�t�@���N�V�������
				PMPanelHdSjFst.Caption:=Format('  %2d ',[iNumb])+rFunc.sCaption;
				PMComboBox3.ItemIndex:=iNumb-1;
				PMComboBox3.Text:=IntToStr(iNumb)+',';
				sText:=PMComboBox3.Text;
				PMComboBox3.SelectAll;
				PMComboBox3Select(rFunc);
			end;
		end;

		(* �g�O�� *)
		if (Key=VK_F9) then	Rt.Vfnc(MASL_VSET_FNC_NEXT);

		(* �m�� *)
		if (Key=VK_RETURN) or (Key=VK_TAB) or (Key=VK_LEFT)
		then
		begin
			if (Shift=[ssShift]) or (Key=VK_LEFT)	//	���
			then
			begin
				if	PMComboBox2.CanFocus			then	PMComboBox2.SetFocus;
				//	�o�[�����́i�P����͈ȊO�j
(*H0038 20030904 khattori	���U����<�P�����>*)
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
					rFunc:=TMASL310IFunc(pFunc^);	//	�t�@���N�V�������

(*H0009 20010709 khattori �b���������̓�������*)
					PMPanelHdSjFst.Caption:=Format('  %2d ',[iNumb])+rFunc.sCaption;

					PMComboBox3Select(rFunc);
				end;
			end;
		end;
		PMComboBox3.Text:=sText;
	end;
	end;	//	ME,2000 �ŗ�����
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
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=1	then	begin	//	ME,2000 �ŗ�����
	m_bCB3KeyEnter	:=	false;

////////////////////////////////////////////////////////////////////////////////////////////////////
//	�I�����ڂ�\������
//		�W���I�ȓ���ł͂Q���̂m�n�����Ȃ��ׁA���͂ƕ\����ʃR���g���[���ł����Ȃ��B
//		���͂��ꂽ�m�n�̍��ڂ�\���p�R���g���[���ɃZ�b�g����B
////////////////////////////////////////////////////////////////////////////////////////////////////
	if	TMComboBox(Sender).Name='PMComboBox3'
	then
	begin
		iChek:=0;
		sText:=PMComboBox3.Text;
		if sText<>''
		then
		begin
			Rt.RCnm(sText);		//	�J���}�폜
			if	(Rt.RChk(sText)=1) and (Length(sText)>0)		//	�s����������
			then
			begin
				iNumb:=StrToInt(sText);
				if	(iNumb<=PMComboBox3.Items.Count) and (iNumb>=1)	//	�͈͓�
				then
				begin
					PMComboBox3.Text:=sText+',';
					if	iNumb*10>PMComboBox3.Items.Count	then	PMComboBox3.SelectAll
					else											PMComboBox3.SelStart:=1;
					PMComboBox3.ItemIndex:=iNumb-1;
					rFunc:=TMASL310IFunc(Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb)^);
					if	Rt.RChk(PMComboBox3.Items[iNumb-1])=2	//	�I��s��
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
					rFunc:=TMASL310IFunc(Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb)^);	//	�t�@���N�V�������
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
	end;	//	ME,2000 �ŗ�����
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
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=1	then	begin	//	ME,2000 �ŗ�����
	bChange:=false;
	gMASL310RootVf(MASL_VSET_FST_NUMB,@rFunc.iNumb);	//	��P�w���̑I���w���m��
	gMASL310RootVf(MASL_VSET_FST_CODE,@rFunc.iOpCode);	//	��P�w���̑I����������

	if	m_bCB3Index<>PMComboBox3.ItemIndex	then	bChange:=true;
	m_bCB3Index		:=	PMComboBox3.ItemIndex;

	//	�y���쐬��
	if		rFunc.sProg='z'
	then	ShowMessage(IntToStr(rFunc.iOpCode)+' '+rFunc.sCaption+' Now Making!!!')
	//	''���Y������
	else if rFunc.sProg=''
	then	ShowMessage(IntToStr(rFunc.iOpCode)+' '+rFunc.sCaption+' Not Found!!!')
	//	�w�����w���L��
	else if rFunc.sProg='x'
	then
	begin
		if	bChange	then
		begin
(*H0009 20010709 khattori �b���������̓�������*)
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
	//	�x���g�p�s��
	else if rFunc.sProg<>'y'
	then
	begin
		PMPanelHdSjSnd.Caption:='';
		PMComboBox4.Enabled:=false;
		PMComboBox4.Items.Clear;

		gfg:=true;
		PMComboBox3.DroppedDown:=false;
		//	�ȖڕύX
		if rFunc.sProg='ac-change'
		then
		begin
			Rt.Vfnc(MASL_VSET_DEF_FUNC,nil);
			PMPanelHdRd.Enabled:=true;
			cCompo:=FindNextControl(PMComboBox3, true, true,false);
			if	cCompo.CanFocus	then	cCompo.SetFocus;
		end
		//	��^�o�^�@��^�m�n��
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
		//	��^�L��œ���
        else if	( PMPanelHdFx.Visible ) and ( rFunc.iMode =MASL_PROC_MODE_NYUURYOKU )	then
//		else if	( PMPanelHdFx.Visible ) and ( rFunc.iOpCode=310101 )	then
		begin
			Rt.Vfnc(MASL_VSET_DEF_FUNC,@rFunc);
			new( pQuery );
			Rt.GetFxHead( pQuery );				//  ��^�d��w�b�_�擾

			//	��^�d��o�^�ς݁@��^�m�n��
			if	pQuery^.RecordCount > 0 then
			begin
				if	(m_pRec^.m_iOptionCode<>MASL_PROC_OPT_ZTEGATA)	then
				FxDsp(rFunc.iOpCode);
				PMPanelHdFx.Enabled := True;
				EMNumEditFx_No.Color := clWindow;
				MTxtFx_Name.ParentColor := true;
				EMNumEditFx_No.SetFocus;
			end
			//	��^�d��o�^�����@�ʏ�̓��͂�
			else
			begin
				Key := VK_RETURN;	Shift := [];
				FxKeyDown( EMNumEditFx_No, Key, Shift );
				PMPanelHdFx.Enabled := False;
				EMNumEditFx_No.ParentColor := true;
				MTxtFx_Name.ParentColor := true;
			end;
		end
		//	�o�[���Ŏd����͊֘A�œ��Y���m��
(*H0038 20030904 khattori	���U����<�P�����>*)
		else if	IsSuitouMode	and
//		else if (m_pRec^.m_iProgramCode<>MASL_PROC_CODE_TAXITU	)	and
//				(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_MONTHR	)	and
//				(not IsSlipMode									)	and
				(rFunc.iBrotherCode=310101) and (PMASLHdRd01.m_bEnable=false)
		then
		begin
			Rt.Vfnc(MASL_VSET_DEF_FUNC,@rFunc);
			//	���Y��
			PMPanelHdRd.Enabled:=true;
			cCompo:=FindNextControl(PMComboBox3, true, true,false);
			if	cCompo.CanFocus	then	cCompo.SetFocus;
		end
		//	���̑��i��^�A���Y�ɗ��܂Ȃ�����j
		else
		begin
			Rt.Vfnc(MASL_VSET_DEF_FUNC,@rFunc);
			//	�o�[���Ŏd����͊֘A�@�h�����_�E���p�����[�^�Z�b�g
(*H0038 20030904 khattori	���U����<�P�����>*)
			if	IsSuitouMode	and
//			if	(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_TAXITU	)	and
//				(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_MONTHR	)	and
//				(not IsSlipMode									)	and
				(rFunc.iBrotherCode=310101)	then	PMASLHdRd01.SetDrillPar;

			iClose	:=	0;
//---<HIS-044>------------------------------------------------------------------
			//	�ꊇ�폜
			if	rFunc.iOpCode=310301	then
				iClose	:=	m_cSwkExc.SetExc(-1);
//------------------------------------------------------------------<HIS-044>---

			if	iClose=0	then	Rt.DoAction( rFunc)
			else
			begin
				if		iClose=-1
				then	iClose:=	8	//	'���̒[���Ŏd��f�[�^�X�V���������s����Ă��邽�ߏ����ł��܂���B'
				else	iClose:=	6;	//	'�r������G���[���������܂����B(SetExc)';
				TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMSG(inforec,20,iClose);
				with infoRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
			end;
		end;
		gfg:=false;
	end;
	end;	//	ME,2000 �ŗ�����
end;

//******************************************************************************
//	Proccess	:	PMComboBox4����
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//******************************************************************************

//******************************************************************************
//	procedure	:	PMComboBox4Enter
//******************************************************************************
procedure TMAS310000f.PMComboBox4Enter(Sender: TObject);
begin
	//	�A�N�e�B���R���g���[���Ɏ������Z�b�g
	Rt.Vfnc(MASL_VSET_ACTV_CTRL,@Sender);
	PMComboBox4.Items.Clear;
	SetIndOnSiji(PMComboBox4,MASL_IGET_FST_CODE);
	SetFuncOnSiji(MASL_IGET_FST_CODE);

(*H0018 20010926 khattori	��^�d��r���Ή�*)
	m_cFixLock.iAction	:=-1;
	Rt.GetFixLock(@m_cFixLock);

    DisableComponent();

	//	�`�[����
	if	IsSlipMode	and	(Itm.m_iDefaultFunc>-1)	then
	begin
		PMComboBox4.ItemIndex	:=	Itm.m_iDefaultFunc-1;
		Itm.m_iDefaultFunc		:=	-1;
	end
	else
	begin

	//	���̕ӂ��ȁH
(*H0009 20010709 khattori �b���������̓�������*)
	if	m_bCB4Index>=0	then	PMComboBox4.ItemIndex:=	m_bCB4Index;
	if	m_bCB4Index<0	then	PMComboBox4.ItemIndex:=0;
//	if PMComboBox4.ItemIndex <0	then	PMComboBox4.ItemIndex:=0;

	end;

	PMComboBox4.SelectAll;

(*H0007	20010628 khattori �����������ɑ��̃A�v���P�[�V������\�����ꂽ��*)
	//	�P��ڂłȂ��H
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
//---<HIS-049> KeyDown �Ńt�H�[�J�X�ړ������ KeyUp ���������Ȃ�----------------
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
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=2	then	begin	//	ME,2000 �ŗ�����
	if	not m_bCB4KeyEnter
	then
	begin
		if (PMComboBox4.ItemIndex >=0) and (Rt.RChk(PMComboBox4.Text)<>2)
		then
		begin
			iNumb:=PMComboBox4.ItemIndex+1;
			pFunc:=Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb);
			rFunc:=TMASL310IFunc(pFunc^);	//	�t�@���N�V�������
			PMComboBox4Select(rFunc);
		end;
	end;
	end;	//	ME,2000 �ŗ�����
end;

//******************************************************************************
//	procedure	:	PMComboBox4Change
//		�I�����ڂ�\������
//			�W���I�ȓ���ł͂Q���̂m�n�����Ȃ��ׁA���͂ƕ\����ʃR���g���[���ł����Ȃ��B
//			���͂��ꂽ�m�n�̍��ڂ�\���p�R���g���[���ɃZ�b�g����B
//******************************************************************************
procedure TMAS310000f.PMComboBox4Change(Sender: TObject);
begin
	//	ME,2000 �ŗ�����
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=2	then
	begin
		PMComboBox4.SelectAll;
		m_bCB4KeyEnter	:=	false;
	end;	//	ME,2000 �ŗ�����
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
	//	ME,2000 �ŗ�����
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=2	then
	begin
(*H0009 20010709 khattori �b���������̓�������*)
		m_bCB4KeyEnter	:=	true;

		if (Key=VK_ESCAPE) or (Key=VK_END)
		then	EscKeyKeyDown(Sender,Key)
		else
		begin
//			m_bCB4KeyEnter	:=	true;

			sText:=PMComboBox4.Text;

			(* �t�@���N�V�����L�[ *)
			if (Key>=VK_F1)and (Key<=VK_F8)
			then
			begin
				iNumb:=Key-VK_F1+1;
				pFunc:=Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb);
				if	(pFunc=nil) or (Rt.RChk(PMComboBox4.Items[iNumb-1])=2)	//	���������蓖�Ă��Ă��Ȃ��t�@���N�V����
				then	beep
				else
				begin
					rFunc:=TMASL310IFunc(pFunc^);	//	�t�@���N�V�������
					PMPanelHdSjSnd.Caption:=Format('  %2d ',[iNumb])+rFunc.sCaption;
					PMComboBox4.ItemIndex:=iNumb-1;
					PMComboBox4.Text:=IntToStr(iNumb)+',';
					sText:=PMComboBox4.Text;
					PMComboBox4.SelectAll;
					PMComboBox4Select(rFunc);
				end;
			end;

			(* �g�O�� *)
			if (Key=VK_F9) then	Rt.Vfnc(MASL_VSET_FNC_NEXT);

			(* �m�� *)
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
						rFunc:=TMASL310IFunc(pFunc^);	//	�t�@���N�V�������
						PMComboBox4Select(rFunc);
					end;
				end;
			end;
			PMComboBox4.Text:=sText;
		end;
	end;	//	ME,2000 �ŗ�����
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
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=2	then	begin	//	ME,2000 �ŗ�����
	m_bCB4KeyEnter	:=	false;

	////////////////////////////////////////////////////////////////////////////////////////////////////
	//	�I�����ڂ�\������
	//		�W���I�ȓ���ł͂Q���̂m�n�����Ȃ��ׁA���͂ƕ\����ʃR���g���[���ł����Ȃ��B
	//		���͂��ꂽ�m�n�̍��ڂ�\���p�R���g���[���ɃZ�b�g����B
	////////////////////////////////////////////////////////////////////////////////////////////////////
	if	TMComboBox(Sender).Name='PMComboBox4'
	then
	begin
		iChek:=0;
		sText:=PMComboBox4.Text;
		if sText<>''
		then
		begin
			Rt.RCnm(sText);		//	�J���}�폜
			if	(Rt.RChk(sText)=1) and (Length(sText)>0)		//	�s����������
			then
			begin
				iNumb:=StrToInt(sText);
				if	(iNumb<=PMComboBox4.Items.Count) and (iNumb>=1)	//	�͈͓�
				then
				begin
					PMComboBox4.Text:=sText+',';
					if	iNumb*10>PMComboBox4.Items.Count then	PMComboBox4.SelectAll
					else										PMComboBox4.SelStart:=1;
					PMComboBox4.ItemIndex:=iNumb-1;
					rFunc:=TMASL310IFunc(Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb)^);
					if	Rt.RChk(PMComboBox4.Items[iNumb-1])=2	//	�I��s��
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
					rFunc:=TMASL310IFunc(Rt.Pfnc(MASL_PGET_FNC_ITEM,@iNumb)^);	//	�t�@���N�V�������
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
	end;	//	ME,2000 �ŗ�����
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

(*H0048 20050516 khattori	����K�C�h�ԍ��ʒm*)
	//******************************************************************************
	//	Function	:	fnHelpIndexSet												<HELP>
	//******************************************************************************
	procedure fnHelpIndexSet;
	var
		AppPara	:	TAppParam;
		rcHLP	:	rcHELPINFO;
	begin
//	�`�k�U�̂ݓ���
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
	if	Rt.Ifnc(MASL_IGET_FNC_OWNER)=2	then	begin	//	ME,2000 �ŗ�����
	m_bCB4Index		:=	PMComboBox4.ItemIndex;

	sText:=PMComboBox4.Text;
	Rt.RCnm(sText);		//	�J���}�폜	20001023
	iNumb:=PMComboBox4.ItemIndex;

	gMASL310RootVf(MASL_VSET_SND_NUMB,@rFunc.iNumb);	//	��Q�w���̑I�������m��
	gMASL310RootVf(MASL_VSET_SND_CODE,@rFunc.iOpCode);	//	��Q�w���̑I����������

	if		rFunc.sProg='z'
	then	ShowMessage(IntToStr(rFunc.iOpCode)+' '+rFunc.sCaption+' Now Making!!!')
	else if rFunc.sProg=''
	then	ShowMessage(IntToStr(rFunc.iOpCode)+' '+rFunc.sCaption+' Not Found!!!')
	else if rFunc.sProg<>'y'
	then
	begin
//		gfg:=true;

(*Ver.x*)
(*H0026 20020111 khattori	��Q�w�����Z�b�g����B*)
		Rt.Vfnc(MASL_VSET_DEF_FUNC,@rFunc);

		PMComboBox4.DroppedDown:=false;


		//	��^�o�^�@��^�m�n��
		if	( rFunc.iMode =MASL_PROC_MODE_TEIKEITOUROKU ) then
		begin
			if	(m_pRec^.m_iOptionCode<>MASL_PROC_OPT_ZTEGATA)	then
			FxDsp(rFunc.iOpCode);
			PMPanelHdFx.Enabled := True;
			EMNumEditFx_No.Color := clWindow;
			MTxtFx_Name.Color := clWindow;
			EMNumEditFx_No.SetFocus;
		end
		//	��^�L��œ���
        else if	( PMPanelHdFx.Visible ) and ( rFunc.iMode =MASL_PROC_MODE_NYUURYOKU )	then
		begin
			new( pQuery );
			Rt.GetFxHead( pQuery );				//  ��^�d��w�b�_�擾

			//	��^�d��o�^�ς݁@��^�m�n��
			if	pQuery^.RecordCount > 0 then
			begin
				if	(m_pRec^.m_iOptionCode<>MASL_PROC_OPT_ZTEGATA)	then
				FxDsp(rFunc.iOpCode);
				PMPanelHdFx.Enabled := True;
				EMNumEditFx_No.Color := clWindow;
				MTxtFx_Name.ParentColor := true;
				EMNumEditFx_No.SetFocus;
			end
			//	��^�d��o�^�����@�ʏ�̓��͂�
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

(*H0048 20050516 khattori	����K�C�h�ԍ��ʒm*)
	fnHelpIndexSet;

	end;	//	ME,2000 �ŗ�����
end;

//******************************************************************************
//	Proccess	:	EscKeyKeyDown
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//	Parameter	:	Sender: TObject
//	Return		:	Nothing
//******************************************************************************
(*H0021 20010928 khattori	�X�V�m�F�̂b�����������{�^��*)
function TMAS310000f.EscKeyKeyDown(Sender: TObject; const Key: Word): Word;
var
	inforec		:	TMjsMsgRec;
	iBalance	:	Integer;
	tlTblList	:	enTblList;
	pQuery		:	Pointer;
	cDrill		:	TMASL310IDrill;
	idx			:	Integer;
begin
	//	���j���[����̏I���v��
	if	Key=(VK_F4+VK_MENU)	then	result:=mrYes
	else
	begin

		if	(Sender.ClassName='TMComboBox')	and
			(TComboBox(Sender).DroppedDown=true)	then
		begin

(*Ver A122 M101*)
(*H0026 20020328 khattori	�G�X�P�[�v�L�[�Ńh���b�v�_�E�������*)
			if (Key=VK_ESCAPE) or (Key=VK_END)	then	TComboBox(Sender).DroppedDown:=false;
//			if	Key=VK_END	then	TComboBox(Sender).DroppedDown:=false;
			exit;
		end;

		iBalance	:=	0;

		//	�o�[���ȊO�Ńo�����X�G���[�L��H
		if	((EMNumEditBalance.Value<>0)		or
			(EMNumEditBalance.Font.Color=clRed))	and
(*H0038 20030904 khattori	���U����<�P�����>*)
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
			//	�o�����X�G���[���N���Ă��܂��B��낵���ł����H
			TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMSG(inforec,20,4);
			result:=MjsMessageBoxEx(inforec.sMsg,inforec.sTitle, inforec.icontype, inforec.btntype, inforec.btndef);
		end
		else
		begin
			//	�d����͂��I�����܂��B\n��낵���ł����H
			TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMSG(inforec,20,5);
			(*H0012 20010730 tyamaguchi �I���������b�Z�[�W�ύX(�o�[���p�쐬)*)

(*Ver A123 M103*)
(*H0032 20020501 khattori	�I���������b�Z�[�W�ύX(��`�p�쐬)*)
			if	(m_pRec^.m_iOptionCode=MASL_PROC_OPT_ZTEGATA)	then
    				inforec.sMsg := TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.MsgChange( inforec.sMsg, '@_@', '��`����' )

			//	�P�����
(*H0038 20030904 khattori	���U����<�P�����>*)
			else if	IsBaseMode	then
//			else if	(m_pRec^.m_iProgramCode=MASL_PROC_CODE_TAXITU)	or
//			if	(m_pRec^.m_iProgramCode=MASL_PROC_CODE_TAXITU)	or
//				(m_pRec^.m_iProgramCode=MASL_PROC_CODE_MONTHR)	then
    				inforec.sMsg := TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.MsgChange( inforec.sMsg, '@_@', '�d�����' )
			//	�`�[����
			else if	IsSlipMode	then
    				inforec.sMsg := TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.MsgChange( inforec.sMsg, '@_@', '�`�[����' )
			//	�o�[��
			else	inforec.sMsg := TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.MsgChange( inforec.sMsg, '@_@', '�o�[������' );
			result:=MjsMessageBoxEx(inforec.sMsg,inforec.sTitle, inforec.icontype, inforec.btntype, inforec.btndef);
		end;
	end;

	//	�d��X�V�����s���Ăe�����������B
	//	��^�d��̍X�V�ŃL�����Z�����ꂽ�Ƃ��͂`�������������ׁA�e�������͕��Ȃ��B
	if	result=mrYes	then
	begin
		for idx := 1 to Rt.BplList.Count do
		begin
			cDrill	:=	TMASL310IDrill(Rt.GetDrillParam(@idx)^);
			if	cDrill.Mine^.bCall	then
			begin
				if	cDrill.Mine^.TCall=mrCancel	then
				begin
					result := mrCancel;	//	�d��X�V
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
//---<HIS-017> Alt+X �������ɓ������Ⴄ�̂�Post����(Alt�����̂����H) -----------
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
(*H0045 20050303 khattori	���ڏC��*)
	bChange:Boolean;
begin
	if	BMSpBtnChange.Enabled=true	then
	begin
(*H0045 20050303 khattori	���ڏC��*)
		bChange:=true;
		Rt.Bfnc(MASL_BGET_CHG_OWNER,@bChange);

(*H0048 20050516 khattori	����K�C�h�ԍ��ʒm*)
//---<HIS-019> ���� (��������Ȃ��Ɩ��������������Ȃ�)--------------------------
		PMPanelAll.Visible		:=	False;
//------------------------------------------------------------------<HIS-019>---
		Self.Visible			:=	False;

(*H0045 20050303 khattori	���ڏC��*)
		bChange:=false;
		Rt.Bfnc(MASL_BGET_CHG_OWNER,@bChange);

		if	Parent=nil	then
		begin
(*	---->	H0045	���Ɉړ� (2005/02/10)
			// 10/24 New
			AppPrm.iAction			:=	ACTID_DOCKINGINEND;
			AppPrm.pRecord			:=	Pointer(m_pRec);
			AppPrm.pActionParam		:=	nil;
			TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);
//	---->	H0045	���Ɉړ� (2005/02/10)	*)

			if	m_pRec^.m_pOwnerPanel=nil
			then	Self.Parent		:=	TForm( m_pRec^.m_pOwnerForm^ )
			else	Self.Parent		:=	TPanel( m_pRec^.m_pOwnerPanel^ );
			Self.Align				:=	alClient;
			Self.BorderStyle		:=	bsNone;
			Self.Position			:=	poDesigned;
			BMSpBtnChange.Caption	:=	'�؏o(&G)';

//	---->	H0045	�ォ��ړ� (2005/02/10)
			AppPrm.iAction			:=	ACTID_DOCKINGINEND;
			AppPrm.pRecord			:=	Pointer(m_pRec);
			AppPrm.pActionParam		:=	nil;
			TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);
//	---->	H0045	�ォ��ړ� (2005/02/10)
		end
		else
		begin
(*	---->	H0045	���Ɉړ� (2005/02/10)
			// 10/24 New
			AppPrm.iAction			:=	ACTID_DOCKINGOUTEND;
			AppPrm.pRecord			:=	Pointer(m_pRec);
			AppPrm.pActionParam		:=	nil;
			TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);
//	---->	H0045	���Ɉړ� (2005/02/10)	*)

			Self.BorderStyle		:=	bsSizeable;
			Self.Align				:=	alnone;
			Self.Parent				:=	nil;
			Self.Position			:=	poDefaultPosOnly;
//��<H0046>
//			ClientWidth				:=	945;
//			ClientHeight			:=	622;
			ClientWidth				:=	Trunc(945 * GetZoomRatio(Pointer(m_pRec)) / 100);
			ClientHeight			:=	Trunc(622 * GetZoomRatio(Pointer(m_pRec)) / 100);
//---<HIS-022> �폜 <HIS-015> �����ł��Z�b�g���Ȃ��ƌ����Ȃ��炵��--------------
//			PMPanelAll.Constraints.MinWidth		:= PMPanelAll.ClientWidth;
//---------------------------------------------------------<HIS-022><HIS-015>---

//��
			BMSpBtnChange.Caption	:=	'����(&G)';

//	---->	H0045	�ォ��ړ� (2005/02/10)
			AppPrm.iAction			:=	ACTID_DOCKINGOUTEND;
			AppPrm.pRecord			:=	Pointer(m_pRec);
			AppPrm.pActionParam		:=	nil;
			TMjsAppRecord(m_pRec^).m_pOwnerEntry(@AppPrm);
//	---->	H0045	�ォ��ړ� (2005/02/10)
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
//	Proccess	:	BMSpBtnMonthFix(���Œ�^����)����
//	Name		:	K.Hattori(MJS)
//	Date		:	2000/12/08
//	Parameter	:	Sender: TObject
//	Return		:	Nothing
//******************************************************************************
procedure TMAS310000f.BMSpBtnMonthFixClick(Sender: TObject);
begin
	sm.Kotei:=1-sm.Kotei;
	SetCaptionBtnFix();

(*������@�r�������������@�I�I�I�@*)
	if	Rt.Pfnc(MASL_PGET_ACTV_CTRL)=PMComboBox2	then
	SetFuncOnSelMonth;
end;

//******************************************************************************
//	Proccess	:	BMSpBtnShowBalanceClick(�o�����X�\��)����
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
//	Comment	  :	�T�u�v���O���� �� MenuItem �� �N���b�N�������ɔ���
//******************************************************************************
procedure TMAS310000f.SubMenuClick(idx: Integer);
var
	rFunc:TMASL310IFunc;
begin
	//	�����I������Ă��Ȃ�������擪�̌���I������(�J�n���Ă����N���b�N���ꂽ�P�[�X)
	if PMPanelSelMonth.Caption = '' then
		PMComboBox2Change(PMComboBox2);

	rFunc:=Itm.ReadIniRec(idx);
	//	����Ύ��s(�_�~�[�Ƃ��ĂȂ��P�[�X������)
	if rFunc.iOpCode=idx then
		Rt.DoAction(rFunc);
end;
//------------------------------------------------------------------<HIS-001>---

//---<HIS-006>------------------------------------------------------------------
//******************************************************************************
//  Proccess  :	�T�u�v���O�����̗̍p��ݒ肷��
//  Parameter : None
//  Return    : None
//******************************************************************************
procedure TMAS310000f.SetSubPrgUse();
begin
	//**************//
	//	��\���ݒ�  //
	//**************//

//---<HIS-033>------------------------------------------------------------------
	//	�������ȊO(�ږ��AFAS)�͔�\��
	//	�o�[���A�`�[���́A���U���͔͂�\��
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
	//	�I�t���C��
	else if g_miSystemCode = MASL_PROC_SYS_KAIKEI_OFFLINE then
	begin
//---<HIS-032> �I�t���C���Ή�---------------------------------------------------
//		SubPrg.ItemVisible[MASL_PROC_CODE_KAIKEI_EXPORT]	:= False;			//	iCompass��v/��v���Y�@�����f�[�^���M
//		SubPrg.ItemVisible[MASL_PROC_CODE_KAIKEI_IMPORT]	:= False;			//	iCompass��v/��v���Y�@�����f�[�^��M
//		SubPrg.ItemVisible[MASL_PROC_CODE_ZAIMU_EXPORT]		:= False;			//	�b�d��v�@�����f�[�^���M
//		SubPrg.ItemVisible[MASL_PROC_CODE_ZAIMU_IMPORT]		:= False;			//	�b�d��v�@�����f�[�^��M
////---<HIS-016>------------------------------------------------------------------
//		SubPrg.ItemVisible[MASL_PROC_CODE_VK_EXPORT]		:= False;			//	�L������@�����f�[�^���M
//		SubPrg.ItemVisible[MASL_PROC_CODE_VK_IMPORT]		:= False;			//	�L������@�����f�[�^��M
////------------------------------------------------------------------<HIS-016>---
//------------------------------------------------------------------<HIS-032>---
	end;

	//************//
	//	�̗p�ݒ�  //
	//************//
	SubPrg.ItemUse[MASL_PROC_CODE_EXCEL]			:= m_cSubUse.IsUseExcel		();	//	Excel�捞
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_YAYOI02]		:= m_cSubUse.IsUseYayoi02	();	//	�퐶��v02-04
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_YAYOI05]		:= m_cSubUse.IsUseYayoi05	();	//	�퐶��v05-
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_KANJYO]		:= m_cSubUse.IsUseKanjyo	();	//	�����s
//---<HIS-064>------------------------------------------------------------------
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_KANJYOi]		:= m_cSubUse.IsUseKanjyoi	();	//	�����si
//------------------------------------------------------------------<HIS-064>---
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_PCA]			:= m_cSubUse.IsUsePca		();	//	PCA��v
//---<HIS-059>------------------------------------------------------------------
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_PCA09]		:= m_cSubUse.IsUsePca09		();	//	PCA��v9 V2
//------------------------------------------------------------------<HIS-059>---
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_KAIKEIOU]	:= m_cSubUse.IsUseKaikeiou	();	//	��v��
//---<HIS-064>------------------------------------------------------------------
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_KAIKEIOU11]	:= m_cSubUse.IsUseKaikeiou11();	//	��v��11
//------------------------------------------------------------------<HIS-064>---
	SubPrg.ItemUse[MASL_PROC_CODE_DATA_IBEX]		:= m_cSubUse.IsUseIbex		();	//	JDL IBEX�o�[��
	SubPrg.ItemUse[MASL_PROC_CODE_KANTAN]			:= m_cSubUse.IsUseKantan	();	//	�~���N�̂��񂽂�I��v
	SubPrg.ItemUse[MASL_PROC_CODE_HOUJIN_EXPORT]	:= m_cSubUse.IsUseHoujin	();	//	�~���N�@�l��v�@�f�[�^���o����
	SubPrg.ItemUse[MASL_PROC_CODE_HOUJIN_IMPORT]	:= m_cSubUse.IsUseHoujin	();	//	�~���N�@�l��v�@�f�[�^�������
	SubPrg.ItemUse[MASL_PROC_CODE_KAIKEI_EXPORT]	:= m_cSubUse.IsUseKaikei	();	//	iCompass��v/��v���Y�@�����f�[�^���M
	SubPrg.ItemUse[MASL_PROC_CODE_KAIKEI_IMPORT]	:= m_cSubUse.IsUseKaikei	();	//	iCompass��v/��v���Y�@�����f�[�^��M
	SubPrg.ItemUse[MASL_PROC_CODE_ZAIMU_EXPORT]		:= m_cSubUse.IsUseZaimu		();	//	�b�d��v�@�����f�[�^���M
	SubPrg.ItemUse[MASL_PROC_CODE_ZAIMU_IMPORT]		:= m_cSubUse.IsUseZaimu		();	//	�b�d��v�@�����f�[�^��M
//---<HIS-016>------------------------------------------------------------------
	SubPrg.ItemUse[MASL_PROC_CODE_VK_EXPORT]		:= m_cSubUse.IsUseVK		();	//	�L������@�����f�[�^���M
	SubPrg.ItemUse[MASL_PROC_CODE_VK_IMPORT]		:= m_cSubUse.IsUseVK		();	//	�L������@�����f�[�^��M
//------------------------------------------------------------------<HIS-016>---
end;
//------------------------------------------------------------------<HIS-006>---

//******************************************************************************
//	Proccess	:	PMPanel(for ComboBox)����
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

(*����*)

(*Ver.x*)
(*H0024	20011217 khattori	��`����*)
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
				TMASL310IMonth(Sm.Items[idx1]^).sViewMonth	+'","�@�@�@'+
				TMASL310IMonth(Sm.Items[idx1]^).sViewTerm	+'"';
			PMComboBox2.Items.Add(sMonth);
		end;
		TComboBox(PMComboBox2).MaxLength:=4;
	end;
end;

//******************************************************************************
//	Proccess	:	SetCaptionBtnFix(���Œ�^����)����
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

	//	�o�[�����͈ȊO
(*H0038 20030904 khattori	���U����<�P�����>*)
	if	not IsSuitouMode	then
//	if	(m_pRec^.m_iProgramCode=MASL_PROC_CODE_TAXITU	)	or
//		(IsSlipMode										)	then
	begin
		//	�h�����_�E���ȊO�@���@����
		if		(g_pDrill=nil)	then
		begin
//---<HIS-052>------------------------------------------------------------------
			if	(Sm.CurMonth.iInner<>0)	then	bKotei	:=	false
//			if	(Sm.CurMonth.iInner<>0) and (Sm.CurMonth.iInner<40)	then	bKotei	:=	false
//------------------------------------------------------------------<HIS-052>---
		end
		//	�h�����_�E���@���@���͈͎w��
		else if	(TMASL310IDrill(g_pDrill^).ToCld^.Imnt[0]<>TMASL310IDrill(g_pDrill^).ToCld^.Imnt[1])	then
		begin
//			sm.Kotei:=	1;
			bKotei	:=	false;
		end;
	end;

	//	���Œ�
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

(*H0035 20030825 khattori	MJSLINK <-> ACELINK ����*)
(*H0037 20030827 khattori	�`�b�d�k�h�m�j���|���l�i�r�k�h�m�j����*)
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
	prFunc	:	^TMASL310IFunc;	//	�t�@���N�V�����Z�b�g
	cList	:	TList;
begin
	cList:=TList.Create;

	(* ���Œ�/���� *)

	//	�o�[�����͈ȊO	��	����
(*H0038 20030904 khattori	���U����<�P�����>*)
	if	(not IsSuitouMode)	and
//	if	((m_pRec^.m_iProgramCode=MASL_PROC_CODE_TAXITU)	or	(IsSlipMode)) and
		(Sm.CurMonth.iInner<>0) and (Sm.CurMonth.iInner<40)
	then
	begin
		new(prFunc);
		prFunc^.sCaption		:=arStr[1-sm.Kotei];
		prFunc^.bEnabled		:=true;
		cList.Add(prFunc);							//	�t�@���N�V�����Z�b�g
	end
	else	cList.Add(nil);

	iPage:=0;
	iOwner:=1;
	Rt.Vfnc(MASL_VSET_FNC_ITEMS,@cList,@iOwner);	//	�t�@���N�V�����ꊇ�Z�b�g�i�Z�b�g�̂݁j
	Rt.Vfnc(MASL_VSET_FNC_PAGE,@iPage);		//	�t�@���N�V�����ŃZ�b�g
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
		iSearch	:=	1;	//	�O�łȂ���΂悢
		while true do
		begin
			rFunc:=Itm.ReadIniRec(iCode,iIndex);
			if	rFunc.iOpCode<=0	then break;

			//	�h�����_�E����p������
			if	rFunc.iLevl<>400	then
			begin
				sIndex:=Format('%d',[iNumb]);

/////////////////////////////////////////////////
				//	�����N�O
				if	rFunc.sProg='y'	then	sIndex:='-';
/////////////////////////////////////////////////

				if	((rFunc.iMode=1) and
					(Rt.Ifnc(MASL_IGET_CHANGEABLE,@Sm.CurMonth.iInner,@iHassei)<>Ord(MASL_RET_MAIL_OK))	) or

					(((rFunc.iMode=2) or (rFunc.iMode=4) or (rFunc.iMode=6)) and
					(Rt.Ifnc(MASL_IGET_CHANGEABLE,@Sm.CurMonth.iInner,@iHassei,@iSearch)<>Ord(MASL_RET_MAIL_OK))	) or

					((Sm.CurMonth.iInner=0) and
					((rFunc.iStyl=1) or	(rFunc.iMode=12) or	(rFunc.iMode=13))	) then	sIndex:='-';

				(*H0013 20010731 tyamaguchi �C���^�폜�敪�Ή�*)
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
	prFunc		:	^TMASL310IFunc;	//	�t�@���N�V�����Z�b�g
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
(*������*)
		iSearch	:=	1;	//	�O�łȂ���΂悢
	while true do
	begin
		rFunc:=Itm.ReadIniRec(iCode,iIndex);
		if	rFunc.iOpCode<=0	then break;

		//	�h�����_�E����p������
		if	rFunc.iLevl<>400	then
		begin
/////////////////////////////////////////////////
			//	�����N�O
			if	rFunc.sProg='y'	then	rFunc.bEnabled:=false;
/////////////////////////////////////////////////
			(* �w���t�@���N�V���� *)
			if	((rFunc.iMode=1) and
				(Rt.Ifnc(MASL_IGET_CHANGEABLE,@Sm.CurMonth.iInner,@iHassei)<>Ord(MASL_RET_MAIL_OK))	) or

				(((rFunc.iMode=2) or (rFunc.iMode=4) or (rFunc.iMode=6)) and
				(Rt.Ifnc(MASL_IGET_CHANGEABLE,@Sm.CurMonth.iInner,@iHassei,@iSearch)<>Ord(MASL_RET_MAIL_OK))	) or

				((Sm.CurMonth.iInner=0) and
				((rFunc.iStyl=1) or	(rFunc.iMode=12) or	(rFunc.iMode=13))	) then	rFunc.bEnabled:=false;

			(*H0013 20010731 tyamaguchi �C���^�폜�敪�Ή�*)
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

	//	�o�[�����́i�P����͈ȊO�j
(*H0038 20030904 khattori	���U����<�P�����>*)
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

		if	m_iExclusive=7001	then	inforec.sMsg	:=	'�d��ő�[�����ɒB�������ߏ����ł��܂���B';
		if	m_iExclusive=7002	then	inforec.sMsg	:=	'���̒[���Ŏd��P�Ə��������s���̂��ߏ����ł��܂���B';
		if	m_iExclusive=7003	then	inforec.sMsg	:=	'�`�[��񂪓o�^����Ă��Ȃ��ׁA�����ł��܂���B';

		MjsMessageBoxEx(inforec.sMsg,inforec.sTitle, inforec.icontype, inforec.btntype, inforec.btndef);
		close;
		exit;
	end;

	(*H0013 20030609 khattori �����̗p�敪���P�̎��A�v�����X�W�Ń`�F�b�N����Ȃ�*)
	if  m_FixKbn16 = 1 then
	begin
		TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMsg(infoRec,20,9);
		with infoRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
		Close;
		exit;
	end;

(*H0034 20030611 khattori	���U����*)
	//  ���U���͍̗p�敪
	if	(m_BunKbn01=0) and IsBunsanMode	then
	begin
		TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMsg(infoRec,20,9);
		Beep ();
		with infoRec do	MjsMessageBoxEx('���U���͂��̗p����Ă��܂���B',sTitle,icontype,btntype,btndef,LogType);
//		with infoRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
		Close;
		exit;
	end;

(*H0038 20030904 khattori	���U����<�P�����>*)
//						iTanGCode:=rcCOMMONAREA( m_pRec^.m_pCommonArea^ ).TantoGCD;
	//  ���U�P����͎��A�S���ҊǗ��K�{
	if	IsBaseMode and IsBunsanMode and (rcCOMMONAREA( m_pRec^.m_pCommonArea^ ).TantoNCD=-1)	then
	begin
		TMASCom ( m_pRec^.m_pSystemArea^ ).m_MsgStd.GetMsg(infoRec,20,9);
		Beep ();
		with infoRec do	MjsMessageBoxEx('�S���ҊǗ����̗p����Ă��܂���B',sTitle,icontype,btntype,btndef,LogType);
//		with infoRec do	MjsMessageBoxEx(sMsg,sTitle,icontype,btntype,btndef,LogType);
		Close;
		exit;
	end;

end;

//******************************************************************************
//  Proccess  :	CM_DIALOGCHAR
//  Parameter : Msg			TCMDialogChar	(= TWMKey)
//  Return    : None
//	Comment	  :	ư�Ư� (&x) �̐��������	MJSBtnVisible �̑�֏���
//	History	  : <HIS-019>
//******************************************************************************
procedure TMAS310000f.CMDialogChar(var Msg: TCMDialogChar);
begin
	//	��è�ނłȂ��ꍇ(���ɉB��Ă���Ȃ�)�͖���
	if ContainsControl(Screen.ActiveControl) then inherited;
end;

//******************************************************************************
//  Proccess  :	�I������
//  Parameter : Msg.WParam		TObject			Sender ���߰����
//  Return    : None
//	History	  :	<HIS-017>
//******************************************************************************
procedure TMAS310000f.WMTerm(var Msg: TMessage);
begin
	EscKeyKeyDown(TObject(Msg.WParam));
end;

////////////////////////////////////////////////////////////////////////////////////////////////////
//	���폈�����ʊ֐�
////////////////////////////////////////////////////////////////////////////////////////////////////

//	�߂�l�Ȃ�
procedure TMAS310000f.gMASL310RootVf
(enPar:enVfunc;pPar1:Pointer=nil;pPar2:Pointer=nil;pPar3:Pointer=nil);
begin
	case	enPar of
		MASL_VSET_FCS_FSIJI:
			begin
				if	(g_pDrill<>nil)	and	(Rt.m_pDrillLevel=1)	then
				begin
(*H0005	20010604 khattori �`�����{���̎��A�h�����_�E���̏C���t���O���n��Ȃ�*)
					Self.Close();
					abort;
				end;

				//	�d��P�ƊJ��
//---<HIS-044><HIS-050>---------------------------------------------------------
				if Assigned(m_cSwkExc) then m_cSwkExc.SetExc(-2);
//---------------------------------------------------------<HIS-044><HIS-050>---
			end;
	end;
	Rt.Vfnc(enPar,pPar1,pPar2,pPar3)
end;
//	�߂�lPointer�^
function TMAS310000f.gMASL310RootPf
(enPar:enPfunc;pPar1:Pointer=nil;pPar2:Pointer=nil;pPar3:Pointer=nil):Pointer;
begin
	try
	result:=Rt.Pfnc(enPar,pPar1,pPar2,pPar3)
	except
		Rt.LogWrite('TMAS310000f.gMASL310RootPf �ŗ�O�����I');
	end;
end;
//	�߂�lBoolean�^
function TMAS310000f.gMASL310RootBf
(enPar:enBfunc;pPar1:Pointer=nil;pPar2:Pointer=nil;pPar3:Pointer=nil):Boolean;
begin
	try
	result:=Rt.Bfnc(enPar,pPar1,pPar2,pPar3)
	except
		Rt.LogWrite('TMAS310000f.gMASL310RootBf �ŗ�O�����I');
	end;
end;
//	�߂�lInteger�^
function TMAS310000f.gMASL310RootIf
(enPar:enIfunc;pPar1:Pointer=nil;pPar2:Pointer=nil;pPar3:Pointer=nil):Integer;
begin
	try
	result:=Rt.Ifnc(enPar,pPar1,pPar2,pPar3)
	except
		Rt.LogWrite('TMAS310000f.gMASL310RootIf �ŗ�O�����I');
	end;
end;
//	�߂�lString�^
function TMAS310000f.gMASL310RootSf
(enPar:enSfunc;pPar1:Pointer=nil;pPar2:Pointer=nil;pPar3:Pointer=nil):String;
begin
	try
	result:=Rt.Sfnc(enPar,pPar1,pPar2,pPar3)
	except
		Rt.LogWrite('TMAS310000f.gMASL310RootSf �ŗ�O�����I');
	end;
end;
// �I���E�B���h�E�J�o�[�֐�
function TMAS310000f.gMASL310RootWf
(enPar:enWfunc;pPar1:Pointer=nil;pPar2:Pointer=nil;pPar3:Pointer=nil):Pointer;
begin
	try
	result:=Rt.Wfnc(enPar,pPar1,pPar2,pPar3)
	except
		Rt.LogWrite('TMAS310000f.gMASL310RootWf �ŗ�O�����I');
	end;
end;

////////////////////////////////////////////
//	�e�X�g�p�{�^�����䕔

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
(*H0007	20010628 khattori �����������ɑ��̃A�v���P�[�V������\�����ꂽ��*)
	Timer1.Enabled:=false;
	//	�P��ځ��l�i�r�f�X�N�g�b�v���A�N�e�B�u���h�����_�E���łȂ��H
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

    //  ���P���ځF���[�U�[�I��tⳁ@���Q���ځF���Ă̕tⳋ敪�@����ȏ�F���ĺ��߰��Ă�Tag
	//  ���[�U�[�I��tⳂ̃Z�b�g
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
(*H0047 20050418 khattori	�ꊇ�u��*)
	TMBtnLump.Enabled 	:= False;
end;

//**************************************************************************
//  Component  :   MFurigana ( TMFurigana )
//              �t���K�i�R���|�[�l���g
//  Event      :   CompositionStr
//  Name       :   T.Yamaguchi
//**************************************************************************
procedure TMAS310000f.MFuriganaCompositionStr(Sender: TObject; Value: String);
begin
	FxFurigana( Value );
end;

//******************************************************************************
//	Proccess	:	���͐���
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
(*H0038 20030904 khattori	���U����<�P�����>*)
		MASL_PROC_CODE_TAXITU_BUN:	bBase	:=	true;
//		MASL_PROC_CODE_MONTHR:		bBase	:=	true;
	end;
	result:=bBase;
end;

(*H0038 20030904 khattori	���U����<�P�����>*)
//******************************************************************************
//	Proccess	:	�o�[��
//******************************************************************************
function TMAS310000f.IsSuitouMode(iPrgCode:Integer):Boolean;
var
	iCode	:	Integer;
	bBase	:	Boolean;
begin
	iCode	:=	iPrgCode;
	if	iCode=0	then	iCode	:=	m_pRec^.m_iProgramCode;
	bBase	:=	false;

(*H0038 20030904 khattori	���U����<�P�����>*)
	if	(not IsBaseMode										)	and
//	if	(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_TAXITU		)	and
//		(m_pRec^.m_iProgramCode<>MASL_PROC_CODE_MONTHR		)	and
		(not IsSlipMode										)		then
		bBase	:=	true;

	result:=bBase;
end;

//******************************************************************************
//	Proccess	:	�`�[����
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
		MASL_PROC_CODE_MIROKU		,		//	�~���N�^�w��
		MASL_PROC_CODE_KOKUYO		,		//	�R�N���^�w��
		MASL_PROC_CODE_NYUUKIN		,		//	�����`�[�w��
		MASL_PROC_CODE_SYUKKIN		,		//	�o���`�[�w��
		MASL_PROC_CODE_KARISSN		,		//	�������Z�w��
		MASL_PROC_CODE_MIROKU_BUN	,		//	�~���N�^�w��
		MASL_PROC_CODE_KOKUYO_BUN	,		//	�R�N���^�w��
		MASL_PROC_CODE_NYUUKIN_BUN	,		//	�����`�[�w��
		MASL_PROC_CODE_SYUKKIN_BUN	,		//	�o���`�[�w��
		MASL_PROC_CODE_KARISSN_BUN	:		//	�������Z�w��
			bSlip	:=	true;
	end;
	result:=bSlip;
end;

//******************************************************************************
//	Proccess	:	���U
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
(*H0038 20030904 khattori	���U����<�P�����>*)
		MASL_PROC_CODE_TAXITU_BUN	,		//	�P����͕��U�d��w��

		MASL_PROC_CODE_MIROKU_BUN	,		//	�~���N�^�w��
		MASL_PROC_CODE_KOKUYO_BUN	,		//	�R�N���^�w��
		MASL_PROC_CODE_NYUUKIN_BUN	,		//	�����`�[�w��
		MASL_PROC_CODE_SYUKKIN_BUN	,		//	�o���`�[�w��
		MASL_PROC_CODE_KARISSN_BUN	:		//	�������Z�w��
			bSlip	:=	true;
	end;
	result:=bSlip;
end;

//******************************************************************************
//	Proccess	:	�e�`�r
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
//	Proccess	:	������{�i�������j
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
//	Proccess	:	������{�i�{�X�j
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
//	Proccess	:	������{�i�x�X�j
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
//	Proccess	:	�����叫FAS�iCS�p�j
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
//	Proccess	:	�����叫FAS�i�Ǘ��җp�j
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

(*H0036 20030825 khattori	syuusei ��ВP�Ɣp�~�Ή�*)
//**********************************************************************
//*		Proccess	:	�����r������
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

		//	500�Ԃ̔r��
		m_iRet := m_cExcept.SetExcept(500);
		if		m_iRet <> EXCEPT_RET_OK			then	m_nReferMode	:= -1	//	�����������s
		else if	(m_cExcept.Status100 <> 0)		then	m_nReferMode	:= -2;	//	���Ŕr����
	except
				m_nReferMode	:= -1;				//	�����������s
	end;

	case	m_nReferMode	of
		-1:
		begin
			Beep ();
			MjsMessageBox('�r�����䏈���̏��������Ɏ��s���܂����B', mjError, mjDefOk);
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
//*		Proccess	:	�����r���I������
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

(*H0044 20041213 khattori	�e�������q����������*)
//**********************************************************************
//*		Proccess	:	���𑜓x�Ή�
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
//---<HIS-022> �폜(�W���T�C�Y��菬��������̂�F�߂�)-------------------------
//	//	�W���T�C�Y��菬���������Ȃ�(�����̂�)
//	PMPanelAll.Constraints.MinWidth		:= fnConvert(945);
//------------------------------------------------------------------<HIS-022>---
	//	�����Őݒ肵�Ȃ��ƃT�C�Y�������(OnCreate�C�x���g�ł�NG)
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
