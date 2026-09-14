Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011033.outbound.protection.outlook.com [52.101.70.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25D84779A8;
	Mon, 14 Sep 2026 14:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394408; cv=fail; b=p+T9vxWFZmJOpgkiOTqxOsr3mLG6T/ia99q48OuxeEeXHr8wwkrCz9Yr7fDs7XL+l5Y8fDt0GZmDDhTpvW0WSDzpWu2woxZX9bj3Z4FMieUUUqmSvo8AoI0ti8g05LD5sfFRWLXaqWejoH9lHzg+FMhIrMhKGVwk2h2uK8r7q44=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394408; c=relaxed/simple;
	bh=D5gPiS5l6P8KgWQBkZm3boSR7eec7Az5CWwE/H4Cg2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=APUaE2RrjwgKo0Agt8tMaB2UF3lwXbCsOurlFds033a207BOqPbACEqXdXRUdoKGlMgGfJhR6tLAmetKJ11ARMMpglzDmgSW1CRQit2Fh4H3mWnckyyXIdcvn3vpJ9TB1ktwvLwX2GimElPeiuflvNFNNWmzHgUmyNsF58ERy+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=T+DyAm6Z reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="T+DyAm6Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weeM0v3s4cESKUbQxylzv0BTizzDQFxqqYKXJ4v7n7p04yRLFW/LFJeiMQusgaKN9/y43ZK0YKOZCLZgK+cJLYuC4vStywEfmXBHC1XCYs/tid/CJBhvD0NbCPUyVVRdreQMK3ciA/IvUqGGg2S/LNFgUlAueG3A4kVe3R0D/hIYBw+UUURUNxPBs/B+yajcBxm7VcbeFdcOQQ/x7flKnV+0NbuLfISJf3XiQzWuHJMtLBZvvpq9iSwFcVpKbN6dWzDDki7Cp0bdTLCOmSp3jBJtM113QQRBK8r8Jihn8LELUufM6tkneBJZv2Vsdwk02E3hDldMUuXrtg9w8Z2jmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkXX2BRgrM8WM3wdl4sQpsxdcnsdqDEzjTu2H3/6qxc=;
 b=lWmsNhjloCFnuAiNjiB+PQJsjms1Z19sSAmBSUOlAxIB5sZpLVAB3/G41wULCVMDs8P75yPXYrMTwaFfxAYx6V9RJoj3USEiMQzhnStJtHRxE538zbnbTm3vURi3sF3rAvtYFC6TLc78mtHpjoCArhYVgGG0BTI870+nAOKY7FvVbvJkga/vBwrdum3aoAQ0lCB17ATje+wPvA4emoOQ1rvuqF7Hjn4/H9frhE0kEaxMrWK1CrxBEg+nu8820KOZ2bsoHUtiI8lXc+4Cb4JgCALS5Rsmru1zUo1oqWneWgUDaSedaPvMpJNXJvmcwXMFjC9kuo6iaxGOQwthycGRug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkXX2BRgrM8WM3wdl4sQpsxdcnsdqDEzjTu2H3/6qxc=;
 b=T+DyAm6ZoYAAyMR90Wv6g9TUQvfD2NTzlypkYjTDo7p/F07hCpZu50PX22gucGSJYVSylzLcZkXoAp3GocJ2p4pMSVtHvOzgUzTYf+sVQRLVb8BPQ89d0M8i7NkOzYON75b06JOvTprCtoCLu1r7Jo73pbVjASVqks6M78M0BLyag3VA3mv4Fj25HkdSWk/Z5V3ogbIu6pkWz+Sh+nVkJ/R3URLOe/BGKsnyUyVo89Xr1Lckmcqiq5AtlLPp9g2MAFCrVp2+WhMgbNolW3NWhjFJFtK29SrSGA8R2Rs6Is5meejxRAE0xOGPrjp4gw3jmBjsIPBAEfgOYxisxdzLwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7234.eurprd04.prod.outlook.com (2603:10a6:20b:1dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 13:59:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 13:59:58 +0000
Date: Mon, 14 Sep 2026 08:59:49 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Vincent Jardin <vjardin@free.fr>, imx@lists.linux.dev,
	devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: freescale: add Nodebox v3 CPU Module
Message-ID: <aqf91XlM-aiX2MXe@SMW015318>
References: <20260913-for-upstream-nbxv3-dts-v6-0-058566b93ba1@free.fr>
 <20260913-for-upstream-nbxv3-dts-v6-3-058566b93ba1@free.fr>
 <20260913124548.EBB021F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260913124548.EBB021F000FF@smtp.kernel.org>
X-ClientProxiedBy: PH7P223CA0017.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:338::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7234:EE_
X-MS-Office365-Filtering-Correlation-Id: 45efaab0-6ce9-4d7a-a649-08df1268769e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|19092799006|1800799024|11063799006|56012099006|4143699003|10067099003|22082099003|18002099003|3023799007|15866825006|41080700001;
X-Microsoft-Antispam-Message-Info:
	5Ed0Mq94tls3jWJ9lCybeqPn1b5u3+2uPO+4GgcDjjLNEM8cPmtwz2Zki3bCepBEYAPpmeWxtkjiM+AzXl22GuftE3F0Dt/lNT6mmVe8bDTVddfv0MotmPYo5z4w+aMC1S8wiDWYzqym/Oz/QzQYlIvpw15YFvyw7Aj8CNlLTgrmqmsaRXuLJ2CX7+tdb1InUDPcdIu6EAVk0ay7RwDEaR6xMuAm8KVQLKVFAP08NyKg9EeJI1JPKLqsltTQNfvMYhajPnHuHsQwG7K6xiSx9bsetqSaJdFNLKKD9K+dpbHELxeepUrUYl6+y9l+Y7tSuqt3G4gaT7aitfcNInhCvDUKz4F/pZtVj9jTczFVqSi7fehJtloeeAdVc4hFeaKI2s2ENnW1qPjyzREd3pZCtHzSLDq45XHDpTMlA2AxFDwJ3bXUUqAV7HFq0QWdEZt0sDxSBKjOBTWT09hbh314ecSzxK8vSaRHK8OE9VpG4wieKPt3Oo6D6wcEPoITLgGbY2l2UcpYyKCo45KehAy8obv0nViHQS+BgZ+EVjv7L4DGM45XAxwY63NlJUn2CoszfHa9Msz9FGO3ShpmmzVh6A9Ox2iyTz0FjALrQkqTBKDnvRqevULTauSpZ2Cxqg1+3kynFEWEQ0HTVVUp4YqZtZCFxuHTc8g5Jh70Z2yIppeRJtss7hfvGoWEPaHTNtqyNnmeOzzHWaUFZcTtmlYBfA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(19092799006)(1800799024)(11063799006)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007)(15866825006)(41080700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?YYTGFPw9I4YuodVKryAOdkbW9jKNOhjtrr+xSgQhvMFGB9eY1p/foH7FkF?=
 =?iso-8859-1?Q?C5UWPE0927SOacxUoz972ls4uG9N/8QUqWKLPAClm2egS9Sg/w6CO+gRwk?=
 =?iso-8859-1?Q?XpC0V8EAQWjvV4xb/t49F244RPDbbw9MaPKrLzw2/S+gx+aPZCZS4joAJf?=
 =?iso-8859-1?Q?7A0KJYPhY79uwDE+/9getEijA7wHe6UUYYYBhZ9phL6oZPx1kid2VPy7ox?=
 =?iso-8859-1?Q?X/y/x+sXRw0WyBYqTeoZ79WDCH9LvmQjKDvRNLQPy5grpek+RwbjBTyycv?=
 =?iso-8859-1?Q?UQST45Wuu51ZOxPSisneBjn4BjWf8NIxjaQpK03y4VIIrf6/fEew+7q1R5?=
 =?iso-8859-1?Q?hu6hhRf6kC3ENlSGiWU+KRARTTjS8dPJHv3S7AnbxKhurvFb+OCy6HzQcI?=
 =?iso-8859-1?Q?El8+T8PBjc4DNWTsxHwmHG8dT7uDAIGYliHk7RKRf3MjNvdv61KctLJaLX?=
 =?iso-8859-1?Q?d7dvIGmlqfX4TA9qWJtDLpEI5x7lYtyowq1l+1N7Xmm3u0orwOnEMM1jEI?=
 =?iso-8859-1?Q?t5dlSiCsLcQVatPV59IpjIUgcSSmSMp3vuZlSwMLUm/KSrz2A2okpOtfwA?=
 =?iso-8859-1?Q?wxya6xMq/ZT/xFu7Xr5XYn2qUHpVwBiCqGVAcO9secGSEUW0zOnJdfvyRF?=
 =?iso-8859-1?Q?F6OvudGPtwl/9uOExIoqr0AHhCQf5hpkgBj+kv1ENUA9icm97PyrP7RGze?=
 =?iso-8859-1?Q?4AsabAYqkWONfb0EdGOzW63wHXYheKH/XEHfRxOKp9ElytH7wCToW/e1NE?=
 =?iso-8859-1?Q?z3EZ0pGVIGrCqcmbvLyt4AZvs7LTiqK0patz6RfHcGiv8tNmAPRec4ne6p?=
 =?iso-8859-1?Q?62agfJH7al66cTnRM0qtQsOh26fGWU7zrY8oZGiGXr+SzOAyxiaT1JDtEJ?=
 =?iso-8859-1?Q?oY0VIuiAGTJBxpJi26Y8p4SKHoRuGbXn6r8M6YDLkeSac10EBNwsA+bNnA?=
 =?iso-8859-1?Q?CNGFufDzMrksYI6vRKwIS61GKrk4IPqZJg+zbTdWiimb6e3I55mVajClsj?=
 =?iso-8859-1?Q?D60fUnwJeW1KbEdCiY55tZulsCq4m7UUzSsWk8+/Q5MfKCPz6dBhRjvOPp?=
 =?iso-8859-1?Q?VwX3O2A2cQWLFeVvIdeI3z5Aa2U8sDUn9f6HVr13Jo2Ugn28CL4x1mWSAB?=
 =?iso-8859-1?Q?PTc+jHuwJCPYI/4/hYZfMVD18K8k8ooWalk/rQeyg/GG7N/a7hn0pIjq1z?=
 =?iso-8859-1?Q?2caxU1o51O5ucZLdlx2VAoQRBu9B3zQLfWxi5aN/xTh5dbRgRp7JTIeaNn?=
 =?iso-8859-1?Q?EBkwHc/KODhKDoiyCmTHmFobLkL/Q+h5jbkoGHdfDIZtTnuY7z+x5q3x32?=
 =?iso-8859-1?Q?l6AUPTCtkPLvFUqlB0mBeqj98tcgitQuuP5DQ8FRnAC/yOVAFDQzni/4bu?=
 =?iso-8859-1?Q?hnpTDxEUueUjHcij0VP/4ELV2OW+tPB2KiDYT/+X6xEHclzlDs1NK0+F/1?=
 =?iso-8859-1?Q?8tM83k/F6IAgC+uvgT0PifPzr2s2b7fHdkKAm0907OqgFp5G9oTnuau5V8?=
 =?iso-8859-1?Q?Vvet+HjJ+v9My0l7J+W4HujukKjr60D5pTWmw854P3gh3A9lEzCuM9HGpV?=
 =?iso-8859-1?Q?KlXA7nLwZX1ss0Y5bQabhEtKM3vLd8DkJ5mSM+gIYjynwuiHttJPglTrKX?=
 =?iso-8859-1?Q?3cRkI9Af8bWWf03Vzret9AS5fAc+YotospdHQDgiwukJWtV98Mhjh66GBM?=
 =?iso-8859-1?Q?mrX3uNv6GZSdpIMg3mTPq2yKL/0OMhS4JCQE9MkxazwSb+IzgmZTDCAZzD?=
 =?iso-8859-1?Q?aWlpr7xknZ+ogwkayPIa73OkcH05KYSxBhRzi7DsVWZu/x/xsxg63UyqdU?=
 =?iso-8859-1?Q?NPlj5m3uBzWPNdOBmYuYB0G//9K7i23+vTwnDRntAeMC2FqKQjNk?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45efaab0-6ce9-4d7a-a649-08df1268769e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 13:59:58.8204
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2+tbfcy1YKlFUDnnzy0G5SWZtU/GYV6jvK/MNdWGLp0EJdUcs7MV/dxDzm2nSs5mYHNv9JzeAix6H/6IqEbjXRfoxbLguogw7yNfWDDfulHjK1uZenrQ9dNO3svyuqUk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7234

On Sun, Sep 13, 2026 at 12:45:48PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [Medium] Ethernet PHY nodes lack 'interrupts' and 'reset-gpios' properties despite physical lines being explicitly defined on the board.
> - [Medium] Regulator polarity mismatch for `ethsw-mdio-en`.
> - [Low] Duplicate GPIO line name `usb01-oc#` in `gpio3` controller.
> - [Low] Missing Devicetree binding documentation for the new board compatible.
> --
>
> commit 8433b3c3d1e5258b1e8b5fc1b405c85d777065d4
> Author: Vincent Jardin <vjardin@free.fr>
>
> arm64: dts: freescale: add Nodebox v3 CPU Module
>
> The Nodebox v3 is a Free Mobile CPU module built around the NXP
> LX2160A (16x Cortex-A72, DPAA2).
>
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts
> > new file mode 100644
> > index 0000000000000..cc02204e9d1b4
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts
> [ ... ]
> > +/ {
> > +	compatible = "freemobile,nbxv3", "fsl,lx2160a";
>
> [Severity: Low]
> Are the devicetree bindings for this new board compatible string documented?
>
> New compatible strings must be documented to pass make dt_binding_check
> validation, but this patch does not appear to include the required updates
> to the Devicetree bindings documentation.
>
> > +	model = "Free Mobile Nodebox v3 CPU Module (LX2160A)";
> > +};
> > +
> [ ... ]
> > diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
> > new file mode 100644
> > index 0000000000000..ca4fb5329c0b2
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
> [ ... ]
> > +	gpio-restart {
> > +		compatible = "gpio-restart";
> > +		gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
> > +		priority = <128>;
> > +	};
> > +
> > +	reg_ethsw_mdio: regulator-ethsw-mdio {
> > +		compatible = "regulator-fixed";
> > +		gpio = <&gpio3 25 GPIO_ACTIVE_LOW>;
> > +		regulator-always-on;
> > +		regulator-boot-on;
> > +		regulator-name = "ethsw-mdio-en";
>
> [Severity: Medium]
> Is ethsw-mdio-en truly an active-low signal?
>
> The reg_ethsw_mdio regulator specifies GPIO_ACTIVE_LOW and regulator-always-on.
> The kernel gpiolib will apply a logical-to-physical inversion, driving the
> physical pin to 0V.
>
> However, the board's strict naming convention uses a '#' or '-b' suffix for
> active-low signals (e.g., ethsw-reset#, usb01-oc#). The absence of this
> suffix on ethsw-mdio-en strongly implies it is an active-high signal. If it
> is active-high, driving it low will erroneously disable the MDIO bus to the
> Ethernet switch.

Is it true?

>
> > +	};
> > +};
> > +
> [ ... ]
> > +&emdio1 {
> > +	status = "okay";
> > +
> > +	/* Microchip LAN8023 dual 10G PCS/retimer, Clause 45 only, one address per slice */
> > +	lan8023_phy_s0: ethernet-phy@2 {
> > +		compatible = "ethernet-phy-ieee802.3-c45";
> > +		reg = <2>;
> > +	};
>
> [Severity: Medium]
> Should this node include the interrupts and reset-gpios mappings?
>
> The lan8023_phy_s0 node omits the interrupts (lan8023-mdint) and reset-gpios
> (lan8023-rst) mappings, even though these physical lines are explicitly
> defined on the board.
>
> Without the interrupts property, the kernel's PHY state machine is forced to
> use inefficient polling mode instead of hardware interrupts, increasing CPU
> overhead and latency.
>
> Missing the reset-gpios property prevents the kernel from managing the PHY
> reset lifecycle. If the I2C expander (u800) initializes to a state that holds
> the PHYs in reset, the PHY probe will fail completely.
>
> > +
> > +	lan8023_phy_s1: ethernet-phy@3 {
> > +		compatible = "ethernet-phy-ieee802.3-c45";
> > +		reg = <3>;
> > +	};
> > +
> > +	rtl8211fd: ethernet-phy@6 {
> > +		compatible = "ethernet-phy-id001c.c916";
> > +		reg = <6>;
> > +	};
>
> [Severity: Medium]
> Similar to the lan8023_phy_s0 node, should this node include the interrupts
> mapping?
>
> The rtl8211fd node omits the interrupts (u1300-rtl8211fd-int#) mapping.
> Missing this also forces the kernel to use polling mode for the PHY state
> machine.
>
> > +};
> [ ... ]
> > +&gpio3 {
> > +	gpio-line-names =
> > +		"altfn:ec1-txd3", "altfn:ec1-txd2",
> > +		"altfn:ec1-txd1", "altfn:ec1-txd0",
> > +		"altfn:ec1-tx-en", "altfn:ec1-gtx-clk",
> > +		"altfn:ec1-rxd3", "altfn:ec1-rxd2",
> > +		"altfn:ec1-rxd1", "altfn:ec1-rxd0",
> > +		"altfn:ec1-rx-clk", "altfn:ec1-rx-dv",
> > +		"", "",
> > +		"ptp-refclk-in",
> > +		"", "", "", "", "", "", "", "",
> > +		"u1700-zl30733-pps-out",
> > +		"",
> > +		"ethsw-mdio-en",
> > +		"usb01-oc#",	/* USB1_PWRFAULT and USB2_PWRFAULT share one net */
> > +		"",
> > +		"usb01-oc#",
>
> [Severity: Low]
> Are these duplicate line names intentional?

Please fix this small problem.

Frank

>
> Device tree GPIO line names must be unique within a controller. Defining
> usb01-oc# twice causes ambiguity; any in-kernel consumer or userspace tool
> (via libgpiod) attempting to lookup the GPIO by name will only ever match
> the first occurrence.
>
> This violates DT schema rules and makes the second pin inaccessible by name.
>
> > +		"altfn:spi3-sck",
> > +		"", "";
> > +
> > +	status = "okay";
> > +};
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260913-for-upstream-nbxv3-dts-v6-0-058566b93ba1@free.fr?part=3
