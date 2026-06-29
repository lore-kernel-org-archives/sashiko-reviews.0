Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012057.outbound.protection.outlook.com [52.101.66.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FD5149C7B;
	Mon, 29 Jun 2026 19:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762369; cv=fail; b=emYvXUJvLUI8uvBYdzoEWmeN3d+zUsgg1o55ezs7u0xo6VhH+x3p7tJAwA2RRjIy6NTaxj2pOFQhu297kjerZHTpJBNZw8rznfawqQSY+o3804YrEjtQXYoV1xEZaTCB5FWdhLCWfkOTpY8BhMBlAFl84K789QOLSannf1FPynQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762369; c=relaxed/simple;
	bh=rF7VDTAUS8oFBuJJBOf6IUK3usvYNVN6qqU08uGMPXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RQNVjtEvCt1SKWxFpnILY6mWQPK+17xEI9Aa6QOIc8RVtOnKjG6wJlFjIcCm6iSp5JSLI5aBRDj7+05cZSbzEYFBKHogrFqhVExY7PbdCj2InlXiilOdkRgYzOKsjvqGyRuXknEGfKJ3xp2Ui/9K7lfKGy9Vk/WX9IcdMtMKDSo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GZVAmCk5 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GZVAmCk5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ag/Dc+PVbuujz3aD/KRAikkJ2UUM5972RWQTh295ogcoB50RannozPOrZ9XrnZquj6Hsd7MY43FkAMqT0l52rKxI6ysWqTwX33dtLYg0jZTE2TU5HIdUsZ6cVemvODez42VKcq/S/Ts4YD6v0U6DE23FEQSpjVZlrhmZ4BRipVv87qh/SrPfLUkgSjwQj8RejkhHmu2o0xtCh2NK74bMI2frgS4/pPN/oYHfbkGpQH6x07LgCccf65kkyXBcazQYBCNi9iQEtNMMPklbVPM0BdMok49ZNxXXq8dtKVtP+ZiW8T9CXW0KRwlBrhVYDAtahnoTmpyiPrwS+kMjCBUTZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=70GLQ+aHoU1cEYBzMqHNo/VQxs1MgnI7nq2TvDpHTPU=;
 b=UKsBkPHDZkyw74tef/DnnJL2/5H517f1i2LpoTjsPpFDqC5N6wZTZ2wLPVGQoWF3U+nD9S+xpf2447D7YliSKafVMEweRNqvjjk7qfPTfgMidE6MPjPy1zlEyV8ST8SjKMSsSWnDoaNthpnf7jYUXj/ir7O4Mlo/+Le9vA5TiFocK0YuLc7yCq08lupq46PgMG7YL5HzRzpmpf2YyeBkY3SV7ZJc0YT6UsrCEGmJcQUUjCVhpGUi3SiezJo/WZT5ihxHIHHgE0043LzB9qf56Dfoo0izMzB17AKXRA7FuYIcV9CgTb9Ww1cvD2v+C1usOIrehqTg1LPI5FqmlFrdEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=70GLQ+aHoU1cEYBzMqHNo/VQxs1MgnI7nq2TvDpHTPU=;
 b=GZVAmCk5LCG/9A0+tUYUtbp4izyCxkGD6Qp6sUS8/4vcLNM6R5tB5wmPPTVA95TrRcwaEZZTmnXMnAB8GBqdgGf6fkGbTQDxSXqGsEeUvJnVxJoPr0QDGv6YdLEH4TbFojgh6a9QMv1fSOgirLkTWARFVVEAoUQaWyTCXXrgIO6UQ6KE6XtphvAHrx9SyXXrzxxJphUe6BC2I//1slleKC9F3PSQoG7wm69Gskao5aso+x6gGn+/4k7bot5ZNiPrWDxN0TG0l5+PRIqL8tK6gOY/sQ+Oa/KnZexDXyTSfk7yEwWIf9dtzMiuxnzfw6KkUJE7IOG3mMkae1xMqdBuUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7101.eurprd04.prod.outlook.com (2603:10a6:800:12e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 19:46:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 19:46:05 +0000
Date: Mon, 29 Jun 2026 15:45:58 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>, Frank.Li@kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v5 2/2] media: nxp: imx8-isi: Add virtual channel support
Message-ID: <akLLdqHJvszefuMG@lizhi-Precision-Tower-5810>
References: <20260521-isi_vc-v5-2-a38eb4fcd58e@oss.nxp.com>
 <20260521100631.7CF5E1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521100631.7CF5E1F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH8PR02CA0013.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a67832e-4a98-4e6f-03a5-08ded6170e80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|23010399003|6133799003|11063799006|18002099003|4143699003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	0yY9tU/FzKOZW0FMwaLybvSrnH1mlP/FVUPMOOk5PYT/gKJqRLi+0E5LSsE4M79emN3MwFxeifOvTYrdnHssNLmUWBntfNbxtE888sIIlGBoiae2OHP5AQzJFgnqiFbDQjZ0ZXGc+mz5ggARY4venhZ2IMW+lmcy9NNzVYF/yrknCQd83EGlDb80eCwngxRCeqvw9dpjs0KOmD1uagYFVnPVK+J5LYH6jbvO39/xqcpg6Nm4pUCA8QzMbwTOHd/n9a5AbbbE3uOVUYjmYd8ypTWvrGV3rmyvv5YWXc+AGtZf+Y6yNHllUpFW1Vd8+j9+/f7w40b5gAMYwDuv89u5Zz+EBo/pSmSVCVY6JECLyuWyZ3+dCC66f4beBZIB4+RYK6ziiBoCk6zDenbZCMnU2khctEjVn/SAZ2Ibh2P0tgKdyWfBKHAouweyg9WnoFZSMPOLaquUnhlcoIRVnK9yO+Yw8LiAgZfMIzC47O8V9dIPKtBWOKJr2Y+41v+982IUYPSk6d2bILAZzgntoY/0ywIHqDS4b61Dg+lg5ybyQLvmIOIcnvn36Yy3P+VPRQE2sBmISXZA0pkj7BNZuMIHD7HN03BJAoCBSprG1CuSFto=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(23010399003)(6133799003)(11063799006)(18002099003)(4143699003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?R9nCnFcZ4QU9D3D7+O8lqbL24MqlI1hxTr/GKPRBj5SkQDJCPUO8PA8kvi?=
 =?iso-8859-1?Q?uSaEl1lO1nQLUift4FTrfuFxuKACpYGW/cjr9+aChN71iHhfA/i5i5sdBp?=
 =?iso-8859-1?Q?lErmQaLFHMRosUZcvPIb5FaWwlgz6khugbAvh2oYTtZuallWWUCvIDbCEH?=
 =?iso-8859-1?Q?zevr1RExPw++ujF69eVUiVsDPCcaGFwVslrnrk/gP6uruht2IBbiZAoBhw?=
 =?iso-8859-1?Q?8bg3HdvSUtoFNl+Rm+O+NGma/PguNu6/SFDqWjt/TebfVetzW2vHGSenRI?=
 =?iso-8859-1?Q?EneLmgc8nU83pax6jDISQTIgfH4wumo1Pd7qjOuUB5W6Niey+ozRAY6gGx?=
 =?iso-8859-1?Q?uKWGwdCWhTGGIitXtHFIpl6xAY9BtfWFlowzQX7b3A2aVzfJ2DTJIDksHr?=
 =?iso-8859-1?Q?FGkk5ZKtkXnZnElOLobfJfC2HRoD5/taiv+2fpuKr9CE7SKC0zVWTEZkta?=
 =?iso-8859-1?Q?qW7M+yF0daE0Cn9BLqTiRuWozg/mYIzAMxC2ct3C4Bg4nbztdaNXzQ5/5j?=
 =?iso-8859-1?Q?MFeus0Yqyh/MizAcYdy4xtzKpkwn6SkUz/l3757TUAmGPTJCfyAeQxraKN?=
 =?iso-8859-1?Q?jH7ZXB5bNheCrY8Y6R+uXndLvNYW+OMbVq5yamhLPJIoQRRmUrbgoxsCP1?=
 =?iso-8859-1?Q?tVY4/ATfKlIso0wjJHneFTnFqTlMsX1p2+lAa5wxwMoLR7mnNz6HL6nVN2?=
 =?iso-8859-1?Q?OVB7wqvu+yvWV+AFNncSlVn6/oFZr6Bt/aOIflU69aVjkd/81onWQi1gmW?=
 =?iso-8859-1?Q?bYyMUbM/3BMvbo74BABQDV6EwSZEP4zJjmhgUToAZVFvYWay8fmgRhfXF8?=
 =?iso-8859-1?Q?HzltcRBEEaakRJAvupa0Ce5nuKjeSeQ+p2Izhr3dxxC6HkcKQ3Rw1Q5pHU?=
 =?iso-8859-1?Q?6/vToGb+l1b345I5K+kOYbz7LlOjo1a2hJZ6NpT9YaiWrdib0krjOvahwB?=
 =?iso-8859-1?Q?sDNFEFfr3TA1nHiIO+mPbX15XfgGp7zoluj6+Gh0TKhvoMZ5nrgSz5T/Hq?=
 =?iso-8859-1?Q?rghzuL/cx8RaGknqKnsv3Eah9EBfI+TFiE86AhH6tSdSoxwF/P7s14eZ/b?=
 =?iso-8859-1?Q?yYlMbbDQ92kd+Q9Ca3fjkX31Fl17cA8WDUqwxrX3XsWhCg0buTFzGN5oMS?=
 =?iso-8859-1?Q?IwwAQL+ZNHytjHgVmf6/qj2hQEK2fy+Maaa03T3sSh7PBZv8AL8KBwmU8d?=
 =?iso-8859-1?Q?XfFrm2qTvf0i4w6OoxGnoVeUL8lxmobPl79vkf3nhsjtoTvqKZFAnTZv6f?=
 =?iso-8859-1?Q?A85Wo9EKCQY3Me3EdE8odLxzP2CM4hvXKKsdOQMefs1TbH1LMaWzXlb0m+?=
 =?iso-8859-1?Q?gRvNEtzqNw8mcBPcGmsdVvcEMh5Y5aYRcpsBvN0os+HB5Eupr/e8h/JiqQ?=
 =?iso-8859-1?Q?N7CDHkorTzUKhM3JGs+lnvQZOhKAXhavRDIzVeawsMU7HFbxzgt3I2eZ6M?=
 =?iso-8859-1?Q?SqPq1LfJmhvc0vtX5ayRTFiPbBqo+8IaXORXlCsZ4aqwqf5kTXC5x1m2Ba?=
 =?iso-8859-1?Q?SwkyP3qSd/eDhFEHNw6eiya7EZq0ozdYb/92U5jmQi9s/Cfb95re4/8oZx?=
 =?iso-8859-1?Q?bNPGtVeGrWzZAlQnBq+cvvTOyrPix+RP5Go0nXNtrc+DI3iPZofzY69N50?=
 =?iso-8859-1?Q?6vp4G5oANVsamv+ix44TGMbe+PyVJxsZBsCYslCL0tdh1r31bJeeTtPEcf?=
 =?iso-8859-1?Q?sOGx3CXEf8XGEMrPtU30CYDv8C65OMuNJq9L9aBbpF2Xokc7y1rDlc3tWW?=
 =?iso-8859-1?Q?BXcJRLfOiB8q0Uff48awsvLCXjGwJ0Hw65G3LVqWsB1YYS2KPukIvcVL2+?=
 =?iso-8859-1?Q?9uoAlpokgKkKJwaTnuT+dR8a8sNwvF9qIK5GQtDLIa1wIb3WwUck?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a67832e-4a98-4e6f-03a5-08ded6170e80
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 19:46:05.0589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dEheEnMDl7dysUoZKvQ2YAbkIR+0ANTB0oSxhIxUtznjHHfQSyKnm/hEWOthMU4LV/3bwA1eAUyjAsPTSYvIc26Vy+kmxLypy0HMYwl6sOg7GxUjbiDQDH/MQlsszpM9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7101

On Thu, May 21, 2026 at 10:06:31AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Pipeline enablement unconditionally fails if the upstream subdevice does not implement the `get_frame_desc` operation.
> - [Medium] The driver unconditionally accesses CSI-2 specific fields in the frame descriptor without validating the frame descriptor type.
> --
>
> commit 4d8a62dc345af085b3b0a217c07143648e85fd35
> Author: Guoniu Zhou <guoniu.zhou@nxp.com>
> Subject: media: nxp: imx8-isi: Add virtual channel support
>
> This commit introduces virtual channel (VC) support to the i.MX8 ISI driver.
> It retrieves the VC from the remote upstream subdevice's frame descriptor and
> applies the required register configurations based on the platform's maximum
> supported VCs.
>
> > diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> > index a41c51dd9ce0f..03e0115b5b5a8 100644
> > --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> > +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
>
> [ ... ]
>
> > +static int mxc_isi_get_vc(struct mxc_isi_pipe *pipe)
> > +{
> > +	struct mxc_isi_crossbar *xbar = &pipe->isi->crossbar;
> > +	struct device *dev = pipe->isi->dev;
> > +	struct v4l2_mbus_frame_desc fd = { };
> > +	unsigned int source_pad = xbar->num_sinks + pipe->id;
> > +	unsigned int max_vc;
> > +	unsigned int i;
> > +	int ret;
> > +
> > +	ret = v4l2_subdev_call(&xbar->sd, pad, get_frame_desc,
> > +			       source_pad, &fd);
> > +	if (ret < 0) {
> > +		dev_err(dev, "Failed to get source frame desc from pad %u\n",
> > +			source_pad);
> > +		return ret;
> > +	}
>
> [Severity: High]
> If the remote upstream subdevice does not implement the optional
> get_frame_desc operation, v4l2_subdev_call() will return -ENOIOCTLCMD.
>
> Does this mean pipeline enablement will now unconditionally fail for any
> sensor lacking get_frame_desc support?
>
> Prior to this patch, the VC was implicitly hardcoded to 0, which worked
> seamlessly for parallel and legacy CSI-2 sensors. Would it be better to
> explicitly check for -ENOIOCTLCMD (and potentially -EOPNOTSUPP) here and
> gracefully fallback to a default VC of 0 to prevent this regression?
>
> > +
> > +	/* Find stream 0 in the frame descriptor */
> > +	for (i = 0; i < fd.num_entries; i++) {
> > +		if (fd.entry[i].stream == 0)
> > +			break;
> > +	}
> > +
> > +	if (i == fd.num_entries) {
> > +		dev_err(dev, "Failed to find stream from source frame desc\n");
> > +		return -EPIPE;
> > +	}
> > +
> > +	max_vc = pipe->isi->pdata->num_vc ? : 1;
> > +
> > +	/* Check virtual channel range */
> > +	if (fd.entry[i].bus.csi2.vc >= max_vc) {
>
> [Severity: Medium]
> This code directly accesses fd.entry[i].bus.csi2.vc, but is it guaranteed
> that the frame descriptor type is V4L2_MBUS_FRAME_DESC_TYPE_CSI2?
>
> Since the i.MX8 ISI also supports parallel cameras, fd.type could be
> V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL, making the access to bus.csi2
> semantically invalid.
>
> Should there be a check to validate fd.type before accessing the CSI-2
> specific union members to avoid potential undefined behavior?


Look like make sense,

Can you double check it?

Frank

>
> > +		dev_err(dev, "Virtual channel %u exceeds maximum %u\n",
> > +			fd.entry[i].bus.csi2.vc, max_vc - 1);
> > +		return -EPIPE;
> > +	}
> > +
> > +	return fd.entry[i].bus.csi2.vc;
> > +}
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com?part=2
