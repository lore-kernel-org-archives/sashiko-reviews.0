Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9465437CD52;
	Thu, 20 Aug 2026 15:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787239490; cv=fail; b=V02YLRgb20VnEnGiHTAYDeBoZz8JjIbtudY6kuAQ/+CHCNKYMwGlwVYpmus5XWW/A39adBaf+p1JU/IIJnKa8pm0hDX+63SDPx9OwJwBzcNbX9y/5nQqNMkfbsjFv4jFP6VlgPpxodkT6M2rDo/tWatJxIpW77IYVT6slbolHwo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787239490; c=relaxed/simple;
	bh=oBasldKKHPmcME4cCasQX9HvKNH6oI4MEq4ogTOcIo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=uDBmn3P2u2+Pd2wcQVYlZ+t6QpMjMYd8zgQNBeikqVolOZn0uMu4jKq1HNIiivv1l/UdlV8RbheJbm9Bj9Rfg2I1UcJ35zSx5CZNJVi3Th6KEgPTMOYEwE3jLUw4CXVJfdFE7ZewTXIq2oy0J7UTiP8x2/mlnvwJX0zeIaRkDh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Whw6guma reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Whw6guma"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ID9h+ZNqcEO8gJnFnjdNMYcAn0moNTfvpkZEuxTplP8cssSVjyRbJOS/t6MPb9qXYrg/mIWYQl2P+FuB9xr41BZ2bnc2P0JLxU6iFJHv3gvN0BeqjoB+EXlwakrpsPWgVcybe31UA7GGTxKmZm9/XQlaMJ5Wu/oSIg+p/tYzZLFJKmDPOBxhb/eJrMxnps9lDyS1Dcc0f0Zz8ccR1jcxGkUHV32jsTbkVaLIQatVT6mwPIjiirZoNF/ydVgjYiuaZb/Ln2xtDx2j4e9nUP21CS4Hvu3pjSJSUeqXnfKqbHhiaN0b3KAeNQKXpxffxPVTnFFrU2b1dfZjqb4osadMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tg5o0lMvommvt9HxMKTKSvEsGqCDPSl0ET4qPVX4jhc=;
 b=LIopN4gA3b5IeEt/EQ7nMCjPlkbwtYEJ5Rj6aWVKnJi3+xTBPUa0ppOGhHF3igHEBLV53N7YuxxtBQXAgJAWTn4KF7oX8YMzD2AzwDaFARzO3D08BEkRJdAnBnzQvYJxai9LZ57lCVAEUFWzmswXoYNanOsaFuR2Nqq8TCejIR/jVbYgA6EN5ffIqD2vnceOmAQOd7JFtjq0SOi10TNRElT1Y3CjE9E+k4626rIUKbEvrXw+/xZM4ueo7XxI+tIfIapcLJvPr4nUzgRSA4N66oDjmKI3VBOqtaQrKFjJvwRUFzV5vydV5kAHjaln7TYnZXDZxD2IatBer9yK2VnFzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tg5o0lMvommvt9HxMKTKSvEsGqCDPSl0ET4qPVX4jhc=;
 b=Whw6guma5x3ZUMQOdmA5rPUcR9dgiUb6dfJJxQzfPsouSLrYJgiVjMirMa4LVu+8QPHmK+fhaz6XESsZRUKQEK2C5A4dkk8k/sQrNLYlCkCLXG3giS1TwGTid2EH5j+TMJTRQj8fiWgngh/CO/WyYLgmFmg4ONp6IAn83uGbRgGw9W55iB7R/VatuQJtF/SzdjY8HAgwKfoMiRNZxlCGC4BDGayi3LLDtrUJVDerb9op0dzlblGB0fMwgb2qIWJU7GywC3p9vSCQOe/28fpZ4BpyfGUdveERxf+uA4d4tjuFxX/OpouV2+ErmE2StuRlVMhZ6pdWqPzbTS9Je50noQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7442.eurprd04.prod.outlook.com (2603:10a6:20b:1d8::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 15:24:45 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 15:24:45 +0000
Date: Thu, 20 Aug 2026 10:24:38 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: hongxing.zhu@oss.nxp.com, imx@lists.linux.dev, conor+dt@kernel.org,
	robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v1 1/3] arm64: dts: imx95: Avoid 32-bit PCIe window
 System RAM overlap
Message-ID: <aoccNh6gCfz3Bz-f@SMW015318>
References: <20260820083620.877251-1-hongxing.zhu@oss.nxp.com>
 <20260820083620.877251-2-hongxing.zhu@oss.nxp.com>
 <20260820084208.5CF311F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260820084208.5CF311F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA1PR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: af617e13-7d10-4b8c-6ecb-08defecf2a36
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|19092799006|6133799003|4143699003|56012099006|10067099003|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	D0hsN3yzBGmASJkRW2dglrRyPGk8aigUeA43RaCdklJ1Yr0y5k0IzGISkNargCNKM89Ltqph0D51TOyWTHguxaAcvmlrDnijxGdTFSnLICDHF/whQd75X/GwGExUK/m3V/9Cz6pQX+ra0oj7XGS6arbM5bskJDZIF+BM2iIJxWYAVxKx2V9mT1MWxXfIfh+IloDdpfTvz5lAcrwxzpUFlcZfRnxZqOsDkvkjk5OvTwUj3PRpOwAibKbvA0xUgLfpJ9zM2nS1Qo4wMlQYX3VtAI140KGxuEETwVMgsXlq0L6xIbhZAee+zl9IZZgHp9bxhWGTVXfGXrt3eN0MyCy3RwU44nCfHczVE1AL1w6A4Uo0X3yD6iWqxzFofgnjUrbITGmjxsYxSGMEXZdRTmmdqEWe1MnT5qvttW26/7LcCmK8rqNwASWHBAx5f+r+Bnnipc/0CgJn6bs7U1L869yXPI5dZ0vZvTA3Zi17J7ULmq0SvxU8hvihs3P/EJhnyTcpoWVQ0qasI84rSR71NHl/bDezuer4hTDgEtc+f5NgplL4MAHdZ1pbmHl1JYYrJzkswwTg72DNYU/hGU4f6sIon/vgQzde4QuFBPvXh4scmTQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(19092799006)(6133799003)(4143699003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?VtpQAMUc7fBvC6QbDCIq9oRogaC5wK2R4Be5ACKdSqNaKYtEMLQeFGEzdU?=
 =?iso-8859-1?Q?/xEZhJKY/aCyjaWUX/aZA94NH4RfpemtcAUfgWdSeCh2ALB8FsX/ohzKJO?=
 =?iso-8859-1?Q?JNvAL4SafwpL+uDhRrSp4bLRZ9jI7w0yOKynQKtbBkTEX8pIIy522AoKiP?=
 =?iso-8859-1?Q?TMnm9EdJPUBGuiJCVK8RS8NAhCsytRb1mpdupxrj42wPTrKFAlz9/POLuG?=
 =?iso-8859-1?Q?KQEhUPXMoSHMwXs7vX6hwoaNp/AvhOKmel4zTBeWmWkEerzGXyqMwho5MJ?=
 =?iso-8859-1?Q?hQaObnkCBl7GtjwZOcaiuhm5ZjelZ8qfVEuxJmf398mFTL8Kt3mDfZ3cfw?=
 =?iso-8859-1?Q?X8sShtRdqgrpMnC2Dj9+mA8kyDi6tgpKsZstX+bzTWGomF10lSe3Vt2py5?=
 =?iso-8859-1?Q?NSZXNIalEBIUkovaxMGLKaznAJhxPloDcaEeaxQM3xufC5OZbkVsMr52tV?=
 =?iso-8859-1?Q?DcmZyj6ADew9UJJtuPAwDwXw8n3ZUcybsMkJUcGVrdvVNQIWaXARsS45u4?=
 =?iso-8859-1?Q?mP652pyoPfggkPqhHQtrL7XHF9Vrzk6FcTvk3qA3yEvGhtr2nqljKVe51+?=
 =?iso-8859-1?Q?tOzyT3VD4NQNk8zdNLbO7UPf5H97pMyEPrf68jAZSVV+RD0zMR8H32v8Cq?=
 =?iso-8859-1?Q?PdQ8t6quJAJRMH/E7B31SHZ4WTL8CJrwk8CR+ddR18SwijV51oNXuR3FKu?=
 =?iso-8859-1?Q?h6fPBuAdpg923WcrNqUOrxLWWGUTxGHnUwFSevD35dPPpi4ulYMGHbcDNV?=
 =?iso-8859-1?Q?JSiHb1vwNybgG/NKJCCA4FP/eWOJCCoRkrAbH5CD2jBg+Bry7PsHfIhcHC?=
 =?iso-8859-1?Q?0vsZhy2oyl+4ItlKrhmGOb0heK9V59hbkT6MicajJ2vSrHaSqvj49RaFET?=
 =?iso-8859-1?Q?wdhrsaHc5wvFAuQJTmjnWXLzw4fAt7sPF506+bLGILItDzWQ3oc53w20P0?=
 =?iso-8859-1?Q?qOOE7ihbxJFqOZmklafi4mle51/J73vHLBTbTHrkiVCyx6lzq+cgXvtc6h?=
 =?iso-8859-1?Q?6XjqBQpC0QRtzpH/RlQctqAy39eUoQ4tpnEpSJSXPKTqk20RpcQaARdgH0?=
 =?iso-8859-1?Q?PZYDGEcE3QU+8TsLX8BmOrGuRvFnjNc6JJCoHavzlaGrBhVvw7cxBksMAa?=
 =?iso-8859-1?Q?rDvBU/MjpnEKoC0iaM5dadTEIeLO80EJVsdaCna5+hzvPzcjhfFKFqll3X?=
 =?iso-8859-1?Q?qcpjnXfjsyOrJEfkMAS+uaeHbxK3hr/TGMcwnJ3u2dNA+uzKlXWsQTuzI6?=
 =?iso-8859-1?Q?qN5TUvEi3xtcAeQ0EU6Dk4leNuXrMsVywJl72VR3rR3lYrdVvtMj71L4sB?=
 =?iso-8859-1?Q?HM3Qvh4m3gvc6lE5//sKPcpUSfX6JiWpQ8ecE1iLC+RFX3JuSkA8pK/I2Q?=
 =?iso-8859-1?Q?K1DktcR1UGv3UXU/qeZ44AZSQoiah9xoZnUcaLI98XMjOKZk2IoKpL1rcZ?=
 =?iso-8859-1?Q?wQ6MFHO5BltRzbCuYnSlw0Nwo9Go9hW7v35IxjZ0UtC/8n0YQxkM3BdIlb?=
 =?iso-8859-1?Q?5Gnv7sX5taGqu6ITgE1t1vWEHahOVjBkvA3QA6E9q750amEDzp9ycTjwrF?=
 =?iso-8859-1?Q?NiwKkcY96JJ/9cMpPRvupc3vY3M9sEwmitnr3/zopxjWL4dXizD2OW1MFP?=
 =?iso-8859-1?Q?8jJrGjTD9FUMGuG9TnDZyN+chFBRO0iB+bJSlieQA8yBmv8QaIUIF4EQNe?=
 =?iso-8859-1?Q?sBhzDwXmwPOLuoI2apb9xpvdLtB7gQMMHhc/rofHp7dICXxUFcQ9+DDAgw?=
 =?iso-8859-1?Q?Q17r/6FV3EYoW9mAe7U4y9bX0gCXb5uBZSVy6KBj28RlnC3m5VaW/RByYx?=
 =?iso-8859-1?Q?/v+01sgCi/WvJIJZ6y81sucwg7XpDyEp3yZYlAdtmqt1wMEKZGn8?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af617e13-7d10-4b8c-6ecb-08defecf2a36
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 15:24:45.5842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9kzBXsf8k/93mDTqOM6lqJMUNSNTIHZwtVeFQ/yZWgtCMwi7ZyKzwOIwOf7b0khWLqvUBYNwhiQNqPfv7ow/N+kOxCFGJA3OtvFL+4NjQ4WmZTnphEqeBkaNE2UCSAP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7442

On Thu, Aug 20, 2026 at 08:42:07AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The commit message inaccurately claims to change the 'CPU address', but the patch actually changes the 'PCI address'.
> --
>
> --- Patch [1]: [PATCH v1 1/3] arm64: dts: imx95: Avoid 32-bit PCIe window System RAM overlap ---
> commit 1e55a58df93bb33b1e5b78cb2403b958366907f0
> Author: Richard Zhu <hongxing.zhu@nxp.com>
>
> arm64: dts: imx95: Avoid 32-bit PCIe window System RAM overlap
>
> This commit updates the device tree configuration for the PCIe controllers
> on the imx95 platform. It adjusts the ranges property to prevent memory
> window overlaps.
>
> > Move the PCIe non-prefetchable memory CPU address from 0xe0000000
> > to 0x10000000 to avoid overlap with DRAM.
>
> [Severity: Medium]
> Is this description of the change accurate?
>
> The device tree ranges property uses the format:
> <PCI_HI PCI_MID PCI_LO CPU_HI CPU_LO SIZE_HI SIZE_LO>
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> > @@ -1948,7 +1948,7 @@ pcie0: pcie@4c300000 {
> [ ... ]
> >  			reg-names = "dbi", "config", "atu", "app";
> >  			ranges = <0x43000000 0x9 0x00000000 0x9 0x00000000 0x0 0xe0000000>,
> > -				 <0x82000000 0x0 0xe0000000 0x9 0xe0000000 0x0 0x10000000>,
> > +				 <0x82000000 0x0 0x10000000 0x9 0xe0000000 0x0 0x10000000>,
>
> Looking at the modification to pcie0, the CPU (parent) bus address is
> represented by the 4th and 5th cells (0x9 0xe0000000). These cells remain
> unchanged in this patch.
>
> The cell that is updated from 0xe0000000 to 0x10000000 is the 3rd cell,
> which corresponds to the lower 32 bits of the PCI (child) bus address.
>
> Could the commit message be clarified to state that the PCI address is
> being changed, or was the intent to actually update the CPU address in
> the 5th cell?

Sashiko is correct, update your commit message, it is not "cpu address"

it is "PCI bus address", you'd better refer to old sashio thread or
prevous discuss link.

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260820083620.877251-1-hongxing.zhu@oss.nxp.com?part=1
