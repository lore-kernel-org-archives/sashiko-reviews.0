Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013070.outbound.protection.outlook.com [40.107.162.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BDF2C158A;
	Wed, 20 May 2026 07:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779261471; cv=fail; b=ZH0kYrc3jpmJJ92k4lJdLEDZnfzIkYs5+juu1tGERZXFmK7mEPOs9ppV8e251eTpoS5XI85JYRuXXKGfI1z1pgUMPc0Y7s+gsH8THB2AkbJ7eDIKnPjwlNl2thQIfFb5jW6SmJrOYIvudhGr/GSEtH7N3XCoSdCCXopccUAkVxI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779261471; c=relaxed/simple;
	bh=/U0wqx9Zuty8lsfyXpCC6FIwP/jt4dSruhamyTAvYLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=MsJubQ8KFs3yGi9DxUGsP86jY35OtHikedyaGfv1GOvkYD4Kpzr+OVk/k2DYtxFw/AzYBgcqRYB5F/iChSS2oJgerxui3GpTtjjrPkn4LfwVvXLB94k2/hbxPUd2xJJcXGUUtmNgYAeRDDg1qAitzdWA21NUvLfc7NARUTcvhcs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=Y5QMAoY3; arc=fail smtp.client-ip=40.107.162.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="Y5QMAoY3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZDvUmaPbBE8r96tr8Jd4OiavFG5Edvw6rnrY30poBxDKXBICrtA5HrLetwRRoj4elOe6UzJDC4xr+Gq4UmFkna1e4vdKd1Dbfa/EmCZSEe1yRl7z00noojjcQCG4bxnjwyV6Q2AX9BqdFSTXb91AfS0JDcHZTYfSFAzEL1LkJK+bSWKW2dpQF3xfirpaTGn4xvUbZPupJotwe9n/uluOQ0eI4w+I4wykQNN/wwiFXkK77LRtd8k5zwxTet5iGRXZ5GIOJSOM36O8JslcKTyH1kQpOarQNh8umykgGcRBiPuJ1DJm0C5GvOtywepuJQVhK0kQP10CfltB8TlFvj9ZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/0A28/LUc0SG6U8S6xppJEDn75y60wX6wRXE8nqim0M=;
 b=DSzaUaTqXWdcv/5SAu+9+UzIKsTJHR3lhIU7QWRxp+kdWThPRaWpg4bbu+S0/f2G/6Dhn5o+nFDTVaXs1ohkEP6LiFa00OlVod7Uhh2365Fe5yEMyOsB3CPmQX+dT291V5sKgCs8AEfhgkNAeGKP68QQlgcPoZNngtcox83BXEt6VWfPLb0f5/JsziIp7Hop1AIJEk0YfgLEszg+XsxXkr4z4vnTd4fFPD0DF6LU8UPcFQNAs+xvEwftl/uU9sfkWJu/YitY66qniN7eAbIqzbhgd2vZJy6opyRZHonRVU1+rgjFyr2jJq4x4UlGURdZ5NDh2Ws6XGqVsoIxqizl4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/0A28/LUc0SG6U8S6xppJEDn75y60wX6wRXE8nqim0M=;
 b=Y5QMAoY3iqlvN1dzRe44wzB2filbyNwXhz+eD8aw36MFk95kWG1IBUvSydasRk+n2JdRhUiwxQZPBA/nLUSeIjxU5ShCzaTujHJdCpK4sPZdLrc4i8MXdls0xMidZxU5/EfW1H0FZWrdvC3DwydMDtWOL6jTZ2QpafbC8zmeMdrtSxvXqXZuTC/ejctr1nWO7wfpuXaJJPAvh1QTAJdtWkR//qQc8cus3sAR8nDhvMCKOHKeiYlyduhAaKH94diLD5FKqsi7pOX2I76uGy6I5vJzp96QL6UWMeBB2Hm8XIwlSLqPg4vUA8HAje8GrdHFxsbxsLtooiCoUvG9jiGATA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
 by GV2PR04MB12137.eurprd04.prod.outlook.com (2603:10a6:150:304::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Wed, 20 May
 2026 07:17:43 +0000
Received: from PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50]) by PA4PR04MB7821.eurprd04.prod.outlook.com
 ([fe80::67dc:4bd2:8552:9b50%6]) with mapi id 15.21.0048.013; Wed, 20 May 2026
 07:17:43 +0000
Date: Wed, 20 May 2026 15:20:06 +0800
From: Robby Cai <robby.cai@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: imx8mq-evk: Enable MIPI CSI and dual
 OV5640 cameras
Message-ID: <20260520072006.GB2269979@shlinux88>
References: <20260515111143.2980956-1-robby.cai@nxp.com>
 <20260515113318.2A02EC2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515113318.2A02EC2BCB0@smtp.kernel.org>
X-ClientProxiedBy: SG2P153CA0025.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::12)
 To PA4PR04MB7821.eurprd04.prod.outlook.com (2603:10a6:102:c5::5)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB7821:EE_|GV2PR04MB12137:EE_
X-MS-Office365-Filtering-Correlation-Id: 908f08a7-640d-43f2-4a14-08deb63fe29b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|19092799006|366016|38350700014|4143699003|22082099003|56012099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	tAZx1UVsOeVn9hb+in99XZbEYb0zO+3QPDDHhni4rwyJi8LjFZVBueTL8cw04Q2cte5F13/ROoctOuNYFhBwViXqfx0IX8FDi6oNKJGDoOUxGsUbEOpfOcvMcoKIu4XuBZ3u6DzZZIJmG0F7L0EZ7cJ3cvoXgVPRnhjWrEp0RyuoKC5RMmD3g7Dqo+J1chtFBKBJRbU+MWbam5oWTsSgeQga6WzCiliAyyYmWUZL3Z2yMxl4ObaKNOqF9yXscbbl+aCFG5z4w22miYaeLsr5ANtqI1CVfG5zk8yzP3j6ygOwLG6BMJJ/hzwYyb/tKx39L61mfzsdqwtrDWPdnf5wnlzxKTbrbvNRrM7qpAEU7HXnDAcRp39adkNJ6BNP2COizFI3CpJoyuVy9/+0JVFRKir1UkyEm3EbTyazHIdUcO7ofYG6hKV+LTvC44Gayo5/mtiH9t6JrKaqI6QN7NNnO7LTY3SbXpj1OQsIkv0UYbpRF5Wf49M5RmHBtZzvZoq7yuaZ6uhwLre640CI5WO49jjncWHAOMrjwkOkrGTgN4nzmz4Jpsf4aeWkpsWyVsbHwsgv96nYuKL/cOig4dw8ySBglqjRG20iooT3yOmhYmlcgfXZee63D3toqaWB49TL+VAmWqhNIuCdFHcqP74G8fZxGRqTGigLEQatiZth1MN8dV+2d8L7z3G3l/8wiHRj
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB7821.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(19092799006)(366016)(38350700014)(4143699003)(22082099003)(56012099003)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ni9jbpoUE8wZnwRzxQZABmmLpd2Asx+ae/LDmV4LHBz/5bzpc6lSUSGwhAKj?=
 =?us-ascii?Q?is0UXlJQHAgRsfMLUs4ie4rL1z6Xg9Nrk82n3Nnn6KSLMTYEtEBl/w/MT7hu?=
 =?us-ascii?Q?LWciZpNSH6ir4jH5ohbvVpsNEQMrZHrcrzCUd37dbDqJSj3fM29C/MSCZVh2?=
 =?us-ascii?Q?bw+7jS984/wutfiL0OHL0r+VnPwnioKvIACOiG4orQ5PSayV/sfqs/NLhb94?=
 =?us-ascii?Q?Wtl509N1IxtlTmEJNfCk83gkLP50nG8wTVFZ0eqRuAaL3F2AOJ1LO6k56Dlp?=
 =?us-ascii?Q?/0Ie0H1J3P/BFpTucTgRxExZIi2p2ol+DUNvb/RrIbgVXHIvp7gNoRV6Gqml?=
 =?us-ascii?Q?1IwP9goP2DvAzoiU1fROkO/n/QmmuqWs4Im2CVW117JlWm8tFquQLIpwLhT0?=
 =?us-ascii?Q?363YGcGexuhkON1hyPdS+Bve0+IXwqUmW+Zx0zWT+FT79zCuOvSqm3RXsXUT?=
 =?us-ascii?Q?x7/KlWqRncA39xKW2ln0r+v/MqoZk8+5T/0Hptg5SEozL7NLwN2ne/AgP8Cp?=
 =?us-ascii?Q?JWt56u7FwSqZyshvdIVH+ta7q2T7RuIVowyX48RYYvMIRfZKMae585ixPIIy?=
 =?us-ascii?Q?39TvcY3oEdwApeOZ2sJvsZeg1ujrrIg+7N0j+naf6//41xD/u2+yparVab9n?=
 =?us-ascii?Q?qxlR4Y2OTN6CB9SbMNnbbSWzQzti9GIym52SUojDwYV9PRUZFe0ahOU/u1DE?=
 =?us-ascii?Q?SOQDSFuXD8QtI7eQnJjkpMpviTR05bi6zDgiU7tZV11bhAEKkwsuTf8/tPsP?=
 =?us-ascii?Q?lfQNIzoEKV5x+X6+mLMcHKUcFuZY7bmJgMiAHAAK2HYt0pvQNxu6MfydZy/E?=
 =?us-ascii?Q?+YVil3IjDkMf6r0QqHv1MSVOg1btFJnvJdWDgIbui2EezpYSv81IYQ0zc/tH?=
 =?us-ascii?Q?vYAlkV2QNm50TKL0XkPYFdH+DnMrCnSlvm2SH2/ojjsJRhbCum6u/CeHy2VT?=
 =?us-ascii?Q?y+xUnkJQAeIf3T6k6vCTx/Uy68OP8s1Ln3Kf5x5p5PlJQM5tgkehIf1JrmYh?=
 =?us-ascii?Q?n4FKIRaHcBEgilkSfsCYmYOXrPa3gAeToMT0m099L++44cN1GcC61e+VKa5s?=
 =?us-ascii?Q?/jwixzSDytQLlEz4/t+smOGj96usNZQD/DmmrJaakalNXs+r8nPxIyB4//3O?=
 =?us-ascii?Q?/Fz6B5ojwrPhoGQhwqmSxWqkzU+kdIjXlN2P5/sJcds1rDuT/OuGgvf5PVMH?=
 =?us-ascii?Q?g3z0zcbB7s5XFWnCpOV4AdsDf+9YCJnPiXChjVoMTG/R2myRYl1rhuKEZXkp?=
 =?us-ascii?Q?sW6nS7KWqE5f2dKBNElawX2SF4CyGe88ffYTUEyvU+O3X1ayTTM0sCc8gioI?=
 =?us-ascii?Q?aR6O1SHBX1oYHjmsZnABh5UiDZaAGMCbDG6YGOgdlLYPmY3k5gPizv0ZjDk0?=
 =?us-ascii?Q?03WhM925msxJeXlUqeru3didfSQn8+l+K2g+Cxlp6koQAy0qrCH5MFOIdsji?=
 =?us-ascii?Q?ByjiHJZX48iMWc2VO30Q8xhvJJdgnfaavStSI5aubQibGlbjpZx/4E/SdVTs?=
 =?us-ascii?Q?Q85FprqTNTjBba4L7yD+luK1xqK7XBTnXMFgY5uzIWuYuzyDT8THMCG+aVUo?=
 =?us-ascii?Q?3987oWj3hu+0qs5ywafvEj6r7WwSJxOBR7ZmmBPV6Yjl/SY4Azr8rEs4vs6I?=
 =?us-ascii?Q?JDISzTfhtJ27fsWpfp3U9soDMjKaF2Hg1dlUm9jeR0xsTFqJmlj2jHRo3JjB?=
 =?us-ascii?Q?Io0Aah09Ihk8TvUMMoKyAzJw4ISWjNh/P4qj1U6fX6NaOVMfpwhEa4csf0XP?=
 =?us-ascii?Q?9fU1/mX0vg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 908f08a7-640d-43f2-4a14-08deb63fe29b
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB7821.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 07:17:43.6494
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IupZo3jDaFQZFLAnmJZAqYrynXvy65XQR5pcFjLFwynzjqwj39nW15JXniOhvj/k7LUSWhKudIiDcGwbioutHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR04MB12137

On Fri, May 15, 2026 at 11:33:17AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] The proposed device tree configuration intends to use software reset by omitting `reset-gpios`, but the upstream OV5640 driver skips the software reset sequence if `powerdown-gpios` is present.
> --
> 
> commit d18d0c4c95f98f3312c777b828bf09c413169ce3
> Author: Robby Cai <robby.cai@nxp.com>
> 
> arm64: dts: imx8mq-evk: Enable MIPI CSI and dual OV5640 cameras
> 
> Enable the MIPI CSI bridges and corresponding CSI-2 host interfaces
> on the i.MX8MQ EVK, and add two OV5640 camera sensors.
> 
> > Both OV5640 sensors share a single reset GPIO on this board,
> > which prevents independent hardware reset when both cameras
> > are enabled. As a result, the reset line is kept deasserted
> > via a GPIO hog, and sensor reset is performed via software.
> 
> Will the software reset actually occur if powerdown-gpios is provided?
> 
> Looking at the ov5640 driver's power up sequence, the software reset is
> skipped if the powerdown gpio is present:
> 
> drivers/media/i2c/ov5640.c:ov5640_powerup_sequence() {
> 	if (sensor->pwdn_gpio) {
> 		gpiod_set_value_cansleep(sensor->reset_gpio, 1);
> 		...
> 		gpiod_set_value_cansleep(sensor->reset_gpio, 0);
> 	} else {
> 		/* software reset */
> 		ov5640_write_reg(sensor, OV5640_REG_SYS_CTRL0,
> 				 OV5640_REG_SYS_CTRL0_SW_RST);
> 		...
> 	}
> }
> 
> Since the device tree nodes define powerdown-gpios, does this mean the
> driver will skip the software reset branch entirely?
> 

Yes, that's correct.

When `powerdown-gpios` is present, the OV5640 driver follows the
PWDN-controlled power cycle path and skips the explicit software reset.

This is intentional for this board, where both sensors share a single
reset line and cannot be reset independently. To avoid interference,
the reset line is kept deasserted (via a GPIO hog), and initialization
relies on the powerdown GPIO and power cycling instead.

This matches setups described in the driver where a single control
signal effectively drives both reset and power sequencing (e.g. PWUP-
style designs), making a separate software reset unnecessary. [1]

Additionally, using the powerdown path preserves the intended hardware
integration: PWDN is the only per-device control signal, while reset
is shared. This allows independent control of each sensor and avoids
introducing artificial dependencies on the shared reset line.

For these reasons, the design intentionally relies on powerdown-based
sequencing rather than the software reset path.

I will update the commit message to make this behavior explicit.


[1] https://github.com/torvalds/linux/blob/master/drivers/media/i2c/ov5640.c#L2449-L2464

> > diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > index d48f901487d49..2311a05b88c50 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> 
> [ ... ]
> 
> > @@ -330,12 +367,101 @@ vgen6_reg: vgen6 {
> >  			};
> >  		};
> >  	};
> > +
> > +	camera@3c {
> > +		compatible = "ovti,ov5640";
> > +		reg = <0x3c>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_camera2_pwdn>;
> > +		clocks = <&clk IMX8MQ_CLK_CLKO2>;
> > +		clock-names = "xclk";
> > +		assigned-clocks = <&clk IMX8MQ_CLK_CLKO2>;
> > +		assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_200M>;
> > +		assigned-clock-rates = <20000000>;
> > +		powerdown-gpios = <&gpio1 5 GPIO_ACTIVE_HIGH>;
> 
> Since the reset gpio is omitted here and is kept deasserted by a hog
> elsewhere, does providing powerdown-gpios result in both hardware
> and software resets being bypassed?

Not exactly.

The software reset is skipped, but the sensor is still reset
via the power-cycle sequence using the PWDN GPIO.

The hardware reset line is intentionally not used since it is
shared between both sensors.

> 
> > +		DOVDD-supply = <&sw4_reg>;
> > +		AVDD-supply = <&reg_2v8>;
> > +		DVDD-supply = <&reg_1v5>;
> > +
> > +		port {
> > +			camera2_ep: endpoint {
> > +				remote-endpoint = <&mipi_csi2_in_ep>;
> > +				clock-lanes = <0>;
> > +				data-lanes = <1 2>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&i2c2 {
> > +	clock-frequency = <100000>;
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pinctrl_i2c2>;
> > +	status = "okay";
> > +
> > +	camera@3c {
> > +		compatible = "ovti,ov5640";
> > +		reg = <0x3c>;
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_camera1_pwdn>;
> > +		clocks = <&clk IMX8MQ_CLK_CLKO2>;
> > +		clock-names = "xclk";
> > +		assigned-clocks = <&clk IMX8MQ_CLK_CLKO2>;
> > +		assigned-clock-parents = <&clk IMX8MQ_SYS2_PLL_200M>;
> > +		assigned-clock-rates = <20000000>;
> > +		powerdown-gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
> 
> Could this regression also prevent initialization on the second camera
> for the same reason?
> 

No, it should not.

Each sensor has its own powerdown GPIO, so initialization is handled
independently via the PWDN-controlled power cycle.

The shared reset line is not used, so there is no cross-impact between
the two cameras during initialization.

> > +		DOVDD-supply = <&sw4_reg>;
> > +		AVDD-supply = <&reg_2v8>;
> > +		DVDD-supply = <&reg_1v5>;
> 
> -- 
> Sashiko AI review  https://sashiko.dev/#/patchset/20260515111143.2980956-1-robby.cai@nxp.com?part=1
