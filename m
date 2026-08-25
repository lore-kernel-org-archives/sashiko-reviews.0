Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011055.outbound.protection.outlook.com [52.101.65.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B598F484230;
	Tue, 25 Aug 2026 14:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787668997; cv=fail; b=ZFSMNvOHE+oLg3gueJTbXmAkjmg6yTI9N0p7IgCQY8T4jH7Jp2NwQTWaHRM8DO/yTQWNuPeVMMwWfkBAw8btNsuRr/hoJDTYFDOWHOQkwAt9nneh/xvzYFMo/iGIO+jGUrdyYKm++CXeHprKBbBoYbM73IVY/BVsqSV0kUGw3jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787668997; c=relaxed/simple;
	bh=DQGYMr0dEnsVJUgvEUDLTsZvAM3hgH2x3MgDCwx6RV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=G8ANn8Jk2qE4Ghd4fEaDa6i8ZDum91w/LQxuEQ6rgr06q+0AZNFXfduWV1RspEolCt//5rAWZjmLU3ybszVesT2hzuoYQllDk4SON8un7d9a10x1TIHfEP2iEzms/8GFEZBPCMkhgwEYQDntcz/jVxkdawwAxE0XhE7+r5RDhzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=kmYwilTD reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="kmYwilTD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMOujjqYUM/P43iAasEaFMoJPxPu40jLQpW2eyKv+X2XgYmOH29uvkU/Z4ZNtp6MNPs/cUO3tBkaCNw11VzdeZ7SzBRkiE2Qg0AgyZyEzQo1eLsmFrCTWbUAC8dxkHJLxXoUwzAs5nZZycSqoxlZezZcRN6siyp21hzqFlwyWxVrDnBTvlWdnLCuV9MKn30q5U2m24E4RFt3layC6bPj5R7DbL/A8eruqg5pRA9yyg3BJe3KW8st29yrl+Qb/Ux4HsbkOPpvq3SdhTuPs7spKJXVYOmf8CdsLsKw41HZCBTzeK/jyxGBndFJON3SJcnX6ey+9roSvwg0GgWIw/3mpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcSPcbMcCZTNLW45VJV2aKdqiLGRkDACNd5L4SDNenk=;
 b=PAOWPodhpEHC9ctmVUzjvwFKLSjTMm8o47v7PO5wEGotjUYbqJrGCCp3IGiB5MNq78IJWKfaAfpCPufnYq/KVNtPmy2dklkSK1iOJTVMOVsWrsA9j7OF/4DmiB+7i3zq1JoCKwVIcLZHBOkGEtZ/wsK/bDNNIvf7b0HlZ7nDlaV2bIKejR8ClU1r/gB+trlt0WHxywQTXN51YoH/mAg3FWmj5mZtrm2eWNnJClLN7ktOz9mo+kJK8Ux6MLzeNzT6SqhkFUYsRyLOu5WDzqKH+jD6wWMJRVy2lyQQjTNaARKoap/XjRQulmpus26KDWBICsKiOt14KMHIFdNIAcmCtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcSPcbMcCZTNLW45VJV2aKdqiLGRkDACNd5L4SDNenk=;
 b=kmYwilTDzjTikt+Z3BHhfS17benwZ7jyey5hAxmngzbnWsKW9rELWn/2rCnUgFeuYfOPPCFTXMWLqD3sfqf8JQ9CijMKM8SRv+eiirfVtu7Ep11v7FaGviAQZ6B8l9gYIKJvdiG2TYqt3nLmuUYViWYm2kt3i52l78h1tguQVrcdpnzJbyebjzo4xjefdx284I5a9TR7rnw7fgUkZE3eApTW0I1grEuA8JCkRBhYAOr7rXesseyMhCLH92h1qZXLNiHsWnUlyN0saizptlcnIg7qtQyMaOhnTcDBZ1wYp0J+Wu2FmQSkBQAX88iyDBHp+aKNAYx2uecJW/r3oRMb5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MMZPR04MB912279.eurprd04.prod.outlook.com (2603:10a6:190:52::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 14:43:12 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.012; Tue, 25 Aug 2026
 14:43:12 +0000
Date: Tue, 25 Aug 2026 09:43:05 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, Frank.Li@kernel.org,
	robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
Message-ID: <ao2p-Yj1HfJeeVOM@SMW015318>
References: <cover.1787586961.git.stefano.r@variscite.com>
 <2b7fabe6b1c4d08e58d2542742492564b67c4c32.1787586961.git.stefano.r@variscite.com>
 <20260825071648.B547C1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260825071648.B547C1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA1PR02CA0014.namprd02.prod.outlook.com
 (2603:10b6:806:2cf::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MMZPR04MB912279:EE_
X-MS-Office365-Filtering-Correlation-Id: cdaddf03-01b1-4508-04b1-08df02b7307b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|19092799006|23010399003|6133799003|3023799007|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8+yD87UW/322wefq58SMA2BfvU0OfYjQmwGjWD9xkUTtD1axe/ZZ3YvvJ65Ham2EikGNcw9J3MDOrfIzRz7KdRlo3effMhOU84/7w8b03oPkPcjlIJ5c8+4w3dfix7HXYsQeAJBfKJLpjC0pepNi3zz5yRvdqk0Op6ERFm+crDNlu2fkFPDkoB5Z34c1NygNmmrUsRgS/pKJfBI5BrgsT3fyvCNrGhjkkcLz2cq8VBNgEMKUWtuYp1MhYyge0mtS4jS7flubIKq8kJJ3L9Xm7hvWZ2mRQKUcQkk0ROZlXU4zjXNnCvXo9cT4Dni7FFaOLlooSaJXzLCACKTIiYu71zRoKrjOqcxJzNVZy4/Rj1Y+PBhoaysBTOj2dysTvqC/xB3yyBw3rUJnz+YzcXOgD/oHVhtISAsf1zeq2o5v03Ob9F7zSfKmhRB0e4jxxqC1FWRBvF7jZ2cYABpSR11PRC9UV3D3WNlfNkUUqizCmBivNokHbArPYxS1xWRIJUVn2w8QQSgfFnP75vt8+fY1VbujVUENJkxSNLWipU7HXYXDJVbQGFniICEPq6i+s9RTg984JPVcvIUdwbkgKImtKtBkLUT8lK5LV+VnCpy9WUA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(19092799006)(23010399003)(6133799003)(3023799007)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?tR/kMBs8GMC4VBwoz7zfYXaEa06nndBTD6bqNv32YkK9qgdUjIL8BlqSmH?=
 =?iso-8859-1?Q?Is4A0XxwaU2SoNgX5E/aSQHbJqLLp1jbhkVt+kq5XdOhAz+hAabBHxslLh?=
 =?iso-8859-1?Q?ZaxFU0eOquEE+yI9GsRcLd4Y4oGuw2o83kSVvqymzcT7DJUgtagaxUoJEd?=
 =?iso-8859-1?Q?tXuEL9Cevx/pmG5sNBE7LKXFY5SJiEG8nHNjc8Q/A5Nd7m80qM9vWpAOyt?=
 =?iso-8859-1?Q?TLofpcIgrlJ3VKpRctkxJVuEkIzxNSApOe43pDEDSedBBowxwRBVmaObd0?=
 =?iso-8859-1?Q?A7WJNFWop/6eDBMYQzEAE+isuRxHe/hORxRc7ccPSQpev1g6xUvS/tHs6I?=
 =?iso-8859-1?Q?EistamsjqMO/8fJmmM2LvMVevlCGABKhHHVH6ghg2Xajdz8tluEbbD8/rR?=
 =?iso-8859-1?Q?ech7tgESRbUuM/gwmsYUWjYlLGy//yxC/AG7/G2voRhVdVs96s2UfQqN4e?=
 =?iso-8859-1?Q?bnyrMlx9l/ZdpnOLJZz29eViWQxSCzcsPvwP6octFfv7t4SE6nKQv6JcSO?=
 =?iso-8859-1?Q?eVGHEAtcqx3o8d63512sBffu16SaHOqefzAIIHNxhNeHE4HQz7sUBCsL1K?=
 =?iso-8859-1?Q?7lLGg9Sx8Aq5jO/92iNA0Y1zFH4ijDQRaincbez5sRGV7RkK8ZSheZN4j+?=
 =?iso-8859-1?Q?NUjA+lZtIE7Xv15isCCn3I+l7OCiXR4NsfJpY73/NFVkVRpsw6BRTFM9i0?=
 =?iso-8859-1?Q?KjcoroqsPMa0n9Dpgowzkn7WOod5UHGvAypqoI3ooCqCswowEY9nxAdSTm?=
 =?iso-8859-1?Q?HxexVc6R5yRFCadGJ1V7kxBAT60uNecGoY9PMfktJbS3xCAvrJd/hVa0Kh?=
 =?iso-8859-1?Q?kBn9Jop6kyFYqRU2BIbWiETWK/SZH2gMF6/e/Hzf84eseTeY2fngGzcaQQ?=
 =?iso-8859-1?Q?Kkuqm7+Nw+mLAgTKXuiLCUCUQdf+rEHJjGu2aCtnydjeDVw69ibyXQGlqC?=
 =?iso-8859-1?Q?kytpRfWHNvOWyulq3tHn9q8SKFK3H5RJYGL+qJmXfKOmhbwOoL02V1JYqv?=
 =?iso-8859-1?Q?5rJnR1Aec0+oDSMe1N7E0bRv4yl7wiK0l33JUM+F6hWCvhERY+7uTwP5n+?=
 =?iso-8859-1?Q?MZr0rfMacFC5j60FYPftwRiuouAwmZrHKoufat0HYYc01qYvVhiHAgCkK5?=
 =?iso-8859-1?Q?XdEn/vzYIPWIQqS46hmCHhrP1bvEaggBVnKlab7ZhuFETodLHKcMNtncWC?=
 =?iso-8859-1?Q?7H5sEPGoP1b15OttKDKIoGuWRalT7ogrg45/UEbcR76ElvfkIqjNqixOoT?=
 =?iso-8859-1?Q?h0qHl/L8NDWLOaCKnct2VRU/1omqNFObHtBt1mFJEoCYGTE+yfoY+iMG6q?=
 =?iso-8859-1?Q?BuGxjLyG4oysa3nh0sR+egElcgm0u1zVisZ7uQk1QPd8kkME5j0M1wi8uf?=
 =?iso-8859-1?Q?zp57GBV96XHZWEKZkenGwOuZ8IHNuYqOPIiVAr1utzchw/Yr8qxlOL0W59?=
 =?iso-8859-1?Q?QqACPB6UA8g90jBpl3c0zYdiX+AE35eu/6ZUN5ssnt9Boi2thrd56aKZcM?=
 =?iso-8859-1?Q?BEPbb33TJvfBNWRaQ9BZORnvy4PCn8ak7wfixC0t/PPmkTOtxC33ygvRDq?=
 =?iso-8859-1?Q?/uZOtosKpJ37icB917YL/zsjf5e7wZmib3ZQX331alTAC7bXO3szxUy7GZ?=
 =?iso-8859-1?Q?WbNR1XyAObE2aPpeOQX3Y1m5RUk8XsbcJJ6DvhN2wpfelV07tAnh0RML6q?=
 =?iso-8859-1?Q?Cy5JC3gKaa4fQP2zUkLvb1wsPkfuH+sGNRul1y6taKPR/p96iSo6iy1LX2?=
 =?iso-8859-1?Q?fRxJp0OkW2n/10u2YwtjX4fjf43z7KYe8og1K+j7FdPEji5T/fYevNq1hq?=
 =?iso-8859-1?Q?2In1rZ4kKnCzzrwiQoSjOFJtJ1CopFXn2E+ofc5gMOhJII8vc68g?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdaddf03-01b1-4508-04b1-08df02b7307b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 14:43:12.8153
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MDHmZ+XZvo3Qtl2G//c90Oifab6bx48KMGfZ6L4QhYyFWLeaaGYyofCxfep9nXiESNB210c2O/G0x6JwXz32F4qLhsmoABDNPDxGNJ/wca32+Xhht+u17h/qpMZs5phb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB912279

On Tue, Aug 25, 2026 at 07:16:48AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] The `sw1a` regulator maximum voltage is set to 3.3V, which violates the i.MX7D core voltage limits (typically 1.0V, max 1.15V) and the PFUZE3000 SW1A hardware limit for this design (max 1.475V).
> - [High] Deleting `fsl,sai-mclk-direction-output` prevents the SoC from outputting the required Master Clock (MCLK) to the WM8731 audio codec.
> - [Medium] The `sd3-pwr-hog` GPIO hog on `gpio6 11` directly conflicts with the native `usdhc3` pinctrl configuration for `SD3_RESET_B`.
> --
>
> --- Patch [2]: [PATCH v4 2/3] ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support ---
> commit a699faaceb07c2b3521d089b94e7deba5e25dd8b
> Author: Stefano Radaelli <stefano.r@variscite.com>
>
> ARM: dts: imx7d: add Variscite VAR-SOM-MX7 support
>
> Add device tree support for the Variscite VAR-SOM-MX7 system on module.
> The module is based on the NXP i.MX7Dual SoC.
>
> Link: https://variscite.com/system-on-module-som/i-mx-7/var-som-mx7/
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
> > new file mode 100644
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-emmc.dtsi
> [ ... ]
> > +&gpio6 {
> > +	sd3-pwr-hog {
> > +		gpio-hog;
> > +		gpios = <11 0>;
> > +		output-low;
> > +		line-name = "sd3_pwr";
> > +	};
> > +};
> [ ... ]
> > +&iomuxc {
> > +	pinctrl_usdhc3: usdhc3grp {
> > +		fsl,pins = <
> > +			MX7D_PAD_SD3_RESET_B__SD3_RESET_B	0x59
>
> [Severity: Medium]
> Does this GPIO hog conflict with the native usdhc3 pinctrl configuration
> for SD3_RESET_B?
>
> The sd3-pwr-hog statically claims gpio6 11, which corresponds to
> MX7D_PAD_SD3_RESET_B. The pinctrl_usdhc3 later claims the exact same pad as
> SD3_RESET_B in its native mode.
>

Is it true?

> Could this cause a device tree resource conflict over the pad, and
> potentially spuriously reset the eMMC during sleep transitions if the
> pin reverts to the driven-low GPIO state?
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> > new file mode 100644
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som-wm8731.dtsi
> [ ... ]
> > +&sai1 {
> > +	assigned-clock-rates = <0>, <36864000>;
> > +	/delete-property/ fsl,sai-mclk-direction-output;
> > +};
>
> [Severity: High]
> Does deleting the fsl,sai-mclk-direction-output property prevent the SoC
> from outputting the required master clock to the WM8731 audio codec?
>
> The WM8731 codec requires an MCLK to function. By removing this direction
> property, the SAI block might configure the pad as an input, which would leave
> the codec without a master clock from the SoC.
>
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> > new file mode 100644
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx7d-var-som.dtsi
> [ ... ]
> > +&i2c1 {
> [ ... ]
> > +	pfuze300: pmic@8 {
> > +		compatible = "fsl,pfuze3000";
> > +		reg = <0x08>;
> > +
> > +		regulators {
> > +			sw1a_reg: sw1a {
> > +				regulator-min-microvolt = <700000>;
> > +				regulator-max-microvolt = <3300000>;
>
> [Severity: High]
> Does setting the sw1a maximum voltage to 3.3V violate the hardware limits
> for the i.MX7D core voltage?
>
> The sw1a regulator supplies the cpu0 and cpu1 cores. The PFUZE3000 SW1A limit
> for this design is typically around 1.475V, and the absolute maximum rating
> for the i.MX7D ARM cores is usually around 1.15V.
>
> If a driver scales the core voltage up to 3.3V based on these boundaries,
> could this result in hardware damage?

Please double check this one?

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1787586961.git.stefano.r@variscite.com?part=2
>
