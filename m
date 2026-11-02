Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.162.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793652502;
	b=Knif1blVCuadkJuNoZK1dHL9q3kuhoTDNrCzQzUkcC83vQg2wyXLAu3CrgBDhx0gUGib
	 sGKpqBIIl1Nj8ya24sOOBPxl/bj87JG8CXWT45Y8Vw9TCufSpIroXOAiF4Kl6DlIwQ05t
	 hS+cZK4NB44e7hfWTLK9iwStNr9IrSJJSnPfwV45CVu3oSDa2POsiFgbnBmWbMqsSpQti
	 npPeYt9w8Jmw1X2PBUKzJDMMnDY110iSnSRfYTMrOzpUrHjUw2jATiLbvWcZHlMqEvDTo
	 kUiKyPXLjrl0xPEvCACG3qv6UZ9wuuuH02udCZxSU+C2QnGQbPopQMY/GNuJ/eIGwFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793652502;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=XylDP1s+5CPjzqGpaXbAJUf0OxjqPDCusRQmVpOhj0A=;
	b=fyZMGk5qxJz/0rhNL3/hvNPj/xiZ5G6K1wojj+eR22XIkyH3lg6Lth9KZpA/qgpHR8o1
	 SplZAoiKiazMl0vJbBSiXSHb/1H865CLLBQFm3v359BD8yB8kDPoeRxjGQYiunmlFp0o1
	 ESQ6/4sCZHYohCWN+xp7jz9ahKgXpqWLZKXsLCVOjRDRm0vQTOEgiZwDeAO6JhSSm/8Uj
	 HODLhkfJbKk89z2qevtDAOt9rXibPY77c1BMPPRIZhXeJxYdm1XQ1gzJfw6czQIrdhnl+
	 0KE2Tpv55Tx4eGdahZlFx85vEf/g0rlb2IoXANwNMw6EJ3e2uGg3kvqfV4eoW7nL2uA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=P+NlLg2X;
	arc=fail smtp.remote-ip=40.107.162.43
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013043.outbound.protection.outlook.com [40.107.162.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39198606A326;
	Mon,  2 Nov 2026 20:48:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39198606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=P+NlLg2X
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOvgm7s+Cgf6kBWLnSEspAWW8i4r8KtD03i84eWpSraFAM7NXZS/3SF7bnGIvYmmmj3VFM+z9S3tBJEF+vIA0CVu3LuqtqEYOHCL/uV6kzLEqXmGgu5zrass2wlrl036s4yYeqxtQ0Byiq2rEBBjWsm3IMGAmIV2abBnrGw3xgeaUIzAePDWWBcPfYioOGczrZzwlbB2jkLSf/vPwPtjCHToLTaoRf1b6O/s9/KVSy79L1CmZawGuXULsryG/jtkDsd0DrreRsBBs+szUwUVOmZauq3vvYbox1/J0HxABGMoztJDXT/Ax7AlPYUfSeCdiH79DnnNVhZdhmzaSqRhGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q3MxOS6rDREm3Qg8Fn0u6slTcop/pmUA+g6pyJJ8pNg=;
 b=Zmjpyf5/XyclcKOiPiR0mW7pHfvBH2xfnEWgO9mYrf955JsoS50bXDER8Z09uBqeWDI4R6z+eQP7ak0mC4Cw7wiRRw5JHorM2sB1Q4EVtdHA5sJGLo6OOpIePbGVrfEhQt36iuLhduTWWG5pglFhdGXRSmtKbN1/jjVJEwgVT88q7KU/N4hl2+SW1hdfU/32+P2qs2YNFWeBulKhowSolxqNsXLetS0CTab2ETjvOU3wTHZd3S8URYPDNODSLbz1L8ig0c6MP6zzRnMLR/1tIeHXezy+700TL4RoIj+b4xoDhpfHFuda2YVZtjN8wPDMXck/zz4JJ0kpoB/cTc79sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q3MxOS6rDREm3Qg8Fn0u6slTcop/pmUA+g6pyJJ8pNg=;
 b=P+NlLg2Xa9WDxeLKY5JQnCVPGuXYnjr9nhrrgqCjB4i1LkTdATs3HcS9om7tsoWCXMxyxdwvUSqFSNGO0d3g22nmwu06RURjmCT0wEzCDMtaEtf+Gs+/ljUweIhvYkOHz1z8oBDXwU13IGji3LNOLYupHZsWEg0wcig5M9Q3t59GD1L9vodykt4VE8DiVTzyTO4hdYgyZWajvYvci8S3W3Hffvr3dgcLTTTFsPbPez8dfJwGHa/Hh/BvIuQKO8trSZEhtoGMNjrG3joNHgiwvVEjXYiu1Ul65uN3yKUD0OZD6mFZPNLs6KvwMVpZDJCciqOWBofEptLRCf4NwW37Rw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMZPR04MB976480.eurprd04.prod.outlook.com (2603:10a6:20b:7c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 20:48:19 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 20:48:19 +0000
Date: Mon, 2 Nov 2026 14:48:12 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: "open list:MULTIFUNCTION DEVICES (MFD)" <mfd@lists.linux.dev>,
	imx@lists.linux.dev, Frank.Li@kernel.org, lee@kernel.org
Subject: Re: [PATCH 1/1] mfd: stm32-timers: use dmaengine_desc_set_callback()
Message-ID: <auj3DJ73ufuEELSD@SMW015318>
References: <20261102174656.3939832-1-Frank.Li@oss.nxp.com>
 <sashiko-outbox-193875@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-193875@kernel.org>
X-ClientProxiedBy: DS1P220CA0017.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:44c::10) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMZPR04MB976480:EE_
X-MS-Office365-Filtering-Correlation-Id: ffd11cbc-267c-426b-a2d4-08df3922a04f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|366016|1800799024|23010399003|10067099003|18002099003|22082099003|56012099006|4143699003|11063799006|261022105027099003|261022075727099003|261026140227099003|261026121527099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	npLph57bUTlVy5iwnihA4VNH5+5CeoLqX1Hbo453OqX6uY/M1I87ZrYSkpWBLKJUHGpDNBlwvds+fkxtMGqi3oXUGKw9okDtaWZ77mKjrJAhwL/pHmzqapxMU01m9U9cwFvy9TDoBtbmnnCiEPtMCuKerxUAYWpJqSFdODHshE/zznwRbaWXGhgX8hytcP2XVqo5ey2yENoqveOTcSENufop+wuSdy45yHOrzI54ZklF9DibGp3Z4nddBO97YsLBc8URCjO7oSuQ1eHKkf5u9bz+1HhGQyhm0dvegy1/czB7ToDwdmOK8Vjl+XcpYNj3cQWN9NwNhT8ZnC2yys9jwLIy7xrCOjzDzWbbpIWzftP18roZ4SdcHhiqmapu2+Q/5zsTSTurA/BK9aukSOScenR6Q4LKHba8+cuxkiWZlvaT/9kGRE1SJtVKszAXSDpWyaVgX3Qda0gdO9PNfLdJrVi7MHMhZMJ20gs0BP6LIKRf/JYLF/wu050d2PhODxn3thvaIPELz5efqV9Jsx6N4iwv43/1YHvpB7TydBAmf2UQN6H3WHOR6k2tYDHfVuHi9s6pxjKSbOMrXjv9lTTMgnUxyuvWKRp/hH7nR9kQrEA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(366016)(1800799024)(23010399003)(10067099003)(18002099003)(22082099003)(56012099006)(4143699003)(11063799006)(261022105027099003)(261022075727099003)(261026140227099003)(261026121527099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?73BCnImoatfwvXZDIcvB1aL7vUTNGVhTzOoGi67S9r7vhQyLUgUCcQvCMy?=
 =?iso-8859-1?Q?j8cuvbheboKmlOf2ncrputg+nuUWmmmWHP2jokwiaPkUFnrt+xKyYxSPDN?=
 =?iso-8859-1?Q?uiUpM8QvjTkVNI5sqlviIW4lhybgSPBJTdkyBOsrUDWLLZZXl8+qQ3yRGf?=
 =?iso-8859-1?Q?J9c7uPI3RJN3/DcAsg8x2Yo3OhqfIR5PAwPVBjnRrjYwX61GlyQOdXGGD/?=
 =?iso-8859-1?Q?+lYZWxfZJqQE+0xYBxb1BIdUnMxnUk8gANEQRP/S+vwBbrjdjk+j9g+xCw?=
 =?iso-8859-1?Q?IC5pBeZ2wa/4YyiI3JL7e310ojmI0Yj+HkgFXr0YHNWQF6AS371r/Nyb+l?=
 =?iso-8859-1?Q?5q8M9/fKo6BDNeotiGSUTiE+kphQ9hFz70n5dF4wPWQ56Y0EibNwrHP151?=
 =?iso-8859-1?Q?tuRlOBaLOszwqLtw42RuPXDHCafd9MLqX5YftxNgoyd+FiXsT6oyVjuBm5?=
 =?iso-8859-1?Q?raPb/4cDMcTwe00GNut78X6fcc8OqURCBwZXUaI79IgXnQX0MZtsJ/bFUE?=
 =?iso-8859-1?Q?8BX7IT5aTgx23XykzJg6DhZrUTIwcHVpW44D+6I9/IjXCd5bP6U6Z9x27z?=
 =?iso-8859-1?Q?hXy/zJkVsYStOeROBrqQqu0aMSR060/iKftdUD4ysfnw58W5In9FZfVPf1?=
 =?iso-8859-1?Q?hm8xuC7JL4sSggCeC+GtrGV+DMpJXxejlnkyrdFV6JRdFH35ZRtBS7TkAG?=
 =?iso-8859-1?Q?ypVHprX70/t0mohvqCs5e8K9l9Q2wPsW0GK8zZvrbWfxJrcFfuofLvj+T1?=
 =?iso-8859-1?Q?r9+h9J6MHSdsl9KBvzYcbeXd7esFekp8GvQ+u5q8b1gbnRwpypZkMtiWBN?=
 =?iso-8859-1?Q?2pyD3y1mOmc8GEdl3vWxL/uOxuLpylH4//1+P8OKZzD0fwaqXFF8q2ezib?=
 =?iso-8859-1?Q?vujBmeY8SZDJjaM2ZnO5nm7RPYT+j7EZXN55ZMrTLC0gX+QWY2X01MnkcO?=
 =?iso-8859-1?Q?3cLySStiyoZ/rzpgj19Ar8yDJmm6Y1LeeraJ1TNZBCOBowdIlbAv8IbqRw?=
 =?iso-8859-1?Q?b9QMlcHM1eTpum7TZF0jC6HZdXn7MpyS45qmZRrg6G9RfrlOFjV5ZRf6Iu?=
 =?iso-8859-1?Q?qm/GHRAN6tNbDdWL7CWh3jVrzpd8PFZdK5kL7EKx/TlL2Re3vBJyZ2/Fbl?=
 =?iso-8859-1?Q?Edav6cXO/m7m/V3pxqnG1r8yz+6AMsjgKWDT2KX5Oaj/bIVPgRdwl80FEq?=
 =?iso-8859-1?Q?Em+2elTGqL4YyTnPU45CkyoDN7QHjgB2/KFB11CrK+SnknPe3vEP7zUMo5?=
 =?iso-8859-1?Q?hzMoEtGoAnxPvvnWvTTZlx+q1Aa07yHCgZW3XzEpU+Ocs3PzxrAA7xzN1D?=
 =?iso-8859-1?Q?p+LU9P29Mu2l9M28i+vebg0qVrHdVKchxIxtE25KLae9R6U8umvB8rnfQ0?=
 =?iso-8859-1?Q?VNO1cWtL4cjXKFi8qVAgrfX8/5SccFlEqIsP4bxUNLAY9LUBUDoDpzaohh?=
 =?iso-8859-1?Q?M/wWlRfKJFePdMHWCiqyCSBcbGRccTEjOeASp0j6/4/nX7IX++LY/uq/aL?=
 =?iso-8859-1?Q?+aD5RresuvfMWhwPgcUzgJqFLT9BEvXIF+Zb0yer9zQ1UICNZWgaLYvwgX?=
 =?iso-8859-1?Q?ky4qIEsO6qHhlI29ue+bntxMQjxVf61wXyjVCH92Zmz3WhnWJGypgAguTW?=
 =?iso-8859-1?Q?PGHoHfdYO7xKUCpBZxb/0LwPMcPmxCfqUG48MCroQqTSyz36ImwjRLHNii?=
 =?iso-8859-1?Q?q4KTjd/e5oWTcgGqEBD2JYGM0ttrz+ibd+VZ9JQxgFK5rIEgaLlEAyUObA?=
 =?iso-8859-1?Q?NmLYw/VfmyQIUlSIUQpWVKACnBqoYG6pfOm6tYRWfeOApcQcxCfjU4neGi?=
 =?iso-8859-1?Q?uuI4O9hmXvx/DawcIb+Sp4q+fh4XsPYVzS/WmM56TA7yof23/JlB?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffd11cbc-267c-426b-a2d4-08df3922a04f
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 20:48:19.2989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apaSTkJ+BZHf8qmigsJHk3PBBn90urK5F0XHCWDUzHE8XbRe4xnDObUT9HyK1Pl6b9L4h+eSRKv+MPFQZRW7v2Q0qs2pPzZwmlCxFa1lEEKK0QMCa7hEB2i4wb0zolYL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMZPR04MB976480

On Mon, Nov 02, 2026 at 05:52:16PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] mfd: stm32-timers: call to undeclared dmaengine_desc_set_callback() breaks build
> - [Low] mfd: stm32-timers: uncapitalized commit subject description after prefix
> --
>
> commit 90e59ce1010cceb53a7009d41c5cc59f1c853e30
> Author: Frank Li <Frank.Li@nxp.com>
>
> mfd: stm32-timers: use dmaengine_desc_set_callback()
>
> This commit replaces open-coded assignments to the callback and callback_param
> fields of struct dma_async_tx_descriptor in stm32_timers_dma_burst_read() with
> a call to dmaengine_desc_set_callback().
>
> >     mfd: stm32-timers: use dmaengine_desc_set_callback()
> >
> >     Replace open-coded assignments to callback and callback_param fields
> >     of struct dma_async_tx_descriptor with a call to the
> >     dmaengine_desc_set_callback() helper.
> >
> >     No functional change intended. Prepare make to struct
> >     dma_async_tx_descriptor private to the DMA engine.
> >
> >     Signed-off-by: Frank Li <Frank.Li@nxp.com>
>
> [Severity: Low]
> This isn't a bug, but MFD subsystem conventions expect the commit subject
> description after the prefix to be capitalized:
>
>     mfd: stm32-timers: Use dmaengine_desc_set_callback()
>
> > diff --git a/drivers/mfd/stm32-timers.c b/drivers/mfd/stm32-timers.c
> > index b3dbc02aaf798..4f344f2a5a26c 100644
> > --- a/drivers/mfd/stm32-timers.c
> > +++ b/drivers/mfd/stm32-timers.c
> > @@ -102,8 +102,7 @@ int stm32_timers_dma_burst_read(struct device *dev, u32 *buf,
> >  		goto unmap;
> >  	}
> >
> > -	desc->callback = stm32_timers_dma_done;
> > -	desc->callback_param = dma;
> > +	dmaengine_desc_set_callback(desc, stm32_timers_dma_done, NULL, dma);
>
> [Severity: Low]
> Does this break the build when CONFIG_MFD_STM32_TIMERS is enabled?
>
> In drivers/mfd/stm32-timers.c, stm32_timers_dma_burst_read() calls
> dmaengine_desc_set_callback(), but include/linux/dmaengine.h does not declare
> or define dmaengine_desc_set_callback() in this tree:
>
> include/linux/dmaengine.h:
> struct dma_async_tx_descriptor {
> 	dma_cookie_t cookie;
> 	enum dma_ctrl_flags flags; /* not a 'long' to pack with cookie */
> 	dma_addr_t phys;
> 	struct dma_chan *chan;
> 	dma_cookie_t (*tx_submit)(struct dma_async_tx_descriptor *tx);
> 	int (*desc_free)(struct dma_async_tx_descriptor *tx);
> 	dma_async_tx_callback callback;
> 	dma_async_tx_callback_result callback_result;
> 	void *callback_param;
>     ...
> };
>
> Is this patch missing a prerequisite commit that introduces the
> dmaengine_desc_set_callback() helper?

Already in v7.4-rc1.

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261102174656.3939832-1-Frank.Li@oss.nxp.com?part=1
