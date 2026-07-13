Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013067.outbound.protection.outlook.com [52.101.83.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8CB33B6DF;
	Mon, 13 Jul 2026 16:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959313; cv=fail; b=S++SPmhC3Y6X4Jhmhu1mqjzrm1xXaRu3PYexCb2zpN1qBT2G76NzV2/YxyADv8e6yeOaL/InV2E1v/d1D5pMVgUCIBodF4DwOW3KGMmgs7VBD76yMwJij0rgGCjzZWdd2Hk4efP8C7GnO1L4EvMnhYbofNEZMwJV6X4r2xoLcg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959313; c=relaxed/simple;
	bh=tS1Q7r1KxILT7veBox9kQUd5Qas7nRYH2Z0+udJGNik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=Ce1zJY8D/rAnIIRTF5kzyAplFWlV7HctlG+4AaQtKzxSqvyrDQ2LZnpvtwYLvOYLLYdUI/gw9xhgjq7pawRYWbp0eKN405xINhQtHrdPkA2Bhbd+78n1HXP9GAlFm8scSCT6ETkYCRcHXCG3JSoQs9TUgqeoKuwu4moJ1gtuSLs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=GKBHZ5u0 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.83.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="GKBHZ5u0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tJeo0bvDvsUYMuw97b2xlJg38DABfEZyedKs5hHKOYB4QT3s6FoCp2eJoVrXmFXX6fZJHMkV1p8tC1PPRMe4fw0aHWLwYpQQV5McsdZrTZZFz+NQ5HML/qSTZGlcoT4c0qqA1oBsF4aoAg62phrnUF3BifUQOGlPwmqV0+iAivC1cfBCWX+K/Hqgs3LA+Ps25hN3mNSQWAvvBcUulqqniwGxUQcY2Rvpk2brulep0m0x7JrwhBbrtIRYgLvXBJzMDcQR32fxesKtW/0JBiyBSyjpRohMMAWk3CyzwKXzHdp6XKI65tM7Z5YX8tof97ILKooxq5xzIAL7svn0W1J+oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jylRX8lgOMSrDLdFOXyFlEv7BMtwrMFPoPWXd5ubn5E=;
 b=AFUdyUNsjJett5gjZ1IC87BbKvPDQ8hQ4tSDhZwSuNEHunljkIaeyZvM5IjkJKEPAqDOBl2VQ+gClw7+1GXUnl74VnKrNdh2i4E2cqwkmEbdyYx8XC98OV2Z/8QQbUmlNorAviLL8YPsyb3udSZ4lTtlaKeUv/zztB7+nHwzfbUObq/apeFu2Z0UXkh9W+taDcG+92fsHIB3cMpadqCoRoLOIywkCriPv+iw0k4XyXVfC0cW/VKdkaWgTz91ugbD5zA4LuvhqqN0tkg/WhE0u9WiXy/NQFRMWvTsNXguQrMReYgEaQpSSAHbEBwXXSXRgJtW8w/WLUle3HjUSrVJEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jylRX8lgOMSrDLdFOXyFlEv7BMtwrMFPoPWXd5ubn5E=;
 b=GKBHZ5u0IlgmoAx64tWeGyLgBn5uycKrEZuimYMBDeT+DvDhUj4zP0FiluPBBUvxy69CBpiuyQFRegvb7+82uSayHkiONarovhTMTFHPVcb3C4v4K06MI8ip9BZbn7ZgRv8At11RWYrC27+AzVbVp4mUhZrtnnnRBBlbrRH+T6hm0NKGMW8eRv/zAQ/Q44FIXtxAo3ZBGsWa+Sp1dmnad5OEnbt2vNeP8jTNO35yJYIvOqcBsBxK/05YL7koz586rBveMshrPFbE6f24KQVLiRqxHOhSkroYnUWlKkOgfr1zP1kQCW58HgvnIDHrZ+L7ji81khXdhG9vsQydhK0jFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM8PR04MB7459.eurprd04.prod.outlook.com (2603:10a6:20b:1dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 16:14:59 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0181.019; Mon, 13 Jul 2026
 16:14:59 +0000
Date: Mon, 13 Jul 2026 11:14:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
	Frank.Li@kernel.org, conor+dt@kernel.org,
	wsa+renesas@sang-engineering.com
Subject: Re: [PATCH v7 1/1] arm64: dts: add tqma9596la-mba95xxca
Message-ID: <alUO-oOtWBescUK6@SMW015318>
References: <20260707062506.949806-1-alexander.stein@ew.tq-group.com>
 <20260707065956.124121F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707065956.124121F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA0PR11CA0014.namprd11.prod.outlook.com
 (2603:10b6:806:d3::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM8PR04MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: ae9476d0-1616-4c63-70c9-08dee0f9e2b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|366016|1800799024|6133799003|56012099006|4143699003|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	1LjZfhv9319nYwZemP8fku+KqIrYXjalqIyxwfNbnrdiorFlLVqQQK8DGeIInossa4lYaFB3v4Kq+xBkxBIaNMMAaPlyLLLneAcHfwzZcgvB+l2C4lAkNkxdZqXby9QcPJeYRTwSLnjPI44MncMrFhDBLdsE/nO0US1D7JVBls2KjlobVzb0UdWa7YQHFuzdSocrY56JpMg7iyNUKe8vnzPGEiiREaZkWqeO+bX6cTjXe7zpw0dCEEpG+fEBZOEwRBiGAx5LDDq8dHnGEzVUMUgvefJ3w/oANxAYSZkXs/ZDb/ASIwdagVDkxUxu7c0sH6tA19eoSrC9YEpbc+atNSNyOIi38j2/CTqNOa00eoiNdiKPiH36tj4iX5kqsfVG8ZWR3xMb+LGFE0HknvODNjkmZhqPBO9FMrqFrR9jaPMfqRHNXR2UQVEuiRGwspzLipH7Sr/PsgqS0P2TwRHAZ5XKdptPNQ8p6/dtzV9VAChiJ7axWest0vUZNNkiVgv+cCPv7isP6C0XQdHXZjqmlKNBgBKkNdbbGgG/pQarS8dCJW+2wnSQpkXiei1Lk/SngJ3OO+j/UpWOnniYZ5o6UGDXHVyMz+L6zvi1CzDWf8c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?JS8Zmjw3d6qC98+FEzboLOtFO5icwTNGkOzuUD6KkSW8jWS1fLTq1AP5jv?=
 =?iso-8859-1?Q?dQ2H43NLB5BUskbiZfdkRR0msX/FDMlPWdPjJtxMEcZ1tj9TUE+DUWSaYm?=
 =?iso-8859-1?Q?wCCtYZBbO5s82yCrHCBm0mu8/UnFI7nAGGRFMl6xNM0pgML91MwDGk59ks?=
 =?iso-8859-1?Q?4rlvb+WZgXXmQ/x94B8/ERj1IN7DxdwTn95TnzZ60VIqqlevxj10vnmWtM?=
 =?iso-8859-1?Q?f/X3GcG+t0CDx2VjDK04RVrSllyyj0GsbYZoNWlmXtbCGi5RxoFCnnUc3K?=
 =?iso-8859-1?Q?/EBs3B5WL2d3N+e1+ei1/u5IXUZj/kAt1iWi6eROmqpkVomJj04Wivsh8f?=
 =?iso-8859-1?Q?jBB8GgzJKTnIjq6yyHSfKOMbeZBnU66/0Q4WKi7GSbgfusEtOj7y7HjgG2?=
 =?iso-8859-1?Q?rCiElXdQmmaWCseMqEBg1lRrGPfdsnvSDeLvyrF0fV1eFWbRtbzqF5ctPU?=
 =?iso-8859-1?Q?pLniBbQ1F/cl9uiUD/zAIxW4xD3dvmXDS+p7ojSb1EWM9PXaIvrF3dt4Tk?=
 =?iso-8859-1?Q?k0ZEU4PazCJsH164ZZG0TDTWGG/c47DgKbO2jkhyt8KE0htpE0IOqx3Ulo?=
 =?iso-8859-1?Q?c8jbI3JOA2UGjLp+FP0BLUspNkpY7r/4YPc0Rq5mRcoDoQ9PaE7D2SH1JK?=
 =?iso-8859-1?Q?/eWht0rPgKSHtEk0JVNPzjcoMY7EbJ8jbcuX/KKOp8kdBhb1VD0iOvTzaN?=
 =?iso-8859-1?Q?zD5q8vSrkqke/RzTTkioFbqQgy4aul17dQoXgvByrIEf8q/73UMV3mz8QD?=
 =?iso-8859-1?Q?2ZWCLlCf/S8KvI2vc44F/XqoaMH5VitBVNi5K0LebGVHHhF2b876BCvjuJ?=
 =?iso-8859-1?Q?zHTglewI9CjfZQJnmMZEGqImPZ4NgAix0tXJ8ihna7gxPBYTE0kxxuYZkg?=
 =?iso-8859-1?Q?3xZAdns4kgXxzjyKSRweO06nC/7kz0s7Akfv3FqggnTk6jNbiH16c2HNfm?=
 =?iso-8859-1?Q?BVVqwO2rVklwrIpQxD5Gj8p7cuYQjfMUrx4EdrN5KdIiz6jEX2F7UEGDB6?=
 =?iso-8859-1?Q?2fM9SMBFAA16OaB+qYW3YIqMYWbjqG4x5NSjrZrXLOIm2JDM/ONpyzGTIB?=
 =?iso-8859-1?Q?QMVpaJ5dLREREZkpfaGhGy0vuMZ3Ncuef2V3e03ebKI6mp7+SykvfzvInC?=
 =?iso-8859-1?Q?iW+bDXpoSl5Ei8IWNwOqhL8dbVG7yqQfRbPkmfWhg6z307eBC+PdJNEjXb?=
 =?iso-8859-1?Q?CodaCBhQcbUsqlOw/aEbOoX87+fN13XAujvZq5eoVZBRGSDYmkmKIDwDa+?=
 =?iso-8859-1?Q?vi9zJUy64pMuqeGAqLHzIjV17bLoyH7POHE0TcW9EgGMKK05lEG38pYyek?=
 =?iso-8859-1?Q?P0gA6hch/XJRverNwgpEUbXs8hhyyf66pgx1YLPKcSmt4+Uw3Sba5k9Zd6?=
 =?iso-8859-1?Q?7GC/Hy1yjNw9iiryruFF5zCru/Fumn0ehMKehEJQSMeAeDxz/AIbZzZHq9?=
 =?iso-8859-1?Q?d+eTRqM5gmCe2vunEJo++MIp+0vUuj+16g6PuvZPrZ4wBN/1xnXga3202L?=
 =?iso-8859-1?Q?4K8hhtBJtvHdNiiFy8vEaqBuKI9WgWHfDxXl6kZcYUyAuogQMSlKe9ScTH?=
 =?iso-8859-1?Q?a3v4ldsqfgrjdpiRi7pQ+Mr/hVBdIQdUf/PzYQ1KBGgkS8IQjny0TUNP27?=
 =?iso-8859-1?Q?m+fbGLLphLFeRSiPNV8qvIbLSFVePM0l2cX2INhgR8EgrDQabBirQ1a/nr?=
 =?iso-8859-1?Q?9/WCm7mkSd4hNAfHnroBPiueZBAoB+2KPfBFPiUtSMIC5p3ekMVZapbHGk?=
 =?iso-8859-1?Q?84IuWDdx93TBA5+BOczKTY0E9yym3DWrxha0bRYiWAFz+PFzJRn5o8iUXK?=
 =?iso-8859-1?Q?esI3QLGhlK7LplxLrBoMVg42uBViWrDSWarhmj2kyRSpsJvRD8rP?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae9476d0-1616-4c63-70c9-08dee0f9e2b9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 16:14:59.2085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KkYA3rjaixAFFtXu4UaVfRXsdFzfR3q0+LkOtdRCZ+jJJLC7zkb5xo2Fk6CQUelieC0AiqKb1r4rt+gURcPlccC+Zk8LQv2zhLLnLR8yMA+k/BAjpBfFJ9yIms65yImN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7459

On Tue, Jul 07, 2026 at 06:59:55AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Conflicting GPIO assignments for M.2 Key-E SDIO Reset between the `wifi-connector` device node and a leftover `gpio-hog`.
> - [High] The fan supply regulator `reg_pwm_fan` is never enabled, leaving the fan unpowered.
> --
>
> --- Patch [1]: [PATCH v7 1/1] arm64: dts: add tqma9596la-mba95xxca ---
> commit c06cc8eb19eb4a69fc0547caa6773b503beae3a7
> Author: Markus Niebel <Markus.Niebel@ew.tq-group.com>
>
> arm64: dts: add tqma9596la-mba95xxca
>
> This patch adds support for the TQMa95xxLA modules on the MBa95xxCA carrier
> board. It introduces a common device tree include for the module and a specific
> device tree for the carrier board.
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> > new file mode 100644
> > index 0000000000000..db2fd6991d112
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> [ ... ]
> > +	wifi-connector {
> > +		compatible = "pcie-m2-e-connector";
> > +		vpcie3v3-supply = <&reg_v3v3_mb>;
> > +		vpcie1v8-supply = <&reg_v1v8_mb>;
> > +		i2c-parent = <&lpi2c2>;
> > +		w-disable1-gpios = <&expander2 9 GPIO_ACTIVE_LOW>;
> > +		w-disable2-gpios = <&expander2 10 GPIO_ACTIVE_LOW>;
> > +		/* UART_WAKE is connected to SM */
> > +		/* SDIO_WAKE is connected to SM */
> > +		sdio-reset-gpios = <&expander3 2 GPIO_ACTIVE_LOW>;
> > +	};
>
> [Severity: High]
> Does this sdio-reset-gpios assignment conflict with the gpio-hog on the same
> line?
>
> The wifi-connector node requests expander3 line 2 here, but later in the file,
> m2-keye-sdio-rst-hog hogs the exact same GPIO line. Won't this conflict cause
> the wifi-connector driver to fail probing with -EBUSY?

suppose needn't gpio hog for expander3 2 ?
can you double check it?

>
> [ ... ]
> > +	fan_controller: fan-controller@2f {
> > +		compatible = "microchip,emc2301", "microchip,emc2305";
> > +		reg = <0x2f>;
> > +		#address-cells = <1>;
> > +		#size-cells = <0>;
> > +		#pwm-cells = <3>;
> > +		status = "okay";
> > +
> > +		fan: fan@0 {
> > +			reg = <0x0>;
> > +			pwms = <&fan_controller 40000 PWM_POLARITY_INVERTED 1>;
> > +			#cooling-cells = <2>;
> > +			fan-supply = <&reg_pwm_fan>;
> > +		};
> > +	};
>
> [Severity: High]
> Will the reg_pwm_fan regulator ever be enabled?
>
> The emc2305 driver does not parse or request the fan-supply property from
> child nodes. Since reg_pwm_fan is not marked regulator-always-on earlier in
> this file, does this leave the fan unpowered?

look like make sense, but dts itself should be correct. You'd better update
driver also.

Frank

>
> [ ... ]
> > +	/* D41 OUT 1V8 */
> > +	expander3: gpio@76 {
> > +		compatible = "ti,tca9539";
> > +		reg = <0x76>;
> > +		vcc-supply = <&reg_v1v8_mb>;
> > +		gpio-controller;
> > +		#gpio-cells = <2>;
> > +
> > +		gpio-line-names =
> > +			/* 00 */ "ENET1_RESET#", "ENET2_RESET#",
> > +			/* 02 */ "M2_KEYE_SDIO_RST#", "M2_KEYE_DEV_WLAN_WAKE#",
> > +			/* 04 */ "M2_KEYE_DEV_BT_WAKE", "M2_KEYB_W_DISABLE2#",
> > +			/* 06 */ "M2_KEYB_RST#", "M2_KEYB_FULL_CARD_PWR_OFF#",
> > +			/* 08 */ "M2_KEYB_DPR", "CAM0_PWR#",
> > +			/* 10 */ "CAM1_PWR#", "CAM0_RST#",
> > +			/* 12 */ "CAM1_RST#", "CAM0_TRIGGER",
> > +			/* 14 */ "CAM1_TRIGGER", "FAN_PWR_EN";
> > +
> > +		m2-keye-sdio-rst-hog {
> > +			gpio-hog;
> > +			gpios = <2 GPIO_ACTIVE_LOW>;
> > +			output-low;
> > +			line-name = "M2_KEYE_SDIO_RST#";
> > +		};
>
> [Severity: High]
> This appears to be the leftover hog that conflicts with the wifi-connector
> node above. Should this hog be removed to allow the driver to request the
> GPIO?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260707062506.949806-1-alexander.stein@ew.tq-group.com?part=1
