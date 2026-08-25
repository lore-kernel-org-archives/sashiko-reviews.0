Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012052.outbound.protection.outlook.com [52.101.66.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA6C4078CE;
	Tue, 25 Aug 2026 14:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787667475; cv=fail; b=klDlfbHeEoziPDxAWfLwjijUtAagiKwfH2Q2gWakuw9loOlpQHb9+Ca0qkxR+Srw7B5MY/4DqVKfyD+56bSCnHvUmIO9ntxCeRNfpVRvKnt6sLPiz/YosM+RvIqSMSZZPPoDi3jxXLpza/HweKbkgbG7Bi1VeQEKs3YebhcJEw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787667475; c=relaxed/simple;
	bh=1ZaDMJ3cukMwsu9gZAf5H6qXYLjHfuMs7TlJG5E9fYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YmVhMSWzrmrlaeMwYM98KnwSLuvJXGP/+p+FlMifMDQHQXVmPd7Pr2MtTU0hUnKgCtoyUPbGfNj6zPpo48Q8J17q50bKeHCCieol3WMXsdszoUlqbDWgo4TUSKyA93NhhwXedB+/y67wvMOoOD+tEVQStW5NGDwygD2114RLZG4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TPZPPOaT reason="signature verification failed"; arc=fail smtp.client-ip=52.101.66.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TPZPPOaT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieSH93BCOWC0yVOUNkuq2dNuSoWzNhmywOpAFSP/v1Ql8d4gaahcjl7IDYmSPfdlxoq9700Haxihbw6i4l3xGoJX9eyfvPxJ0HLta/FcsYayCSY5YQ6sZoynCxBlOVqhIxMwOfrOnw6gtDGlGClkKY3LyJ8L+2S7bmnC/e1VwZL2OTRXFg1YLkRBuNpY3sPlvW2EH/evvWfXKrhgc6oCUThWAjFpX1Jp7UHw/on0ujvMIAyLO63abVozI44BfKEYBPbPorb55e25V6QAnJU/5M8CHQQSgwrCPHi0XGp493kLIWSCe+Y4AjWPWrmr3GVu4+NjqhIMdQHqr7GSz7S8YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f345bn8iR18y+sucS7jOLEEg2ulNvASLsgK1QDHZ82Y=;
 b=MNuqmlbCUBJHjDClVxtjnS4W3CgMfIEJ/BB1/EGI2vaHQB8f0mCUzGph+OP8gFhE0TTc1lO+8RtIvuBYhSew0nddnkJeK1iTPAxoLwZ1/Dm4TOFfMX3Y6ZCcnbybpol0g+igi+TMEGKFp4gjDxx+Jk7oA0LglKMdMSjziYEBoKL/rBbhOVAIa966LJ4KGaOyc9HLJjNGOfkgqU8hfehjJFcEzmwC2xEtuZzRjo1Y4xqeretAhXMuAhGLwQms2w2iHDxnElPOX1/9WWOsbQH8STe1iPAFtK5BD4Jc8zHyMHV+i+bI9ukAhnarIf9UZXE1hunYrrsd5BK+gwcXFPE+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f345bn8iR18y+sucS7jOLEEg2ulNvASLsgK1QDHZ82Y=;
 b=TPZPPOaTg6gj25G8solv4rWmHu7tVvBmLGVORE9rPWPjikSW/yMGDxCAdOY5u/Lr3tFr9QABnl6c6Ij1yCx91mVR1F4MDETYLo4AFwUXW5hcWCUquvIf/D5j1aRZlcWmNqyoqKmMnJIeTOIMY9ofbAk2i4idYRZsPJj5FQUOvEPXSMJIoDsUM8dP51qB1QKQqjtbMoKg3MpnbUF7H5Wfqiup2s443XQLudKuTAk3q1RAQ4R7lNaw7X2WbkFJCYdtrl7orsbdwd9AaqDXiYEeXDWhKVFZen4LuwWqjEHxPozL+0FNAdxJozX3PgPg3HsNec64OMtKWN4ims8BMEdsKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8208.eurprd04.prod.outlook.com (2603:10a6:102:1c7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 14:17:50 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 14:17:50 +0000
Date: Tue, 25 Aug 2026 09:17:41 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Marek Vasut <marex@nabladev.com>, conor+dt@kernel.org,
	imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard
 configuration EEPROM layout DTOs
Message-ID: <ao2kBe5NFvvwY4ow@SMW015318>
References: <20260825135754.864501-1-marex@nabladev.com>
 <20260825140251.28B981F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825140251.28B981F00A3A@smtp.kernel.org>
X-ClientProxiedBy: PH5P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:34a::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 35a78b3c-e967-4bb8-4095-08df02b3a4d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|23010399003|376014|19092799006|6133799003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	gnKUbnjYCHrAMYZCs97JJLkwLj/W9NBcZtWnL3sqtasTqTI9d01xeUWTjgBn/QpA42Y6Bbmrjr+5y43eR6RijxKqFCGIfdLd411vmNMRUkRoyjDm3knPhONtmUjmjX0d9QRBBUIcQHqzE7XtDsoywftNNoczuOA2lj1DwhVWS66BTxuXU52cn5WHmGvT5IvBZllNqxfnFVmW9vJjucDwsNteNt+xFeK5b+9lwL4Lg5jFVJ/Pp0kVlJEwSZ+GTO8ZQXjUnmcdg8mWE7TmtDp8sddPeXXJChRIzchMxV+VLNS4RjjCZlwl2cr1LpUA7Ef0BTED4E5a60pD5fxgNk2C/Ota6TerXWvGGZkRHnn4JpZWXMcHtIjsU3Qou/KyHgByt7upzdxcOSQKmBIbfNqew+jljO6ofM5kn6n44GTJe0h1GdrZJ6pSOgUP8E47lxjxPrTtspRxLPV6n7U5ANUo+BRPhR5oVbUOqaKNgkBLSfWSxwujSnkAIIDHAHZyZcQwLTMh0007N9wDaZ2NHHmF8tOGcplQbbwYVJyPhF6ucYQ1RafodBLAR2OnOhAtH1utsyJD1oajXDluO5HuJymuQg98fX16gdOqkRF8Qw3qLOM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(19092799006)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?M8c2Sgurt74TM5ZWZRzr9luWklr33zkzKpgqK6R6X4rf72omFQtSqeTT8w?=
 =?iso-8859-1?Q?vkbNgPMEbWdg/2JPIUYDOH4bIw2qGb1ufip/L1QMiw+e5uRNYtav+6fr4D?=
 =?iso-8859-1?Q?VX1j4TZPBylRvFizZp6hCoSuD0Dr66biEHQA7CKlx4+WxuLk1+gfINywmP?=
 =?iso-8859-1?Q?MJqTXXjK5Gb3UJvm1uVGyxhM4RdLQ/l42HxN7UAtuWymk8i7C3SXCPKEH9?=
 =?iso-8859-1?Q?ZdRHWtK9iMQa9e5GtNZ0nB/dg7Jm3hHk4iSS5AXMaD/wt5K+1uDJP5hQmB?=
 =?iso-8859-1?Q?5BXdbFdIZveONNeK0xFumdgVDIaxhEGQt2ckfHSmyFsnBeifdqR40k87I/?=
 =?iso-8859-1?Q?75Um4GvuJ8vH4wt0HwGbZBshRp4n0etx5h44M7YY4aI01BjD96IvCdjtCv?=
 =?iso-8859-1?Q?jt0nAkcEktoy7dOfKfjEi1gjtB21vNHV4lO9eYq+AHVDY/0PlSX3VXXlCq?=
 =?iso-8859-1?Q?G8o0NTo8MthbbmY8H5xHWB3NrlHWQ0OtlMNPFKwkIuMKv8AUiOoeQqqBat?=
 =?iso-8859-1?Q?zKhO71vUDJ+ckPT7VBsSz3yUMIgJ/5++VL4t9c70U2CGcvs4uveUFu8zY6?=
 =?iso-8859-1?Q?Gk09EOQKVLVqmRVdUFyf4a5smJ1CgWmYEeiCNNZnF5HRD/sVH5yb2JY5Rt?=
 =?iso-8859-1?Q?+xrNdQzZSiKq4CGWZMgow+XWkXhOijrY8/wRfO9wyw6nS+6lI+g3gOXCHa?=
 =?iso-8859-1?Q?PCrH/g3vUNuhyUSkITFnbgr6hgRcX7Cs6mpfDxBHtPBnfTGo1y6vyuw7ur?=
 =?iso-8859-1?Q?kV9oGV6mClawkCsLyimTI0OSZUworvUkRkircaN4WQRyI+rhz0AUXmVhFz?=
 =?iso-8859-1?Q?vDaD8n2cN2wYo1p9zGidEZgOug1tHja7c1FhYOERJcjVvnHAMddct0zRIJ?=
 =?iso-8859-1?Q?Hy2G4ndtfIr+alaMjAYy4x8+C0XB06MilWBnv+XPwPL0hE1RQ1e0Gh0qM5?=
 =?iso-8859-1?Q?BWZm8A6tya5fwsfZ1fP1zzh+75AgZKMZvsOKhofsXh5xYvRKDbyTG7ipZh?=
 =?iso-8859-1?Q?bbubxWZ2Xmxsp+H/nssGFVsL+UV4AeYEj7G20RNOydQ6Ups8SBpxz9K5I8?=
 =?iso-8859-1?Q?kkvk2HBP+ICuVwbq6n+hyPbtULOlQKNjttORm+GvDthLioC442IGWrYpfu?=
 =?iso-8859-1?Q?b/XViQDZn8DU67FGziCMyW2fUTk8vU+rJSvbOnFKMH+Fj/kFBmODU8U/oc?=
 =?iso-8859-1?Q?6tKj+vTShlFugHIUFfa5Bu8k3mNSnUQV3ZNdZMf58WAn1j53x8+/p0K4nZ?=
 =?iso-8859-1?Q?FdkAXe6fWHBz/THZpXlZTD/c9H9w40ox6OspRWarobprnFn+hkuDemfg2I?=
 =?iso-8859-1?Q?gGXtDi7Gb4dyq9L1nE5gGcHXDdXicdI+WKH7oKC0LKClCXPuJZFRTKxpOT?=
 =?iso-8859-1?Q?G022R5iIZwWl3O9WzrCrC0Zzs0AscSX2xRM6nAvBjpuplL1NiRjt7BiwHC?=
 =?iso-8859-1?Q?4aQtKRDfTZeqf3JswCCQpzcXnBy68VvMR7lJK21+cjU9T5i1gVQYkR9Lcu?=
 =?iso-8859-1?Q?pzQ2WFtsNCe/eL3miCtQBWwh4zdWaQfmPIi0DgU/y3dYvhtiuKoo3dDh+7?=
 =?iso-8859-1?Q?KIeovjTqIEw+ok2YrWNADk0BRdBaKkMXt8HcsafeNV70sn4wfLLFAhXSLx?=
 =?iso-8859-1?Q?2cSWuRssaY9MovXbgK45EYix3DrwhZ+Q6vrFUnGgz+a6dulHyf/2+iXtUD?=
 =?iso-8859-1?Q?xLBIhl4mCbq8qg7yK1tTXinkftfHyDMS+HcSb5ORjN3cQ7mLstjEWd4t7W?=
 =?iso-8859-1?Q?8Y9KsuySxrSUl4BCSUANSdrl5uCbuRjxpLF37LiUT5o8DNVCZ3rkZejbfw?=
 =?iso-8859-1?Q?Ji9El5x4Qb3oz7snzfOpMI9L70t1Axyt5+01jMnM5ytpO/kAXJlE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 35a78b3c-e967-4bb8-4095-08df02b3a4d2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 14:17:50.0605
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5dvQM25iV1KBM2bjiD2pTq/4qSFNrkUgKCpPf6qK9wxEg8BgVWpIPfDsz8ZzgHTAlzkK3jCUKPIbtCsBnPmEvB0GB9RNaor8U0LoR5RAY3mUbG5kGaFzIOUIejvqpuNm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8208

On Tue, Aug 25, 2026 at 02:02:50PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The device tree node for the software compatibility field is misspelled as 'software-comatibility' (missing 'p'). As these fields are exposed via the sysfs nvmem interface, this typo will become a permanent userspace ABI.
> --
>
> --- Patch [1]: [PATCH] arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard configuration EEPROM layout DTOs ---
> commit a29716c722da3485b2bb345e32239ee52540c286
> Author: Marek Vasut <marex@nabladev.com>
>
> arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard configuration EEPROM layout DTOs
>
> Add DT overlays which describe configuration EEPROM VHIP section,
> for VHIP section v1.0.0.0, v1.1.0.0, v2.0.0.0, used on ifm VHIP4
> EvalBoard. With the DTO applied, the VHIP section fields become
> accessible via the sysfs nvmem interface.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1000.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1000.dtso
> > new file mode 100644
> > index 0000000000000..41641c54164f1
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1000.dtso
>
> [ ... ]
>
> > +		product-type@64 {
> > +			reg = <0x64 0x20>;
> > +		};
> > +
> > +		software-comatibility@84 {
>
> [Severity: Medium]
> Is there a typo in this node name? It appears to be missing a 'p' and should
> perhaps be software-compatibility@84.

Please fix it

Frank

>
> > +			reg = <0x84 0x4>;
> > +		};
> > +
> > +		manufacturing-date@88 {
>
> [ ... ]
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1100.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1100.dtso
> > new file mode 100644
> > index 0000000000000..5f89b1af6874d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-1100.dtso
>
> [ ... ]
>
> > +		product-type@84 {
> > +			reg = <0x84 0x20>;
> > +		};
> > +
> > +		software-comatibility@a4 {
>
> [Severity: Medium]
> Does this node name also contain the same missing 'p' typo?
>
> > +			reg = <0xa4 0x4>;
> > +		};
> > +
> > +		manufacturing-date@a8 {
>
> [ ... ]
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-2000.dtso b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-2000.dtso
> > new file mode 100644
> > index 0000000000000..01599bf46ac18
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-overlay-eeprom-2000.dtso
>
> [ ... ]
>
> > +		product-type@90 {
> > +			reg = <0x90 0x20>;
> > +		};
> > +
> > +		software-comatibility@b0 {
>
> [Severity: Medium]
> Could this node name be corrected to software-compatibility as well?
>
> > +			reg = <0xb0 0x4>;
> > +		};
> > +
> > +		manufacturing-date@b4 {
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260825135754.864501-1-marex@nabladev.com?part=1
