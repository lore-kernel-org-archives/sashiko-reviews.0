Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.65.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795117006;
	b=hONWY6w51BbLrNKuuySIKEV/DiJKsdKvJ7R5ibnq7gqkt9A0qFSkccqv8dV3blHrUDYW
	 zg/+PifUsXfQaIBe0JK6463f0TP6y+bN7yjAr5ToUdYRnQQMfGIY8p+OKNmyh3at0HFM5
	 pm106z0GtJEFLF7KaWbQa3DeBnphpsOVH/awjPD3IgwqEzdUMRQTx+P2j9v2QIeuawmqo
	 5VrPM41Qeo4YVZDXLX7Psy3T4VgZYbyKcKbxA9Tgr5beBu2T36fYiNVA4o+0vzTUTZGdk
	 4+eTx5LFykzLlvedJ6aA4JCK/AMKD4drYLUc4CDS34dU3/h0LlUB7iOrpkTImZG5kHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795117006;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=CranEEoLWmWMxEIv1STGl+Y4fM+6BcY9fx5piGDDqwg=;
	b=Y9J/eE3J+/26Pcx15+90NYQcFnoW7YyBjSgZgX5QhD7IGhhXSG5OuXPs6b6y2C16PUFV
	 n3TUUKmGLE76ziezYlfmaFXqyNt4yzxDv5pTr929y3Fh8sydV3xIgI7eSyHA7enLd+dSn
	 utlTgskXEdgMmWL43Mk4ieFqqvMcFslE5+cU5sHTGajeIeg01MuQsc1Job2TSw/GuE2Ju
	 4/oG9kicT2D2GvHhOhYSaxHf4zj2BYQFYbGOgeEOPGl7qNE1NUYki4Q3Wgf7TsTpx0lyJ
	 TjjQ8k2rc+v8exL2EjTJDoJrVyW0jWXffjwnr6/R26FxBrYf3CsiPIdy7L0Rh+mHzIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rWs7JGBU;
	arc=fail smtp.remote-ip=52.101.65.67
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AFC606A337;
	Thu, 19 Nov 2026 19:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08AFC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=rWs7JGBU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W8SOf69VqE+Ax731Re8LLfd9AA4RySdzLWaUZle2hrUL1fMYgSIzd78I0Uz+GTnvt0sSbfqWXuZq6WnNT3nQZywV4YaOUCwBWjnps4uLVECnCRFUkqxDyiNXkFDPQhX0js8gnliicvMRc1g8g7cWp0EzmcTyCnQ7xKIqfMSqts0avuBQ+qIwIG2ijPk2WXVHOecA2T80kkatSkpwBDy/BCjA7gNgysDhos/0djlL65Dww1r4Kjc6bbB2ja5TYKp9vok+fyaThPG7O5gfdat1+YQdpUCTPJi5266s/UhktAugugW8wYkms5VaNUgN3hdRBb8opHkIk+tjuby93g3V6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3GDuXD4h+UyMkzGfn5txw1iB0qmhW8RloVNJPJUITE=;
 b=ZTXdYB6AZdfchEez8DTyC615ksRWs5zUDDZqmY4zY1e8SJEFqH6BhVn2d2ioHucytd5mRFJahSpikgfgaHwQhufZrZlDTg6sN0Et2v6ivCb7ikYBCqw3CgMax5frqDlTVVYOgSDzyvmI5lS9NJLBTKJbzLps3/kaPAWe8IA+zmWESLPMbaZarCVIKXkEudp2qZKL1b3hsPeFqIx2TQyD2R/9qhwbrJzQ8+bQkvg+B3Ln2lfw6EA9AmIPqIHv1tmaYPDXlTquslc7iw6ZMz+bWKz3kuv1eW83bba+HGhExRtxgX9ziCzmGoBs2c8mAluCGL+1m38Yw5IRoqaeeGjJHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y3GDuXD4h+UyMkzGfn5txw1iB0qmhW8RloVNJPJUITE=;
 b=rWs7JGBUtuCdCsJVNVvySVc5lHtdmRD0vNeIfHC8yxVFpKeAQEadz1PiLoUKiFsr5JAgoIZtmzLtKfc6/fB2O7oDO6mztQ2TSwg2z97Y/FNeo6kkA0RWhk+tU3JBpbsFzs3m6TGQu3rjW6/Q++5ep/ZjlEvUVqkxNoj7tlL2xTGWZQTCkd5g1yyzwnveqbtO3cvKfHyqgRNkChZf85mqo35NODN+1sTvyPbFliMmbywMeZ38CLOSWpa0rq7JjKqEQ0t9FO7BRSVe/mGFzPzzGe9B0prKrP03Zv38nl2RzITqSDeqEB6b7ajT+zCaDWyJv/K72ug/dbphct8zMq1I9Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA3PR04MB11225.eurprd04.prod.outlook.com (2603:10a6:102:4b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 19:36:41 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.010; Thu, 19 Nov 2026
 19:36:40 +0000
Date: Thu, 19 Nov 2026 13:36:33 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Nas Chung <nas.chung@chipsnmedia.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org, media-ci@linuxtv.org
Subject: Re: [PATCH v8 02/11] media: chips-media: wave6: Add Wave6 control
 driver
Message-ID: <av9Pwfx0wjfjw36L@SMW015318>
References: <cover.1795075577.git.nas.chung@chipsnmedia.com>
 <6b00047b748267a2ff4e18ccbfd573ea92166d34.1795075580.git.nas.chung@chipsnmedia.com>
 <sashiko-outbox-222830@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-222830@kernel.org>
X-ClientProxiedBy: PH8P221CA0061.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA3PR04MB11225:EE_
X-MS-Office365-Filtering-Correlation-Id: 86714c6b-fcc7-4330-c01f-08df46746f43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|366016|1800799024|22082099003|18002099003|6133799003|261022105027099003|11063799006|261026130827099003|261022075727099003|261021130227099003|4143699003|261026135527099003|261022115727099003|10067099003|56012099006|261026121527099003|261102123227099003|261028144727099003|261022113327099003|261026140227099003|261021133027099003|261021135927099003|261021121427099003|261009223027099003|261021123027099003|260925022911599003|260925021311599003|260925021911599003;
X-Microsoft-Antispam-Message-Info:
	6CDf6XgfVewTaBIVSCQxsa5rqmTz9VxuBb4Pmf0Buz1THztZNhlN6MB5924+lQ+a306Gyxu+ZmbPhSAYMP+MxQ3lSUSo5ZbM6llWbzitU4DEh5jIS6lIzFRoM3uCf3R3lTXPz60EaxydwQ/hrGr2tDyeNi84nLtyU4DdOvZZZCzuBH6wp4Lp75FKWpieVQ3cWKUEVBVGUlGO9Le9t+jNadDFdTB3sqzWqNfx9vtq3yw1vVi3Nz//4rfm987g03NS8bvMc/j3Cp0F5nRHsMYaoA6renBBpo2SDEhEEZLrlrmdFGcubdPeHtTbU+dlRIF0ztVyJzme68g9lA0NH4A8ktUa7gKAdt5xa9MuiCqDuZPuORmUmzLs1bxoUiFtjLbOvA2QNAbkfsN8+yOpNiIMA+dnE1/Z5AGkOSxwCq4vPj1s+iEmV2Nkrd8rqRrsXmei+FtikJIT4SRt5K4WiqVg8ZYoE33EipManng2RIh8uoaQWzKXBBudN6ZmfjPgJUueWfta4NLDttcUsSsv/o/lQsgokZ4LZyavQYYAyCO4yXnE2Ccq2FuhCSei2LSNKrBXymklkbXE7eg13ufEdK1uWM6DfjpkebeeikYbGTVDdjM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(366016)(1800799024)(22082099003)(18002099003)(6133799003)(261022105027099003)(11063799006)(261026130827099003)(261022075727099003)(261021130227099003)(4143699003)(261026135527099003)(261022115727099003)(10067099003)(56012099006)(261026121527099003)(261102123227099003)(261028144727099003)(261022113327099003)(261026140227099003)(261021133027099003)(261021135927099003)(261021121427099003)(261009223027099003)(261021123027099003)(260925022911599003)(260925021311599003)(260925021911599003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?w08FgUE4dUJm2ZVRy2C6J9LpxCv2LI5KU+Po2gVthHgqkWdg1JLdsk+lPC?=
 =?iso-8859-1?Q?2wnDfAr6AjfqJgvPv1dCJGmBHe1mm2eWl1ucAwKiQdPteLmgDpAEglB7hV?=
 =?iso-8859-1?Q?6TeDGLdKaZ1w9crzDGjDmHdvp2yKr+wd3ZVqg1/vId/g9YZNBKtxp397pH?=
 =?iso-8859-1?Q?QtPyCASvESRoQPxFOkYk0WVBy7IP87LxD6tRv0jGw6Jqws58gCcE8Nxv6h?=
 =?iso-8859-1?Q?7w054GVSm5FsRVNC24IER+4Zt++9AaArUGq0nMA1u+KqBNG7Doy+6giHAQ?=
 =?iso-8859-1?Q?PR6Rbb57WMdbZ2gpagW0ihBCxO5kdGcHOKp1q2/BrnZUuAG4EN27sr/w94?=
 =?iso-8859-1?Q?1/KYB74S122smWY0BLN183FA0LKmwEgpV8n5femqq+sCqPO7NZNbRYp1cl?=
 =?iso-8859-1?Q?sn06rw9aHbuN+iqxGq0/+unrNfZaQYZMtdS0gM8H83+DTbz2RkioMI51Mn?=
 =?iso-8859-1?Q?51QAr37MOQ6IcPhk3F6tsaD4XEOrL1VKgwl1a0joGX0snsfl4oCXM3kmUL?=
 =?iso-8859-1?Q?qECayIfcquPfRMaYKW9AqJYIHitX69AY7wq+F5lndbjHbQ94GZbpIvPPvy?=
 =?iso-8859-1?Q?NrwehZzgSWyjHMDy+9WxUGdhv6XOV7tEkJzMTnGgqp/h93KIu5pvTjxAPu?=
 =?iso-8859-1?Q?c/L/+JYmuLSVkzfBLUAeX7s55cmg5NcKKzRIP7D92bowlWwbuZLZ+coMFi?=
 =?iso-8859-1?Q?KoMn7TtMOcQo65Sv89fZQ5KWs2sMA/iC4Py12RazxFbrsmaMXBVeofFUiZ?=
 =?iso-8859-1?Q?apdiQvINbvKQcTGoOA1kmmhsIpIESEJcN0BsnT9e0irjyyVtH2MsxBr5jz?=
 =?iso-8859-1?Q?8m9qYaKRwpp7V4/U0ZS1SbIPHzD1X7+hdwXU7LdTat+R06wbNH6p0/NCVU?=
 =?iso-8859-1?Q?rqw/uaKaCxd1f4JpxI3rPjGlp796igbZ/P7wNFEFgepA2PmcSiYV4/UlYN?=
 =?iso-8859-1?Q?j8tfnUq1D9kt/DcTI6AQwQ+8T6Kk7Xpu+UuBm9gOi6RMr0AbnFQvrW+ZTd?=
 =?iso-8859-1?Q?uy6/1tck3Hy50RupXBemEOQbjbv4iwSBYCxB/AXlaGEaEcJMIsNu5XeSbZ?=
 =?iso-8859-1?Q?5Z2MXQy2zxjjtqMd6JacBcqoPMCIhanXdNYeHGjtaGzJXmYDWILBBPF9EE?=
 =?iso-8859-1?Q?zrThYU/hvZdCACWhkwaTcJCpDl9dcc8KZVtik3lBpHori9ucThKswin/Sj?=
 =?iso-8859-1?Q?C5i6n+o0hkgl2EDit343mFg+aOounrTzQK4yDJLyIKNx7rM2PrdxGAqB6W?=
 =?iso-8859-1?Q?NXt91IEY/eN2e5eG8yWvca8t1O5+0JUJw1KeRfrTOgEibhEHihxvg8Jrtd?=
 =?iso-8859-1?Q?UXU47bGqjQho7DTnTMChgJpfoKvD506pIEWLsQ/OgGLqUxwOQpy/HFqSYn?=
 =?iso-8859-1?Q?+prwIZ3RGd1SYwcwQCBNeUXod3deUUxXpe9BZnNxZYAwr/De8pCRNon2JN?=
 =?iso-8859-1?Q?v+9RgfEObz6gYS5ULPhlMOeqb+DGj18UzZ/wqZVKk/KhskrwpQSQgL7/ub?=
 =?iso-8859-1?Q?DWcORkQ9Y899owG54kGerhDfit8GRChVD+mqD2VZmONhox+PdeDFaMvek+?=
 =?iso-8859-1?Q?M3FhNdEYezd3wiyF1gy2wyWfDJZywdCW68Ugb2xX0mwcx8Sn4ZquQdDPyZ?=
 =?iso-8859-1?Q?fwtVH0yOhBeNN3x5eXIofQpU1HT3w7AHXrJbfx9Q1zTKavOWi/DJA966HC?=
 =?iso-8859-1?Q?a1Dk4FfUoCzDvyqb5AsKBWc1T++LLM1ucBJMYlz7eZ+Vt4UuhdicT/K0mw?=
 =?iso-8859-1?Q?KTdzCzz+0UYbyulOno39yhF1svBQkrqBEV59giEzhCUlZFxA9RcdBT4KoC?=
 =?iso-8859-1?Q?HUeNYC8wOg3I25xsWovQasaGsclmAZeow00RqPFcXFcLC6xGXMAb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86714c6b-fcc7-4330-c01f-08df46746f43
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 19:36:40.9328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExjrTae0l9FmSGJc48tGzTizMSGU2Q3n/n3p65eZgfYfmvmNDGUTGKPBILBsT+qko6h9j8S2oHTWIAFWcs84vaSgucsFiSbRDZFD6GQUYeTRuGrvJPl65gfRPcMb8YW6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR04MB11225

On Thu, Nov 19, 2026 at 09:26:25AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 8 potential
> issues to consider:
> - [High] media: wave6: vpu->lock held across core device register and
>   unregister
> - [High] media: wave6: data race on work_buffers_avail in
>   wave6_vpu_require_work_buffer()
> - [Medium] media: wave6: stuck PREPARE state on work buf error in
>   wave6_vpu_init_vpu()
> - [Medium] media: wave6: incompatible phys_addr_t pointer in
>   wave6_vpu_probe()
> - [Medium] media: wave6: wave6_vpu_probe() succeeds without required
>   memory-region
> - [Medium] media: wave6: wrong product code value for WAVE677_CODE

Please fix above issues

Frank

> - [Low] media: wave6: off-by-one of_irq_get() error check in
>   wave6_vpu_create_cores()
> - [Low] media: wave6: mixed guard(mutex) and goto cleanup in
>   wave6_vpu_get()
> --
>
> commit 600333b152222fe3a820d242ccd857c34cf7d58c
> Author: Nas Chung <nas.chung@chipsnmedia.com>
>
> media: chips-media: wave6: Add Wave6 control driver
>
> This commit adds the control driver for the Chips&Media Wave6 video codec IP
> to manage firmware loading, shared memory resources, and child core devices.
>
> > diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpu.c b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
> > new file mode 100644
> > index 0000000000000..9160ce53062ce
> > --- /dev/null
> > +++ b/drivers/media/platform/chips-media/wave6/wave6-vpu.c
> [ ... ]
> > +static int wave6_vpu_init_vpu(struct wave6_vpu_device *vpu,
> > +			      void __iomem *core_base)
> > +{
> > +	int ret;
> > +
> > +	lockdep_assert_held(&vpu->lock);
> > +
> > +	/* try init directly as firmware is running */
> > +	if (wave6_vdi_readl(core_base, W6_VPU_VCPU_CUR_PC))
> > +		goto init_done;
> > +
> > +	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_PREPARE);
> > +
> > +	wave6_vpu_remap_code_buf(vpu);
> > +
> > +	wave6_vdi_writel(core_base, W6_VPU_BUSY_STATUS, BUSY_STATUS_SET);
> > +	wave6_vdi_writel(core_base, W6_CMD_INIT_VPU_SEC_AXI_BASE_CORE0,
> > +			 vpu->sram_buf.dma_addr);
> > +	wave6_vdi_writel(core_base, W6_CMD_INIT_VPU_SEC_AXI_SIZE_CORE0,
> > +			 vpu->sram_buf.size);
> > +	wave6_vdi_writel(vpu->reg_base, W6_COMMAND_GB, W6_CMD_INIT_VPU);
> > +	wave6_vdi_writel(vpu->reg_base, W6_VPU_REMAP_CORE_START_GB,
> > +			 REMAP_CORE_START_ON);
> > +
> > +	ret = wave6_vpu_wait_busy(core_base);
> > +	if (ret) {
> > +		dev_err(vpu->dev, "init vpu timeout\n");
> > +		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret = wave6_vpu_check_result(core_base);
> > +	if (ret) {
> > +		dev_err(vpu->dev, "init vpu fail, reason 0x%x\n", ret);
> > +		wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_OFF);
> > +		return -EIO;
> > +	}
> > +
> > +init_done:
> > +	ret = wave6_vpu_init_work_buf(vpu, core_base);
> > +	if (ret)
> > +		return ret;
> > +
> > +	wave6_vpu_set_state(vpu, WAVE6_VPU_STATE_ON);
> > +
> > +	return 0;
> > +}
>
> [Severity: Medium]
> Does returning on wave6_vpu_init_work_buf() failure leave vpu->state stuck
> in WAVE6_VPU_STATE_PREPARE?
>
> Unlike the timeout and error paths above init_done, this path does not
> reset vpu->state to WAVE6_VPU_STATE_OFF.  wave6_vpu_get() then powers down
> the device and drops core_count to 0, and every later wave6_vpu_get() ->
> wave6_vpu_try_boot() sees vpu->state == WAVE6_VPU_STATE_PREPARE and returns
> 0 without booting the VPU or initializing work buffers.
>
> [ ... ]
>
> > +int wave6_vpu_get(struct wave6_vpu_device *vpu, void __iomem *core_base)
> > +{
> > +	int ret;
> > +
> > +	guard(mutex)(&vpu->lock);
> > +
> > +	/* Only the first core executes boot; others return */
> > +	if (atomic_inc_return(&vpu->core_count) > 1)
> > +		return 0;
> > +
> > +	ret = pm_runtime_resume_and_get(vpu->dev);
> > +	if (ret)
> > +		goto error_pm;
> > +
> > +	ret = wave6_vpu_try_boot(vpu, core_base);
> > +	if (ret)
> > +		goto error_boot;
> > +
> > +	return 0;
> > +
> > +error_boot:
> > +	pm_runtime_put_sync(vpu->dev);
> > +error_pm:
> > +	atomic_dec(&vpu->core_count);
> > +
> > +	return ret;
> > +}
>
> [Severity: Low]
> This isn't a bug, but wave6_vpu_get() mixes guard(mutex) with goto-based
> error unwinding in the same function, contrary to the Cleanup API
> conventions in include/linux/cleanup.h.
>
> [ ... ]
>
> > +void wave6_vpu_require_work_buffer(struct wave6_vpu_device *vpu,
> > +				   void __iomem *core_base)
> > +{
> > +	struct vpu_buf *vb;
> > +	u32 size;
> > +
> > +	size = wave6_vdi_readl(core_base, W6_CMD_SET_WORK_BUF_SIZE);
> > +	if (!size)
> > +		return;
> > +
> > +	if (WARN_ON(size > W637DEC_WORKBUF_SIZE_FOR_CQ))
> > +		goto exit;
> > +
> > +	if (WARN_ON(vpu->work_buffers_avail == 0))
> > +		goto exit;
> > +
> > +	vpu->work_buffers_avail--;
> > +	vb = &vpu->work_buffers[vpu->work_buffers_avail];
> > +
> > +	wave6_vdi_writel(core_base, W6_CMD_SET_WORK_BUF_ADDR, vb->daddr);
> > +
> > +exit:
> > +	wave6_vdi_writel(core_base, W6_CMD_SET_WORK_BUF_SIZE, SET_WORK_BUF_SIZE_ACK);
> > +}
>
> [Severity: High]
> Can concurrent calls to wave6_vpu_require_work_buffer() across VPU cores
> race on vpu->work_buffers_avail?
>
> In commit "media: chips-media: wave6: Add Wave6 core driver", each child
> core device calls wave6_vpu_require_work_buffer() directly from its
> wave6_vpu_core_irq() hardirq handler without holding any shared lock:
>
> CPU0 (<hardirq> core 0)           CPU1 (<hardirq> core 1)
> wave6_vpu_core_irq()              wave6_vpu_core_irq()
>   wave6_vpu_require_work_buffer()   wave6_vpu_require_work_buffer()
>     if (work_buffers_avail == 0)      if (work_buffers_avail == 0)
>     work_buffers_avail--;             work_buffers_avail--;
>     vb = &work_buffers[avail];        vb = &work_buffers[avail];
>                                         <-- duplicate buffer or underflow
>
> Two cores can be assigned the same work_buffers[] entry, or when
> vpu->work_buffers_avail is 1, both cores can pass the zero check and
> underflow the u32 counter to 0xffffffff, reading vpu->work_buffers[] out of
> bounds.
>
> Also, when jumping to exit on error, should W6_CMD_SET_WORK_BUF_ADDR be
> cleared before writing SET_WORK_BUF_SIZE_ACK so the firmware does not
> consume a stale address?
>
> > +static int wave6_vpu_create_cores(struct wave6_vpu_device *vpu)
> > +{
> > +	struct device_node *child;
> > +	int num_cores = 0;
> > +
> > +	for_each_available_child_of_node(vpu->dev->of_node, child) {
> > +		struct platform_device_info info = {};
> > +		struct platform_device *pdev;
> > +		struct resource res[2];
> > +		int irq;
> > +
> > +		if (num_cores >= W6_VPU_MAX_NUM_CORE) {
> > +			of_node_put(child);
> > +			break;
> > +		}
> > +
> > +		if (of_address_to_resource(child, 0, &res[0])) {
> > +			dev_warn(vpu->dev, "%pOF: missing reg property\n", child);
> > +			continue;
> > +		}
> > +
> > +		irq = of_irq_get(child, 0);
> > +		if (irq < 0) {
> > +			dev_warn(vpu->dev, "%pOF: missing interrupts property\n", child);
> > +			continue;
> > +		}
> > +		res[1] = DEFINE_RES_IRQ(irq);
>
> [Severity: Low]
> Should the error check for of_irq_get() be "if (irq <= 0)"?
>
> of_irq_get() returns 0 when IRQ mapping fails, which would register the
> child platform device with an invalid IRQ 0 resource.
>
> [ ... ]
>
> > +static void wave6_vpu_release(struct wave6_vpu_device *vpu)
> > +{
> > +	guard(mutex)(&vpu->lock);
> > +
> > +	wave6_vpu_destroy_cores(vpu);
> > +	wave6_vpu_free_work_buffers(vpu);
> [ ... ]
> > +}
> > +
> > +static void wave6_vpu_init_firmware(struct wave6_vpu_device *vpu,
> > +				    const struct firmware *fw)
> > +{
> > +	guard(mutex)(&vpu->lock);
> > +
> > +	if (!fw || !fw->data) {
> > +		dev_err(vpu->dev, "No firmware.\n");
> > +		return;
> > +	}
> > +
> > +	if (fw->size + W6_EXTRA_CODE_BUF_SIZE > wave6_vpu_get_code_buf_size(vpu)) {
> > +		dev_err(vpu->dev, "firmware size (%zd > %zd) is too big\n",
> > +			fw->size, vpu->code_buf.size);
> > +		return;
> > +	}
> > +
> > +	memcpy(vpu->code_buf.vaddr, fw->data, fw->size);
> > +
> > +	if (!wave6_vpu_create_cores(vpu))
> > +		dev_err(vpu->dev, "Failed to create VPU cores\n");
> > +}
>
> [Severity: High]
> Does holding vpu->lock across wave6_vpu_create_cores() and
> wave6_vpu_destroy_cores() invert the lock hierarchy against child core
> device locks and runtime PM transitions?
>
> wave6_vpu_create_cores() -> platform_device_register_full() and
> wave6_vpu_destroy_cores() -> platform_device_unregister() acquire the child
> core device's device_lock (core_dev->mutex) while vpu->lock is held, and
> platform_device_unregister() -> __device_release_driver() also runs
> pm_runtime_get_sync(core_dev) and pm_runtime_put_sync(core_dev).  In commit
> "media: chips-media: wave6: Add Wave6 core driver", the child's runtime PM
> and system sleep callbacks call wave6_vpu_get() and wave6_vpu_put(), which
> acquire vpu->lock under core_dev->mutex or during a core_dev runtime PM
> transition:
>
> CPU0                              CPU1
> ----                              ----
> lock(&vpu->lock)
>                                   lock(&core_dev->mutex)
> lock(&core_dev->mutex)
>                                   lock(&vpu->lock)
>
>  *** DEADLOCK ***
>
> CPU0: wave6_vpu_init_firmware() -> wave6_vpu_create_cores() ->
>       platform_device_register_full()
> CPU1: device_suspend() -> wave6_vpu_core_suspend() ->
>       pm_runtime_force_suspend() -> wave6_vpu_core_runtime_suspend() ->
>       wave6_vpu_put()
>
> During teardown, if core_dev is in RPM_RESUMING or RPM_SUSPENDING waiting
> for vpu->lock in wave6_vpu_get() or wave6_vpu_put() when
> wave6_vpu_release() runs, __device_release_driver()'s
> pm_runtime_get_sync(core_dev) will also wait on core_dev->power.wait_queue
> while holding vpu->lock.
>
> [ ... ]
>
> > +	np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
> > +	if (np) {
> > +		struct resource mem;
> > +
> > +		ret = of_address_to_resource(np, 0, &mem);
> > +		of_node_put(np);
> > +		if (!ret) {
> > +			vpu->code_buf.phys_addr = mem.start;
> > +			vpu->code_buf.size = resource_size(&mem);
> > +			ret = wave6_vpu_init_code_buf(vpu);
> > +			if (ret)
> > +				goto error_detach_pm_domains;
> > +		} else {
> > +			dev_warn(&pdev->dev, "memory-region is not available.\n");
> > +		}
> > +	}
>
> [Severity: Medium]
> Should wave6_vpu_probe() fail and jump to error_detach_pm_domains when
> "memory-region" is missing or of_address_to_resource() fails?
>
> Without it, vpu->code_buf.size remains 0 while wave6_vpu_probe() continues,
> allocates 48 MiB of coherent DMA work buffers and SRAM, and returns 0, only
> for wave6_vpu_init_firmware() to unconditionally fail its size check against
> wave6_vpu_get_code_buf_size(vpu) and leave those resources allocated without
> creating any core devices.
>
> > +	vpu->sram_pool = of_gen_pool_get(pdev->dev.of_node, "sram", 0);
> > +	if (vpu->sram_pool) {
> > +		vpu->sram_buf.size = vpu->res->sram_size;
> > +		vpu->sram_buf.vaddr = gen_pool_dma_alloc(vpu->sram_pool,
> > +							 vpu->sram_buf.size,
> > +							 &vpu->sram_buf.phys_addr);
>
> [Severity: Medium]
> Does passing &vpu->sram_buf.phys_addr to gen_pool_dma_alloc() fail to build
> when phys_addr_t and dma_addr_t have different widths?
>
> struct wave6_vpu_dma_buf declares phys_addr as phys_addr_t, whereas
> gen_pool_dma_alloc() takes a dma_addr_t * third argument, which triggers
> -Werror=incompatible-pointer-types on configs where
> CONFIG_PHYS_ADDR_T_64BIT and CONFIG_ARCH_DMA_ADDR_T_64BIT differ (exposed by
> COMPILE_TEST).
>
> > diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
> > new file mode 100644
> > index 0000000000000..1d4e016c2a582
> > --- /dev/null
> > +++ b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
> > @@ -0,0 +1,37 @@
> [ ... ]
> > +#define WAVE617_CODE	0x6170
> > +#define WAVE627_CODE	0x6270
> > +#define WAVE633_CODE	0x6330
> > +#define WAVE637_CODE	0x6370
> > +#define WAVE663_CODE	0x6630
> > +#define WAVE677_CODE	0x6670
>
> [Severity: Medium]
> Should WAVE677_CODE be 0x6770 instead of 0x6670?
>
> All other Wave6 product codes encode the three-digit model number in bits
> [15:4], so wave6_is_product_w_series() in wave6_vpu_try_boot() would reject
> a Wave677 reporting 0x6770 with -EINVAL.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1795075577.git.nas.chung@chipsnmedia.com?part=2
>
