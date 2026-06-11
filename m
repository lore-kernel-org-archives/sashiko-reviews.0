Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011028.outbound.protection.outlook.com [52.101.70.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39689FC0A;
	Thu, 11 Jun 2026 01:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781143188; cv=fail; b=fuU0tWDAKvRPlK4ePkbtXtVBOzXE1Og86uGQ+rXN8PC6IJWhUxg9BljljResyDh8/yqccMo5bIk7Hx+zMVXVhcXrfkobnusnk38K5OTBEAINtD2eP5vraLP2n3bf/yuET7prQmJzQAPalXDFBqb3DIIuRmAifOs4oQ3YyR63uts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781143188; c=relaxed/simple;
	bh=Cgeqj7R0TlINMnetuHuZt9Q9DLKoH30pHAX9XxWUAqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=nY79qZqz7ErFhR10aebeawnMYQ+xHjz43u7zRD9Ke+GPpQbm6R7KlELPBv049Ckl5+182pfDv1a3b9BpP7Hp5qKb3WCtugOmPH1Cj9loeV+I+A8AAhEcAFjE+3vHCNVkHA4+FTIcvilSbgLveiqELRnfFN8EoXznPJdb2I8nb5Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gxwKPPY3 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gxwKPPY3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YH5km1dB+xFkiBUCNI7G9rCz+EfC5C4cgkWyEdPUx/mgTgPHn0FHFrs4OkYx1GDmfomLY873AgOQoE2wG7W3vi57R9aKpezVcY5mjC+AFnuoPpXkTjKHT00wGXeCxnTrShHr3lfOjCVMR64/a5KyKwdFGY62EsVQTcFxLrq0vInK08FD67OqUtYRRHhW5EkkEZ/KsryLOvWgh/REAK4llYAcJEdu5Gf4FDxAvYh01OuDODcLMLr5KVTEePvq5E19bRDCd+Pob0tIb9vY0IJRdtrhbj9FzoLyuHPG3TBYYArFl0ORkA2FcdfsHVEpzOgSPcE7zTVjQkMKs0yQ5pWfAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bAAuw89rmQmJBHKl1Jnb7NvpIlADat+ZnV7vtLittmA=;
 b=tmXflTQJ0rIQXUCBhQI3iNwzdzfqtoCkx5O+ai7Et5v8kE2XDbFulE1zbwl6updTw8BC6MVoFhyuXPEOjTVJfHFL+Ig9EbmPA73JrZUIJP2VzDqwmBTDXe5l+YZ4wu53fJY9KOFdsviCbuP/K3QEqRaKUrg+xvOLpxPKqaxGN6zgKUsi/Nr9h5rLZw0mOQJ5xMsTfzTX8i2F6Iw4+jtQ55GBSYPjrT1AU42/WKTBNeLa9vEpfp3gI7BvRyNiy+ahiXxd0I5kFbd7xn3iW+2NFWnRtQMhWWrk4CZoOCK4Lavd3rIH6icV59QkqNqsPZHvUOh08wVjb1LzxA314LI/Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAAuw89rmQmJBHKl1Jnb7NvpIlADat+ZnV7vtLittmA=;
 b=gxwKPPY3kPPJtKSLgCu3/h/2fw3Go2NWxtqrlqGsjiJZZqv9wxVedkQ4FGxh05zVv1ia3/3rHjz0in0VqNpBUdpQf+c/0phIvIiOwveN7QTnHOxOK2Vw95q41PutJhzYKuvHlDZ0g3G51/yLBge5NtalyLEJoeWy0QAeo398tqcj3Fz/epHdcLoPKuzFuku0frqF10anqKyV2SvdcbrvsX/9M3NsTKtPQJTIpAnaZHdTbDMoXZEhh7NJ/C1VVp2GXelEcBWEhHMB81UWR7DOC6y1uiIxURNiIJiI9BmF90dbgVyMCkQCv3jia7sEDpCBnbXuuPeCy3pkffyObrsVDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by GVXPR04MB10135.eurprd04.prod.outlook.com (2603:10a6:150:1c0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.14; Thu, 11 Jun
 2026 01:59:44 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%4]) with mapi id 15.21.0113.013; Thu, 11 Jun 2026
 01:59:44 +0000
Date: Thu, 11 Jun 2026 10:02:55 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v4 2/2] pmdomain: imx: Fix i.MX8MP VC8000E power up
 sequence
Message-ID: <aioXT8gTULg1Fulo@shlinux89>
References: <20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-2-ea58ce929c84@nxp.com>
 <20260610133429.B58471F00899@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610133429.B58471F00899@smtp.kernel.org>
X-ClientProxiedBy: SI1PR02CA0045.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::16) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|GVXPR04MB10135:EE_
X-MS-Office365-Filtering-Correlation-Id: a50fd81c-8401-45ab-2adb-08dec75d1b85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+iubQ7LnxjA4KU2UMjRYgVcuEbgwFlZlQssnvwIE5EGdDp35rRJlZl5G/RB7xJmQ+oWeHlq8E0vCXFcB3hMT2NVy2R5q1vIbjL5KISGpzf6e3AegCxkplNtMsXSp9x4/0Ch7qQ2DKLSkZdAIjr5efe+TmALsI6dMG8W5uoNsWOM/YaufWuhlMJGnrnMebWIrPn+WZlDKE4mwOyROFKezfJb+fNh6Jwslt2F903reosWbvHmN5GXteBADCAYjcdOhFB7NWoG8LfCIjo0nUjCGw8TInXHnWTVxnqQ5Dzm34LNyH2Q2UoYT4G2lEuoNrgPba5YjbfaycgpAWnS1YkpCHHWbaTTDThFERzB86lIQiG5yhqAvvuth+wExvFUg8EGHWHUIjnA415AzB0tlDC3z9NhKgItkWGCF3eCbruiajC7NvSs6yU5qAoEm/T/OdM4R8KEXuMldX6d4oM672G6QRJBOAjxc4v/BZdV1uykMSV5FrLi5Vdc8f6ibQIhUZ38BCeEFEwDbgbTc/0Sz/uxMB7QnS9/rnQf+oakYG4/41QYp06IAV+LzhE2I/bFy++areZA1uKKogHyE0UNzQIzZkntTz4qUcgdr0IuI1e06EwQucK5sBaSEnHwSqZbQzAxAWyivVT4ibf5cTEBP9v6aUA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?+jrVotSip27gNBxlYPn7d3ijNqnxOLrZd4a57W6Wwuwh29r2KrxdYwSPpQ?=
 =?iso-8859-1?Q?LM+/kpHbfnWUzj6id0cbjaJgdVutaJJgPLe2qSxrB38hglXQMr/d3mqXbI?=
 =?iso-8859-1?Q?ZvuFGEBIYZYvBORGHxsrvApSnkqqhOwBObob5NAhiddT9XRHl3TlhhdpKa?=
 =?iso-8859-1?Q?APdSBdnM5e8YaiDUZ1X9NujY+hpfb7eZ8T9oy5qfQmEZbuBKPooBfO5ahk?=
 =?iso-8859-1?Q?DHfBSpszIPvh4pMJOblwokm787/fYF5miHc3UXCPhPbNKj7z7H0kmCs26K?=
 =?iso-8859-1?Q?GPeD9FOsNv3eEdAHsd/t5bdNTiohJA9TI3MYmPTI7rupg6svPrBf2O5uX/?=
 =?iso-8859-1?Q?lnXMxDZ4nSkHhwTK7KC8MtB/n0BqJeXlGqna3Ki25J7RVnLXl41rEH9X77?=
 =?iso-8859-1?Q?snGH0pMbrRIo/91Lk275JnDcHT/xXyDFT7ZmuQE+QzpbZrVhToSNg9s1+g?=
 =?iso-8859-1?Q?ecKKMITeRIeThSk9PRPPYq7VVm6c48MDWsTeK8X8JOpsYCQL4AbHjtTa7c?=
 =?iso-8859-1?Q?7Ov9rWG5zomXlj9vfmcRnKJcX4P5/JUtE7se9bIeIUectNFc67whsK0jod?=
 =?iso-8859-1?Q?+BqTUYmhjRcOZRTP5Y+ZU62dPrBs48NnUaNbUDZ2EWQXaP56ed8aWbLILy?=
 =?iso-8859-1?Q?1qTVLSnyXwAa01em25NSyNU0BQhEdttWwx0kgv8OcHZ4Z/tWA5H688oR+o?=
 =?iso-8859-1?Q?K+HfQZwe3Aot6QoRNZsQd5JvP/p8bHC0w2+WGr2WtWX+bL8e9tWOPI8qsl?=
 =?iso-8859-1?Q?a/9Q4wEQKz6J9togsYFzbQPIsC8vanKmtJeSdpyeOY2gD6ASck1gImwLP2?=
 =?iso-8859-1?Q?uiVtbGCLTE7IfYOYKBBwjO/o3NiX210UYwX3XgEwYr939/n3rL68MLsWwe?=
 =?iso-8859-1?Q?VI29pH36j06FC01eXto0RG40Y0glww/UQXNqoiXbNjPwwO/5bDojMGeNwA?=
 =?iso-8859-1?Q?8RjSNfOCkFUHMfzNpHs8BnaUCvwnWygQqTcuG7epKVbyww4AGAdqDtTUJm?=
 =?iso-8859-1?Q?uzdB+lN7BOUtVHMIldCAYVR8d6MEtBknrOYDRxG6u98v6DSi3E54WrZLEr?=
 =?iso-8859-1?Q?DdDxNQb9kSJpP7SATZVFf/Y2sLF5RTwEMX7hxlg59rMuQUce3HxO0Nte06?=
 =?iso-8859-1?Q?GPTIMWxwtHdyTFLr1tBINydFbI3SGHYUBUQ2x3WgmnMJo3ZgD9KeJIQTiZ?=
 =?iso-8859-1?Q?uBGwtUcDRWmhDV/xt20YajPVb8Sj3pOHlpXdFGA4KkrDydi/CPo9WpyMOo?=
 =?iso-8859-1?Q?OHulw7qfZc4rH/uzKyJNwcSQmSoamZpVzuAyxFeoNNiK/UuUXEFbv+4XpA?=
 =?iso-8859-1?Q?vxdTZS04yEHb9cWOi6M28PJNfFp+zFQiaO/YUuBMiTyYzy8yCNKoITCu/a?=
 =?iso-8859-1?Q?wcIlLNQuhXncG3O724FmkpRfdT546MYExGt0/3niKjCN0/2P0vNdfmJsrT?=
 =?iso-8859-1?Q?ONlbYGbAsIx7htOJpNs/6t5FHnYg7iPFlUPqua9wP2ZIIEycclso7of7ZW?=
 =?iso-8859-1?Q?tHN/dHI5o2GcUHDAVEqJutKmaE6jHrFzXFJ034vEaPTOtQP52IRCBRBgQT?=
 =?iso-8859-1?Q?W58PuRD80SRexE7DWb5y37VvWDBTKi2QMTZWmSQ90LiZLEVE7mWkhUxQl1?=
 =?iso-8859-1?Q?HWG4y4zTISbUOMt7SbI7eXP0eF3Zk0s+5QT/s24/pmFUjrn+0EgShPBn8e?=
 =?iso-8859-1?Q?InrchOWduYUueOeBfudGFOO5kO2HJc4LtmlX16uiUWw6d7IdBjiYuzHCH3?=
 =?iso-8859-1?Q?6EFwdvf2gQKbQP8k3tch2PYvYOAQeJDTFQTtOplHpOKxc0FGlk/tCOTvYu?=
 =?iso-8859-1?Q?/jP8ItUNBA0FZ9Q/pUDmS6YJgVFAd8Y8dANM9Q4FcSHxILFkqWNx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a50fd81c-8401-45ab-2adb-08dec75d1b85
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 01:59:44.2168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1I3Ii6y++YOD4wUxfQ0EiIdfO42czF8EJq+BPQCkt9K1N9S0vILej7QAc0+K62gBb3OgEmqM3yHNrgKsXwG27kYG9UgD/QoHNWIdcgk8pekJYxt15uZmSfxQlwmXRBtN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10135

On Wed, Jun 10, 2026 at 01:34:28PM +0000, sashiko-bot@kernel.org wrote:
>Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
>
>Pre-existing issues:
>- [Critical] A registered PM domain power notifier is not removed if `devm_of_platform_populate()` fails during probe, leading to a Use-After-Free.
>- [High] Missing `pm_runtime_put_noidle()` for `domain->power_dev` when `pm_runtime_get_sync()` fails in `imx8m_blk_ctrl_power_on()`.
>--
>
>commit 66b12e5f806bfaa002428850f133acef50ed1a55
>Author: Peng Fan <peng.fan@nxp.com>
>
>pmdomain: imx: Fix i.MX8MP VC8000E power up sequence
>
>This patch addresses an errata for the i.MX8MP VPU_NOC power down handshake,
>which may hang during power cycles due to timing issues between the VC8000E
>reset and AXI clock. It introduces a boolean flag to apply a workaround that
>clears the clock before powering up the GPC and enables it afterward.
>
>> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
>> index e13a47eeed75d..99d100e1d923f 100644
>> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
>> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
>
>[ ... ]
>
>> @@ -108,7 +117,11 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
>>  		dev_err(bc->dev, "failed to enable clocks\n");
>>  		goto bus_put;
>>  	}
>> -	regmap_set_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
>> +
>> +	if (data->is_errata_err050531)
>> +		regmap_clear_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
>> +	else
>> +		regmap_set_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
>>  
>>  	/* power up upstream GPC domain */
>>  	ret = pm_runtime_get_sync(domain->power_dev);
>> @@ -117,6 +130,9 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
>>  		goto clk_disable;
>
>[Severity: High]
>This is a pre-existing issue, but does this error path leak the runtime PM
>reference?

Pre-existing issue, I could use a new patch to cover this.

This patch is only for VC8000E errata fix.

>
>When pm_runtime_get_sync(domain->power_dev) fails, it returns a negative
>error code but the usage counter remains incremented.
>
>The error path jumps to the clk_disable label:
>
>clk_disable:
>	clk_bulk_disable_unprepare(data->num_clks, domain->clks);
>bus_put:
>	pm_runtime_put(bc->bus_power_dev);
>
>	return ret;
>
>Should there be a call to pm_runtime_put_noidle(domain->power_dev) here to
>balance the counter and prevent the device from remaining permanently active?
>
>>  	}
>>  
>> +	if (data->is_errata_err050531)
>> +		regmap_set_bits(bc->regmap, BLK_CLK_EN, data->clk_mask);
>> +
>
>[ ... ]
>
>[Severity: Critical]
>This is a pre-existing issue, but is there a use-after-free risk in the
>imx8m_blk_ctrl_probe() error path?

Ditto.

Thanks,
Peng.

>
>If devm_of_platform_populate() fails, the code branches to the
>cleanup_provider label:
>
>	ret = devm_of_platform_populate(dev);
>	if (ret)
>		goto cleanup_provider;
>
>The cleanup path explicitly detaches bc->bus_power_dev but never unregisters
>the power_nb notifier from it:
>
>cleanup_provider:
>	of_genpd_del_provider(dev->of_node);
>cleanup_pds:
>	for (i--; i >= 0; i--) {
>		pm_genpd_remove(&bc->domains[i].genpd);
>		dev_pm_domain_detach(bc->domains[i].power_dev, true);
>	}
>
>	dev_pm_domain_detach(bc->bus_power_dev, true);
>
>	return ret;
>
>Since bc is devm-allocated, the memory containing bc->power_nb will be freed
>when probe fails. When the PM domain later changes state, the core will
>iterate over the notifier chain and dereference the freed memory.
>
>Should dev_pm_genpd_remove_notifier() be called before returning to prevent
>the freed notifier block from remaining in the generic PM domain's list?
>
>-- 
>Sashiko AI review · https://sashiko.dev/#/patchset/20260610-b4-imx8mp-vc8000e-pm-v4-1-v4-0-ea58ce929c84@nxp.com?part=2
