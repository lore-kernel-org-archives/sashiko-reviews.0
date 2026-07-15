Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993CF3AFD19;
	Wed, 15 Jul 2026 16:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784131955; cv=fail; b=sCleCcBtqrB0uaKWYp3GJJzY6VCODnw1HpVV88D9SqrTQO9e33m+O2UAbRjJGHVv91ToFmH95YxC1pfbXiXiletbl/upasZkNgrXKLQRb/2xpHgnEMdta0rA1Pyr/zKu7TYJ4hnu+/5q5iq5I1IsqqrvleRN1QhKNwXO8oy3Qtg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784131955; c=relaxed/simple;
	bh=LDGktG7JcC6bmwYp9UwuRGK/ojUqrccO0pUHYVM4I8U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=FfvCwHzOvAYwHY2QHh2P+HK9NVMsKphJiNTG6f+GILQSbI5XIPwBaN17JA13GGYayMJETv2ycJ6iAfyQ9LzEURimuHgq2hEY7Fjoed1XGyARosEqHBa7EQXE2O9mouatSGzztvyhgsBUeQ7xhQsOOaOljXoxtjsPxcYzstCYU1E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FcnPxTwS; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FcnPxTwS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W7KwjnSGcdc1Q2BBUpNSx8vBIHKe/L1whWFzAp+qwSCBQ23M3uDSN6ItLnakoMHvtECvPtTv21J+NzQ8/k6d9OP44j/AefLCNISHtkDpIggv57rY4qWtSj591+p05zDysb3OYTUinJwJ1fjuDRU7RspqxLQKNqF0QK+lhNIQjr5wdU1gjeC7p55ABsHvVsSzhaIX1h2SO+PWO3z7MSlgA82zs3ai6A/g88UVdmB6xpgg3Z/8tvvDYylgsBjLFvtsDJigFX0+QOu4448GpbSpy3zRbgMx0577EdqeOQYHEDcRayhfmV9SZ1huqSC0j3W4ZKPF+XhaNKjoECowEOIaHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/nzhhW7ewkTuvM1mH9EIDPAHu1gRSB90KHSm9GvkGyo=;
 b=qMHPUWSHMXMUp9YKiPz33xnIirzTTvL54UuwcWYJRdjQglQJ5g+I374swwCc/LDmukfYPuH0u2WDP/zmUPKIjc4lFK7rt4EkSeCmUVlmJ0HSN9ka5O94Jqfd3+YMKa6yb1z9JC4Naho35Zz58er9R0ienfrmMZt7x3q/YBfBdgjmkhZpLhCfP2HOYmMUQ9JSf/1+HyJqjUKIYcD5klDp0QAfymLCAyag76JYMSC0dsMZC/NeeidQ99aAs74kt8/wBd+O2GTnkChDlvqamUN1U7B6kwtYSD1Oyt90IlQm7yqjHtP5zvwnP06W6OYBgfhd/3ZH28LY+sU/F4pbrKNy0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/nzhhW7ewkTuvM1mH9EIDPAHu1gRSB90KHSm9GvkGyo=;
 b=FcnPxTwSRHc2IFTiUoc74a202X3m+YZ7uXwuV9YBA1v3zjtE26p1Cpbd/oaHwvP4Vq9s09Gf+ldDl/GF02m3jRKAx1tILwGRlVnBK70xjj7BKiM1zEuKEwlMUgNEayY2KsSg+eeXr1904G7thLfOxz3dBVx9pCVnVSJ3LAtVhvNNtr4cHbXx5LSlRk/Cfm6J4NujBQDc/4XlH/Ow3A+1l6yMgVxryyEqA4JXL0MuBSHgvkPVVOhW0lN1bcx6Rd5XNk/a8znJie6qcxLYB/bivMJHgK2dbEj9Y4EdihyLD5zJ4jSaop3E0IMCgjFZdfAOP0AGy4rcmxAxrnmyaQGFzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB12309.eurprd04.prod.outlook.com (2603:10a6:20b:723::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Wed, 15 Jul
 2026 16:12:20 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 16:12:20 +0000
Date: Wed, 15 Jul 2026 11:12:13 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Frank.Li@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] arm64: dts: imx95-19x19-evk: Add CM7 node and
 related memory nodes
Message-ID: <alexXTYQHUs76J7v@SMW015318>
References: <20260715-imx-rproc-dts-v1-0-d02b583c507b@nxp.com>
 <20260715-imx-rproc-dts-v1-1-d02b583c507b@nxp.com>
 <20260715071741.79CA81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715071741.79CA81F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA9PR13CA0054.namprd13.prod.outlook.com
 (2603:10b6:806:22::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB12309:EE_
X-MS-Office365-Filtering-Correlation-Id: 07563da9-8922-421c-fe18-08dee28bd924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|56012099006|11063799006|22082099003|4143699003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	RLvrR6Hw4sYaayz8rVUA7HUXXQuKQkABWwlzMGn7pqKN73RKSLWC+m/FY+VzIKjEkUw0ZkdFfY8kB4YXHUofe1Q+KIbH0T+NlhB2GU1O32yLj6m1v3I68lruQpYBTk8aAcQxExgSVjFm89j3WWu/1H+TPSJ2H9t9HnHA7CaxD4UtjOIABtLDH5kyRs6EyQfQp38vNBkCOPTcYs83CsbeLF4uC5NVTzgltQ1Q7Yjcn6qgyj1bzhT5pYui86eE8wYujCJZ8B3ZnYIzdytr9aqpXfTObzbNszK+RerfNZeSVWm19J7Bn2P6Jb9ax2QbLvPgs8tLA7ROrPEMT+TJnBl8EmZUG3CUSlNHAsegO2xl8xjMFTmA5e3/jkD5XmC2wvSfPSxO5CbLAY8/+05d+jbh1mnwYO+Ru/vBRtlKINNqxlAsSGjekk9DNZbufHdTedyIEFBE4SgsVPit30Qe5HJHsrUDPx+VW9GRFeHWHeyCwz05NePlfHaig12FJ93QwBebeXGvYSkklss8Zy41WXm/bOjpaUB9/rb14pyJ86jlpeMeqdBI2o7QuARZbKfEY+WLb+Uy80gKppJQOelmV9Ru8WwHS79sJy3/rw51MMD9quE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(56012099006)(11063799006)(22082099003)(4143699003)(18002099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QjQ3U3M5NkhnSXg5RWVyeDZVQ0NORHRDck9RZVJnRTRDaGN5dGlUbWpxbFls?=
 =?utf-8?B?d1VZK1Q1cWVMb1dROGlWb1k2aGVDUEFQVTdmQmN1TUtJU0VBVnZoa3JXYUlW?=
 =?utf-8?B?Smg3N1ExOW1tTlQ2NGpyeUp5UzR5aHVFMUhhbStUUkh6aWJ3ODM0K05SVU1K?=
 =?utf-8?B?NUovdnNvNzV1QTRsT3ovR0Z5VXlKZFgzZXYyeFpYYVJsejA3cmR5YlFkMmRP?=
 =?utf-8?B?ZVlKQ1lkUFVPY2lIcnRTNDdXN0M1SXdWOUFzcXczTThLcUJEdjBTOHdXN1Qy?=
 =?utf-8?B?cGMzUWdtM0U1QTNxSkxXOVc5RHV0VWFGbDN0YkI2ckN3SDJLZXVyaWF5SVpa?=
 =?utf-8?B?WS9iM3lIN25JOUVxRGU2SzRCR3p2T2tkRjRFTEl4a0lVVnk2aUJMNGRDU1Jx?=
 =?utf-8?B?RVMwTUhnZU0vd1FHempFMkgwOUdKQ2hpRW8yKzM3cVd0SlYrQmdiM2J3cGpm?=
 =?utf-8?B?V2QxWUlHT2wwdHN5TVdabGVxU2dIQ1BuK3JkQmZwY0NrZ3NGQzY5YURLeXRP?=
 =?utf-8?B?Q1A4Q1pJV2NrZmRLT0hnRHdEWHJaZUdwdklBMEppYTNGNm4wcUlQa3VTaUlO?=
 =?utf-8?B?YVBwTEFMbytheWxIQ09OUnpma2VFbFFTZjQwVkJOaXQyS3FySy82NmxIUFk2?=
 =?utf-8?B?SnBPaXltZGIxM0dpU3Y2MnVESE5KUVl1aFRyS1ZjakN1ODR6M2ZWTmVKS29P?=
 =?utf-8?B?cWVkdUNCTWkxZUw4WTM4RFlEa1QvUlcvbnNiSVNmcHdydVk2b3c0SjQwditr?=
 =?utf-8?B?Zld0a0VhbEt1NmZIY2liVzA2dno1N3Z0OE50U2IzRnpVa1Jyd2Fwd2hMV1or?=
 =?utf-8?B?SXZzVjBxLy9ONkVMd09IMTVKREFVMjNocldCZzM3dGxoVkprcDFicVpnMHNa?=
 =?utf-8?B?YjVZdlNOYlBVc0p4T2svdElTdTNsdVpUWUFRZjdqbldPczFqMlIwZVdJMVAx?=
 =?utf-8?B?TkowVVFMYm5YcGIyN3hQaGV1UjErTVM4a2JMeGZVT0pMK2UxN0RxSmdheVZz?=
 =?utf-8?B?VUdEUzBqaHBQSHRUc1pBVER0b2dIYUtMOUMvMC9saWkxK04vUjlFbHZCUFpH?=
 =?utf-8?B?UWNqOWpnOHJLUHdZRU8xVkFCbjJTeWM5dGF4R21tTDNDMkJIT1ljakRzWS84?=
 =?utf-8?B?Wm9zOGhMSUowZFpMeFZ1WWFUUzJ5RWoyK0YzRXVGWVlEK3RFVGY3SmtWN1ph?=
 =?utf-8?B?SWtDR2YxeFJYWkpObXFtaGdieWs0aW1sbzB3T0NtWkI4TkQwd3JaZlJaeCs4?=
 =?utf-8?B?Ynd4RDRnZTc0UVFRdys1a3FyY0ZWdjFpb3Vaa1VJdVlEeFBhbmV1azNzVWNO?=
 =?utf-8?B?SGRTZGRENy9ISzNVYVdMME5oOW5PdFd6ZjB1akxJVEhYdWtUVDcyWm5tRS9w?=
 =?utf-8?B?T3ZTUFBtZVBwMlJGbWgrMmdORDhNRVgxcTV6R3RrTGtXR05rTlRlSVdnN3BZ?=
 =?utf-8?B?SUJuK3hnRG1ZTTRDWXJ3bWJZMHl4VG01ZjlZRnBYY201Y1U2eVlCNmZEd2NB?=
 =?utf-8?B?ZUxGRnRuWU45Ui8xcTNiMkxoZ0M3ZEFUVkRpN1puaDRKNFBhd0RWYkxGbysy?=
 =?utf-8?B?eURxL3d0ajRxbjlLN1lOSE1uTHlvOEo3YjRjZk5BOEJKenNLZzBZOFYxVkRx?=
 =?utf-8?B?bk0xcERzMmxDTit6REpDcmg5NGpLK3ljWG5qd2tLWFVVWWtMUFgxakc0SENN?=
 =?utf-8?B?NmpLeWh5ZUk0dTNLTWU1TXBEN0xBblVGRzJ2dklYZXNvai9pb0NOQjBtVCt4?=
 =?utf-8?B?bUFhRWwwTEpSbG9EakZoS0RLaDkzSFRBTDVDM0V0S21sdXlINENSMStjdk1Q?=
 =?utf-8?B?di9idlZIUWlzSHlqKzl2RVdMWTVySm5iVVN4eFRMVnQ3dHY1R2k1QUFRbnB1?=
 =?utf-8?B?cjM4NmpvdFVGcGtYTVRmNVVQczVOVnNRL3hkOFBMVnpWYXFsaUpUUStRWGFF?=
 =?utf-8?B?YWcremczeUVrdFlkN0VuSGVtalQvZkNYZmxFMzlhWkFnVWxsT2JQaG9URG9N?=
 =?utf-8?B?VVJ5TzYwTEdyaktSeGlOeEVwM3BtOWR1ZGFwRFNIVGNxdDg1UGUyUnVobVFr?=
 =?utf-8?B?cFRlS1poaXpoWHpsY3Qrbk5VVWR2QUljY2lkL0lYWFFCNjhBd3ZjWmUrQ3Ez?=
 =?utf-8?B?ZFNVQStaYUU3cjVZYkpGWmQ3ZG1GOUh5Y01ncmNGdnM5VXdmdVAyQlhubzJo?=
 =?utf-8?B?ZWlxa2grMXBEbjdrU3NZWllIZlRTUXZSLzJzMExKcFBtcDZUTmpUQjd3TFox?=
 =?utf-8?B?bWFIOUFCeGtsemxQMlpwVkJ2Y3NzR3JoNHoyaDZwUTB3Snh1cTlLbnkwd3Qz?=
 =?utf-8?B?blFnL2xiZnViYVo0WVpObFAxeEFMTEMyWTMwNUNDajNXc3kwRjA5dzhUU25Z?=
 =?utf-8?Q?X50Q6/qhNVLnIjsd5IJBYQFk3CACwyi1+hmdX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07563da9-8922-421c-fe18-08dee28bd924
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 16:12:20.7739
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dx9dWTYRocqVrzys32+TsP1TYgmqYEI/qcX1uesTGDH2MxlraqCBw92OfCPCpY0UDRHqL0IBFzq80OOkcWkybxFRe/aqGvAswECvh9NzW9kLFWFkUys6mWgpFbNbT2ZU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12309

On Wed, Jul 15, 2026 at 07:17:41AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The virtio device buffer memory region is named `vdevbuffer` which fails the driver's hardcoded check for `vdev0buffer`, leading to it being erroneously registered as a carveout and double-mapped.
> --
>
> --- Patch [1]: [PATCH 1/4] arm64: dts: imx95-19x19-evk: Add CM7 node and related memory nodes ---
> commit b818b56116c9f6f62676b904ae89c90565f8f036
> Author: Peng Fan <peng.fan@nxp.com>
>
> arm64: dts: imx95-19x19-evk: Add CM7 node and related memory nodes
>
> This commit adds a remoteproc CM7 node and reserved memory regions to enable
> the Cortex-M7 remote processor. The reserved memory includes firmware memory,
> vring buffers, a resource table, and a shared DMA pool for inter-processor
> communication.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> > --- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
> [ ... ]
> > +		rsc_table: rsc-table@88220000 {
> > +			reg = <0 0x88220000 0 0x1000>;
> > +			no-map;
> > +		};
> > +
> > +		vdevbuffer: vdevbuffer@88020000 {
> > +			compatible = "shared-dma-pool";
> > +			reg = <0 0x88020000 0 0x100000>;
> > +			no-map;
> > +		};
>
> [Severity: Medium]
> Will this node name cause the region to be mapped twice?
>
> During device probe, the driver iterates over the memory-region nodes in
> imx_rproc_prepare() and attempts to skip the virtio buffer by checking:
>
>     strstarts(res.name, "vdev0buffer")
>
> Because this node is named vdevbuffer instead of vdev0buffer, it appears the
> strstarts() check will fail. Does this cause the 1MB region to be erroneously
> registered as a carveout and unnecessarily double-mapped via ioremap_wc() into
> the vmalloc space?

Look like correct, it should be vdev0buffer@88020000 ？

I hope laurentiu can speed up memory-region-names support. otherwise it
missed CHECK_DTBS.

Frank
>
> >  	};
> >
> >  	flexcan1_phy: can-phy0 {
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260715-imx-rproc-dts-v1-0-d02b583c507b@nxp.com?part=1
