Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.65
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792701635;
	b=YsnADyvZCfQaWpin3zyTl3lqRW0kTUPgYn6tLO4LRhljZRnkoW0SkhVwo0oFZZigNBdr
	 Ycbw5wyCbuTQIeQyIBQOPUDaTJEWkhV1Ia0zjrLaoNLPgSbFOqrJzusgKzta9IyFxeKOc
	 WWDOqyNSqvHLfCAvtRo7yTbhslbpMHZFkGaof018sdZWCFxtyEoJ/ltnNhh1mUnT1J5Ha
	 HSIotgQmeaABxQkV1N91JtS9d9ud/iEL0eIgFQooG2flG++DQ9BObsa0QMntCDv40LybC
	 ITSeAq8rpx9co6NMkUr1lRetWINjFcaT4dEL/eh/ZSJl0hSGLocKZ53sScNb9N6wWUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792701635;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=29uYZ3MI3ajddo/lkMf4kDoPDZSo+wMUk8ZudWJScSw=;
	b=wd6mfC0hzmC/qQuKuNqyMWbV+hod1kvlq/Oxq9UpOgR/gBTbmb3Uh1z1n3OPcBVPiRJa
	 cx6R11lkc669tIa78QDOrcj3VfTi/M3iPOBJEH+sDzdjAlymmtvZGFwDHNSmvnIFujQJp
	 FN+BhIoC1ronmbKba+8/HQOm/tegyjaUJVSKe2Rfe67O0VxhV/gnJxpuUmobVFNcD9uts
	 YmlNyjAT1NoidFGy3/WYlr7N3PNzSCcy2zkMIihuqeiKlDBgNUa3A8pbOKNLN6Zrx3LeQ
	 4GvTNkjipbVjVBGjTZM1g/Qs+Uhiz5JDZOyH89tomk6F1ieDXaYVozSbDBnbBxMwK5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=BZgNig9C;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.65
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010065.outbound.protection.outlook.com [52.101.84.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B19606A319;
	Thu, 22 Oct 2026 20:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7B19606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=BZgNig9C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UTCSDRFRjwcgujxBG5KjtMtXToP4IrlSS32+79sueAEkikqh+WrFTRezFpDEBD9vweGvnJR8+n8LRrXDllFHchkvTdGr7a72dgOdCreg9WMoLNOejjhPDRsAXtH9U8CZjxS7Bmw557ySkBrUxSflTeEhebGayMF3DvoUe0s6zwid+95Oa89IRsF6Yck8CG1T+pYoEib53Tc7rRmp+GPbDsHs7PAYn0hV7N4N3YsjrhdXEQbL7xr+TTRGZrreBf5Wg0yRt1m9gaENAdb+3dDC7c0R0+hdZ9d5jL+vfidHcfNFDclRh+sH1acVSnFcbFmYb4yU1uei1cud2/tNnSfzjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29uYZ3MI3ajddo/lkMf4kDoPDZSo+wMUk8ZudWJScSw=;
 b=L8kUs4kMBkcoKD3sTG7Azxj8K/prhOr0kegQ4TC8bPXd3G4iyrfQ5cwGt7XKt72qhYF0qWPe4LNs2GEU0ajNVmnFgduVAmUB/E6a7cba13PUVMeYkyA2+gO3x9AVkmnLtyFExJ9VEmN4bn5pHfuzHyCS3lE0nrH8+gXonQcobcQIiyAF3r4G4eXVW3+yJSYiNCPOr6gHH/y7cJlHlj3bS1T+DvALZa/GUmBN9phlZyLg+GkEEeCDS3Id6Cs2glThwT89UixzyrJz/mJxew3jht5eythimPOpExHrB1Q7bgl32yWZ+Qn/Z4pJlysOlJ/cVdXn2o7/sJaNmcb5DSY8wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29uYZ3MI3ajddo/lkMf4kDoPDZSo+wMUk8ZudWJScSw=;
 b=BZgNig9CEfwYz+9yDkpsTg27sf5Dar5Z5wD+B/3JPiI2r/lVnpCvMjPlCgkpiY8zo6Wr0l0lHE8gUEutrfPGyw7Gvf3JxNJvgVnGYV/JXE3jvxUAxk7wEGbe/r6n1bTLefuhkmqa4o2ZM6hWdOXULgC3PeO0EMvBSp6rZZU7OIlb/Be+LBolt40kj3JiAq5xka7TGJNkIg7ry7MBq0T0Zrd9HF19LTXaFboJLl9f1jv23IcRshbRFg9YUp+rCo+HSSn4zX20S7T+6AcMggFBVGvLqGL4WB85kxBLe8nJ3w8qVk71qCkyFQOru9GosCzO5ZBleD3Ki9RY/IkkIr+y1A==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by PA1PR04MB10868.eurprd04.prod.outlook.com (2603:10a6:102:482::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 20:40:32 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 20:40:32 +0000
Date: Thu, 22 Oct 2026 16:40:25 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: "Joseph Guo (OSS)" <qijian.guo@oss.nxp.com>, imx@lists.linux.dev,
	conor+dt@kernel.org, Frank.Li@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH] arm64: dts: imx95-19x19-frdm-pro: add boot phase
 properties
Message-ID: <atp0uQDD8EuhYyb1@lizhi-Precision-Tower-5810>
References: <20261012-bootph-frdm-imx95-pro-v1-1-6757c5f04a17@nxp.com>
 <sashiko-outbox-167770@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-167770@kernel.org>
X-ClientProxiedBy: DS7P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::26)
 To MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|PA1PR04MB10868:EE_
X-MS-Office365-Filtering-Correlation-Id: ea3626da-00a0-47fd-b259-08df307cb737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|1800799024|18002099003|22082099003|11063799006|4143699003|261009223027099003|261021121427099003|10067099003|261022105027099003|56012099006|261022075727099003;
X-Microsoft-Antispam-Message-Info:
	SFX4bAjY+41WpnXUeXiuEf3t+2MExGngPnbv6ThejuKiFmXoa3s+agvsm04Yrps7pm6Qme2tEGLUTI1cAkoP1lqGpXtsHgGgFEYL7AzDHaScDj8WJxwwRnI3mLAN/pzCG3ngyJkUVgb4JbPol/UMdDiyg9B8Bnz5AxEq6TZKkE28sxTcUBPtzkalzbU6L7xEe0cvPehh4+8NSXTwnD1AbjS0/+Pkuhp6OIdtCM3vwwMTid6Gz/1LJ+jrazI8DdN9lB53F8Rd+u7NU27MCR+Dcrb7Y8pZgtcL//ciEAe7qBo6aYrwX9yQ6u2RGDpTn3gTw7cZCyMuHs7kXOotIK7USeZggzDrY0WN08CRj+07aryAiabtPSmT4snYeo1gfpqDm18xeQifJL+ugfn3IcMbT6BIKDii8ni+kjFTRt47y/SpE2jsGtx9+tA6ioMF5Weg4dIuFukTmxaRMTWkPpYfvTBPkHCR+3lz4j9N8Pg45AbDXoYsm0Id8a3ksOcG1YSCr5o7D/O0oi6ki/MstLerIMvbhaCG1S8Z93vlu+DuDX2NVuredV0KBcmiAG6rlV466eUgMS/YDtCRvsDJDHVv5a7awq6Oalij0vIZGDMUne4/eyzbeNOCProVnptKEeUhJBmRKkboEeCSXcZ09O92wQf9FAb1si0VOlQ96JNj+QY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(4143699003)(261009223027099003)(261021121427099003)(10067099003)(261022105027099003)(56012099006)(261022075727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5acRA46tsOAfuSnXq0JHciqVR559pfBt6vpBHiak7kOd5qna5Ts9whWriTkk?=
 =?us-ascii?Q?yUImUzGlcsVRPwZZvqjfcIzNKkt4uQOOPAXxjHFuyN54x2BPYtBM5eyLoIlm?=
 =?us-ascii?Q?Pbh9CGh5cw3+sZK8IOZJ3x0GR2ouzIi1YIhdKMcZerSXdqQuuuUFM3ct+dB4?=
 =?us-ascii?Q?cNIgw6T1ry4HlUUq3e7aXF346hXyRicFQzMbS35RNr280iPKqaFc5BDZUXLg?=
 =?us-ascii?Q?EkD1QFmJtprwnomvZmFhVOX3oQYyB3iJUel2LD1xkCHpqJqc9T/vy2pacwyM?=
 =?us-ascii?Q?n1YLnGlLhdCJ3AivcXpzzOjCE6tkzcdSfsMwA564HONhn1rH98djtfSPM4TO?=
 =?us-ascii?Q?FBu1aUj+4Zz5c+M92YhNVBPB/56fGwUUfVnNGh4d8HiE6yDNGuU8+xpeyb6Y?=
 =?us-ascii?Q?Ai0nmJ0INNlBi7TxNKByZPchnrAn1YjoruWt1PuQcjCdMUTj+vLZHQTCpQbq?=
 =?us-ascii?Q?BQ462Ynv05yLsbt12JCqHjby7XG/K5KaPCEwTTkoqSOuOW1K0xGgEH6ukGBw?=
 =?us-ascii?Q?il2f8uhZtmVHSA4ZHC/ZoNhy/TC/kerHkB/eBBroa11Qnyx0Y4xcRCcWjFsP?=
 =?us-ascii?Q?oGoggPws2OKl3598l8IXDSpVNfFe96ZwMFoM5SjhrSWnEeLRC4XP7nDXZZzC?=
 =?us-ascii?Q?rj7XSuuRO8jz2wbU4hmAVdzOYiNAFSejvddH8hPmwOBfp0Z0fL9wPNnVaeYB?=
 =?us-ascii?Q?2mGT5tVZ1+3+/PPMUYXMsEG5dKJEIAlerN86bWmYX0nKou01NjV1VAVqPCrY?=
 =?us-ascii?Q?6+8sCSxq23JXA+hRNBOOw1BaX6uYTWOIfio39rPhKjDT1rPppPGW0V8J4sYE?=
 =?us-ascii?Q?wvNyh8AYqY9aULeCvCAWlaFY7kTlf4FeuIFwN5ey8xlpGX+6tU2Uzm2K7BSR?=
 =?us-ascii?Q?uawDHlWlm/UqLZnzPrvgsxBbWbIFFog6fVdkml2x2LTKc9VAsmShXxT2oKhG?=
 =?us-ascii?Q?kZf1OKr8losb39PHGEHN/JAH7oTl/42FoWJPHpv6MKL3CFzNDjNhqxY31xRd?=
 =?us-ascii?Q?rBZdfDKZ/hX3ZG6PryeS1FCEPqLLAgBjqGudkSgzdb+uqz3Hwm+JUcRKRiHO?=
 =?us-ascii?Q?Ne5d3MSMMCy/4CK94tQN499JkL7knmWWtolzg6VIUg/HyJwSrS3ZQE5aJnr0?=
 =?us-ascii?Q?OGJaj5/13XojuqmDqEtjwyIxYLX4i8TACI8Skr3r/MrrMQJFuSqKbZ+JdhvG?=
 =?us-ascii?Q?rZQUNKfa+4XLZyCIJBFWRKxoj3dYItvQNSTlVVmVsZN6nJBWx4NdYyHbv41m?=
 =?us-ascii?Q?C4KXBxqHx4tHrmSJLDNUKsDd2yxyAPwFy6FwzPuCF9Q0giWq/eDHMBKUnYTC?=
 =?us-ascii?Q?6LA9BWD0XQRyErsFzM25w5ubt/Y0iinrXga0HxmraH+NOXsTjkGtwW/c9Sa/?=
 =?us-ascii?Q?4MHrEwLR9XEo92SiK8fJkkOOhmA8ySZh/+t6pAWzPUH3l+5z4rgg/neBfzqH?=
 =?us-ascii?Q?LcGnb2ZeyGrnyyz+35BlLHBIftb3oRl6cfFtdFUZivlgnG78g8xd4FkesdEa?=
 =?us-ascii?Q?YtHg/zgOXWuYGk06cMN1fbWG+ziuxgIovY7cTDuyfeiJUMLZqbR9uylarjjq?=
 =?us-ascii?Q?KgmP1pFqdlz41UgGblN1EwWMQ7UobkocuuXFEJkQ6D1diHZ4Fr03iQCpjS5/?=
 =?us-ascii?Q?bKhup9GdZ+BGxZZRltbiFlD+sC7B4WSCVoZP2u5v1EsLb9jiwkloH3zQ8UcD?=
 =?us-ascii?Q?6ZpxWQqSXN6tLAMqiMIlb/WBosY2fOjXm+lSakSnmSVG5L+XaYvtZzwtY+f1?=
 =?us-ascii?Q?U5CRpgB/k5PeKsTsdKGmvBlVJ5/jIJwOhcKmYGErp9u2jg1ZCQpg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea3626da-00a0-47fd-b259-08df307cb737
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 20:40:32.0366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FDxxYH5rUrhmjgz1/eYp0onFXxzWWumJkVVhpzvYB1HAHo89gk9VRZo4um2csiYQyvCCZlymknQkDLM9Y3Ad02ouZmTAodSqb70TN6+ZahEObkLyi0JTAth80qd0IGaV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10868

On Mon, Oct 12, 2026 at 07:01:30AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] dts: Missing bootph-pre-ram for gpio3 breaks early SD card access
> --
>
> commit dc22078eb20524e315ef0d520678ff9336ed179e
> Author: Joseph Guo <qijian.guo@nxp.com>
>
>     arm64: dts: imx95-19x19-frdm-pro: add boot phase properties
>
>     Add boot phase properties to essential resources during boot phase.
>
>     FRDM-IMX95-PRO need UART, SD-Card, eMMC access during boot process.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
> > index 1f62d729a5e77..8dc1134f8d24d 100644
> > --- a/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx95-19x19-frdm-pro.dts
> > @@ -180,6 +180,7 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
> >  		regulator-min-microvolt = <3300000>;
> >  		gpio = <&gpio3 7 GPIO_ACTIVE_HIGH>;
> >  		enable-active-high;
> > +		bootph-pre-ram;
> >  	};
>
> [Severity: Medium]
> Will this regulator be available in the SPL phase without adding bootph-pre-ram
> to the gpio3 node?
>
> Since the fdtgrep tool extracts nodes tagged with bootph-pre-ram but does not
> automatically trace and retain phandles for nodes lacking the tag, the
> gpio3 controller node will be entirely stripped from the SPL device tree.
>
> Could the gpio3 node also be marked with bootph-pre-ram so that
> reg_usdhc2_vmmc can resolve its GPIO dependency?

Is it true?

Frank
