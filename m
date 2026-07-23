Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013005.outbound.protection.outlook.com [40.107.162.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C8363D25A2;
	Thu, 23 Jul 2026 07:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784791460; cv=fail; b=nDop/C87v3F5/YDxMTnfVyw2ZvYJaS7MSO0aO3GpBw0JQ7bLanj29ayYh46O0KRPCi1WQCqOP74opy+KkUpkFcZNV5pWdu2SrFxrxeJyM8CUGnidpW+do5F3fdrtDeFOLJ8ECdHIfFzU4YBZvt/5M3U0wMCJOGEakOKaxT2Xd38=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784791460; c=relaxed/simple;
	bh=FvnUGZoeRTE+zu23lg9WpUy9RKsneZQT7KFlbQHaR9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=A8M3sN2VwPpeLtdDf7+gxrItJ/oAWZzGA1SPLWYbilJL2Wqqhg9StrAMTModRH0ygIjoQ75V/m92+s4rXPxyu6NdvLzbo3g3DY2AGCzyZ5pLNb8+4NHHc5dErxh5ddDOIxdD9srf2ZuGB1QjNH06mN2F8MIFEhn7XiMSSo5Q8lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=H/L2+e2q reason="signature verification failed"; arc=fail smtp.client-ip=40.107.162.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="H/L2+e2q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gp940gU9rJtUpekCrdSwGjfWrnbMSECNk6wvG7oKr0P/HlE8icoGhnOHHski8k0jLqvIeY5YweefjLIh5Oz58OCxqjxUdjSxgbxCu/OICqETBI+bOSmxhEUIBxNGV09Iw698JrK+AoHCvmEFtmWBoq/Fu59u+KSzj+69A/36hotoRtUeDeMIYI0yUTq1DpPViOV6YaNswK9Dze4b5XtocyFenPEYbFMfQkDTEKCW3GLNXaA2wd81zCmzEFRRtrsQJk4XFVjBjkNh0oCQKLkFHkoWaylti3Jq3XT0Vw+YKu223Srhz3udGFR7RmGgkIdMwsXTZCptPX9DdNGBWDMQQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=grB6ih64akBv1cc41to3998fFEu98ifTHlet4xlF9hA=;
 b=QtykAe3/oRARcL5MSMwnNelsSaNOP/QlscQXq4KCJs4hkRk2vBLQ3cks+vHJpKP2YNVUGoJpzzGHZQSjupW11JRIgdk69ILZLxY/N9YoQ/OsNNs0YSDhbwNnZQjzpOUGZ8bfV6iHeOXgYgNFf2boORDS1BcJW2WiFZA2xF2JtMJKFhYqex0TGattvtHwSoeWChgzrImH4ufRcQZyPnd/6+jMM8iK1NIA145CDVA0Mh1t6B0YNunQ+rDJ6RbrhhokPfZETTY6P26zH0ylyOSexNZJNPcaXL3PC8c8hdkMO78U1AAGxhKYUYR6tHYzc/vfmim7r0wenoHdkxlia+K39Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=grB6ih64akBv1cc41to3998fFEu98ifTHlet4xlF9hA=;
 b=H/L2+e2qV09zDaOW9969aFkVJRt2TfAFk+gAEm3ZT8LrEe3t3li6av7wFapL3UGaNkHQiRK3Jzi/G7JuKaAC/f1XAaxpF0sWb75/3rVDSVTA6lrVF5tqY+L4efSTNu2K7T3Q7F+Hqjsr2PFlTikIFWmLK1w9WGhQNUaSE1jXN4CuglTWuBD1n+/cGpRzux+V5u3Y21By/oX87RC9nKq/+bZ3/AqPhGuOswvUfpkvUgClQJ6iVVi+5aE1q0KraKtdf23dMRd3YBuQ5tDGId+5EYEQOTXoVgZZvET++huU5t5/JG8JoPgRZFjlaR8s80zq2373LPktZetnOF9aCuCb4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by PAXPR04MB8351.eurprd04.prod.outlook.com (2603:10a6:102:1c4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 07:24:16 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 07:24:16 +0000
Date: Thu, 23 Jul 2026 15:27:54 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 5/9] arm64: dts: imx8ulp-evk: Add gpio-keys node for
 power button
Message-ID: <amHCerZ5p6UlSyEF@shlinux89>
References: <20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com>
 <20260720-imx8ulp-dts-v2-5-d05c67676f53@nxp.com>
 <20260720143716.036BB1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260720143716.036BB1F000E9@smtp.kernel.org>
X-ClientProxiedBy: MA5P287CA0225.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b4::14) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|PAXPR04MB8351:EE_
X-MS-Office365-Filtering-Correlation-Id: 42dda8ae-941f-4f4f-5610-08dee88b66e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|1800799024|19092799006|376014|56012099006|10067099003|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rLd4eI6VrQQ9U3d4UPp0clAidJGC25KtEbAFi9ECR/MRGHR4XYcdBpYK6dvQH5031e6rcOfnao228NkNoj2HaG5Lm00kbOoLWsUibkMVJIZXj1HJLyejBZwkElDI0FW7VfUxHhjqIEKzCGSlotGsLqWCBwIwiCug+g28aGdy5QWOWO4YOm14dRiRsHC8TLDRtoUu6hDiENRIkeJWjtv/WIAAfMbh0C+s2WgnZ3fBLMv708yBkG1SXt44GdNaPj6AH2cLQFo91ahHKBlRY6xx0HGeK7lzBFddEE6N0/LLeX7asSb4pHqgznZzVhH4tzKYUG4tiu2sE1QT+cxR3XurkBGyurWlu2l4y2NLmrtxD/CISyjSpptI+Ego87HdFjTAQjCO/r95pJy5EkQCqEMjX6iSdUBnm2d0cNzeoklCT4FeepyXNWnaD9+sdkzffvXJM5JYkjzaP2NyP1CjPdjvlsMGget/e9iTd8v7z3FNfPF2NKf5oen9V/Rn+ee8liNYBULJPfd5uPm3o6pnt5puG0C0anPGUF+n3f0mMEBH6yE6aOt2lhd7IQezGbkoDHIi1jFG49ZztMoaN0qb2DhjuiAJZ84sZmKIe7GBQR+qkSM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(19092799006)(376014)(56012099006)(10067099003)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?SCuKJ7g8ew4DeTFk0gNlGVvRqxcXrfguQ+egcTxZjEtAKczn7iHJ5moarl?=
 =?iso-8859-1?Q?L8VGgDPJkCIvY74VpCSUUtOzdZqRLT2xuYGI9xlDAz/5otj4bHODv7YLaH?=
 =?iso-8859-1?Q?nUDH5Ad5joo8KXFm6nkKMvGA6Of4PYrKLUps3BsJilV0BlC+w9MY1HWPRc?=
 =?iso-8859-1?Q?KpPBfVKBbixz3uT0/OY9XUBbIGlRhPjfAUK3vuu295Cd+ouMGxZEj+SYRd?=
 =?iso-8859-1?Q?fj4MQz1NO8WxQCbD4cgK2IEPO1102tXzAWZeP2O6abSI1NRpTjiAaHVHZO?=
 =?iso-8859-1?Q?L7Jr6StaJVcQLX6CLQmNo9I76R6Df87+Jmmpa6/2OzxRsPf+BCXlC/YEQB?=
 =?iso-8859-1?Q?KOaD1En6gopJHfOV5uBN1eQKNCukj/xDm3MRBloMhHt94qgObUUVeCCzhm?=
 =?iso-8859-1?Q?4Z5e+xhuFIcpNp5xaryW+FPFa042LXkzrwiBOFI7wkxRJ0YA+LE8gphKAk?=
 =?iso-8859-1?Q?f42iWziyNj+oLG/3Hwwpo4cQ9NfhPogVnKxRpy7Kk/6pBEGNhuxBaPKkXN?=
 =?iso-8859-1?Q?dhUZ6oTbWg3pi+LHj/NWviYWfZe1ud4vVkjxSMwc6GgSO6QQD3TNlFiN04?=
 =?iso-8859-1?Q?Ul9dvAXjvhoTq9hY2rn0sFp+Jgnwym8N1ze2eVuKSxhIpsKAnP72hkK6+l?=
 =?iso-8859-1?Q?iW9zJW0UIu8fTAiT03RKpnZ0qDUgVCn3Dpgz8uWudf2V+LK2LWNsbC8k8g?=
 =?iso-8859-1?Q?CcsfWuUug2D0Z9uSFTAin6ZAkZaZ63kvXnftpf/LRt6215cMpiejeSm6m6?=
 =?iso-8859-1?Q?K4nOAbyUzlYWjDuDzzwlfxmffjhRnkdgKy9IJqyfY5V6SEgbH+T0P0ZZJi?=
 =?iso-8859-1?Q?bIObi2ZO/Qc+ikNf/cDWyb63HbpJx1+9HgjSGovDMM3Q5N9IMxupov8cZm?=
 =?iso-8859-1?Q?D/TmyCymSC0QzqaBQDKTgi8Yu0gZNDGbkqcFgMg2VwV1hXNcdGVXk2M1dw?=
 =?iso-8859-1?Q?LcTx4t0YtNQDl8dca+HBgUBZt7G7X3tWUWijhSzocb1OilfGe175W1gs3Q?=
 =?iso-8859-1?Q?zmMdpq0Uu9u064bK1V0K8zq1V7CIw3Yk5Mu7C64wwrc8dfSNl3OFLVZx85?=
 =?iso-8859-1?Q?SQHCTyn8xHfvQJSnRGYRI4o90AVMXAwei4IglrEwyBZwrOutF5OC0WCExN?=
 =?iso-8859-1?Q?7fWhL5ZM4W7r/tM+1p7m4JmLrd8eZTXmFR/jSih4E2/xB2562LNRxQBANV?=
 =?iso-8859-1?Q?4Pl6Jb3ooIbeXvGGeO5LEfDaKgL/owEd9jwbmZvh8Y5qdCqq9HHDK41pHZ?=
 =?iso-8859-1?Q?jxkqKOh8UjuSjxrKdGMxU05fst/omTjXE+u8gLGyasBhGeGRZ/ttBg6DOD?=
 =?iso-8859-1?Q?LTGmmWym2m6xxcDQvEUlZQhINPb5AvR1FEfzAjdUAkP4slOoC/Rc6Su+P0?=
 =?iso-8859-1?Q?AANoNy229Is/uD2TqNyUxO8v8VJpVB18m3oLDcldP1WyQvXDleFO/UqFkX?=
 =?iso-8859-1?Q?fJ9RbZZLny5lRUtBpEiZ6UpIrBVJiPSI70t//3MAixCtH+Ow7hc6s1WTd4?=
 =?iso-8859-1?Q?n7ruEjIT7XOE00fZQ5qyGUMN56vLI9UIXMDsaa31V/GuYeHMzxJBZh9I+k?=
 =?iso-8859-1?Q?cZoCwcyfneyrGg3IH6CuWtcX/2olTQD8AoPrWZU6r69JTzrGIc92RoQ+Zs?=
 =?iso-8859-1?Q?8iQft9/QTWUvsTF47qgGEQ0U0BcLCHaVsHpVEbHEupI/qQHGhyir1QiTKr?=
 =?iso-8859-1?Q?oDi90Faijsftx2XOJuw7BKu9UxzoTl9+KdRcsxZjGbaJvprix+HP66Fn5O?=
 =?iso-8859-1?Q?gSy7s/2smC1Wy433RL5qU4IkcgDBj8WUHfNouyZwK7+2xFbcHU+q9yhz4D?=
 =?iso-8859-1?Q?BprKq56NuTdr0DqgqDR1RKZd/Czyio6oOsXgVBe5xr5HWtzClwT5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42dda8ae-941f-4f4f-5610-08dee88b66e8
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 07:24:16.0575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dUUn1D4ngKb3fmt4BAuUOz0h3scjAXNC/6TXC4F0Avr9nrjUoi+sF9M7pyPpoWN+8o2rxdqtvhjAXFuC9ERtVTfJ3ga2NH6728sKR5q7GuXjkr0aLairKK/NSldyKrzM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8351

On Mon, Jul 20, 2026 at 02:37:15PM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
>- [Medium] The power button lacks the `wakeup-source` property, preventing it from waking up the system from suspend.
>--
>
>--- Patch [5]: [PATCH v2 5/9] arm64: dts: imx8ulp-evk: Add gpio-keys node for power button ---
>commit 7fed30ac7ebed8088b601492b14b387b09c09f46
>Author: Peng Fan <peng.fan@nxp.com>
>
>arm64: dts: imx8ulp-evk: Add gpio-keys node for power button
>
>This commit adds a gpio-keys node for the power-on button to both the
>imx8ulp-9x9-evk and imx8ulp-evk device trees. The button is mapped to
>report KEY_POWER to user space.
>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
>> index 5497e3d78136f..af8f0d6087f71 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dts
>> @@ -10,6 +10,18 @@
>>  / {
>>  	model = "NXP i.MX8ULP EVK9";
>>  	compatible = "fsl,imx8ulp-9x9-evk", "fsl,imx8ulp";
>> +
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_gpio_keys>;
>> +
>> +		button-power-on {
>> +			label = "PowerOn";
>> +			gpios = <&gpiof 11 GPIO_ACTIVE_LOW>;
>> +			linux,code = <KEY_POWER>;
>
>[Severity: Medium]
>Will this power button be able to wake the system from suspend? It looks
>like the wakeup-source property is missing from this node, which might
>prevent the button from acting as a wake source for the board.

No. this button could not work as wake source when APD in PD mode.

>
>> +		};
>> +	};
>>  };
>
>[ ... ]
>
>> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
>> index 5dea66c1e7aa0..6a92c5ca9a412 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
>> +++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
>> @@ -20,6 +21,18 @@ chosen {
>>  		stdout-path = &lpuart5;
>>  	};
>>  
>> +	gpio-keys {
>> +		compatible = "gpio-keys";
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pinctrl_gpio_keys>;
>> +
>> +		button-power-on {
>> +			label = "PowerOn";
>> +			gpios = <&gpiof 31 GPIO_ACTIVE_LOW>;
>> +			linux,code = <KEY_POWER>;
>
>[Severity: Medium]
>Similarly here, does this button need the wakeup-source property to wake
>the board from sleep states? Without it, the GPIO interrupt for the power
>button may not be configured as a wake source when the system is suspended.

Ditto.

Regards
Peng

>
>> +		};
>> +	};
>> +
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260720-imx8ulp-dts-v2-0-d05c67676f53@nxp.com?part=5
