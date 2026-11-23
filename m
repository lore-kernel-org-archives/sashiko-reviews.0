Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.66.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795456615;
	b=d+5usP7TjtCoL5YnQz0jfPCKMx6vr6zG7Ko5++zBVqO+n5MvO0SKx55DJIeJQQ7jPHWp
	 AWzBvSWej6pCTcUDX/YFe9egNbDLDCw7Fm2kMWiD92uXlwZBA7/aK8oXIuNi5K4S5JyLv
	 atXC6vJhfdL8ItmTyYUDifjrsbIgXao7AiSPzxqSI2nkaWlgxN8b2oZGdT1sE4TN5M8qO
	 kgLBFkhVtQNnG5H3QOdxkgrOaLAEJVUtJaCpwMUyTMhW2y+J/PvEKthkH5gktCDgyxk8e
	 aFBT9L6sBGFGGC67Zb0iorypvx6HCh2B/ocRc7h4WOY6iQQoWG/wznZ7LhbgZcNjpaA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456615;
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
	bh=hZERnomQKV2g6U1shDJjy5BpcfECuGPSoagtbTpNEQs=;
	b=ZeQcrOt6vYKovw6w6nUEZXLikAmE+PdYsa9Lu8fJHzWWZcRPqByvxfhdc9dfi2TJdA7+
	 QE7Yhn/fuQmQJs/IjlArkUF2Pb2cAvQR/UlPSiSwrS74SX3vxrsHukcnBSN153ukf4K5t
	 4T03ZHsgVrYMrvYjxP2Hm3yLL59Goz1h6C84LpRu6l2eU0c05KOVM23rMmrz1k3MjSduV
	 tz+/v15ix6980XbpRTs+B4EB8rG7536MR2e2FK8xbFNLTg4ZPHQTqU5O+SZbzyUmtCGg+
	 ZQBOp0QRysgpbp/2lVt2Fy27o+HTeGIC3Blc9f/TwVy1m5+yecm/q2FoiZ+HY71yqsQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aOrLuGXA;
	arc=fail smtp.remote-ip=52.101.66.16
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012016.outbound.protection.outlook.com [52.101.66.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EBC7606A31E;
	Mon, 23 Nov 2026 17:56:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EBC7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=aOrLuGXA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eWwGT9U+3ksRuzsVsjvReFFbMs7dh5OqV0h+Hb/E5488FhJ4HqblsNSdYggDJ81vtKG3/Hx12nb1EUMQu36diwqqd5q4PvzzAQRA82AEpT/SxKroaj99SNOKVwlk1NpuGv4LgytskQ6i9TSYlwm0gtpfiy+GwlUEgA+h8rD7Omcd6lPk5kuYajQbLUHg/eXscJVtEZ+AA3D179vvYd7hbz+YpZVPyF7jpvZL6pC7J6Eyj0af5HMlWZmuxw1iGBgDkplRe9snW12X+3y0YWdYv0vR8bZqsMtXF5LgohrxiHsnatZJeeqr1i8JhutDrDHnAo4ut1ygm4ldJsQmPqlFAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+27HBPNZC5TN3Fp6yT1Dd5UwAsE6p9DoQgR8TmMo8E8=;
 b=aJRBM4xHQBe9EwUUacC63ZXXjIv9XfXK1MBjCXdFpxTCA7ZcOGclAo4CI9+vPXZJDzT71mgRQ5MuGMvUNqBq+0Cw3jkazbm9d29BP3Rki6kTvQknYU7erBMFsx6/imPN3d0kjiy43BmwRY9IF4JnY9u9B49RbtfDF3d+18GU8NTlur2fEpsjX45jHgSDYPEQhPdYFKYdajnKVLn/fUHWB6JweIypAFdcpcrjXGiEO/83RN3qidaBsPhdzLqkBN4lOGh1fTXbE7ES2zXnsaMG60zja0P2l5mF2Hc5Ac1dqAKEe4kZ4IuJnDcPRzXiHCsEWofUAhur7bhoLPIKyx5QrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+27HBPNZC5TN3Fp6yT1Dd5UwAsE6p9DoQgR8TmMo8E8=;
 b=aOrLuGXA0XzmBmbxqzWRBkAhEFu+B0f8zGgwYSsL0vwnn+mznV2N5i4EXQ3WHm4G1FXCZ3k8cnYWoRSKLsU3g1eyEO5GLpfBtJUv6YRkvUMEajg7nHb62garK9a9C1HX4fK7QN0hi2Tu8Z28naEEbP317zpxQMN2R4/9Qlajc1whAxAg/CFNp8hV/ipATq52eIQI7ieDwFn6TElbEv6luLH4Mk8RVfGmGp4kAIUVff9Vsn4T2U6iKkfImfelj4UD1Rg59SK89Bp+0OrdjNFBkAUuF0QJt+mXqXbTdJokXT1tWb4FE8jIJNr6sNsBsZw8z9Ykp6c/dHFEgScd2qIF7A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GV2PR04MB12192.eurprd04.prod.outlook.com (2603:10a6:150:338::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Mon, 23 Nov
 2026 17:56:49 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 17:56:49 +0000
Date: Mon, 23 Nov 2026 11:56:41 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Jiaqi Shi <shijiaqi_develop@163.com>, imx@lists.linux.dev,
	Frank.Li@kernel.org, media-ci@linuxtv.org
Subject: Re: [PATCH v6 1/2] media: imx: remove legacy video node control and
 format handling
Message-ID: <awR-WfnTvAxN6Lcg@SMW015318>
References: <20261122114205.494704-1-shijiaqi_develop@163.com>
 <20261122114205.494704-2-shijiaqi_develop@163.com>
 <sashiko-outbox-227913@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-227913@kernel.org>
X-ClientProxiedBy: PH5P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::17) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GV2PR04MB12192:EE_
X-MS-Office365-Filtering-Correlation-Id: 0004d6d2-cc58-40fb-0364-08df498b2574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|23010399003|1800799024|19092799006|10067099003|4143699003|11063799006|56012099006|261021121427099003|261022075727099003|261026140227099003|261022105027099003|261009223027099003|261028144727099003|261102123227099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	7ZKm7Wy0Y2kN2E2VWx1It4PZ7jti7TJ6Eznx2jt1nYq47OAlEphFFmiJ1lkxQIR0f1zZnwZtWSRpEtBuR9mxM3UfSwQTUk59RpvkLg8D2rxqbRCqXJo3s/Yi/8M5PiLCscE1q/KPYDYu/TgFnWieGNaUE/PvTwFQUgdowu+Zzh2sl7ZwV6DkO4fAkRhasGjMhR5dpEGGX2mkERQ1I8r+uHXG+WOhABiqC/nC5qk4P7do8jK+38Xsxl7unOAb+BWl6zCXlWVracsn0jhMpPr+KsXw3pYMIxezq35TxFQQyz3jSumtSWDOkIxohuq3ZejMeEGEmhfedzMBGd0Bl/M5fEWMKq0Mmv5AzyO9qyKNWSt1qUWM2YOHubkNPi3oNQFSr7BtC+u+E08imYDG0CTNCqsJZMy2gu9yEL7ryPZFoM4gEWnLYuOWRaFYm0OlOwGh6DZZMnIReM42ZTIQzhxr4bEUHCBlyFtl0Ldqy5k/YOA+m7HEz4/5E4goCsbeIpO2637T4iMxAdwOGq0L4uGeAobdubOCRQYNKiRUun7a1yH05hH61vt816Z4zH2gKXYw5OpjTmeA67ztYORFM87BRRVmxKqpoCbJlkwDBZg0M94=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(19092799006)(10067099003)(4143699003)(11063799006)(56012099006)(261021121427099003)(261022075727099003)(261026140227099003)(261022105027099003)(261009223027099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?gqCz8CBeSdMMTDw/6nJD0mj+GlUJFGInB7jXB6hWVWQrxpZlNskn1WW8Ll?=
 =?iso-8859-1?Q?IRpQpwyihxX+zkqCwvaG0NZSHhrLxyHetYfK2OmT3HRF4rYKEBAIQ8jN0T?=
 =?iso-8859-1?Q?bmUUvXjZcNJ1IYkU7UQ4bXNLoFHXDNZQ7jNJKs836KhfIUS5N7CwLOzbfm?=
 =?iso-8859-1?Q?r1uo7VlhiCLbA3C+RNowlcH9ZQhot4MsRxbcvfSBbpM7UFhfe0wRBYl3Rp?=
 =?iso-8859-1?Q?yUgCTpUUJShctsWoVGbgSlLgza0LFqPPjALxugCTvTMuk6/35EngoKywzX?=
 =?iso-8859-1?Q?9+QuMASaPu+/JR/9kFN1UMcQP02d/hc4lmhh3m2AF0FShurOwMMPKvMlJU?=
 =?iso-8859-1?Q?WVKa0Cz+cM4gIK1Pg9t80x/KNBXjFARNlP8sFMj+eIqeQmTvq49vIreO9g?=
 =?iso-8859-1?Q?NGrU4RYipwePmT1qm38SmmmDpfgr4lRtAKqHZcfNTpuL2J3i067gcRUkHq?=
 =?iso-8859-1?Q?197JjsHUjjyAwwx09qYl92SPIBFHSem5X0T3YYqK7UvAYPExrVDLx7KnhS?=
 =?iso-8859-1?Q?OKibjT5aHAHrOqEX83awzJQ5qOJDRkGuUHbwGsYeD947UvY7uhLXRx9Anf?=
 =?iso-8859-1?Q?TtlI6JZQOqHYU95Dcr88KHW7dr5260lOMI37VdpSYGizKrlJi4PeQPkTX6?=
 =?iso-8859-1?Q?6EWVMR209JJNp9O4YK8K9mfaZC3S8T5Sw7UMDRjy4Wnl/CjKZ93EO7YYvF?=
 =?iso-8859-1?Q?b1+1Z7cCiKemLUJNHE/Gn7QIIZ4pNusp5yMxIXIrMrpGLvJwbLAP4xSc5H?=
 =?iso-8859-1?Q?WFuxuQknlikARORi3ysfcgsC6QLX7vA7ziQhrQDP+la2o0PQ0Rq8b1o/mr?=
 =?iso-8859-1?Q?HHPhJNRyjW3cPbGkpNOc8q1Xyv/JFm/KqOKAOIvBklBqnUwq/zhayq+YGV?=
 =?iso-8859-1?Q?HA/LZCYH23DOtDDlBjP3tsNobZwX2OgeidXR6fH1Rna6mb2ZSJ613e4MY9?=
 =?iso-8859-1?Q?1bJrqmjIWpU6M4BQF5SPb/eRpyR2ZVapDoxASXuVFeypLwBsWBGNmfE1f0?=
 =?iso-8859-1?Q?/FVPamsjJLbm1UJeLQxRKFlor0TobfvZFEHByl67KODPsfdc+YcDNEu3IN?=
 =?iso-8859-1?Q?4dpDUDmE98whm+m313FMcxZT8T2Rslwql9zobmhC9m/sTSDlOjde8fAd5a?=
 =?iso-8859-1?Q?MdhorczSmhiQyS2brO7mKur8gu8ofbtm+hHdl+isB1yi3siAoxudgD9LB4?=
 =?iso-8859-1?Q?/B2gzydQzZRfvJUdfA2jCjDn3NVTs7SDjo2a3py2LNLw2N6kh6XQ2/mFzr?=
 =?iso-8859-1?Q?sP23DxE+8s/X592X+6xy4OJCTkCeFZqoE50FpYNJapv2CaoG6qQCOZXuNX?=
 =?iso-8859-1?Q?fHL+lNfO/q84/UzLkZj+qoaIrKmpVQxDvTqeSiPWVanV51hTBfkCV7fMKu?=
 =?iso-8859-1?Q?j0eOqwhUvVgViTM9Y06s3kp+Og6BmkMWs+MxRjIzoja7o08nRnDco5ZoFs?=
 =?iso-8859-1?Q?HTfQ2Qy11uaN3DzSkYBmqm9etPk6HMy5ulQnTWBB2rSti8kXBk7Kq1XVyd?=
 =?iso-8859-1?Q?w40qfLtQ5kuSmC3x6w6MEVVEnE6GTJhoO1RI2RE7D1QSyRvVLjRFGtA3UL?=
 =?iso-8859-1?Q?t5BJ1AoGKLg7UrJt/P77jftgSabVF3MVzcW0Z9B2a663XnhKn9/2bWe4yT?=
 =?iso-8859-1?Q?S5KDLD2Ecf6h4RQO+Bsd75sOEIe628k15x53AwPDtsYNcU9WGIwTOMbG0R?=
 =?iso-8859-1?Q?dp0rUouBrc9zL+0WHqlWjkudcCU6y3SYcu/QjN1mDNzJqkQP72XadOvKSI?=
 =?iso-8859-1?Q?uMMoITWo7hF5tQPnZEYNbhATgiduQGo3pWxE4E3DO3aslVQzxTPpP9mhJV?=
 =?iso-8859-1?Q?sAsGahKOk+0iGdyT6pJY2coLgiaNGDEvXHovqR3BE7lgYyA3XIPo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0004d6d2-cc58-40fb-0364-08df498b2574
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 17:56:48.9565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RW2zGwoWg6UyhjBFlEvsxnuoRPs25BQ3gXBDWzWDbC6VUguQBmUVTHfbC3TF5g8WNg7RHIEGJGiBW6sOArM6VtD8vWWrZST39cK9zH6ZT7PhVDyllW3p2TeXiHSjDjDO
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12192

On Sun, Nov 22, 2026 at 11:53:32AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] media: imx: callers of imx_media_capture_device_init() pass
>   legacy_api
> --
>
> commit f477c79fad0e434429f9fa5c4d3df4807bcb087f
> Author: Jiaqi Shi <shijiaqi_develop@163.com>
>
> media: imx: remove legacy video node control and format handling
>
> This commit removes subdevice control inheritance to capture video nodes
> and switches capture nodes to source-independent format negotiation with
> stream-time format validation.
>
> > diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
> > index 3430ddeac3569..bd4c2e7a0b8d0 100644
> > --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> > +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
>
> [ ... ]
>
> > @@ -1280,13 +1281,13 @@ static int prp_registered(struct v4l2_subdev *sd)
> >
> >  	priv->vdev = imx_media_capture_device_init(ic_priv->ipu_dev,
> >  						   &ic_priv->sd,
> > -						   PRPENCVF_SRC_PAD, true);
> > +						   PRPENCVF_SRC_PAD, true, true);
>
> [Severity: Medium]
> Should prp_registered() and csi_registered() pass legacy_api = false (or
> should the legacy_api parameter and capture_legacy_ioctl_ops be removed)?
>
> Because both callers of imx_media_capture_device_init() still pass
> legacy_api = true:
>
> drivers/staging/media/imx/imx-media-capture.c:imx_media_capture_device_init() {
> 	...
> 	vfd->ioctl_ops = legacy_api ? &capture_legacy_ioctl_ops
> 		       : &capture_ioctl_ops;
> 	...
> 	vfd->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING
> 			 | (!legacy_api ? V4L2_CAP_IO_MC : 0);
> }
>
> V4L2_CAP_IO_MC is never set on any capture device, so v4l_enum_fmt() in
> v4l2-core zeroes f->mbus_code before calling capture_enum_fmt_vid_cap(),
> making its f->mbus_code filtering unreachable from userspace.  In
> addition, capture_ioctl_ops is left unused while
> capture_legacy_enum_frameintervals() remains active and coupled to the
> source subdevice's V4L2_SUBDEV_FORMAT_ACTIVE configuration.


Please check this one?

Frank
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261122114205.494704-1-shijiaqi_develop@163.com?part=1
