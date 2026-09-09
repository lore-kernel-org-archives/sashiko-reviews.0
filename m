Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011068.outbound.protection.outlook.com [52.101.65.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A39279DB6
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 16:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788972008; cv=fail; b=GKtXXdpca9oi0qBtP+7XolN90JtOYBvmb+rAl8ii32KYCHFNyj6tjry7E5w2v8YpOdlZSfBMLPkbmkT0lJjBxdircflcoLhRgF+lRJIdomqBpNvR023qWt1SEZ9Y7QJHi1JQvni546tP/Y+vzJWxSIDJXJSnpCmR7KtjCkXKVK8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788972008; c=relaxed/simple;
	bh=Gt80Apkovq6wmoq0ZeE8qxaFmCSt2DclzeDoXCzGmkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=L2I+Wa8f0Fne0ByazM584so1uOqaewVIMN3hl49fb/ez7jbKnkjclZc/4v73mBE7ZB6kpCLDg5ndXqyy138hNh+NhMKLDjJTGcHE7S5RTOKSXHbRlcUyfg7V8Nf8C4igqod78yRECbQSu6WWBmX2vtJxGQGk/a0frcum7XRcSTU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BHdvSyyw reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BHdvSyyw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kz9QCr0gpzl9J05h3GWGaKq0OyeBJYtWbnRJIasNFjwD7YSwtkHwGQdOqD8TuKpSTgM/YFlbPhXhzT4vZEvsqNpycKRCiAPTq4pc2HrkkZqMbEgLfxbTd1jzUB0MEqRTKPaI7nq+GAzvB8F1sx/+VndYafilGjZq8bl7AuqlR93nNtGIcd+amn4Uabd6//O1j6EQewzsozlihWz1h9umw6fPsCAMgQsyzB64AA1O+/0SvTu4pchWewOufbID/KXKVPAX44riqZNFzsyda7A7UVzincTfKJdJlwHtnn7EHeMk3pqLuoIDsZ5O3o/5Q4C9moGyNKyN3CxPXmf5hw8aNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Eja9NtOALIU699xi34urVEbSN1FuHNB6wwp3E1IpTTY=;
 b=jRcr85iqrsfAAHkEGPM7M1ivo3kKEgpp4lPpc5Csb9LYMw/cF7ZumsdMIzC1HGxGWE9OOTeXKo8CW180PwHB93037biJe3M6EXtk8sgnSsDjpp/SfcBNa7Tx5gThYmGD4qTBELJbui5PlBbzeZKtiroDHtXYPHgWUvepEOaGg8e7foBEFObijczz98bSz6xFYFSKfmVBvBeDimf8Xu1efB85XWM2VWmndcbLZ++F8trTh+mXb7qDblliAbdfRLuMHU+JYPGyjNd58qjXqcopFWpgNhumR6YTS/hgknRre63vuNhKYWNy9lV+E9qqvD+fPzgVp9wZCiLClzlc4o9SOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eja9NtOALIU699xi34urVEbSN1FuHNB6wwp3E1IpTTY=;
 b=BHdvSyywyxcT8haAs/MqHIUqU/ulGoxJUMkCXHFuknQk6xRFd81UtLJwhRjos38qlnhfFiNC/tZAPZauLFxEtFS1VCpikiUbNDBiRCL7z/iuMNj5isWOu1NEZ/Tvpiys9R7hvmRdLv/sFnl0hyCik6r4ljnqini1sWozkiPOWILaImMXJGaqlDLSnDFOB/e5wB9XclK8MVVzVtxJghMp7XnNLLcXcuMLDx9cwWz5ps/tRhoEVkoEtJrEuZ35m4pH0eYJgylvOmajXi285BYU1k0MafS7mhhRBlZ6S3WtXjsCF6FE352u9LR/Iw/Psnfzs2dmBOlUM1HZzAh4r44dIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DBBPR04MB7882.eurprd04.prod.outlook.com (2603:10a6:10:1e7::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Wed, 9 Sep
 2026 16:40:03 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.005; Wed, 9 Sep 2026
 16:40:03 +0000
Date: Wed, 9 Sep 2026 12:39:55 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Nas Chung <nas.chung@chipsnmedia.com>, conor+dt@kernel.org,
	robh@kernel.org, media-ci@linuxtv.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v7 3/9] media: chips-media: wave6: Add Wave6 VPU interface
Message-ID: <aqGL22zVAFBY7BOS@lizhi-Precision-Tower-5810>
References: <cover.1788496816.git.nas.chung@chipsnmedia.com>
 <39115ce2f3d9cc18350cddc650b7cb40317e5ef3.1788496816.git.nas.chung@chipsnmedia.com>
 <20260904070450.80A561F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904070450.80A561F00A3D@smtp.kernel.org>
X-ClientProxiedBy: PH1PEPF000132F8.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:518:1::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DBBPR04MB7882:EE_
X-MS-Office365-Filtering-Correlation-Id: 42400440-bf3f-4e9a-fd5b-08df0e90ff69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|19092799006|10067099003|6133799003|3023799007|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	YyouHC+Ew0Q1Y0Ukj1y2vVKwEGe2tk5lRO6/3BmKD1/GN23SjM0yRuMAwhPxwVRUJBhKAQLzHdyrgzB78s0ejvEiaY4mTVPmYee5225uoc04CDhwtVozmVx6JWsfOyOordKHrpihwdWw6/vCWOT6drbRP4egGhS1QXmdeTYxtLRU4bWUCd6CHIutfWqLc9H4q21qWvZ7XoT9Y+pCz/vNebR54mZrC53UEmmHKqxbbVUCMCBnA/YJ1eskQbx7CKyNzRp/MVpJtc8S+0+/qIAqX3j52SyHH4iMK0Ymx9rcGq5fxcRfBY+khMlVuoOy1QZqwY01JEhBDwVkoTzm9ui1lMN7crF3cQrZ54kx8G/IIj5oMCLagaVOWAtZYb0+dWVcYyOLJHatOKh6flO5l1GQT0E0urpt9qOjuUvCt+lRmT5Gf7E4mHAHucLbfTQlTJDmuQkJ7AMr19DwWXVVPH0bxOlTCryyhjjFnUGD4lK6kz1XY803NpRwaIMvsSfew00LO8BNNRW/8/7OhFjh1bvW+Or/g1iogvRTWFUm0DYMcgrmEhZn2rT1fWwdqeePG2j1eRh7iij9Q+BKFWvkXjbJNvk2CTXGA//3OmA1CiWVtrA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(19092799006)(10067099003)(6133799003)(3023799007)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?DBAxVfU0WA0AEUayVQ9hz89vsO3Gl+wgIGHenqOKmu2l2Fk1zAcX0/Bnw4?=
 =?iso-8859-1?Q?PeIgCT2om8O/IDbtWPclTWKgp1oXTJgBWqKkPR/bM4q/mEqLa1nJDAxQzG?=
 =?iso-8859-1?Q?sG0Zr6lzcGrjJabn+h7UpgzZRcip5m4VU9SEwVVTOnWGCkqeaTNWOQcqt+?=
 =?iso-8859-1?Q?92J25k/5bdtU5qYxeUYhmBHbyGaFqXIWilPVm5VKLFZp8gac+Ccijmil0B?=
 =?iso-8859-1?Q?CG5W2JZ/QfrTchBVWkn4rrNlOX64TQUT2qKoCO465qdg9EU2CdUqlUEFn3?=
 =?iso-8859-1?Q?F9Wn4PPJnMjw6SL/hdVmVoztSCLQ7a5fWXFoCUlKbwi9ndz/O9Ui5YsZHz?=
 =?iso-8859-1?Q?hgEFQaXVw8jkJygdp1OkKEtHQP5WRjK6lCgfNz3UbS4CKnvpyFt2dbR5dq?=
 =?iso-8859-1?Q?uZHxEWIyzbhcLn6CIQP6K5TmQ2OPfq3Z87XLcV8xeO2AhudhVUobpCpbIC?=
 =?iso-8859-1?Q?y7Lvgayfj67M/rete7dXHBeIS8DzFRvV+85VgUVZ0j9FMgHlXsIK+tW2bi?=
 =?iso-8859-1?Q?AU4Z2y1hPVdQMMCUB8/JS+AnyRJtGOJsO091Yhxam+dpJ2I64U/VuIUqod?=
 =?iso-8859-1?Q?gFyGkDCUQ2FrP6eoFgWkIz4EicwNV9YDQrDQz0iLKa8l2RmsjZoHfMheJY?=
 =?iso-8859-1?Q?uSMUYIldKbN+O1cCd5nvlwUYo+6Kxw3tO6aJmGMPOtZX3XU542ZB58yKr7?=
 =?iso-8859-1?Q?76ouZj6+n0a4OuaLwhF+QofkKs6xqZb6qT3LeFhSJjbHTfvdmz0hmlpm04?=
 =?iso-8859-1?Q?47KVeTyLPnZF6cGnx7fWtjSeon7BM0h2JDOd0Gf1q4XBPmqhCCCDiAKmII?=
 =?iso-8859-1?Q?ZFdhLVi/A6BpvGfcfgXiGE5uWOX4fD5WiLupVxKfrzSHZUKehZ6nvoyvYy?=
 =?iso-8859-1?Q?31M8+UsN6TePrxtqDcVnKZsYcC0y+Wfrx9aw100nBWw+uUEVrsD0XlqtvT?=
 =?iso-8859-1?Q?XaUu0ZBmG6iQDLPOdRw11lN/jVHXtBRff/e7pT1PI3nH4Z0Pi0ao1QL/sU?=
 =?iso-8859-1?Q?0nKBKaTIuESSnWzVwfq+WRk1TOHeWYxhvZBBdI2RT11hQyPmelqm4z/4XC?=
 =?iso-8859-1?Q?H1p2TwObjBLJIrSE5b4J+YEJ3zBZ80UcgEDXPHrbhxBrSPp89W+lXJEW7g?=
 =?iso-8859-1?Q?yq8a64L/yqwF/xqxU8/wGQdutbN5BHruM84jHqzQoNsdYh1vkZ7Ovlr2aZ?=
 =?iso-8859-1?Q?VhoLyvmFK0WSd77/L6JnBTJjUgal4rHBJFw1C3XJ7D8heFf+6JXa3Ai0en?=
 =?iso-8859-1?Q?/nvU1yVCkk7y8WS/WG4XC2sa+zhyRrloso1rBgNPCmEGlc6BmUFcIaqbj9?=
 =?iso-8859-1?Q?Bohy6DwnrJsEFHk975gfDYVqHOwVIxnBjzhlkVwDv/mMWMFESeynBtrMPN?=
 =?iso-8859-1?Q?YE3BkZrvLZoN/W5p9UAJHpewwb3HX0D2fRCfekvIYKm0jPQW/xE5tZ83bp?=
 =?iso-8859-1?Q?30wHPX/tXGBbvf1MXBE0AkKn1dJBu54aYpfvtCh+XQbTE3+GbRCTDNgRt1?=
 =?iso-8859-1?Q?bkkdARr7RIIId4kcH5Iwi4wWK9TQozieuF0lfthmO7zPEk4UnHu/J4sU4i?=
 =?iso-8859-1?Q?DylCjGUJFyK1a91ZVS3eX3ukcLOBZ13x3ra2xKoly1gAt9GObJm6tkaEfh?=
 =?iso-8859-1?Q?4RtTf8hMkXv4hIacphf0dadx6/nJdsLIIG84eYyHQiq0S+TLhPlDBzmf0X?=
 =?iso-8859-1?Q?8nR77v8nP/I64a+0q1m2p6OnbWl47K7UnQ8i+XvTxCtjOO9ouNtZVIrdB7?=
 =?iso-8859-1?Q?2wKjq9TOeQsRLcWgvWRxL5HcujlrNXiPUFKESm0eEmay/ZDZZW0/ulR7yz?=
 =?iso-8859-1?Q?r+Zgz0PwmcmFqVa6Hz/Q2/An2rmAG1Fhk+JmcKaO3+0MgVOq0zrA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42400440-bf3f-4e9a-fd5b-08df0e90ff69
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 16:40:03.4973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WRt4wWf4uv6DUkev8+Yd8/QyEQVFoqjfwXXizpqrfzBqQU1JSjZE76fwcAu4WkQpB7fzeAxX1MngIl8fmUpAo7BlW3ppk3ULp6bIWaU3/c27lxpKCPlVQ8JSlXreHUnZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7882

On Fri, Sep 04, 2026 at 07:04:50AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Integer underflow when calculating end index for frame buffer registration causes out-of-bounds hardware configuration.
> - [High] Encoder frame buffer registration fails to group configuration commands, allowing array index overflow into adjacent MMIO registers.
> - [Medium] Silent truncation of RGB chroma format due to mismatched bitmask.
> - [Medium] Display buffers are silently ignored when the metadata array is full.
> - [Medium] Hardcoded little-endian memory layout breaks compatibility with big-endian host architectures.
> --

Sorry, jump in at v7. Please fix AI report issues. or provide judgements

And please CC imx@lists.linux.dev next time.

Frank
>
> commit 5d00a062981a74f9de3d4d2750b7f43dba64822e
> Author: Nas Chung <nas.chung@chipsnmedia.com>
>
> media: chips-media: wave6: Add Wave6 VPU interface
>
> Add an interface layer to manage hardware register configuration and
> communication with the Chips&Media Wave6 video codec IP.
>
> > diff --git a/drivers/media/platform/chips-media/wave6/wave6-hw.c b/drivers/media/platform/chips-media/wave6/wave6-hw.c
> > --- /dev/null
> > +++ b/drivers/media/platform/chips-media/wave6/wave6-hw.c
> > @@ -0,0 +1,2030 @@
> [ ... ]
> > +static void wave6_dec_set_display_buffer(struct vpu_instance *inst, struct frame_buffer fb)
> > +{
> > +	struct dec_info *p_dec_info = &inst->codec_info->dec_info;
> > +	int index;
> > +
> > +	for (index = 0; index < WAVE6_MAX_FBS; index++) {
> > +		if (!p_dec_info->disp_buf[index].buf_y) {
> > +			p_dec_info->disp_buf[index] = fb;
> > +			p_dec_info->disp_buf[index].index = index;
> > +			break;
> > +		}
> > +	}
> > +}
>
> [Severity: Medium]
> WAVE6_MAX_FBS is defined as 31. If userspace requests and registers 32
> buffers, what happens when this loop completes without finding an empty
> slot?
>
> Does this silently drop the tracking metadata for the buffer, leading to
> failures later in wave6_vpu_dec_get_output_info() when it tries to match
> the display buffer address?
>
> [ ... ]
> > +int wave6_vpu_dec_register_frame_buffer(struct vpu_instance *inst)
> > +{
> [ ... ]
> > +	fbc_remain = fbc_count;
> > +	mv_remain = mv_count;
> > +	group_num = DIV_ROUND_UP(max(fbc_count, mv_count), 16);
> > +	for (i = 0; i < group_num; i++) {
> > +		bool first_group = i == 0;
> > +		bool last_group = i == group_num - 1;
> > +		u32 set_fbc_num = (fbc_remain >= 16) ? 16 : fbc_remain;
> > +		u32 set_mv_num = (mv_remain >= 16) ? 16 : mv_remain;
> > +		u32 fbc_start_no = i * 16;
> > +		u32 fbc_end_no = fbc_start_no + set_fbc_num - 1;
> > +		u32 mv_start_no = i * 16;
> > +		u32 mv_end_no = mv_start_no + set_mv_num - 1;
>
> [Severity: High]
> If either fbc_count or mv_count is initially 0, or if they are uneven
> and one depletes before the other in subsequent loop iterations,
> set_fbc_num or set_mv_num becomes 0.
>
> Does this cause fbc_end_no or mv_end_no to underflow when subtracting 1,
> sending invalid boundaries to the hardware?
>
> [ ... ]
> > +int wave6_vpu_dec_register_display_buffer(struct vpu_instance *inst, struct frame_buffer fb)
> > +{
> [ ... ]
> > +	reg_val = SET_DISP_COMMON_PIC_INFO_BWB_ON |
> > +		  SET_DISP_COMMON_PIC_INFO_C_FMT_IDC(c_fmt_idc) |
> > +		  SET_DISP_COMMON_PIC_INFO_PIXEL_ORDER(PIXEL_ORDER_INCREASING) |
>
> [Severity: Medium]
> When the format is RGB, get_chroma_format_idc() returns C_FMT_IDC_RGB
> which evaluates to 4 (binary 100).
>
> Since SET_DISP_COMMON_PIC_INFO_C_FMT_IDC uses a 2-bit mask, does this
> silently truncate the value to 0 (C_FMT_IDC_YUV400) and misconfigure
> the hardware for RGB displays?
>
> [ ... ]
> > +int wave6_vpu_enc_register_frame_buffer(struct vpu_instance *inst)
> > +{
> [ ... ]
> > +	for (idx = 0; idx < fbc_count; idx++) {
> > +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_Y(idx), fb_arr[idx].buf_y);
> > +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_C(idx), fb_arr[idx].buf_cb);
> > +		vpu_write_reg(inst->dev, W6_CMD_SET_FB_FBC_CR(idx), fb_arr[idx].buf_cr);
>
> [Severity: High]
> Unlike the decoder buffer registration which batches commands into groups
> of 16, this loop writes sequentially up to fbc_count.
>
> If fbc_count exceeds 16, could this overflow past the 16 available MMIO
> slots for W6_CMD_SET_FB_FBC_Y (and others) and corrupt adjacent hardware
> registers like W6_CMD_SET_FB_DEFAULT_CDF?
>
> [ ... ]
> > diff --git a/drivers/media/platform/chips-media/wave6/wave6-regdefine.h b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
> > --- /dev/null
> > +++ b/drivers/media/platform/chips-media/wave6/wave6-regdefine.h
> > @@ -0,0 +1,649 @@
> [ ... ]
> > +#define		SET_DISP_COMMON_PIC_INFO_C_FMT_IDC(x)	FIELD_PREP(GENMASK(25, 24), (x))
>
> [Severity: Medium]
> As noted in wave6_vpu_dec_register_display_buffer(), this mask is only
> 2 bits wide. Could this be extended to correctly support C_FMT_IDC_RGB
> (which requires at least 3 bits to store value 4)?
>
> [ ... ]
> > diff --git a/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
> > --- /dev/null
> > +++ b/drivers/media/platform/chips-media/wave6/wave6-vpuconfig.h
> > @@ -0,0 +1,72 @@
> [ ... ]
> > +#define HOST_ENDIAN			VDI_128BIT_LITTLE_ENDIAN
> > +#define VPU_STREAM_ENDIAN		HOST_ENDIAN
> > +#define VPU_USER_DATA_ENDIAN		HOST_ENDIAN
> > +#define VPU_SOURCE_ENDIAN		HOST_ENDIAN
>
> [Severity: Medium]
> Does hardcoding the host endianness to VDI_128BIT_LITTLE_ENDIAN break
> stream decoding and encoding on big-endian architectures?
>
> Could this be set conditionally using standard kernel endianness macros
> to support big-endian hosts?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1788496816.git.nas.chung@chipsnmedia.com?part=3
