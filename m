Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011007.outbound.protection.outlook.com [52.101.65.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 420A042D757;
	Wed, 15 Jul 2026 18:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784141388; cv=fail; b=hc0yoHfjyiiljhDp1fENErEcmO2sJygcZus1HqyGZSuWkmbwxFyA1RIFL8+1O4AVN/R1QznnMmuTTrYLcUmOgZItoQSEUn2hBQVFbOaaT+W8AGW8KY6gMYlM2k8hdq/1P8xXunfpO9D1EHzxoNtxQfMC61qZWk71Z6s4wp8Kp/8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784141388; c=relaxed/simple;
	bh=F/cheBJhfdOl0YyRkcX5DVcABnzeeOgTe0dZbHgJupc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=QM5H8ME5ICCPJoAOmV5yljwTehgxKvUB/3IgPxcUhOKAd8NWHXj6V5C0R+ieLfsTuI2gHzutxcWbGg2C8bJA8OCw19I2hmxNVYZp4Or1MduZdlxJQ+1g5N9uZn2RuMsELEa7TUXlJPDVIvN+FiAA3N448diMMFB1PgI/9dMrUTk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Q+VfIHll reason="signature verification failed"; arc=fail smtp.client-ip=52.101.65.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Q+VfIHll"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5iVzUa5dZHSASVEtIONmmOheOxbA97kHLCiodI4s1PCjmtVOGjjpRQ+Da7yOVcgRTJ4sVSGWkHGovC7Otanp9TWdsiW6K4x2rMSRIvfNxCyuq1FhL7S573wG/CA12ACTMOyw1Xy/KFXkla3aZ2JY39kxtcAu4UoyGuxGV5V3BS5Kj2WLqWYnMbAh50LYtcsln8s6lWSzG0mabBYbvNDx/F3fbfDjVLfTs2wQMyQjlg4hwyQMU8zxqScWmUHywVm7S6GDdZOLw0dvzhwONpm3pdchhg+eNLEF3EUQUyHxdPb9TY+aGWWi/nRRaFCgtM3MUk2TsNKdLCI3vchB3mXkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TleNCExtqlFA8KaP7SR8+FMsNwuPmpyY/5pEsFql0E=;
 b=C+CpP8yN+74wNogxdiE8aKaqzcOhhNWvJU0kE3D/vsG75N8+Hg1w20ddXvX0G844IkP7o7dhr6zU6VzOoUBrqpdvCVH6WB8EBRCdjdcwuMYSig+kvzGUgQZL8eyoMefVj8OwNjtQZBTt2trUyj+3amL/6XCKhUDG69SvOfADXSHbJJ/tbAHy39js50LlvDrU42hQeQqzuQUYni/RhHXuojH2hfa42IpURA3Xqsc29VuQeWgofP7llONG2hWuvWwB2MCITERkYOz2x3THGJsmC2Ru3xH4AeirCiVxcice/oMNnB+zRecE5mij0sXdbR6QVL95ZWc77CMQ6e4Gjz+I4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TleNCExtqlFA8KaP7SR8+FMsNwuPmpyY/5pEsFql0E=;
 b=Q+VfIHllbwHRPKeIia2yYCP7xf9DLVN41Ui8CmV1cNP0mzLFknjNuOY1DfBQUCJhlLIoJ2cwOnPZc8YSnEW89MJE1mranAyvtY2UWll1byMKtXJwPHY2rj930wbAkItsnnWHpqxKUS3Gs15eNsu364ObaPDJyz3/ptQABBLlE/IWteyxQnTiNVatOH4gKAVOcoAbcjKnQXDnyGTurH80ENMvcJL8u8c45JOLr7aoCQqp7q78Luvh07C0ypqSr6l1DMnCxpmCevLlfSD15dy57nkvXHWLWlFO6e2gqpySUMxdD1B4VbRu0EcYu/jpwRlYh/SYXGBRRpv75RDYX0t7jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PA4PR04MB7822.eurprd04.prod.outlook.com (2603:10a6:102:b8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.9; Wed, 15 Jul
 2026 18:49:40 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Wed, 15 Jul 2026
 18:49:39 +0000
Date: Wed, 15 Jul 2026 13:49:32 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>, robh@kernel.org,
	Frank.Li@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v4 2/3] arm64: dts: freescale: Add support for Variscite
 VAR-SOM-MX8 QuadMax
Message-ID: <alfWPKIeGqn_Er5B@SMW015318>
References: <cover.1784133402.git.stefano.r@variscite.com>
 <41ef8c2a7c390ae5703c212e8b51fdd20ba9237c.1784133402.git.stefano.r@variscite.com>
 <20260715170007.63B8D1F00A3A@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715170007.63B8D1F00A3A@smtp.kernel.org>
X-ClientProxiedBy: SA9PR11CA0014.namprd11.prod.outlook.com
 (2603:10b6:806:6e::19) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PA4PR04MB7822:EE_
X-MS-Office365-Filtering-Correlation-Id: fa58c6ff-ca82-4720-62f0-08dee2a1d30f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|23010399003|376014|366016|6133799003|18002099003|22082099003|10067099003|11063799006|4143699003|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	QhEpniUzoov63skH/+UrmGC6s+IA4EjhsltY5Z+JsfP15SqCRm1q3swZgUCfU5ChIZdjaJc8IRTEd+OW4dYYoc1RUNRJwr6NVexE6WGz/SewB0jxWk+d6v9hOSszIBnZMi0/odGj7dE2K/xDhu9T9gyOH+RHOpBuMZfG7tDLiy7Y1qrbTU4Q6AJlNq976sGphrSkAT37VMyZnB+dB+ym5f1qbRzualvgNjkr3lMMhkmXem0G1vqUsFj1lJlcuolqHWRtKJ8/Pj58RNHHucQr4Is1YXzvtGmD6GPcYfJIWdi+D/mih1L4KSNyH2yEfQD0ZrTRFdNOxPICzzF0Xf0H8n2xHIGstsDlbPbgp6zgkrzP6I07T+a+ic5L0Hqqelkc4Qhqj219rhlIMc2AXb14dDGSEUUK28lGyt6YA2sGAfg1w59j+VhGknSnWnfqQYdiT3QO7gJvqy4FyJ2oRGIMgQzXEZfajYjbQwI+vICL3inHH/UwE6Rr3lypnpK/qWRb8PSe/ynRFshMgB/8vMv8GVNtP3cj0+T/nguaFzkyyk8Zz3bTBFTT8W2WnIRbXjJJ2jMjtiTwIA9CzcUguz1+cVDWxu6XA/9KUsmMsStu8/o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(376014)(366016)(6133799003)(18002099003)(22082099003)(10067099003)(11063799006)(4143699003)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?3D8r+8+ovoFB67EwxLm1Ex0L8y3wZmX2C1WYLEoNzWb3zzPWJUqi1blW6m?=
 =?iso-8859-1?Q?Ti5CbA6BddKRt5fdHZ1F2VL/r6eit4+kHo3Q7+pU7CwXB2zDdbYOqJ0gF1?=
 =?iso-8859-1?Q?7TAVT8JACoZS1lK3ex5eol8dJnTkoaOd2JX6gODwFbjWTKfpbUTRe/S8fr?=
 =?iso-8859-1?Q?wrqI5smevyH+X9456ssjtk0lCd34EgTDBH7o08ynPT1GukMN6XOjMJIbrn?=
 =?iso-8859-1?Q?eB75WvnyiSwHFpJNLdR6hJDg5lhxFa5muHo+Wo6FOGkJiB1C4LZJBkTvFB?=
 =?iso-8859-1?Q?htVNWj0kRFZJURSa8IRfILapPsqd+0GXRWHxu9xXoA45fP451foghUsW2U?=
 =?iso-8859-1?Q?XWhQJuk4QDgwSfC3R2htIjMam3eV4OzYuvBcv/cormv5YnUlctGdixesdm?=
 =?iso-8859-1?Q?ApUN+RkXaTMmOjZ6ACM8+Oj7Q1MfPCgfYf4CSs1zG4zoyOiemSKMsrC9rk?=
 =?iso-8859-1?Q?6KJmmul55rs+3Xsp6WhEEPcP3mCamYccHnDIO0S50p4OFvmwm6BKCmPkns?=
 =?iso-8859-1?Q?vuG/rO5Q547uwtLFz7XQzmVnupFz04eaXlpJHz0X58KTjmBI7IwpxxRSAv?=
 =?iso-8859-1?Q?vSn7K28vtW5Gn9bVwpwVqk88wnhZg9lX2wfb4QVyN6Aif3Xfah2OYKghVc?=
 =?iso-8859-1?Q?ITG+PBofyHBRuoHIYh80vGnK924fGEAJoBjbZDzg1zmHFKRDAWyQcjwS8W?=
 =?iso-8859-1?Q?W1J8DVfD7VZPfH6jwjMYAD2B/xXJVwqMb3QyDp4JYGlP/YNcL8LZxpgev6?=
 =?iso-8859-1?Q?+DH/1gkpqmEQMq9F7ps52bdQfRnQMZcWN8t0QTyem8Nyionj22QcgkM+qn?=
 =?iso-8859-1?Q?j/yPWt3yeWSlAXIkYzjZMbzj5KgZNCJlkDEmZTcnPXYsnCHLokXSGsmsdd?=
 =?iso-8859-1?Q?ov4w7A8E1MP3xzMkItDdBLs8eM+ntrWdIpEXTETApEnDaPLiHauuuGW8cX?=
 =?iso-8859-1?Q?qXJyLdGIjKDD0hOAdPwTbj/gvNAeGKCUZY2xqacACyRxsZZZBrfaxTZRSO?=
 =?iso-8859-1?Q?MjDuDMSPcjQTdYKm+gVOUXNG4FTL/JJcjKTVnDjKu3kOS+4KySBLkEdl23?=
 =?iso-8859-1?Q?EwIlKprmaYaHGKt1Hf8EMnj65BvrbwamERI+PJW6e235Q5foWjun/B8IZi?=
 =?iso-8859-1?Q?iiKd4MjHcI7rSb6WRBkhezlSOGzxYnVhQOBLhRULAftYzRSbgbhZLaaKGE?=
 =?iso-8859-1?Q?J4j2VwwZpTepXDJw8PRBAzY1TKlmqqxBIqkGIF/N4FNoBWKHY5l4Imdlyk?=
 =?iso-8859-1?Q?zBNLpQ4fkxfhQQFwNwFZ86WITj0Jg63wvjo1VlS3LhGYVboIYgoYz6zCg0?=
 =?iso-8859-1?Q?87848ZA/m79MdY6yghr5NpqU/U/wexmsfqVMJQu9OS5lkg9QuDrNx7oRlZ?=
 =?iso-8859-1?Q?v3MWh1yjLfwdU7o9ttovD8O06jDzhg4p9LppcvhhOCc9iDmQklbpQW8AFD?=
 =?iso-8859-1?Q?czMyhHg99q2e3YQJGrX9hQWMNWBqXKN1xMtksoWa7yoKOyJsgqRRzT+xYH?=
 =?iso-8859-1?Q?pw4/biIFrxeR6LtBoJjgQJZUWa/pCzhyb/jB9KbH6lOLKYFq7rHhwIgZ9X?=
 =?iso-8859-1?Q?67wDPTbF1ZhbmHn1nenBT77lGkOWzBC9SO7JimrVGa84HHiH5Cp/H1gI71?=
 =?iso-8859-1?Q?G+3vFsp0NXUYJzbYcxr6EEF5QJcOURIBjFsN06d37HJadx0xpuQp1GQliU?=
 =?iso-8859-1?Q?woMnRWbsJqeVvYEG6ZDJfr27nLWfEO8cv+d+Jd877DGlFyvgAJl/2QGu7n?=
 =?iso-8859-1?Q?4LyAgDUOgqDwXOx9cmMk+ar115B9Dzj8KBvSjmVF4qWzQ8PcN31G4MLpLD?=
 =?iso-8859-1?Q?y4pMlK8kdShvKNbB4XgHvH6dwuEqqLuAKBbuKTbm5nRjdl4nscjb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa58c6ff-ca82-4720-62f0-08dee2a1d30f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2026 18:49:39.5673
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unszBCcvriAA+IeXIwNA1W3w55MNKaB+ZBUypJkEb65TVB34LN4j5s53eX3hck/DeiliaIB6kerF7n2Un9f6H9DaOoYYXEFTTK33A6rWyvgfYGtJrvR++HY0OFSoCdKd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7822

On Wed, Jul 15, 2026 at 05:00:06PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issue(s) to consider:
> - [High] The CMA allocation range starting at 0xC0000000 falls entirely outside the statically defined 1GB memory node bounds.
> - [High] Assigning a 3.3V regulator to the 1.8V WM8904 codec supply pins violates absolute maximum hardware ratings.
> - [Medium] Delegating WiFi/Bluetooth hardware initialization to user space scripts bypasses kernel power management and is a known DT anti-pattern.
> - [Medium] sai7 targets the wrong LPCG clock index (IPG clock instead of MCLK) for its assigned clocks, leading to incorrect audio clock configuration.
> --
>
> --- Patch [2]: [PATCH v4 2/3] arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax ---
> commit 62ffa3edc88c7bf11df029d0ed1df55635d9355b
> Author: Stefano Radaelli <stefano.r@variscite.com>
>
> arm64: dts: freescale: Add support for Variscite VAR-SOM-MX8 QuadMax
>
> This adds device tree support for the Variscite VAR-SOM-MX8 QuadMax system
> on module. It enables module-specific peripherals like the i.MX8 QuadMax MPU,
> LPDDR4 memory, eMMC, Ethernet, WM8904 codec audio, and WIFI6/Bluetooth.
> Carrier board interfaces are left disabled by default.
>
> Link: https://variscite.com/system-on-module-som/i-mx-8/i-mx-8-quadmax-quadplus/var-som-mx8/
>
> > diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
> > new file mode 100644
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
> > @@ -0,0 +1,531 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> [ ... ]
> > +	memory@80000000 {
> > +		device_type = "memory";
> > +		reg = <0x00000000 0x80000000 0 0x40000000>;
> > +	};
> [ ... ]
> > +	reserved-memory {
> > +		#address-cells = <2>;
> > +		#size-cells = <2>;
> > +		ranges;
> [ ... ]
> > +		/* global autoconfigured region for contiguous allocations */
> > +		linux,cma {
> > +			compatible = "shared-dma-pool";
> > +			/* VAR-SOM-MX8QM doesn't have 1GB variant */
> > +			alloc-ranges = <0 0xc0000000 0 0x3c000000>;
>
> [Severity: High]
> Does this CMA allocation range fall entirely outside the statically defined
> system RAM?
>
> The memory@80000000 node defined earlier establishes 1GB of memory starting
> at 0x80000000 and ending at 0xC0000000. However, this alloc-ranges property
> starts exactly at 0xC0000000. If the bootloader does not dynamically patch
> the memory node, could this cause CMA initialization to fail or trigger
> panics?
>
> > +			size = <0 0x3c000000>;
> > +			linux,cma-default;
> > +			reusable;
> > +		};
> > +	};
> [ ... ]
> > +&i2c0 {
> > +	clock-frequency = <100000>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_i2c0>;
> > +	status = "okay";
> > +
> > +	wm8904: codec@1a {
> > +		compatible = "wlf,wm8904";
> > +		reg = <0x1a>;
> [ ... ]
> > +		AVDD-supply = <&reg_audio_supply>;
> > +		CPVDD-supply = <&reg_audio_supply>;
> > +		DBVDD-supply = <&reg_audio_supply>;
> > +		DCVDD-supply = <&reg_audio_supply>;
>
> [Severity: High]
> Does assigning the 3.3V reg_audio_supply to these 1.8V WM8904 domains violate
> the absolute maximum hardware ratings?
>
> The reg_audio_supply is defined as a fixed 3.3V regulator, but the maximum
> voltage for WM8904 AVDD/CPVDD is 2.0V and DCVDD is 1.98V. Does this hardware
> description misrepresent the physical setup, or is the hardware actually
> supplied with 3.3V on these pins?

make sense, reg_audio_supply is virtual power supply, not hardware controler
it. It'd better to fix this

>
> > +		MICVDD-supply = <&reg_audio_supply>;
> [ ... ]
> > +&sai7 {
> > +	assigned-clocks = <&acm IMX_ADMA_ACM_SAI7_MCLK_SEL>,
> > +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_PLL>,
> > +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_SLV_BUS>,
> > +			<&clk IMX_SC_R_AUDIO_PLL_1 IMX_SC_PM_CLK_MST_BUS>,
> > +			<&sai7_lpcg 0>;
>
> [Severity: Medium]
> Is sai7 targeting the wrong LPCG clock index here?
>
> This assigns a parent to <&sai7_lpcg 0> (the IPG clock, IMX_LPCG_CLK_0)
> instead of the MCLK (IMX_LPCG_CLK_4). The sai6 node correctly uses
> IMX_LPCG_CLK_4 for reparenting. Does this break the MCLK configuration
> for sai7?

lpcg 0 is wrong, which come from downstream old code. after switch to clock
indice, it should use  IMX_LPCG_CLK_0 or  IMX_LPCG_CLK_4 according to your
user case.

Frank

>
> > +	assigned-clock-parents = <&aud_pll_div1_lpcg 0>;
> > +	assigned-clock-rates = <0>, <786432000>, <98304000>, <24576000>, <98304000>;
> > +	fsl,sai-asynchronous;
> > +	status = "okay";
> > +};
> [ ... ]
> > +	pinctrl_wifi: wifigrp {
> > +		fsl,pins = <
> > +			/* GPIOs used by user space WiFi init */
> > +			IMX8QM_SCU_GPIO0_07_SCU_DSC_RTC_CLOCK_OUTPUT_32K	0xc600004c
> > +			IMX8QM_SCU_GPIO0_03_LSIO_GPIO0_IO31			0x06000021
> > +			IMX8QM_SCU_GPIO0_02_LSIO_GPIO0_IO30			0x00000021
> > +			IMX8QM_QSPI1A_DATA0_LSIO_GPIO4_IO26			0x00000021
> > +		>;
> > +	};
>
> [Severity: Medium]
> Does delegating the WiFi and Bluetooth hardware initialization to user space
> scripts bypass kernel power management?
>
> This pinctrl group explicitly reserves pins to be toggled from user space.
> Should the power sequence be modeled in the device tree via mmc-pwrseq-simple
> or fixed regulators so the kernel can manage power sequencing autonomously
> instead?
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1784133402.git.stefano.r@variscite.com?part=2
>
