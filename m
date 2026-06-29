Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013070.outbound.protection.outlook.com [40.107.162.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1A33A8730;
	Mon, 29 Jun 2026 20:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766580; cv=fail; b=qLaFTlcWqMshHosgMSEFcZSnZ9lc7MP3q0u00hs07E5+IgYYOCN6z8oy7eX/TM8aRjhLOHT1pOcGJ85cjJARaupRhHcap9YCwbKgmN8xh/vdJ6t5s449YIpe5HfEmmmDEbIwkGlRRSuPJU/YPyY7HrMWWTRrL1gUfEdYRlLQDt0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766580; c=relaxed/simple;
	bh=pZJeAzejV5BQqfG+g7b1BUZGrWtLWhpQOC7it/HcOk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=AuH73TjJvZxEqk2DwqD4RAnZ7op2NstJI6wd4hX+CoA/Jx51oCNO2obUsVMCfiQREpLrlCZnpVSkWYfVkN48cLlVlSpx90I6oiamuYeD0d738CanH93XgIq+kLUcNbzxFXmAQojpKT2ill2I319H1AjZg5InAYJqQk6VVuMLLUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eFW5IZFn reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eFW5IZFn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=as4ztVKMwcjU97SWGcHikUV8J1gt60/XpbCYsr6gkUe2xi3/YN1LfZEwVi5Na7jNgn1GtPGtbKiVYnGTd9tofk0qYRZkENMz2GlwSq2e9V1zJEPXXRWU2mRe+MP84AVsaUgDO1JYerIV7IKYH63vmGV0VjHID+oV7/I8vuvDpHoJ28MmoQ3WnoSvmByOLN20M0NOg5ODo84h1pVNMV0S0QaYRyzqQ2rWvoHrKxBGknOyOilWosDUHGNx/d8korS6PUhKi2Zv5hWK4VVsPYIycOjq/xVeKkyflUeKTateGoqn+ZinWiO0gQlvkckQC1E70BL0h05TD+GJa4prYXNKuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=57pNQ8iOSknf48rIkZGZhZchqOwx8GV8I2DZYyTHZq0=;
 b=i9lLvOzeNCSGElIgTj7D0KepctsKjbpOCoTvxGAbUz9J2IFwNjwuBSQSe7sU9X+8SL8TvBvH+lHYXpFpmWtg6b3ETSx0sN1fJxmNJetb867ENuc/394pfCokHk+coZ6Hjgcz1VgtP2pcQgoUkpaedLVuvrhASfFKD+q5UUI+vcb4H2tjen3p8x8u9PGSraBP2U3Y5myHTgr12W60ZVlJTLFf7EVHGBYyJ+FIDZNX0jpBdW8RlCaXXZP0Ys+yv16XHtb85Sz0Mf1RiioH/S5Zg9o6+FE8NxAdEtduKNFBxtgrcVZqkL0GbgOZjzWNVDGPB9PtFp/zm5kQVrmqhFeWsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=57pNQ8iOSknf48rIkZGZhZchqOwx8GV8I2DZYyTHZq0=;
 b=eFW5IZFnihukXAUgDJ2UnjphF99PagDjOZ3odNluWZ3CxBeooBeX/lxfjliFDrMkghzI6DKu/SkbLDysXsIAE9YvlBDjEu303ArrfVk3jp/K7DFLSiQwrXYfw0BOkzaeLzBADnh4u+rkhf167R+ODBwJv273TFRj3sI3dskFJ58V0LqWOMCVBv/diu/BICZLRk/JZHBc4yyTJ7yM0/lCeE4IdMNXMK+s2cVLB4qvhW9biK56E0Bhn7UwJkTDlB365R4amBJ9cAnGypAa5nW6M6YE+DjTTOoXxUqBkws65TBlTxKMy8nhYMoyZGb0t+tQi60DwvWaA2laxtrCojgwFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB7590.eurprd04.prod.outlook.com (2603:10a6:20b:23d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 20:56:11 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 20:56:10 +0000
Date: Mon, 29 Jun 2026 16:56:04 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: guoniu.zhou@oss.nxp.com, robh@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v11 3/3] media: nxp: Add i.MX95 CSI pixel formatter v4l2
 driver
Message-ID: <akLb5LAzG3SL0P-S@lizhi-Precision-Tower-5810>
References: <20260623-csi_formatter-v11-0-a792fe9c1502@oss.nxp.com>
 <20260623-csi_formatter-v11-3-a792fe9c1502@oss.nxp.com>
 <20260623040548.7EAE31F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260623040548.7EAE31F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA0PR11CA0032.namprd11.prod.outlook.com
 (2603:10b6:806:d0::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB7590:EE_
X-MS-Office365-Filtering-Correlation-Id: f6544e24-9df4-4ba6-ad5b-08ded620d945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|23010399003|6133799003|4143699003|22082099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	QjNgwBIDQx9ZeFUdJVR9VALzfmuUMZcERyKcQ4MwLl+vFiqSOXiltuVMMXlEGcXq5vje5EzterZI22QpNeid96oko4yXsduJteStUYgS2MBq3r5iX1HlcIiwzIJlJ68cBPat1EkGN2Vt9xrc/BX1kkrJ6NgSect9CnPBbkN/eRZiv76yscEfy9e+zMPTJq524CU7W9aorITh3SLDBO2KCi/diQBIfYhV3tr3bOXc3QfhTGKpFcnMmy8+f7EFt+kGXQcE/sOmnKD5MKzN0kLMmndJyl9yMrL71fokB3nqqgffF4RJ90idlivZ8aUT92OaYni05a7v2AEIXoTpKlXG2//Pnwk1BRSnsiN+zPwkHwtmoqjSEBCKqt4KTMCa1syA64e7BJExVu9/fQ1qQ5Qz4uTzTcLK4RoPJTrMdPHyl8ezQ9jiE4t2gUB7UMHzRR0ibA+e35NJkT1lPlVl6P4GiZ2cOaYR/nW+8w1OKtDRzv4yfJAnMPLdhXZxmRMDD4xsX2P6kcd0/NmXX8KSYgxi/NWyfu9o5xdfPJ/OePeHPQ091Pyx4MjzdFjhXbOTBelTeu4tt2hIPKuukPUyvzzZTtnQZyvAPxJ1ViRocTrBScI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(23010399003)(6133799003)(4143699003)(22082099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?5je2yYa1U7lFXa70eQfC9TLCicGuSc8tiYM3Z2ZvgA9l5Wynaai3bZhRyx?=
 =?iso-8859-1?Q?rlCJ6ose9apN55fLqZyEVhvYmxFMKJ2z7wQZQoHyusngwoXMCmf+3UcV7D?=
 =?iso-8859-1?Q?uVfPmmIhNnqAjko7tZo2ukgno/kzcKmUTa0e93h2QDb1BVEsl6N6LbluRR?=
 =?iso-8859-1?Q?F5eh9Jo81RtNvM0LKJ77yqQR1k0ZL2bbVOd5lQcqtyiQEAiZ4FsfH2qUDz?=
 =?iso-8859-1?Q?apxhdrvgFzfKgthLbyHWXwldaXHdE9b2PQsOrI6ajTj1K+LLVXr/HI8bBA?=
 =?iso-8859-1?Q?GFy82g358TvZJU2rk2PtTAjS3n04kzR8zKQAZ0IhJnWbvZNtxw0l9ofIkz?=
 =?iso-8859-1?Q?unCY+zbYry/rYU/ulXDjJN2JfYnrpSNg/GD8sB8qN75zmNqNR4h5wtpP9F?=
 =?iso-8859-1?Q?/B2RtbNCQfcaDI79QcyOC4hYE3unFy+L+KTrXZKWDmoLyjKAzgGIeOJN9l?=
 =?iso-8859-1?Q?OJdPg5zc527rD0qsuSjVAwB23SQdWEETCCO863jf4jiiafq/dNGf76ZtRQ?=
 =?iso-8859-1?Q?Lv+y3gPepQvPmt3Rh9xdnn62UMP6I824rbH+oh8cCuggP7yZQcremiXXHK?=
 =?iso-8859-1?Q?noyXNUTkRY3quNuLrHyK6zxUZcOcOs7LFxNA1TlafpLTR0FAWmQ6G7NV96?=
 =?iso-8859-1?Q?mqMH9oQOlK+bFeMj+eXqbgKlUVoGl8wuJob2XVMhxN9lJqoZYzOg2hMDRX?=
 =?iso-8859-1?Q?edPYGnHKqkKKrG1ggNPPL6oKP+lsGXmMBCuGG6msulwEjHpkLmloFF44vH?=
 =?iso-8859-1?Q?qDpTJRhA1yAtRNClS6JScI+twhptIWRmqE4rHBt2OP4NgN3igUXaQPLqC4?=
 =?iso-8859-1?Q?WiqFhRV9yRjvk3HUFargy2AKZKnlwJg5T47ioprl6g0OmcGcZIV4rfVmKK?=
 =?iso-8859-1?Q?UNhnxoo0Gx8WXMv5jNNrR5RDnMJdf1W5Zw8KerZktNFWbpHdakfgc1wTTL?=
 =?iso-8859-1?Q?HvCErv9HJZqO9YgFCqXJCAjhhVFlQsXZApKlyu8WngV9C4DLzKa5ANJyGD?=
 =?iso-8859-1?Q?gQl774kyyrRNMbIgtaUw7Rtlu5JAJ7tocRsTYaPI7LhHqgx0xOgl8AaP0B?=
 =?iso-8859-1?Q?fFxXpbggN7y4Ohu1csn5VfOLA5lFmWkzjxqpmIZ0lWQCe+taQeyJH5a5Sa?=
 =?iso-8859-1?Q?8tN+Mvuq6ulD+qBljmYaYQloP6L5wK1EF/Plbv8qSAKYXNb+na6yXprm+V?=
 =?iso-8859-1?Q?10Uz2l2SPrYnSkhCSJXcimZGEJiM5d5cToRW/Cf2xWWwVbi0q8YXI85tnF?=
 =?iso-8859-1?Q?DjrjLgbEsWoQoifio7bQO/3VlNebM2WRF69kuPl//nLBb8qAiTGxaji6sN?=
 =?iso-8859-1?Q?wzcHULwkWHjTPoTPexYPvcUMuKSx0ka9ZBnnNdKeQKzXR3mP5C/Vj+AQAw?=
 =?iso-8859-1?Q?RAyJ22U9yiKQQzWFfk7lehHlk5a5HvngFbSKuBs/2HVW6rv3wVw3TfTuJ8?=
 =?iso-8859-1?Q?n7V/YbFimceCfJeVdGa/TcpdDCgy6MUthX7ZEiboqe1U61GzubASE9giXI?=
 =?iso-8859-1?Q?u868q7o+f5HGFe4mKWf6HHWm+yFBdCCP4nrKNJVbrH7+sHP6Tt5rKyOveK?=
 =?iso-8859-1?Q?+X7NefBGuNTTz2FyZkqfJq89OjnYpSIWQ3+mBl1EAapSGjuOQVWOy8cvu1?=
 =?iso-8859-1?Q?nLkl3AVd1fHc81E3KFALDHQFQOhSIaQDloQMr9iE6U2X5BxkiC3W9+Rx6j?=
 =?iso-8859-1?Q?/nyzIqi1YOe/mIM99NuZ2Sw/xTMaJxHfrMHqYoLCPpNiSaFhfCx0v7CPea?=
 =?iso-8859-1?Q?WrumuZxfab5tdiLtYskD6ahK8vTvLFDv1shHH7K1+WY69icE7B+301FU+s?=
 =?iso-8859-1?Q?flIsSXZ3cV6v0MmzJXg0+dnv+I5PbaKqM8LwBNq2Me/jhzLOpuKZ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6544e24-9df4-4ba6-ad5b-08ded620d945
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 20:56:10.8669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g9+SDe22f/ySVKSi0rwR9XSMLAD+urtWESoSagodzSRszKtVf0KnCzXzE5FhY3I3Lkd7UZfigCc9liqety+LDvbdtTHa91gsETLklaY3JDD9ul1ukljFT/o0ouCJtkgJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7590

On Tue, Jun 23, 2026 at 04:05:48AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 8 potential issue(s) to consider:
> - [High] Missing NULL check for the return value of v4l2_subdev_state_get_format() in pad operations, causing a NULL pointer dereference.
> - [High] The driver incorrectly assumes source stream IDs match sink stream IDs during stream start, leading to a NULL pointer dereference.
> - [High] Unbalanced PM runtime put in `csi_formatter_subdev_disable_streams` due to state desynchronization on failure.
> - [High] Dangling `csi_sd` pointer leading to Use-After-Free if the remote subdevice is unbound.
> - [Medium] The driver fails to validate stream ID bounds, silently ignoring stream IDs >= 8.
> - [Medium] Overwriting the Virtual Channel Data Type register breaks multiplexed streams sharing the same VC.
> - [Medium] Mixing `goto`-based error handling with scope-based cleanup helpers (`__free` and `guard`) in the same function.
> - [Medium] Setting the format on an unrouted sink stream incorrectly fails with `-EINVAL`.
> --
>
> commit cca7db4730915ca13295d8053b3569d5e6266e0d
> Author: Guoniu Zhou <guoniu.zhou@nxp.com>
> Subject: media: nxp: Add i.MX95 CSI pixel formatter v4l2 driver
>
> This commit introduces the i.MX95 CSI pixel formatter v4l2 driver,
> adding data formatting support to match Pixel Link (PL) definitions.
>
> diff --git a/drivers/media/platform/nxp/imx95-csi-formatter.c b/drivers/media/platform/nxp/imx95-csi-formatter.c
> new file mode 100644
> index 0000000000000..cfe448fedd37e
> --- /dev/null
> +++ b/drivers/media/platform/nxp/imx95-csi-formatter.c
> @@ -0,0 +1,775 @@
> [ ... ]
> > +static int csi_formatter_subdev_enum_mbus_code(struct v4l2_subdev *sd,
> > +					       struct v4l2_subdev_state *sd_state,
> > +					       struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +	if (code->pad == CSI_FORMATTER_PAD_SOURCE) {
> > +		struct v4l2_mbus_framefmt *fmt;
> > +
> > +		if (code->index > 0)
> > +			return -EINVAL;
> > +
> > +		fmt = v4l2_subdev_state_get_format(sd_state, code->pad,
> > +						   code->stream);
> > +		code->code = fmt->code;
>
> [Severity: High]
> Is there a missing NULL check here?
>
> If the requested stream is not found in the state,
> v4l2_subdev_state_get_format() returns NULL, which would cause a crash when
> dereferencing fmt->code.
>
> Userspace might trigger this by passing an invalid stream ID.

Does it really happen?

>
> > +		return 0;
> > +	}
> [ ... ]
> > +static int csi_formatter_subdev_set_fmt(struct v4l2_subdev *sd,
> > +					struct v4l2_subdev_state *sd_state,
> > +					struct v4l2_subdev_format *sdformat)
> > +{
> > +	struct csi_formatter_pix_format const *format;
> > +	struct v4l2_mbus_framefmt *fmt;
> [ ... ]
> > +	v4l_bound_align_image(&sdformat->format.width, 1, 0xffff, 2,
> > +			      &sdformat->format.height, 1, 0xffff, 0, 0);
> > +
> > +	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad,
> > +					   sdformat->stream);
> > +	*fmt = sdformat->format;
>
> [Severity: High]
> Can this result in a NULL pointer dereference?
>
> Similar to the enum_mbus_code operation above, v4l2_subdev_state_get_format()
> can return NULL if the stream is invalid.
>
> > +
> > +	/* Set default code if user set an invalid value */
> > +	fmt->code = format->code;
> > +
> > +	/* Propagate the format from sink stream to source stream */
> > +	fmt = v4l2_subdev_state_get_opposite_stream_format(sd_state, sdformat->pad,
> > +							   sdformat->stream);
> > +	if (!fmt)
> > +		return -EINVAL;
>
> [Severity: Medium]
> Should this return -EINVAL when there is no internal route configured?
>
> Valid requests to set the format on an unrouted sink stream will fail here,
> which seems to violate V4L2 semantics where the format on the local sink pad
> should still be accepted even without an active route.
>
> > +
> > +	*fmt = sdformat->format;
> > +
> > +	return 0;
> > +}
> [ ... ]
> > +static int csi_formatter_start_stream(struct csi_formatter *formatter,
> > +				      struct v4l2_subdev_state *state,
> > +				      u64 stream_mask)
> > +{
> [ ... ]
> > +	for (i = 0; i < CSI_FORMATTER_VC_NUM; ++i) {
> > +		if (!(stream_mask & BIT(i)))
> > +			continue;
>
> [Severity: Medium]
> Does this fail to configure stream IDs higher than 7?
>
> The loop terminates at CSI_FORMATTER_VC_NUM (which is 8), silently skipping
> any higher stream IDs present in the stream_mask.
>
> V4L2 subdev routing allows stream IDs up to 63.

Is it true?


>
> > +
> > +		fmt = v4l2_subdev_state_get_format(state,
> > +						   CSI_FORMATTER_PAD_SINK, i);
> > +
> > +		pix_fmt = csi_formatter_find_format(fmt->code);
>
> [Severity: High]
> Could this crash if the source stream ID does not match the sink stream ID?
>
> The index i iterates over the source pad's stream_mask, but it is used here
> to query the format of CSI_FORMATTER_PAD_SINK.
>
> If userspace configures a route where the sink stream ID differs from the
> source stream ID, get_format() will return NULL, leading to a crash when
> accessing fmt->code.
>
> > +
> > +		val = BIT(csi_formatter_get_index_by_dt(pix_fmt->data_type));
> [ ... ]
> > +		/* Store the stream to VC mapping for stop_stream */
> > +		formatter->stream_to_vc[i] = vc;
> > +
> > +		csi_formatter_write(formatter, CSI_VC_PIXEL_DATA_TYPE(vc), val);
>
> [Severity: Medium]
> Will this break multiplexed streams sharing the same virtual channel?
>
> Writing directly to the register completely overwrites the configuration
> with the new single bit, which would destroy any existing active data type
> bindings for that virtual channel.
>
> Would a read-modify-write operation be more appropriate here?
>
> > +		configured_streams |= BIT(i);
> > +	}
> > +
> > +	return 0;
> > +
> > +err_cleanup:
> > +	csi_formatter_stop_stream(formatter, configured_streams);
> > +	return ret;
> > +}
> [ ... ]
> > +static int csi_formatter_subdev_enable_streams(struct v4l2_subdev *sd,
> > +					       struct v4l2_subdev_state *state,
> > +					       u32 pad, u64 streams_mask)
> > +{
> [ ... ]
> > +	sink_streams = v4l2_subdev_state_xlate_streams(state,
> > +						       CSI_FORMATTER_PAD_SOURCE,
> > +						       CSI_FORMATTER_PAD_SINK,
> > +						       &streams_mask);
> > +	if (!sink_streams || !streams_mask)
> > +		return -EINVAL;
> > +
> > +	guard(mutex)(&formatter->lock);
> > +
> > +	if (!formatter->enabled_streams) {
> [ ... ]
> > +	ret = csi_formatter_start_stream(formatter, state, streams_mask);
>
> [Severity: High]
> Is the wrong mask passed to csi_formatter_start_stream here?

Please check this one?

>
> It passes the source pad's streams_mask instead of the translated
> sink_streams mask.
>
> > +	if (ret)
> > +		goto err_runtime_put;
> > +
> > +	ret = v4l2_subdev_enable_streams(formatter->csi_sd,
> > +					 formatter->remote_pad,
> > +					 sink_streams);
> > +	if (ret)
> > +		goto err_stop_stream;
> > +
> > +	formatter->enabled_streams |= streams_mask;
> > +
> > +	return 0;
> > +
> > +err_stop_stream:
> > +	csi_formatter_stop_stream(formatter, streams_mask);
> > +err_runtime_put:
> > +	if (!formatter->enabled_streams)
> > +		pm_runtime_put(formatter->dev);
> > +	return ret;
> > +}
>
> [Severity: Medium]
> Is it safe to mix goto-based error handling with scope-based cleanup helpers
> in this function?
>
> This function uses guard(mutex) for lock management but also contains goto
> labels for error unwinding. Mixing these approaches can create confusing
> resource ownership semantics.

This should be fine, can you check other comments?

Frank

>
> > +
> > +static int csi_formatter_subdev_disable_streams(struct v4l2_subdev *sd,
> > +						struct v4l2_subdev_state *state,
> > +						u32 pad, u64 streams_mask)
> > +{
> [ ... ]
> > +	ret = v4l2_subdev_disable_streams(formatter->csi_sd, formatter->remote_pad,
> > +					  sink_streams);
> > +	if (ret)
> > +		dev_err(formatter->dev, "Failed to disable streams: %d\n", ret);
> > +
> > +	csi_formatter_stop_stream(formatter, streams_mask);
> > +
> > +	formatter->enabled_streams &= ~streams_mask;
> > +
> > +	if (!formatter->enabled_streams)
> > +		pm_runtime_put(formatter->dev);
> > +
> > +	return ret;
> > +}
>
> [Severity: High]
> Can this cause an unbalanced pm_runtime_put() if disable streams fails?
>
> If the upstream v4l2_subdev_disable_streams() call fails, the function
> still clears the bit in enabled_streams and calls pm_runtime_put().
>
> If userspace later retries stopping the stream, this code will run again.
> Because enabled_streams is already zero, the condition
> !formatter->enabled_streams evaluates to true, causing a second
> pm_runtime_put() call.
>
> [ ... ]
> > +static const struct v4l2_async_notifier_operations formatter_notify_ops = {
> > +	.bound = csi_formatter_notify_bound,
> > +};
>
> [Severity: High]
> Does this missing unbind callback lead to a use-after-free?
>
> The driver stores the remote subdevice pointer in csi_sd during the bound
> callback, but does not provide an unbind callback to clear it.
>
> If the remote sensor module is unloaded, the dangling csi_sd pointer could be
> dereferenced by subsequent stream ioctls.
>
> [ ... ]
> > +static int csi_formatter_async_register(struct csi_formatter *formatter)
> > +{
> [ ... ]
> > +	struct fwnode_handle *ep __free(fwnode_handle) =
> > +		fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0,
> > +						FWNODE_GRAPH_ENDPOINT_NEXT);
> > +	if (!ep)
> > +		return -ENOTCONN;
> [ ... ]
> > +	ret = v4l2_async_nf_register(&formatter->notifier);
> > +	if (ret)
> > +		goto err_cleanup_notifier;
> [ ... ]
> > +err_unregister_notifier:
> > +	v4l2_async_nf_unregister(&formatter->notifier);
> > +err_cleanup_notifier:
> > +	v4l2_async_nf_cleanup(&formatter->notifier);
> > +	return ret;
> > +}
>
> [Severity: Medium]
> Is it safe to mix goto-based error handling with scope-based cleanup helpers
> in this function?
>
> This function declares a __free() variable but also uses standard goto
> unwinding labels, which can lead to double-free issues or confusing
> resource semantics.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260623-csi_formatter-v11-0-a792fe9c1502@oss.nxp.com?part=3
