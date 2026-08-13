Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011004.outbound.protection.outlook.com [52.101.65.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C6C495517;
	Thu, 13 Aug 2026 16:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786640080; cv=fail; b=Js+W0NO04qnQHo0akwQjeyXisYfJxWH63U4HORKhRrvqYViemrrdx2bOyrbQt6ozXGDTHHDnGqw/u1fnlQr0Rmh0Z1B2n/m2zniOSuvUMiGWyR9LHrVfol0vwPrsqhcR8eN/WxAiUx+xBBs6TbTlH0LPqNLjwksntYnQSel+z8I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786640080; c=relaxed/simple;
	bh=9e8BqPcBzoi4lTZP09ZmXzok+FiRfoiT7fTJWVfhkaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oz3CJT50zLzwUtSX951yr32donPWxUUd4Rui4+Z786XmUtVc0eIbRp0hFMaNSapmwG5H5CRLQ5vumxmCUMSHOttN41JzmBF+AzodQdhB8v6PReDRt6jXJORKXqepRPVbV2eCU1ZNsZK9MTjkrmQdWqe2rI/gckbxJWjg2Jqzn10=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cteYegzC reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cteYegzC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yYcLJXOJbeGSKkjqk1WhZqXedL8E50N//fbL1HWd8KwnrMyoytcOZHNNH19q4XbCNfuBWgb4IJ8uRBYEHCJ36L9y7mt2wnSX/oEb1O+rFEy/hNlB/yy7D7pWeB9F8AYi1Ga/1kWVAdE4YR+s3CQg5JFnnNXXtJdqKSYUXQfYHQPW6oEHXXTyR2IYWF2lATCeNG8J79mSyuUyA35PFDa9cKeDmbe1LT+Mn7K1aei+l4a2rvLtlW2+LW7fnLWJZar32SeYC0Qr85R6WmKsVRggEpOLRgB15KyFbgI8EnLg504UtrkdsKRmGmlmdIUqMuFpNOw3esuT/HCgUlrUpCVLYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CmRynr7sXMst/ZRNpW8Raef9vObRV7twnq9gz91sXw8=;
 b=f6mj8HS7Lw7Bh3VtM7scUyvPAjyUasdL/nBiQJw+G2fHS5KrjjAoAw2A170nG+G+DGP3SCEed+OAryNOVcrnAyqb0Ote01a2eTkL9ww7U+sicC2pvhDds1NkXI0Dy0qOu7RKDmoX3nYY/UL9aLABLc+hl/LsDlRf2R4rIZ+swJhk3WH5AGFyU/TtlK74ZnJxQQvhd77hgHYQ3+BTQXjkgIjeGZiXTsYu5Kq4+L2DQmBq6u+O4fFQmroma5Rq+iyj50BBVxm4rXrW4QLvNBa9gUn50w1k8WhRHGGF4a6OHGPgtRo6anNdewlk4Q71z3YtknvZ+cYrlrjTX/6FsPYSWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CmRynr7sXMst/ZRNpW8Raef9vObRV7twnq9gz91sXw8=;
 b=cteYegzC0uNJ4gVwQH/uV5PmIb9GrcOKlUmdhl6Q/YMDyzL4H0PVNazmPcw98xGB6nJrPieNeUNaYCFWRqXAvJ5zeHM1m2kkIIt+xzQ8dIPTUw4cZmUKOG4vTPib+JE6YVHvDsOajrghtWv6c/2aSKPQV5NJIAjwA8kMvyncvitb6OrQjfCzSuVHGiq9V+/oaPp8T6LNdyWmakvKNTteMRIJb/uRp5Hz+V4VtRjjJ0FTAyGV7XYntoJo6f7iIZqZr6nCzgT8OBCG9qRxlmU2fAuPi3PXNHg0TNw7L8Z70JWeImnl2IDAxbIjb6ky0ng7kxYDRxNtOgSsZKV2ZIR0Fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.14; Thu, 13 Aug
 2026 16:54:32 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 16:54:32 +0000
Date: Thu, 13 Aug 2026 11:54:26 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: shengjiu.wang@oss.nxp.com, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v4 3/5] ASoC: fsl_asrc/fsl_easrc: move DMA params into
 pair/context struct
Message-ID: <an32wu6oTkCAwoe1@SMW015318>
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-4-shengjiu.wang@oss.nxp.com>
 <20260813070944.C22CF1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260813070944.C22CF1F000E9@smtp.kernel.org>
X-ClientProxiedBy: PH8P221CA0064.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:349::16) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|PAXPR04MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: c2fcb18d-24f5-4a17-b4e7-08def95b8c23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|23010399003|376014|22082099003|18002099003|56012099006|3023799007|6133799003|4143699003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	GaD7RDj2sPy4JK1eY2io5UdgFFx7kkUVsyZov09Xzf90qQSj7lhyBfNvbDjW/WmgN8L7rKDWTtYO/9Xhd6cOrMIC3dUA/KwQpM9e+vR/nIRzvXJ29yD5xuxXE5FogdGT9sRPRD4CD+QwDHRP/SUSSaT7NRsNvwkg5XsqNkJSFcs9JX2pg8B1oXTszlHyOCnX1L1uHQwMzp8s5Uxkl9rsdwRVMl83yv4zfQ9qe8kGxfgTPzLSA6qIsnMeHmCHAdsqn+NQAIt3UTiZ47eBL4+74S9k0Rnq2mFx/Be511gKiGgGXXZiBlM+jdRLdlyvIVMAyr+Tv4vi+i99O5JI7GfRM+NZIEHBXH+pgYvx0vz199Mk1mW/iUfZW00e61WXUtlfQrCz/vqBoxm0cqKgdFJZ203bbKecf8gNu0NZykBzSZg+Svm7boYluPb2WCn87PXs0vrUvzlrRDpQIx7bvH3sNY+P/ePuXg4XtAZucVgkedGBi7m5mP1wORlreOSFKLl042byzaIWke7GJv+BTas+zyzTh9L4gJyeUupA8AvoxJ4xt/9J5385mfuwHJIuHqNa4YcZdNYmweIg5RhutVFPzDv+a1stktcIMzgr/Srkh9I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(6133799003)(4143699003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?7RzNrhLU4zcPjhXqMlOOgQTR1zejp/nEFC+uyeVbNCfyKIloJlEYCRGtwL?=
 =?iso-8859-1?Q?xFViz2GlOECr9JmAa7vMVawdPB+wbRh3jQmsD1rf7h9r2XY5EOygJ7e5ZE?=
 =?iso-8859-1?Q?X6Ll+ZHhOF3pwjZK6lVvKWBr1NkHYV+rfoMs+PPYdO9O+mNsqYNp7wFfEB?=
 =?iso-8859-1?Q?TGrT9hzn30MGbVo3Kk51Z1oHKTMN4PKj2AdTA6yITcHGoXhovcOQyoWrKG?=
 =?iso-8859-1?Q?b0hXFImie2tYXSa/FUWJ9RmMGuks/tRxASGUX7XuuyHG3NXt/59MJEb5Dm?=
 =?iso-8859-1?Q?k6vC2Ib3kLPj5KIUMM6IwAEfR9JumNJnMgBtlkXvh/NZc1DqYNbopd7oZJ?=
 =?iso-8859-1?Q?USn77+9Rfv7t55oZOvjnK0l/IiP9KFrZzVkvPDwTt2Tkhm+fJVSZ2ixGgt?=
 =?iso-8859-1?Q?wEb1DTrN+vg34sDbxisd9FF8+d5S+Aqgyq5Cw2wfiBu2oi6FzJoac4d77q?=
 =?iso-8859-1?Q?BVrYYvf686rNR4MsjRfbu3MljlC4TOz7qxNeVaHHgGncnBb68/tEZBpylb?=
 =?iso-8859-1?Q?0KDZ0F0iiYNsMfN2h4an1FTHbHBNVY1JKW3zZ+7o9IsYGphQrCm/svv2JM?=
 =?iso-8859-1?Q?/kBuxLcfame40YEvuIU0Omn+Qwn0Y3Cgp5KziXsYe8t6JPZUfa3MYI1l3n?=
 =?iso-8859-1?Q?Or4fYUmloNnlNE+0MMGD7M1kqyzWds29LNj0FLV59mndQtQ/0fXVLghq8L?=
 =?iso-8859-1?Q?NzGTOVoi1LKRQuI2RiZ7LQdDqAWiwjAXnaxlmpaPOgo0JN0e407m+eyWMV?=
 =?iso-8859-1?Q?skUH9DmetBE9p0CUdj+RUSPlP2RRgaeWzmRLCYDjcVvjP9POzOBrQNDY2+?=
 =?iso-8859-1?Q?erDZSu0p3x8EfJV5Q+53B7mzvMtuSFjXpgt/YfIKHoGSD/NVDreJeq2mK9?=
 =?iso-8859-1?Q?577+wf3HuBUBv4b5EZTbV/1ewsFBLrgehcr8AGS32jY9hDa8fbVTzA84ag?=
 =?iso-8859-1?Q?/F7Eyteur2IpBRsQFZpDIYL6jZfP6TbaV1OQYglsIv1TJcZpzIMWFCY7RQ?=
 =?iso-8859-1?Q?SP9u1dF/MaDT1ptmoZpmh/ivdcRiQ3HVCMWGCgmIWibWPcUAkbC7HOsu4b?=
 =?iso-8859-1?Q?qzAthdC9N+YP7dLebvXb9UIvnnFYWW13296puH31eSaxNtMAGTW5WXgit6?=
 =?iso-8859-1?Q?hZ1CqMcnPlj3eqtuSsaC9zyasbRmCmuP+DA21Qt/44IHpIXbzWuz5Eu2jF?=
 =?iso-8859-1?Q?SsV7F5XSj+Eg6fnjscjM90hAZDIVul1FCBCYWYJqGcP/PhxqLalzcOSK/6?=
 =?iso-8859-1?Q?vspztPbMOeOgq13RDCDEeeRZRVTYhUeym2JSuLr9x2k0wmhQHrtW1ee0+4?=
 =?iso-8859-1?Q?YhWapZcpP3CcmlvWbQomKH9KGCwcy6kxk7xEqYyHI1lGJVIygg5ont1fBX?=
 =?iso-8859-1?Q?BxoFw7btA1InhBVAF/UTl/LeRcprEaV4NJJSCesG48gfcg+vltS0kten3W?=
 =?iso-8859-1?Q?rYSYdANuy24pKE2Uh3OnqZh9a7hXCLmKfmxvRe0tqNqyfWFW6io9Rhjsb0?=
 =?iso-8859-1?Q?Pe2dvOej2W5BPRLMsDBJ5M3gPLnGZMj6AMEcOA4kpBVlcqJhdtDx736dxd?=
 =?iso-8859-1?Q?tyRwWZzLqx33tO/JVvTdaezFysTFcgh66h/0E70zh7huBqPzOiYJP6VIfO?=
 =?iso-8859-1?Q?Q0IwJjOfY9kDIcBoF0wmyCDVNcYSmIAY/6ApZh+faVkz1R8CCCtealyMrv?=
 =?iso-8859-1?Q?VtXUkbeGoFCekAhlza28SmHJTeGO2BJhdSwz7ETgR+2bPW55gi2bHL/IFh?=
 =?iso-8859-1?Q?Go33eJtm0tiypIAI5ehJS3O/EFFKdUenGuIlMqk6R2xMGkbxqNGn18bf5C?=
 =?iso-8859-1?Q?7QLRfPfmEufWRHT5OVd5ssBrKDWzSLQ+UzaRTF4I4Fb7AhG/AGFg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2fcb18d-24f5-4a17-b4e7-08def95b8c23
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 16:54:32.4846
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0cV57zXRQA5GaQyeBsSL0uJfZNOAjdqsNEtNCGTwRqpIq7CY1E8JqWQvmf3tPAwMBhNCc9cUH/r2+dkmzm/d2zpcdGIcWyYlfU8lIp7VS2q2yqiWjahHeWjg90P3xYpu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8459

On Thu, Aug 13, 2026 at 07:09:44AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Critical] The dynamically allocated `pair` is freed on stream shutdown without clearing the shared CPU DAI's `dma_data` pointer, leaving a dangling pointer that leads to a Use-After-Free on concurrent streams.
> - [High] The patch fails to resolve concurrent stream corruption because it assigns the per-pair `dma_params` to a shared CPU DAI, meaning concurrent streams overwrite each other's DMA parameters pointer.
> --
>
> --- Patch [3]: [PATCH v4 3/5] ASoC: fsl_asrc/fsl_easrc: move DMA params into pair/context struct ---
> commit 6f9d240bd6e939329ded07360e8ef36835e62929
> Author: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> ASoC: fsl_asrc/fsl_easrc: move DMA params into pair/context struct
>
> The shared dma_params_tx/rx fields in struct fsl_asrc were a single
> instance written by every concurrent fsl_asrc_dma_hw_params() call.
> With multiple DAIs registered (one per pair/context), parallel stream
> open+hw_params races would corrupt addr and maxburst for all active
> streams.
>
> Fix by moving dma_params into struct fsl_asrc_pair so each pair owns
> its own copy. Initialise them in fsl_asrc_dma_startup() where
> the pair is allocated, which makes the per-DAI probe callbacks in
> fsl_asrc.c and fsl_easrc.c redundant; remove those as well.
>
> > diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> > index 2f662bdf14d07..15f2dccc35840 100644
> > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> > @@ -392,6 +392,20 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
> >
> >  	runtime->private_data = pair;
> >
> > +	/*
> > +	 * Point the cpu DAI dma_data at the per-pair params so that
> > +	 * concurrent hw_params calls on different pairs each write to
> > +	 * their own struct and do not race on addr/maxburst.  Use the
> > +	 * per-direction setters so that a concurrent open of the other
> > +	 * direction on the same DAI does not NULL out its pointer.
> > +	 */
> > +	if (tx)
> > +		snd_soc_dai_dma_data_set_playback(snd_soc_rtd_to_cpu(rtd, 0),
> > +						  &pair->dma_params);
> > +	else
> > +		snd_soc_dai_dma_data_set_capture(snd_soc_rtd_to_cpu(rtd, 0),
> > +						 &pair->dma_params);
> > +
>
> [Severity: High]
> Does this actually resolve the concurrent stream corruption?
>
> If the driver registers only a single CPU DAI, won't multiple streams opening
> in the same direction all assign their per-pair `dma_params` to the same shared
> CPU DAI pointer?
>
> The last stream to open would overwrite the pointer. When concurrent streams
> then call fsl_asrc_dma_hw_params(), wouldn't they all fetch this same
> overwritten pointer and write their DMA configurations into a single shared
> struct, continuing to corrupt the data?
>
> [Severity: Critical]
> Can this also lead to a Use-After-Free when streams are closed?
>
> If Stream A opens and sets the shared CPU DAI pointer to its dynamically
> allocated `pair->dma_params`, and then Stream B opens concurrently and
> overwrites the shared pointer with its own `pair->dma_params`:
>
> If Stream B then closes and frees its `pair` struct via kfree() in
> fsl_asrc_dma_shutdown(), the pointer in the shared CPU DAI is left dangling.
>
> If Stream A then proceeds to fsl_asrc_dma_hw_params() and calls
> snd_soc_dai_get_dma_data(), won't it fetch the dangling pointer and write
> `addr` and `maxburst` into freed memory?


Please double check this.

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260813070020.719810-1-shengjiu.wang@oss.nxp.com?part=3
