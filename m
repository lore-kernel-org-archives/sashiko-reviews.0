Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021143.outbound.protection.outlook.com [40.107.42.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B70DF4B53ED
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 23:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788998004; cv=fail; b=pXOOrR03kPO256bhEn5Lakgd0nile11/NXYKOmSfO2K+Z4ykyrh51u6HT9tBDQUVt//hCq3fpHlaUi2gN+IuXgLb6oFSe//c+utOXCqAr4f1GsZu7WdcZ/tSNy70zwqB3h6z0IOnt7OjvJZMvcu12bHc8pae8DK2bxlMEWsTxpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788998004; c=relaxed/simple;
	bh=pJIph3Zy8OloQSvCNNyYHDKtVC3SPFqCTMlaTkkPmas=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JHPL5jIUvRi6aVH75yKk4eHalyZm54S0ftxHkjHQhksQEtWdVQYE8Nc7RRb6a2HxlLotFMXkZB+ukM597hhyBDjxNl3qvKe2EhEpHpZ+vdTNmze3BxcAos1gPPwzCZkg4kFWzUAGq5X12cMJrD2UuTtzmbPvziETrvM4gqSWa5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=QxzzAxIc; arc=fail smtp.client-ip=40.107.42.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="QxzzAxIc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiiZyN2ov3/pquDgTUFoGrEkvbBgsiYGAB4RTzb83dvp0oYcFkA1AQl85SVqT/AioHHc4xTRuPFkUT214NCgNLNnfrIWk40Ca7On/s3sCrpbqfo7M8vf1fiMx1vNk/kv5KXGdTRAokvXl4Z/6CW7f18TwvX1YCO+crq/MewTBstBOmZqmj3ABNjdGtagPXgbnfijAql2iC1lvUrlZ7pr8pc0XuXpMr5Qnqkyugn8bejXkzvzPMgmhxer37RPNX27Xkliytc0+njNKH5mifOi+bH1WijXvB/nEBiW9wT6kIO93SyrV4ThYyqXNV05C6qr582cVcWbFBLGfjEZ6pVC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+rxfRXdgFO2XqkABisa4ygiMEKvX9FjQzmK9YFuG4XI=;
 b=OwxuFu3FvThx94kB5bskXSwoOXVlqjnfx42CLfGtIzheBfdnRFb2ZEmfbhnEsVrdu6y85x8hm6Lq9xEXd+HM/S4QUoIKG06LpOoLW+4Odmnta93P+2cvDpS4t6/WikHn+qbaoluWnACEQcTJ83IJD6eJ65wczxqY8PoyXC3+5Bm+zONLxgQuaxFGtkmoTUj2C7lCSqx+MV/Kw/u5wzBcSw0TAi89ynDqoNjM5H+SuJxy3nf4yHejaYJZALrvZVnubHMk+X34j+JgGOCjiJqhR8bdgDxcpnkatopRW02AoW8PvRkKP7XqFU3F1LQG3GhJ9kNxy5tb5Et0SbmMyFe1xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+rxfRXdgFO2XqkABisa4ygiMEKvX9FjQzmK9YFuG4XI=;
 b=QxzzAxIctGrz7Ze7HioxSSAu0LoPPU/IfBYJi/dp4mR6/tnFSX0ZsytbJHWa6TttH90KiyyqiJ/EdRlSQGRbFNX2EMdDFAHzr1MYtDE8qCdfkQqR4pAKXWbVQcrRBa0qvXgmZK8QpTGtZM4+0YX9p+Sw9UsYZIfM0JYkDXoxdpEXL8MNvKKD1b+sRIHaD0xF9fGnJunWil/KChXm/oDLBtiiqupCUdY9ITPzdX1SgHkmGgYoc/IjD6EAkMb2HiydhTYCukWX7+bt7yLsc98VI3Gswj34NkQSdl2/fcH796WVqrw2MEZPDbHdh21Y+55vDl2by8sX7AcJizh2skxpqg==
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM (2603:1096:101:1b9::8)
 by SE5P216MB3172.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fc::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 9 Sep
 2026 23:53:16 +0000
Received: from SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232]) by SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
 ([fe80::f234:3bc6:9197:8232%6]) with mapi id 15.21.0406.007; Wed, 9 Sep 2026
 23:53:16 +0000
From: Nas Chung <nas.chung@chipsnmedia.com>
To: Frank Li <Frank.li@oss.nxp.com>, "sashiko-reviews@lists.linux.dev"
	<sashiko-reviews@lists.linux.dev>
CC: "conor+dt@kernel.org" <conor+dt@kernel.org>, "robh@kernel.org"
	<robh@kernel.org>, "media-ci@linuxtv.org" <media-ci@linuxtv.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: RE: [PATCH v7 3/9] media: chips-media: wave6: Add Wave6 VPU interface
Thread-Topic: [PATCH v7 3/9] media: chips-media: wave6: Add Wave6 VPU
 interface
Thread-Index: AQHdPDkr23ol+EHgZUqQjr0gKJp7ELa9/ugAgAh8VYCAAHjjMA==
Date: Wed, 9 Sep 2026 23:53:15 +0000
Message-ID:
 <SL2P216MB244106043878AAF2168CA81CFBB02@SL2P216MB2441.KORP216.PROD.OUTLOOK.COM>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <39115ce2f3d9cc18350cddc650b7cb40317e5ef3.1788496816.git.nas.chung@chipsnmedia.com>
 <20260904070450.80A561F00A3D@smtp.kernel.org>
 <aqGL22zVAFBY7BOS@lizhi-Precision-Tower-5810>
In-Reply-To: <aqGL22zVAFBY7BOS@lizhi-Precision-Tower-5810>
Accept-Language: en-US, ko-KR
Content-Language: ko-KR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SL2P216MB2441:EE_|SE5P216MB3172:EE_
x-ms-office365-filtering-correlation-id: 559e6826-7c99-4acd-050a-08df0ecd8447
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|38070700021|4143699003|10067099003|6133799003|22082099003|18002099003|3023799007|56012099006;
x-microsoft-antispam-message-info:
 kt29s0KjsRHqbJP2pZzOZ3QxlDsL8nwTMYOpyE9U7huWzJ3toF48TKGnP0NpM8a/zl5HuJ88bM/5jU3FIsbo8NsF6Lz8xF2yb0SmXEhqBKE7PXu8ILQTOS0pH1v4UEl3h0f4we9Fo8yudceG1/dTlBhD3XDIQnv6CXKsXP4TW6yGun2qH41SXQ0VAFEQiVdnTl8NXowufE1qwvTB65n63Hu2J1b6V6r/XsOv9QU2L4bW34PKb9sao3X5XuBeu2kfhjhGVZ4kFJ1aZhaAxZN+Va4WaGE3TcySMlTrapCOaTkM3PcRraOd6Ds65sUk96z+P9zjPrMF7bcOyttxgGP/E3Bio9uRXRFFjqnjW8ola18KqW89v+m4WwV1xBhwPhecfcBC100nijv0VDo1jUk5doxfdxNWD4KqmjT7xq+Xh5yw53jt+wG+iUcUeawLC8H/KnwmY8Nd6GLseToUdnG7k+gLcxNU1PHDuaiXrl6pwXEUQXSsIhrumWtRgti09g9g6sXMAyd3VyU7w3K09JPdJfswiAqv8YXNFLM8mZ8ck5Op8RXhlfn5XVe8L/WOGV0Z6Np5ZI8clYbIyKmir0X26qa6QQJJg5iMMGntcGKm37vYhhipepgnoa8J+MyFHKSqmb5LoTWJ6asHCKtqnQvJTlhMFCoPQ5JWch80k+sfZkY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2P216MB2441.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(38070700021)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CPLJLkZLNc1z/8kdoFuNnNkULup+dCGwaDQpEoqNFkPiKEfl7mqDBbcenO0S?=
 =?us-ascii?Q?ZanQXZ7Y0yHxMrk1WpSAerMdcrEBCjkiRA+JFcVkFSztCxgPjXmksm1iExpg?=
 =?us-ascii?Q?tKiVfsw6IaWyZ8UniopxF5d/hjK8D4JvYOXdtYBc0vR/aA+HsenYqK+0XrMt?=
 =?us-ascii?Q?DvSWG84NrT7wyuqc75AF1nbHCz8is2tf3eNXE6w0YiWRD0nJubRGDmWdOS2L?=
 =?us-ascii?Q?3s2MS/TtGANDeG7u1S2tbylrDWBFkHCYxMEY5dJBfX+FONPqxa6k3cs7R8C0?=
 =?us-ascii?Q?jK7D0f5wfcsxkWcDBY9R/pnxoQr2jyCZ/5dFLkkuBGBYnuFW1T0eTIbT8CwP?=
 =?us-ascii?Q?GLoY47gDAvM+zOln1dHmNSvj2S7EadDXQBwjIf78fTpz3nmfP9KsP+ORvsLt?=
 =?us-ascii?Q?w/WAVAwU4yQ3KetaxhyWW8zkVd/Xyckfd9D3d1GbGoOSIG2VQtZocp87l+YM?=
 =?us-ascii?Q?WcL3HJmGs5DluDRqdwKSdL8bt+JIRd9A4gI8On/sat/guIYb8EaTLaQcse4A?=
 =?us-ascii?Q?L12Q7GgVTbKSjfl/0utOWmeL1QOgmkeX2oeIpnDwcoa/ece0BZD/w2dM+gPo?=
 =?us-ascii?Q?8y8RTjc3oUF6msV7UNJYMIXC83A/enr9quoHeAFikoSg8Xd1bXienaGeoSlq?=
 =?us-ascii?Q?3zN985lo4JluntAU7/L5jqVBQclEOKGS3nvquLa/V2HV1hJFBNQk/TwZvct6?=
 =?us-ascii?Q?Y7EaqEvugOUaCIu0L7kDjV7+ME/i3EtBPNXZHKFY/HbsVazqsmMwhL/XIbbq?=
 =?us-ascii?Q?wAozOEltvARvs3PlUaJyx6i9BMsm0AXnw1D5ANwFFBKz+xKJRnSsCKoXWwIz?=
 =?us-ascii?Q?S2xzF5ViiOZK0nhCzO3+HAcPMG4WtuompfsKz9Nja7uItDGy4O0Rv4CgA531?=
 =?us-ascii?Q?HQngCCB7O+icn+FfyMcnVLzd3Mq8wlGidVkJltD3tQ/0xpVi+otyVutkUFA1?=
 =?us-ascii?Q?2bLtOdHeaKWniMdKCqkoO/g1IS766LeNc3KCeSUG1aFAQpiChtmp7rVZOMV2?=
 =?us-ascii?Q?83eqQGq6YjCBFytxiH4jhzPefIOTvlDUvSTgZ87+Ccoe2UW9iSoF7AhF21vt?=
 =?us-ascii?Q?PTZ8CrUCIsAJ8KxRhaCSxHIi5Ia0/E52ZDyiwitHrmanfK8tMcoXjuiF7SKw?=
 =?us-ascii?Q?5YiKhmnKQg0WpUDxtY0U5Bb5L/rDfcdwoQCrkY3SSDv3jc09xq/uYXAXvjdY?=
 =?us-ascii?Q?uFGW6RltSh3qPip6jEcedZO1xziw1sySR+x9pFwh1SE+sSbQtRdBNR6hCDni?=
 =?us-ascii?Q?iv6Q0bwqoE6jzsTG2dequvwzVEy5IZ/R55FETWPqPhWJLIYEyWW46O5eaWO+?=
 =?us-ascii?Q?DR659+DHwrEb8OpTgu9pF1tPx5yL2g+JAaVssa0Zj4/WCoIRod2EJFdyuJDG?=
 =?us-ascii?Q?Q5V/B36q6Eie15ea3+gUNzsUk9Ct9/PGuWZvOOOhK6mTHJnl/LJqevIAnGXD?=
 =?us-ascii?Q?Lbn3Y5DCYrJ9poxvax+Xs+ky/Dyjv/9ydSs1gsQPNorDQ3cNU/k12Ep9WmMk?=
 =?us-ascii?Q?Fn9N0spqhvZSQkjYUgKysTQAa/fgQIl2QlYIdd0Q87atDgQRBWQEiV2xx4yD?=
 =?us-ascii?Q?2nRph/S4EEEg7oeTpZQoDcjHK9bRaVSCEfe1Xz7eRuuuv+FdDiEXEcbyOwf8?=
 =?us-ascii?Q?LMeaIHaw/42tZyNNQHpjnY5bn27Tww3Z1GjLYsMdaLwWNe4m62Zq/Lokib5C?=
 =?us-ascii?Q?1Dr934avgyBATJxj4q6IRdxo1CddtUnLbu3irWLaxWXAC6+JdDOCXnCP1RTM?=
 =?us-ascii?Q?5ZvSvPB8Fw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SL2P216MB2441.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 559e6826-7c99-4acd-050a-08df0ecd8447
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 23:53:15.9701
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TdhPUzHTStc81iEQg541+DKze1WU/zvbQ8KpxdvlG6Vv6so22gv0EIkxrdpCWXBFc6XPyuc1VahlFIAvvjsM9G5eqKHARzJ/PIRjOQ9yxDc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3172

Hi, Frank.

>-----Original Message-----
>From: Frank Li <Frank.li@oss.nxp.com>
>Sent: Thursday, September 10, 2026 1:40 AM
>To: sashiko-reviews@lists.linux.dev
>Cc: Nas Chung <nas.chung@chipsnmedia.com>; conor+dt@kernel.org;
>robh@kernel.org; media-ci@linuxtv.org; devicetree@vger.kernel.org
>Subject: Re: [PATCH v7 3/9] media: chips-media: wave6: Add Wave6 VPU
>interface
>
>On Fri, Sep 04, 2026 at 07:04:50AM +0000, sashiko-bot@kernel.org wrote:
>> Thank you for your contribution! Sashiko AI review found 5 potential
>issue(s) to consider:
>> - [High] Integer underflow when calculating end index for frame buffer
>registration causes out-of-bounds hardware configuration.
>> - [High] Encoder frame buffer registration fails to group configuration
>commands, allowing array index overflow into adjacent MMIO registers.
>> - [Medium] Silent truncation of RGB chroma format due to mismatched
>bitmask.
>> - [Medium] Display buffers are silently ignored when the metadata array
>is full.
>> - [Medium] Hardcoded little-endian memory layout breaks compatibility
>with big-endian host architectures.
>> --
>
>Sorry, jump in at v7. Please fix AI report issues. or provide judgements

OK, I'll reply inline to the Sashiko report.

>
>And please CC imx@lists.linux.dev next time.

Sure.

Thanks,
Nas.

>
>Frank
>>
>> commit 5d00a062981a74f9de3d4d2750b7f43dba64822e
>> Author: Nas Chung <nas.chung@chipsnmedia.com>
>>
>> media: chips-media: wave6: Add Wave6 VPU interface
>>
>> Add an interface layer to manage hardware register configuration and
>> communication with the Chips&Media Wave6 video codec IP.
>>
>> > diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.c
>b/drivers/media/platform/chips-media/wave6/wave6-hw.c
>> > --- /dev/null
>> > +++ b/drivers/media/platform/chips-media/wave6/wave6-hw.c
>> > @@ -0,0 +1,2030 @@
>> [ ... ]
>> > +static void wave6_dec_set_display_buffer(struct vpu_instance *inst,
>struct frame_buffer fb)
>> > +{
>> > +	struct dec_info *p_dec_info =3D &inst->codec_info->dec_info;
>> > +	int index;
>> > +
>> > +	for (index =3D 0; index < WAVE6_MAX_FBS; index++) {
>> > +		if (!p_dec_info->disp_buf[index].buf_y) {
>> > +			p_dec_info->disp_buf[index] =3D fb;
>> > +			p_dec_info->disp_buf[index].index =3D index;
>> > +			break;
>> > +		}
>> > +	}
>> > +}
>>
>> [Severity: Medium]
>> WAVE6_MAX_FBS is defined as 31. If userspace requests and registers 32
>> buffers, what happens when this loop completes without finding an empty
>> slot?
>>
>> Does this silently drop the tracking metadata for the buffer, leading to
>> failures later in wave6_vpu_dec_get_output_info() when it tries to match
>> the display buffer address?
>>
>> [ ... ]
>> > +int wave6_vpu_dec_register_frame_buffer(struct vpu_instance *inst)
>> > +{
>> [ ... ]
>> > +	fbc_remain =3D fbc_count;
>> > +	mv_remain =3D mv_count;
>> > +	group_num =3D DIV_ROUND_UP(max(fbc_count, mv_count), 16);
>> > +	for (i =3D 0; i < group_num; i++) {
>> > +		bool first_group =3D i =3D=3D 0;
>> > +		bool last_group =3D i =3D=3D group_num - 1;
>> > +		u32 set_fbc_num =3D (fbc_remain >=3D 16) ? 16 : fbc_remain;
>> > +		u32 set_mv_num =3D (mv_remain >=3D 16) ? 16 : mv_remain;
>> > +		u32 fbc_start_no =3D i * 16;
>> > +		u32 fbc_end_no =3D fbc_start_no + set_fbc_num - 1;
>> > +		u32 mv_start_no =3D i * 16;
>> > +		u32 mv_end_no =3D mv_start_no + set_mv_num - 1;
>>
>> [Severity: High]
>> If either fbc_count or mv_count is initially 0, or if they are uneven
>> and one depletes before the other in subsequent loop iterations,
>> set_fbc_num or set_mv_num becomes 0.
>>
>> Does this cause fbc_end_no or mv_end_no to underflow when subtracting 1,
>> sending invalid boundaries to the hardware?
>>
>> [ ... ]
>> > +int wave6_vpu_dec_register_display_buffer(struct vpu_instance *inst,
>struct frame_buffer fb)
>> > +{
>> [ ... ]
>> > +	reg_val =3D SET_DISP_COMMON_PIC_INFO_BWB_ON |
>> > +		  SET_DISP_COMMON_PIC_INFO_C_FMT_IDC(c_fmt_idc) |
>> > +		  SET_DISP_COMMON_PIC_INFO_PIXEL_ORDER(PIXEL_ORDER_INCREASING)
>|
>>
>> [Severity: Medium]
>> When the format is RGB, get_chroma_format_idc() returns C_FMT_IDC_RGB
>> which evaluates to 4 (binary 100).
>>
>> Since SET_DISP_COMMON_PIC_INFO_C_FMT_IDC uses a 2-bit mask, does this
>> silently truncate the value to 0 (C_FMT_IDC_YUV400) and misconfigure
>> the hardware for RGB displays?
>>
>> [ ... ]
>> > +int wave6_vpu_enc_register_frame_buffer(struct vpu_instance *inst)
>> > +{
>> [ ... ]
>> > +	for (idx =3D 0; idx < fbc_count; idx++) {
>> > +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_Y(idx),
>fb_arr[idx].buf_y);
>> > +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_C(idx),
>fb_arr[idx].buf_cb);
>> > +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_CR(idx),
>fb_arr[idx].buf_cr);
>>
>> [Severity: High]
>> Unlike the decoder buffer registration which batches commands into group=
s
>> of 16, this loop writes sequentially up to fbc_count.
>>
>> If fbc_count exceeds 16, could this overflow past the 16 available MMIO
>> slots for W6_CMD_SET_FB_FBC_Y (and others) and corrupt adjacent hardware
>> registers like W6_CMD_SET_FB_DEFAULT_CDF?
>>
>> [ ... ]
>> > diff --git a/drivers/media/platform/chips-media/wave6/wave6-regdefine.=
h
>b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
>> > --- /dev/null
>> > +++ b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
>> > @@ -0,0 +1,649 @@
>> [ ... ]
>> > +#define		SET_DISP_COMMON_PIC_INFO_C_FMT_IDC(x)
>	FIELD_PREP(GENMASK(25, 24), (x))
>>
>> [Severity: Medium]
>> As noted in wave6_vpu_dec_register_display_buffer(), this mask is only
>> 2 bits wide. Could this be extended to correctly support C_FMT_IDC_RGB
>> (which requires at least 3 bits to store value 4)?
>>
>> [ ... ]
>> > diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.=
h
>b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
>> > --- /dev/null
>> > +++ b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
>> > @@ -0,0 +1,72 @@
>> [ ... ]
>> > +#define HOST_ENDIAN			VDI_128BIT_LITTLE_ENDIAN
>> > +#define VPU_STREAM_ENDIAN		HOST_ENDIAN
>> > +#define VPU_USER_DATA_ENDIAN		HOST_ENDIAN
>> > +#define VPU_SOURCE_ENDIAN		HOST_ENDIAN
>>
>> [Severity: Medium]
>> Does hardcoding the host endianness to VDI_128BIT_LITTLE_ENDIAN break
>> stream decoding and encoding on big-endian architectures?
>>
>> Could this be set conditionally using standard kernel endianness macros
>> to support big-endian hosts?
>>
>> --
>> Sashiko AI review *
>https://sashiko.dev/#/patchset/cover.1788496816.git.nas.chung@chipsnmedia.=
c
>om?part=3D3
