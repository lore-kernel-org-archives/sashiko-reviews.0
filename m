Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013041.outbound.protection.outlook.com [40.107.162.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC7247CC85;
	Wed, 15 Jul 2026 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784128503; cv=fail; b=anSaVwOgeBzwqJq7kzM0pEG8e8yk5jhpc7McgVQpeW5xYiaMXsE4LtOaaVuyqOOw9wqsh1aIhImZAIhbje41UUmdFNOQZ9Wx1o+lDONzpjXxtx++MEADcL4opBFus4d2tP86Hbkv08zonkixrKKOV+eptV61tT/wcivgrkB/rvc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784128503; c=relaxed/simple;
	bh=pZFVU9CgdO7C1DmVaX2c/RRrVtDKG5J2FpbPujKlETk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GtnRFRt2sV0h+wYflLg+om04LTasyUEofYfPZ4pE912Eoa1Bi/InpFm01naFtHgyRqBssC22Kt8B7yi/8D+vZti2H58h36CNigPTCuZrt/IHZ52l4vb1ZO8+MlZ7skv6Q6jeA7Ro7QCmpr3zZ5AauVjBoyEQ5by6tKT+NRp4pWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=mgu/K0TC reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="mgu/K0TC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+py0vHvs7svN7+0UGpELRvUEFEydbwOE/5YN+CFAxTYGTXK91JuyY31GtNUxBu4RExyMY2Qz3lJXvwKfiv/mvfphRUkkAKK8EVVHnhO8BTlabrMC4iAo+kpcZ8LXZugaD2AMhhljyB5P9arf9rNMtXwCncNHtLqibHtbliynBAsEajysn3yTPT9t1cl23dv+xFFCju+R/9CW8hYHoGgrkA5QVqyxWEUEgcZxVchlu2K9IuxVKmYSC98OQ3laOCa9DPABnRzocAeXFq08lMaRX5O0KLnV76lydTJneHMIqNbpJTm8WVeMfeZ4jrLzV7gVszd+AbZQas7mk23ZYUS7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YXpxnt2x2m2srZKvuQ14UZbGy+XQyPMqLikTCxoNz8o=;
 b=lwtpeC+8DnF3xvBAwNmuOakZRb2q13hgADFcP98fm7XocZrRWcLDYCZNsh2LGSr429i4NlISd7VMNzSNC1PjJhW7e8+K5F8DOAtlVkQkw/bIT82BC3TTqYhk2X5gsk2awrb/TiT7/t5d3FJjh7t1U9aIYK8rSEE7/oBZ6QaSsQi5zol8PxYXEhTJGDNyDyKG8/LBOyKYltdvGzKxSCUCZMOGxD6EIByRIIIvhA/UAZMumfWQ9qXKz1DyMqnXd6w1C4pd/Kx8r+ADIer7G36BeljQN4329EGwpPF8ok+wD6sWKwyTQgEiN9lA0PFxyBbCopsbpdofq92Nq7uMQLp5RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YXpxnt2x2m2srZKvuQ14UZbGy+XQyPMqLikTCxoNz8o=;
 b=mgu/K0TC1KyILTUlpPaBKi+ttml93yur/6Mu/A3SBP4fwTsx4nPQiIibF5khK9sWHH02+u1SDV4/LAAq0sqckEElTSDh1BVggQqkfARxn2+bJ5J/xbkd7kfr5rsXoqe+HqokXJT5Uu3lXE9iZ4/87n53QnYuAVA5fNwij+CA4N+Uap+69kSI6u1b2h9LemKPRLTaTxUUvVjiD9M5bUhyptacslD03e5zf2kanv6TqBdz7l4rz/5f11EQDlsjf5J5sMepl3mgvg35vWb67SJIeq03XcN+AscfsF14DGqOVKh4Yl+q6MhTM0w8iNHIzdAwyE+4YRNF/bx3Nt2w2lzvwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB12308.eurprd04.prod.outlook.com (2603:10a6:501:88::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 15 Jul
 2026 15:14:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0202.018; Wed, 15 Jul 2026
 15:14:59 +0000
Date: Wed, 15 Jul 2026 10:14:51 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, robh@kernel.org,
	Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 3/9] arm64: dts: imx8ulp: Correct SRAM node address and
 size to cover full SSRAM P2
Message-ID: <alej68J_-lk0umBI@SMW015318>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
 <20260715-imx8ulp-dts-v1-3-19651358b599@nxp.com>
 <20260715124736.CDE9A1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715124736.CDE9A1F00A3A@smtp.kernel.org>
X-ClientProxiedBy: SA9P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB12308:EE_
X-MS-Office365-Filtering-Correlation-Id: 38463348-d744-4a7e-1ad8-08dee283d5d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|1800799024|366016|18002099003|22082099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	AlP0303WUrrR7givv8DODpT+CnikHI6Xgt3MS8lC9hkMBVtnOxztBjDIxadBlqB1crCTnyNz6v1JVr0moaMiao/KMjKVG++uFyBJALEVlY1Bw5U7E4ifLmU1dY1b9j9uTmpCZIWkPlxmw3Ub2LoNPn6rH0sKFw7BOhQrMBxUO8dKmENaUqqQnXIme3zr+wv68FXzeAa6L9LT6Mavo52BNCY8rnz2A/MND336H3yqaYbZZ7ufGFx4UnlquI73nJaxsqs9IxmOKpfyBwNP4JyPWiS8X5BSyGWBRI1Y/cOz4W8VPThtiznNUkccjZX6kFTlgjnx/E9iVtNy66M8PcjRMmTZgmeo/9MrNuDMAzZmAkhX6z6exZrzZQr3Ao4/nZRWi0ml/DXrKpkfA6RFy4DoE/tx0RsnCfTJWO+Geh71LsUF3S3xUs2bbl2N54Vz6Sd8CjIKgKNgwqyWUFopV18y5sJcw9ruT5NI4Gm8GjECr/g94Mc2XHhaSKC8JrfBABaXrLHZK77Uvvza8Pul22SwN+jlXKn3cDm0C+6hjV6xpiSNsHA+9FoomSghA4Gh8M1BoMQ/hCpV3+AFM8248WBsnY+6N9QmxYAdKYh7IG04/0M=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(1800799024)(366016)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?JdL0fNK/9qBwUU1+oD8odOt3JfMOWABN/D20DWuc4XIKdDZ9jWgrm4cE23?=
 =?iso-8859-1?Q?1DSW0TTvxwY43Tx63mF4P+EwpnjBM676EhIJwA8vNCtkZH39BNKUPVUYF8?=
 =?iso-8859-1?Q?ih8XFaTj/kwtxqKuMjZe8C5xL/swaDgFWJyxUyW/atwMbX5pDqlHnhF8QK?=
 =?iso-8859-1?Q?UVgLqmBc4sTkz4LcsL2BqQCELA2sYRKgVclYMwlXbQYJkqBzqGFjndAA1T?=
 =?iso-8859-1?Q?K4egiE7qg+pidGGD4imDA+8t1tCCU9+gWp4hPNx3TGR1sZG4b65k+0K87c?=
 =?iso-8859-1?Q?/IaF9ZcGFoY8NTKmXreOuOk9DIDzfpgDlB97mu/HJo8Qs8JFtQfZBqrMow?=
 =?iso-8859-1?Q?2Oi3VNwwwQ3AKKHVByyabBzlCFb6X8Avxd6z4wsorOV8WupWEmO9zgPt3L?=
 =?iso-8859-1?Q?wQBbceChj59+Gw/iiGf1XAt+vX6js0TZwhFomWRK0E+KsHEWhju3DOCq80?=
 =?iso-8859-1?Q?ZfxV61lfj0XE1txdTCbB4o1qAjZw/q/LXydIurE6JEo2r0gN1GlVfCZbjA?=
 =?iso-8859-1?Q?LNiCOMlyezmCSaV7Mri5lQtA7m4CRLu4v0dUBH2zz1cHmo/pB3pn2G+SvX?=
 =?iso-8859-1?Q?MsvaXiIzKWQdTPksUJ47Q5gs9+cZ2cqwmWkrK8c32zvodvWHcdUAqrzd3/?=
 =?iso-8859-1?Q?HssAdy+m051B2/kBIkuedAkVuuJxrHMgu3yfRhr1W77GVS1WVUJfK0sGLl?=
 =?iso-8859-1?Q?IqtH0NUsiMuwKkT+x58BH69+T4H2NCRcf+iAVEeb0Z8VaYI7Hp+Hj4BQyZ?=
 =?iso-8859-1?Q?+vG9LCkAMzONWJEI2Efq+0gM55xEhZm4Gy88pQjIurGLTyHJFuxsKE83tF?=
 =?iso-8859-1?Q?hOcNGsQnzJfGRskkePSZu5p6PIOn8ESbmLzl5reQthKwo4x8ljnzQJkrKN?=
 =?iso-8859-1?Q?6w2eqZP/kTBQ/Jp+/WxPRF3vwbqqAUxmtzrTYkB5EwCLnRLk4nSLiH67u7?=
 =?iso-8859-1?Q?AGER2jH3RNd2KuvO0SGqCSKrpJql1LlvKxtgk2f4HlTOYQNqfy/+OKPilx?=
 =?iso-8859-1?Q?lyYBelkWnvINgPLoOtGyELqEm0Ot+EXiYyYamEB5MTtG/noYYU8C2uEkCg?=
 =?iso-8859-1?Q?YmNhokwAis+EC9k//CTcrkX3UN4N+/kivT5du1ett/71oVYpLtL6GBAe65?=
 =?iso-8859-1?Q?RTPJQh0pA4xzvVjyrBehUSU0oRe6v/23VmQuWKoREPWYpSNaT2VpEaDxPA?=
 =?iso-8859-1?Q?ai7ZvU66ooX11sd/0GYb2cOaOlk1/v7mF7nhoeJj20mwg3/5gLJe38axIJ?=
 =?iso-8859-1?Q?9oc+Map8Oy2gkEnmFgcNqCpoMIo6WLVJfP7nb6yAv3cKt2KtNf1eY8yVMU?=
 =?iso-8859-1?Q?JKnv3I6yVtJr0Q2VHYEXLgDPFBEonethB7130RzixiVc86vglT5Lg9eUaC?=
 =?iso-8859-1?Q?n1MfFAb/9Api2RkvamWh5CMuECuYdJA3vpCQEzgtHKcw9ifv2jZhQ3jF4p?=
 =?iso-8859-1?Q?4T1DTJXkud8X+v/lKueyWLO4vpSo4/Pst0B0XQmUGwKlgXDaSTfZvEAuME?=
 =?iso-8859-1?Q?0upfXKq77plyvHvwj7GJXyonZXVTzscEOir6scxaeNWZg0F5R6Qv5aYWyP?=
 =?iso-8859-1?Q?2N0W1c4+NgLhEohQ+GreQqHrDAuGExZh7221zvAujp+wnmd2QNWc6Edkz7?=
 =?iso-8859-1?Q?aKNji9y+hbY57AYmnfmUM62Vr1qIJxB+2WcER5aPQW4uQCpukMQrbUI96N?=
 =?iso-8859-1?Q?xfLSXClki8P6Bghff8c7hULiPCHmcjmnBX16VleMxNmG+KgsftLx3zGtLY?=
 =?iso-8859-1?Q?6jaJ/3Bl5+dR0EsxVkZfXaQEAbs0w/h/Y/Oxtz/eheHFitoxXWy4k0ChLQ?=
 =?iso-8859-1?Q?Pzx33IqYjfDsfFLTu/uHrHXBqLkEELmDFgM747w6v+YQHUoAd+/A?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38463348-d744-4a7e-1ad8-08dee283d5d0
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 15:14:59.2136
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /RdhsbL5KEevtAVJcqwdbFDUoph5cM1ZDH9/utAF2LE+YVfSjkGx/fzB7MAmUC/E1+wbbdplFLgcJBhGfv70nQSLrtK183OqRT9zjVvWV4Kzb9ZyIcqJwcq+Gpx9b4t+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12308

On Wed, Jul 15, 2026 at 12:47:36PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] The `ranges` property of the `sram` node and the `scmi_buf` child node were not updated to match the newly expanded SRAM `reg` region.
> --
>
> --- Patch [3]: [PATCH 3/9] arm64: dts: imx8ulp: Correct SRAM node address and size to cover full SSRAM P2 ---
> commit e7f90a5991db01135d232289fb75ec4528de4fca
> Author: Peng Fan <peng.fan@nxp.com>
>
> arm64: dts: imx8ulp: Correct SRAM node address and size to cover full SSRAM P2
>
> The SSRAM P2 partition starts at 0x22010000 with a size of 64 KB.
> The previous node only mapped the last 4 KB (0x2201f000, 0x1000) which
> was used for the SCMI shared memory buffer. Update the base address and
> size to cover the full P2 region so it can also serve as a general
> purpose SRAM pool.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> > --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> > @@ -154,9 +154,9 @@ sosc: clock-sosc {
> >  		#clock-cells = <0>;
> >  	};
> >
> > -	sram@2201f000 {
> > +	sram@22010000 {
> >  		compatible = "mmio-sram";
> > -		reg = <0x0 0x2201f000 0x0 0x1000>;
> > +		reg = <0x0 0x22010000 0x0 0x10000>;
> >
> >  		#address-cells = <1>;
> >  		#size-cells = <1>;
> >  		ranges = <0 0x0 0x2201f000 0x1000>;
> >
> >  		scmi_buf: scmi-sram-section@0 {
> >  			compatible = "arm,scmi-shmem";
> >  			reg = <0x0 0x400>;
> >  		};
>
> [Severity: Medium]
> Since the reg property was expanded to cover the full 64KB region starting
> at 0x22010000, should the ranges property and the scmi_buf node also be
> updated to match?
>
> Right now, ranges still only maps the last 4KB (0x2201f000). Any new child
> nodes attempting to use the lower 60KB (0x22010000 to 0x2201efff) as a
> general-purpose pool will fail to resolve their addresses.
>
> Also, if ranges is updated to map from the new 0x22010000 base, wouldn't
> the scmi_buf child node offset need to be updated to 0xf000 to maintain
> its previous absolute address?

Is it true? look like make sense?

Frank
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com?part=3
