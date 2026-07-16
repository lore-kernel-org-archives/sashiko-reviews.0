Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013041.outbound.protection.outlook.com [40.107.159.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B573AFCEE;
	Thu, 16 Jul 2026 10:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784198538; cv=fail; b=MEQG8KrhLIkzBdVvQQ6AIQeHzcZfKM3SefG7zRbwDsl9kb6S50qcKGbsUjBs0aUYuVjNCn9NQ1O0dWMGz4qIUtO3B2Cp4+YkL/1vBgudS0Wcqx5ArFHzL+rY4mahL7einBU3KhyQwXRYcIjVryb8ZxJg5IuP4Tbdi8f53AMTbko=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784198538; c=relaxed/simple;
	bh=jHeRodYYg1krMtxtCwtH5jaqWwhaSYVDpwRbf/d2nGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=koAeMYFGkQ8tI5kxH7bQdfAikn0fddIVZ1DzWrrG4tIGocNtoKrT569YkKTfb+PuhxbvJhr84CTNO2Tog+pONSwm4XU5xoPg3NIYKv96uEy5F2YzmElxymikG2t7DiLumQDsYKBIU5faPJRGsJlqaudW36aTg1Y+A7KRvIBWzUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=IWLw/5aU; arc=fail smtp.client-ip=40.107.159.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="IWLw/5aU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LCSyXBGG8qUAXceUVMR6ge52/4iA15k2syqPKsP9uHGjHKBP9S10uB8Sx2QEoGvWchHx/4/feDoKO/BqBz8bYL8BX9di/XHoI48/cdAniXgY2gJ/Hazb//9JnfvjGBrMWucu2VxrMBOveVcVvCWwIneQuHmfJx8cK46Ipsy60HQi92GnE696kc/16K4vS2HQc7Zm47rGy8ZUtYwZYPz/ob0B4eBD8qaxHwMM9MEMdZNJCB6r31GU/u6ZOB776pAW3wJVq0rN7joXjzEPW4wHDmT454LJMV+O8HWbuEfgdFT0UD8QxXftiUIARSsCMks13IB/m6LchzSchK5yVTBQ6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VZ6lHFCu0Wg4qTUQTpRRuNRkft52tB9ztn4HXixFJ34=;
 b=bwOHmcmjrIMeWw4EQwEUp/sAm8Kuf8UfIbIp41J4tSfdAc4ZN59Zn9iIsK91ZI86mk4p1vXgVbLYkObooBHnMqwVgkxBaZbxkvs/gZ4ly6fv+6745e2/6lCrMq28TXXVQf7lyGfO0a5swaY/NkxRG0O+1kkUxu/ISwBSskUmDjNZJv2dqOXJGi1HIu82QQyNWRtCQOW14PaPjcl8Uxa0F4pdmRNjkna/1k9kivkNzqVG6hgHHtklfl0FB8czPZPCqQQSM1vfKHcdatZVWINuQprXIIVzqsak7FcZ78IWdV3/qXBKqhGz8ssCqjDGrRwLHP1GUoUcD3WM8Y2V1doCvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZ6lHFCu0Wg4qTUQTpRRuNRkft52tB9ztn4HXixFJ34=;
 b=IWLw/5aUdxqdzYsIZiGQALqiVa+cT/OJaHz/dvPQehExhjLfuJNUpeK0VMaoWYseWYllN+Hxg8VsZHIbxQBItwtVXHeRdAAbjbc6l9AVeS4549U2AQnN2f8FGlau3NZs4SUy7UjmfclV6vg7ACi/2+h3fqSqpoihNuCKw5s2gqMlJFSmUXJnF3+ClrHguU126DCNYIDfAA3Nw+j4yHnQ631WzdvQ4VPsQARGDuIEx+t3f286EgqWMzKCnHUO9ZU0Z1upgF5XLwQXfEsksqu9WEvx9dMATiykZ+56rw1Ey3cWpF847D1ZSOTBfzLHSSl/M4E51pgfViaJuPca6KXcGg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com (2603:10a6:102:2b4::21)
 by AM0PR04MB11878.eurprd04.prod.outlook.com (2603:10a6:20b:6fb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.18; Thu, 16 Jul
 2026 10:42:13 +0000
Received: from PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d]) by PAXPR04MB9422.eurprd04.prod.outlook.com
 ([fe80::54e:28bf:aa85:d25d%4]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 10:42:13 +0000
Date: Thu, 16 Jul 2026 18:40:50 +0800
From: Xu Yang <xu.yang_2@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: olteanv@gmail.com, linux-phy@lists.infradead.org, imx@lists.linux.dev, 
	vkoul@kernel.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
Subject: Re: [PATCH v6 1/6] phy: fsl-imx8mq-usb: fix typec switch leak on
 probe error path
Message-ID: <tm3ptavs6y3aejixayfbwb4lziy6jzj6btdds2kq6m4hzvd5sf@6itsf2kksoob>
References: <20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com>
 <20260715-imx8mp-usb-phy-improvement-v6-1-00d95e270e4c@nxp.com>
 <20260715114626.651A81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260715114626.651A81F000E9@smtp.kernel.org>
X-ClientProxiedBy: FR4P281CA0175.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::12) To PAXPR04MB9422.eurprd04.prod.outlook.com
 (2603:10a6:102:2b4::21)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9422:EE_|AM0PR04MB11878:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fd80803-c411-4f09-5a5e-08dee326e56c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|19092799006|366016|1800799024|6133799003|4143699003|56012099006|5023799004|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	GMwftpMZTL9Vnz6QdnDA6JyLb6mia7anDUT3uC0DEGYLckufJRen1v4KNxLqRnwhw7yZhG4SPlQPsdIKkgvNNnLFxV9hwPDBxIlB8EWw0DMD0XBsq71gtUoxj7kV1twnRAoY4J1erxE8J/BsXO3Sw4npzM03WoiWgsLSB+5EDFVFLWaWy+CmCLqAYbIZz1Ptu91boiwTGxnYf6ASt8iHSa+ZoDc5DzpLKxTpa09Tvd2qDrzgXVdwsGalTj17JW+sQzzE46JNAU3bJ/WTh48PFXtiDi5yPwMBQXbO6JoEzmj5SZOGU/zlZGy4IeYXsKc5fm2bz8fnhSPKOqZAOgvxTHHbcbd8KThqAdIP5wJm9JQBtz8qoSYjEn7OgHGNT/FBVjWG2EQlgAlqvJwW2clac4k5HwioRHL3D8J8m+BFUvLPA59l9NCo7f9uHbk2MaM5SEOuHgNSJS58b1JijadsB4t7EHqDs8q3P28DcCpE/ZFzd3/wVkt6OAqUfLcmuyGYWAvr/Q9wf74FuFeBwPDEAvhrB1Q86KAUA9zU4JnbWoQRZ8vRxy0p1y7L8i3Lpmyme23WgMhDPJ+ooBcGK67gyOdAODnbEk7G3qqnqHHc75w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9422.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(19092799006)(366016)(1800799024)(6133799003)(4143699003)(56012099006)(5023799004)(11063799006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RlhrdWphS3lVWUM5bUdySmNkRW42MHVvVlpvSThDaTlMNThiMEo3OW8wZUJa?=
 =?utf-8?B?dG42TUQvajlDcGJGL2w4YWlYYjRNOE9adllzakp6YmtCY1UyYnVTRSt4bTFG?=
 =?utf-8?B?aFd6MTFUYXlDeWxubkFYMXZsTXZ6N2ZPZmlqU2RKTmtzMnJJQmNiVlovOUJE?=
 =?utf-8?B?VWR6SFZLcHFqVjFia0JoRENnUEt1MHhzL0JPV3FwblIvZ0Q3T0hOcS9sQUsr?=
 =?utf-8?B?TUplNGdvTGcwMjZSQU1DaXRUODlWVmhya3gwd2pPL3lDbEZMRlN5ZkxZdGJ4?=
 =?utf-8?B?WXZhd0pTSjljUFlSSzEzM1dyLzJ6SzVrNTVsd1dqSk90eE5GTENNVWw1MHBG?=
 =?utf-8?B?akhRTmdUN2dDamhicTNjVWNHRDhMZWZtSFU1SUY4Yk9nZEQ2aXlGQVZvZUNP?=
 =?utf-8?B?LzlnRldHWVZmSGVpYWhjSVlEN1IxcHpYOXoxcEE5M3RzYitManlJemkrcSt1?=
 =?utf-8?B?K0Y2aG1Hc083Yi9pTWVNM3gwMjNhRW9RQ1RpWHhqbEY5NHI2YUs5dVVWVUMz?=
 =?utf-8?B?M2QzZjFOWFlsa0hWVEp3YkpRMEVYUEVQQWtIcmdaNW5iZmRpMnRtdm8rUlFn?=
 =?utf-8?B?OHhUOEVyWGFTaFc1ajU3bG9DdzdjSXNWWFkwa1hnSjV5NXp4UHNlS3JkVzFM?=
 =?utf-8?B?d2tOYnl1S2toaGxhSlJmeW94UkJjVExxam1BaGR5WGpLaTQ2ZnYyNWNwRURJ?=
 =?utf-8?B?WGlUM09saytNUXhJbkc3QlFuVndTa1F4NzBZR2FJWGFpa2ZzM2FVajVDMDQx?=
 =?utf-8?B?Wkw4c1VXZjhiUXV3NTBzMzVXRGdvNzZOd1dIckZ2eWNEaVJkeVVvTzN4ZXhU?=
 =?utf-8?B?Z1ozaXA1U29KZE95a1AwZmNOaFpNVEQ4Zi9OVWkvb0VicndrSS9MM0M3a1dI?=
 =?utf-8?B?bGQzMmxweG56Y0tybmVnSmhMbEdSRndNOUZKQXZKSEJwWmRwajl4ZzBjNWFR?=
 =?utf-8?B?RGw2cm1PWmdoZDNTVCtzaVdMRmgwZXdybW80c1BlRkpZK2J0bVNLdFRmQVpl?=
 =?utf-8?B?SmkyQkdHMUtURGpydkRNVDdHc2dVWGRhRG9oS1Z3ZERtRzEvTWpEYXl2RTlp?=
 =?utf-8?B?aUI0SE9McWF0aHhVVlQwWEluNVdnaVU2UCtKR0llajZZSGNYUjhsN1hUTW5N?=
 =?utf-8?B?TnJhTitSSkFzOEJVYnZQY0p2NHNHUDBVVWMvM2FvMy9YdWhxU0FXelF3S1c3?=
 =?utf-8?B?YWJKTHk4V0tDcERDMWcvdzRadVJyUW5TMTRUays5UG1qZTBoSEVSbXlkUFA4?=
 =?utf-8?B?eDFZQjkyekdTSUVjanZEUXJYdEoyc3F5OUE1YkdEN0lKT04yYXQzS3hjV3N1?=
 =?utf-8?B?TnhRSUcrV0RwYWdMR1E4dThUY3RrZmFObFdIRVcrUkM5Smg4NXh1aklvNWg0?=
 =?utf-8?B?WkVQUjZjdElJa0NNTTFjWGduWWQwNzVJN0RqeFpMNUp2bG9YU3RVdDg3Q3Y2?=
 =?utf-8?B?b0pZeWNuQnF4SXFoRFk2T2RuOU1qTWhYZ1RtSFVUbEU1TmF3MXZlRThjbGY3?=
 =?utf-8?B?Y29IVlFXT0RXOVloM09vNDlHSkJ5NEF5QTVzaDlwTm50RFFrSWlTVWJLbTNi?=
 =?utf-8?B?Zy9CdGxRVEJ5dlRYMWc4Rk02QjJwNVRjZjFNSW1UaGNTa01jazdhUm4vSmlv?=
 =?utf-8?B?QmRmVi9LVE05MW9XMG55RzhUdmpTR3o5M2szVyswd2VJdTNtSmxDeXRwZUph?=
 =?utf-8?B?em56VGZtdS9nYlBBTlJnTndQZ2FPNWo1aTU5ZXlrWC9UK25wU2dKVXZ4QU1y?=
 =?utf-8?B?eWhwQlVtWFZKM0FWSUlMcFZudkJFRVlUS2xIRGpHeHpoZ0hhSjFlbmxXQVM0?=
 =?utf-8?B?V0p0MjNjMEt4bHJpUGVVN1VlT3lMSHdXVEVWRDBESm50V25ZNld6SkswQSt3?=
 =?utf-8?B?Y3NscUh1ZStML3JoOTBRdU9pRVZxY0kzd0psZGsvVkZkbUI5TTUrUVpiZC83?=
 =?utf-8?B?ZThZVzFLdXY5YllrUTJpUDU4WHhqcjNNeXNMMWhXTC81UkRpUGZEMytjMnRN?=
 =?utf-8?B?Slk3M1Z3b211djNaMGMrVCthV0JUdDN1a0lFcVNlR2taaU0vYXNHbmF1WkQv?=
 =?utf-8?B?UFdacVZDeDl3ZEZDRks1bkR2UUVrdlcrRjJ0cm9Jekowd3pHY2dac3ZudjBI?=
 =?utf-8?B?U2Y1ZTNBQmYwNkNVeVUyUkVXRGJEWG9VQUQrNjdOQy9DajdoSmdHVHYyNlF2?=
 =?utf-8?B?NVFNRGs5THQweXpjVHIrdVp0Y3RDaFBUMmRvT1MyalJ6c0ZoUllqejJ1Q0RO?=
 =?utf-8?B?VUgrSTV6VGdqVmcwNjNIT1pRdmFVdFFibkhHMS93NjkyNGREcUNnVHpFVURL?=
 =?utf-8?B?K2FqN0FZL3gzTWJSV0ZXd0c0K0JOQ3VjNWdZSmVXcjZrM2F6NEg5bUkzdXJr?=
 =?utf-8?Q?Bc3KzfAiVvrWGkJOOiLSLnal2KTT79Jt8RTJS?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd80803-c411-4f09-5a5e-08dee326e56c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9422.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 10:42:13.2285
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2X+TkAOfiS9Gqpz3MPR16pdKTQ5rpeqNliYLG4ljg98eTKZN07F0vUpfTn11HfMX1VscMAR6B1GqE0A80yF3vc+S0/SDGSei05nicjL18AZ3mdXcH9AtPvnvZ67e8Po5
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11878

On Wed, Jul 15, 2026 at 11:46:25AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> Pre-existing issues:
> - [High] The Type-C switch callback `tca_blk_typec_switch_set` can be invoked after the PHY driver is unbound, leading to a Use-After-Free of the driver context.

It's a common issue and it should be fixed in Typec-C subsystem.

Thanks,
Xu Yang

> --
> 
> --- Patch [1]: [PATCH v6 1/6] phy: fsl-imx8mq-usb: fix typec switch leak on probe error path ---
> commit 5e0093cfdd6e9dd648ed3549eb93bacb54164be2
> Author: Felix Gu <ustc.gu@gmail.com>
> 
> phy: fsl-imx8mq-usb: fix typec switch leak on probe error path
> 
> This commit fixes a typec switch resource leak when probe fails after
> imx95_usb_phy_get_tca() succeeds. It transitions the cleanup of the switch
> to use devm_add_action_or_reset() so that it is properly freed on both
> probe failure and driver removal.
> 
> > diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > index b05d80e849a14..9a33c06d6fc39 100644
> > --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> > @@ -173,9 +173,9 @@ static struct typec_switch_dev *tca_blk_get_typec_switch(struct platform_device
> >  	return sw;
> >  }
> >  
> > -static void tca_blk_put_typec_switch(struct typec_switch_dev *sw)
> > +static void tca_blk_put_typec_switch(void *data)
> >  {
> > -	typec_switch_unregister(sw);
> > +	typec_switch_unregister(data);
> 
> [Severity: High]
> This is a pre-existing issue, but does typec_switch_unregister() guarantee
> that no consumers will invoke the .set callback afterwards?
> 
> If a consumer acquires the switch using fwnode_typec_switch_get() and holds
> a reference, it appears typec_switch_unregister() removes the device from
> sysfs but doesn't revoke the consumer's ability to call sw_dev->set().
> 
> Because imx_phy and tca are allocated with devm_kzalloc() during probe, they
> are automatically freed when the provider unbinds. Could this lead to a
> use-after-free if the consumer asynchronously calls typec_switch_set():
> 
> tca_blk_typec_switch_set()
>     struct imx8mq_usb_phy *imx_phy = typec_switch_get_drvdata(sw);
>     struct tca_blk *tca = imx_phy->tca;
> 
> where imx_phy has already been freed by the devm teardown?
> 
> >  }
> >  
> >  static void tca_blk_orientation_set(struct tca_blk *tca,
> 
> [ ... ]
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260715-imx8mp-usb-phy-improvement-v6-0-00d95e270e4c@nxp.com?part=1
