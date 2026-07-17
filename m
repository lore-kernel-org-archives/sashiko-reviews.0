Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010054.outbound.protection.outlook.com [52.101.84.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC8133E348;
	Fri, 17 Jul 2026 16:12:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784304730; cv=fail; b=Wc/Jt1uIVQl9pIJxk1VdDGdbl7cOwgDCTp0LAtsOpFx8th/M4jeY8ESTnoaVbSbzXd5AtFuUWJBTQHjLahr07zNAd7lQhGEm4dJVRRzzQnUncxKcQFkoq5UXM9VH/em21a6SOFyj878tJiV+yBE7cI1EFdM6a9O3VsiB8EAsxaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784304730; c=relaxed/simple;
	bh=ibC5/PyGv8YWWyGGi9aCAxmc4xLAkgsxQTSykpKAO/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=kwbr8YiqeWXfuDbEgQgdurL7dzdTSGe0sE/oYE4ApzxKmEHVkrlnpc3w/iUE7CmUj5i+ju9ZoUsJNzW0BV9x2Acq6jY79/LuR/3958vC7aScMxYOFmtSoP9O5P++Rpuuq9/FrInrstrN+wbrAzqJroAnkP74biFyi4bld332jBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=r8tUClNg reason="signature verification failed"; arc=fail smtp.client-ip=52.101.84.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="r8tUClNg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IbrFlDl6YddKLP8Vyqj/E2teNDuYtOo1wWm01SyWW+yaY5EJJDNg+ZHk5H1ejCFRuxSbkBqKb/BZ86KcfDUiyATWLD/zni6nukVWoUJtjUABbol+6tlko4XxCWpkH1NXmKDfQ8FIx3ojiEQLIoCTMQ3bpApk6sLoIx+YtY4OjblMmD986NJfzPHG/yeS8v58qPIdSixFGEOrq/5m6jLPxmXm01ilNf8u5DRipPQHhGGzn1cT0jp6/lfIqrNg/WvNFvhrOPIWU51C4ir92dspjdr5u9xkl22ZPUjmCxdItppKiQRi4BxHUqHmBaKwpgf4Z/ol6oZN0i7aCHeJ1Daufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ilI8l7VBNYIubzmippXYfc2c+ctrFzU/vpzJCBMoxYQ=;
 b=AqvXBpySvbL9/Kco2GIthl250g9wfXxnDWwxKOO6nj97Ouhay2t3qMuK5pi47w4g1U5tEkmibaM9uqpKxkChX4RFhhe3HGhtvFIa4x429EXThDaqRdkBbrbb/kFAZWImkR7xzwKn9Dsl1FqDPHB0nf6mbUl172YuS/OBUJDZGHvFoPi35YcWVKKthN/qoJQSgAl1sGCpbzSJ9bRLmIrI4ZhvKNYjfjJY2PBWXq5JInM66dQj5V4lONjU8jwHJ1LKGw/yHSeeKOO36HT1nFSCkCaYpy6fXuZty99zGopXiGRjVqs9biKq/RfYn5tMj5/+w5edOyl5L0kZWOIwXuiA3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ilI8l7VBNYIubzmippXYfc2c+ctrFzU/vpzJCBMoxYQ=;
 b=r8tUClNgZtl8fHsbRENCj2Kl+ULka5o8luqRqgiRihZGH02oIPbtSykA/PUGTf9Eb3zSbqUgvgCVxc74mjUNVsRUn9OFhC8y30IzRPIPmWW6m5aW5KNGNbeCMlC6lxRXV9wUvLM9L1gZtMx5PrayUQ1mGh07mGU8j7OPWzRCZdCQGNVUZaDDpJ5+Lu01jbT4nsQgc/jBcISRlAR04v/0VZ7qGQvry76S2wD/CWnnn2naS4LWBtjUeeE6i2+Uy7HRnxxGn2CtuzHvgzX1jqaGHR0oZ8hqgfMLhb+4IKGAh8KNHfxI7FaaLiI+bq6SQ09rxGhJq55p/Cr8UG+vr2Lj0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM9PR04MB8732.eurprd04.prod.outlook.com (2603:10a6:20b:43f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.13; Fri, 17 Jul
 2026 16:12:05 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Fri, 17 Jul 2026
 16:12:05 +0000
Date: Fri, 17 Jul 2026 11:11:57 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: pankaj.gupta@oss.nxp.com, Frank.Li@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v28 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <alpUTTH1VA9hvQva@SMW015318>
References: <20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com>
 <20260717-imx-se-if-v28-3-0a9659c7e69d@nxp.com>
 <20260717111009.B55531F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260717111009.B55531F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA0PR11CA0128.namprd11.prod.outlook.com
 (2603:10b6:806:131::13) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM9PR04MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: f6434ed2-e2fe-4156-7b7f-08dee41e24e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|23010399003|1800799024|366016|13003099007|6133799003|11063799006|5023799004|56012099006|10067099003|4143699003|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info:
	fhYQEFGhMPUhA5LWhP+M23miFiDhNDgok6GO4dn8fq7gWRcA3fI4k8Y95LReN7Sm09TaUkR5lzrz6zxVZD2PeEgUAL0Q+MqkizTiwalNuueri/jjbSw8xBzd19VjSzkKLYT+7F2OVNjgLF2B08dOq6UPlC+82tVVvUKOJrr1Msn0I1UlmAIku5P3x3AqYQfHfVK8bJ+5yrvK5+zxAwgD7MoYnQ7ubc2V02qUacOx1Nra+jjdt7NlLVdDanBruYk5vm5dRnEGZbODjuk0AuyVp33tYWMB2uuXAhCCf6YUbpMiMvUmQE/7bMFa7AX0AI9VWn3RvatfxqcYyf1YZ9WkJ6pkVt/lxPa5z67tPhSWXBWyoIwVT7ldPsvL39ZT/MmwGG5OcRga1mj9djyFmf+uLgnaPhmNvnkYmkvFt9Kz6toiq6NUk0ZcmSIQ/OAa+jCw5MzLPlbM11UWb3CB4Rj/WoeAE1htvLmYAK7IdM9mV8Td5bub0jfcKONvgKyFkJwDAHK6HORdnhE+WXYwosyR/EnY5YuStQZgcc1008owaqGDWnYuTNoKms5ttWAu1PIi1ID4LzmGxr8tiWpzGn4HyiuchbNhau6oNBIpw42iL00=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(23010399003)(1800799024)(366016)(13003099007)(6133799003)(11063799006)(5023799004)(56012099006)(10067099003)(4143699003)(18002099003)(3023799007)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?obif2vErtbc3o2XCYLeKrCJ1iN62XkoYVJreEO6UmFn7m1o3jHLeGjm3Aw?=
 =?iso-8859-1?Q?DUIlsgXvFkZGacRaqjQAhdfJ/mT9IMwGU//H0HwPew7SXk86sdR+F2qmx6?=
 =?iso-8859-1?Q?KLhFsvR4Q7xAtLhTMVxpBHHhA9Up64Lrexd7OZ/NjaWlrzBR6QdZXBy3t5?=
 =?iso-8859-1?Q?xvpEqfPoBFSiOJVhEBIKCSJP3MbGg84SqHhS4QgQMKJwEVAdSMzpjRc2uY?=
 =?iso-8859-1?Q?VnOjH5X41Tp22hRP926twfamIFWOxrUzrHP/y4/2n8ytSuVc3E47yQb/EO?=
 =?iso-8859-1?Q?7UBmzER5VfyvXv5PoWNUz2F6UDsRJVHFJ4qnlw/6tjrpf1wy88L0aXLmqx?=
 =?iso-8859-1?Q?DUqX2DGnXENCxBzml5D779T5+vFw1TUqfw6vRPwl8xrLnwpAyMvXBPGJ+D?=
 =?iso-8859-1?Q?oBwYaiijp8cggiSAxrznRnmAlzZaFLNRZWSr5CU4Cy82xjhB5QbrH1fPww?=
 =?iso-8859-1?Q?O798xL24siZxK76BRnHX7y0aKAR7K3xBjIyGKvas8GMiYJgwmZgFreHgXn?=
 =?iso-8859-1?Q?O716TGyhgpC5K89I0krdsgsuCgvig3WQ6bYx73WSryDeeFxS0bgelDVIbC?=
 =?iso-8859-1?Q?Qh19c2OUXEuj22HUwL6Vwmlt/XWhEdxInKWurFeY8D1zOq8QYqqWddFbRB?=
 =?iso-8859-1?Q?bZQW7Hh7GGhTHrLAUVLmr3vlWJptjodkySyhydn15+6WZFor+a4NcxsYkP?=
 =?iso-8859-1?Q?q/+RhRFMKsfMj0mW5Lj6mlsnx7FQyXUZ/s7FQetNu43cFaUSYllsBYpOqj?=
 =?iso-8859-1?Q?0MvCiheyzBJBtSPfHrl14+6WiDsaNgUt9aaeiMbis13tyGajM+VhmylP0Y?=
 =?iso-8859-1?Q?Fq3DqVOogs/60be44G0e0gRTlR7cJ7qIQCYPqjWuLuW97b+wNQEqbLfQSF?=
 =?iso-8859-1?Q?Jc5yN3rjhwU+UX6ML9h5twrbRm683OTw0HrGh16IqdfuEGLlRRY81gJkyQ?=
 =?iso-8859-1?Q?vq2BY+pP1K0kRIiGmGIU9aAzSot7EsXjxZ45EbfVLsa/sCnXrVYKyghD2j?=
 =?iso-8859-1?Q?m0qkqGeH5zOPIFKQP5b3QSEqzNKZLFtamK5nqiMgpSw7YhMXMBgGH1t5QP?=
 =?iso-8859-1?Q?nth3sdEdKNYXqHZnqokSw2Zyjf900ZPyfUg6qeMTrhprXsHGXdX86iwpWe?=
 =?iso-8859-1?Q?kOyfq//mcQKhX3LyxXRvGuSU7fazDDCqhgqJEauJqe8NflzUmOpHuL9X0f?=
 =?iso-8859-1?Q?m0Gj9tBodOqcsWiRpeZgq5b+8l924gxhH9//vWLTP95TiGtCHtruDOh0Yd?=
 =?iso-8859-1?Q?N7FuaRVId60n2xLtE7xiOLHgGqr8zKIzZTQ+HEcpg9ByEhKYvxAmClmP2a?=
 =?iso-8859-1?Q?fDDvWXjUTE/hwIdf0BSbi2ZOC/Ybj3boMTP3yrffROCzrX7JDiJLAoL14+?=
 =?iso-8859-1?Q?LeyqsSE2be7iPUAfhFULiwkF7+mwHG25fqq/pVmC27uXgKgrf8sPxq8sTF?=
 =?iso-8859-1?Q?hdaT5wEReTTQj/IzAMD2B0iiGC1Nh57h2Ny/mkDnvwp6DsppqQUjgs/XWu?=
 =?iso-8859-1?Q?NWVFXXXXxwbEZ9G14t7Bsh2fAhyDjogAl+cGSrUvCEbvms+7TiKmrszBCR?=
 =?iso-8859-1?Q?box5esA4HXEsRezJS1IXMT266YUOTViRoXeM50i6fEDmjf+O1i98HN5oXd?=
 =?iso-8859-1?Q?jX+qFHeb3yxYX4y/GxU6D0O5XXi0eJtw/3cuToxxDDjqDjnewBDJDYOOyP?=
 =?iso-8859-1?Q?C9R/hIZEV62iIblUTQtWa10+y2AbOue+2YT6K5+q3KoARnvcuSWKzOddLQ?=
 =?iso-8859-1?Q?r8rlvf+U+vlM71CUvdD2L4Oaav7UwUkrp6sXk1l0DGCtmzRwHE7tNJPvLF?=
 =?iso-8859-1?Q?2OnelrSrewMh2mMn7uVN26a7I1uab46lGhicLV10L0OzeLWR90l2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6434ed2-e2fe-4156-7b7f-08dee41e24e5
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 16:12:05.4655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DZSBhkO3G3FduahqQeTtb3eEq6Kfk6/QU6a44eX+nzLW7ldDNlxtAEwSrC/egejFVjtsnisVLs3ZYn0ljnnoY0ITPqxd7kzYFyizutst20pJii8uB59ijwj9mrOZnzlC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8732

On Fri, Jul 17, 2026 at 11:10:09AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 6 potential issue(s) to consider:
> - [High] The mailbox receive callback `se_if_rx_callback` dereferences `msg` without checking `IS_ERR()`, leading to a kernel panic if the mailbox controller returns an error.
> - [High] `ele_msg_rcv()` uses `MAX_SCHEDULE_TIMEOUT` causing an infinite uninterruptible wait and subsystem deadlock if the firmware hangs.
> - [Medium] Global state `var_se_info.soc_rev` prevents SoC device registration and per-device IMEM state initialization on driver rebind or secondary device instances.
> - [Medium] Casting a 1-byte aligned stack array to `struct ele_dev_info` and `u32` pointers causes undefined behavior and potential unaligned memory access faults.
> - [Medium] The driver fails to expose the file descriptor interfaces claimed in the commit message and Kconfig.
> - [Low] The SoC revision is incorrectly formatted as minor.major instead of major.minor.
> --
>
> --- Patch [3]: [PATCH v28 3/7] firmware: imx: add driver for NXP EdgeLock Enclave ---
> commit a06a0c9a5464457c1ae77bb60350c41fff331ed9
> Author: Pankaj Gupta <pankaj.gupta@nxp.com>
> Subject: firmware: imx: add driver for NXP EdgeLock Enclave
>
> Add MU-based communication interface for secure enclave.
> The secure enclave FW communicates with Linux over single or multiple
> dedicated messaging unit(MU) based interface(s).
>
> Link: https://sashiko.dev/#/patchset/20260715-imx-se-if-v27-0-bb7c45952f06@nxp.com?part=3
>
> > diff --git a/drivers/firmware/imx/Kconfig b/drivers/firmware/imx/Kconfig
> > index 127ad752acf86..e3cb7f965e70e 100644
> > --- a/drivers/firmware/imx/Kconfig
> > +++ b/drivers/firmware/imx/Kconfig
>
> [ ... ]
>
> > @@ -55,3 +55,16 @@ config IMX_SCMI_MISC_DRV
> >  	  core that could provide misc functions such as board control.
> >
> >  	  This driver can also be built as a module.
> > +
> > +config IMX_SEC_ENCLAVE
> > +	tristate "i.MX Embedded Secure Enclave - EdgeLock Enclave Firmware driver."
> > +	depends on MAILBOX && ((IMX_MBOX && ARCH_MXC && ARM64) || COMPILE_TEST)
> > +	select FW_LOADER
> > +	default m if ARCH_MXC
> > +
> > +	help
> > +	  Exposes APIs supported by the iMX Secure Enclave HW IP called:
> > +	  - EdgeLock Enclave Firmware (for i.MX8ULP, i.MX93),
> > +	    like base, HSM, V2X & SHE using the SAB protocol via the shared Messaging
> > +	    Unit. This driver exposes these interfaces via a set of file descriptors
> > +	    allowing to configure shared memory, send and receive messages.
>
> [Severity: Medium]
> Is this Kconfig description accurate? It mentions exposing interfaces via a
> set of file descriptors allowing to configure shared memory, send and receive
> messages. However, there is no character device registration or file
> operations implemented in this patch.

please check this

>
> > diff --git a/drivers/firmware/imx/ele_base_msg.h b/drivers/firmware/imx/ele_base_msg.h
> > new file mode 100644
> > index 0000000000000..4c3699543e879
> > --- /dev/null
> > +++ b/drivers/firmware/imx/ele_base_msg.h
>
> [ ... ]
>
> > @@ -0,0 +1,98 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +/*
> > + * Copyright 2025 NXP
> > + *
> > + * Header file for the EdgeLock Enclave Base API(s).
> > + */
>
> [ ... ]
>
> > +#define GET_SERIAL_NUM_FROM_UID(x, uid_word_sz) ({\
> > +	const u32 *__x = (const u32 *)(x); \
> > +	size_t __sz = (uid_word_sz); \
> > +	((u64)__x[__sz - 1] << 32) | __x[0]; \
> > +	})
>
> [Severity: Medium]
> Can this macro cause undefined behavior? When called from get_se_soc_info(),
> the x parameter points into a 1-byte aligned stack array (u8 data). Casting
> this to a u32 pointer and dereferencing it could trigger unaligned memory
> access faults on architectures with strict alignment requirements.
>
> > diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
> > new file mode 100644
> > index 0000000000000..ca8a32a82689b
> > --- /dev/null
> > +++ b/drivers/firmware/imx/ele_common.c
>
> [ ... ]
>
> > @@ -0,0 +1,470 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2025 NXP
> > + */
>
> [ ... ]
>
> > +int ele_msg_rcv(struct se_if_priv *priv, struct se_clbk_handle *se_clbk_hdl)
> > +{
> > +	bool wait_uninterruptible = false;
> > +	unsigned long remaining_jiffies;
> > +	unsigned long flags;
> > +	int ret;
> > +
> > +	remaining_jiffies = MAX_SCHEDULE_TIMEOUT;
> > +	do {
> > +		if (wait_uninterruptible)
> > +			ret = wait_for_completion_timeout(&se_clbk_hdl->done,
> > +							  remaining_jiffies);
>
> [Severity: High]
> Can this loop cause a subsystem deadlock? Since remaining_jiffies is set to
> MAX_SCHEDULE_TIMEOUT, wait_for_completion_timeout() blocks indefinitely. If
> the firmware hangs and wait_uninterruptible is set to true after a signal,
> the thread will enter an infinite uninterruptible sleep while holding the
> se_if_cmd_lock mutex. The timeout fallback and circuit breaker logic become
> unreachable.

Can you use reasonable timeout value to avoid deadlock?

>
> > +		else
> > +			ret = wait_for_completion_interruptible_timeout(&se_clbk_hdl->done,
> > +									remaining_jiffies);
>
> [ ... ]
>
> > +void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
> > +{
> > +	struct se_clbk_handle *se_clbk_hdl;
> > +	struct device *dev = mbox_cl->dev;
> > +	struct se_msg_hdr *header;
> > +	bool sz_mismatch = false;
> > +	struct se_if_priv *priv;
> > +	unsigned long flags;
> > +	u32 rx_msg_sz;
> > +
> > +	priv = dev_get_drvdata(dev);
> > +
> > +	/* The function can be called with NULL msg */
> > +	if (!msg) {
> > +		dev_err(dev, "Message is invalid\n");
> > +		return;
> > +	}
> > +
> > +	header = msg;
> > +	rx_msg_sz = header->size << 2;
>
> [Severity: High]
> Does this code safely handle mailbox errors? If the mailbox controller
> returns an error (like a timeout), it typically passes ERR_PTR(err) to the
> callback. The check for !msg allows ERR_PTR to bypass the check, which
> would lead to a kernel panic when msg is cast to struct se_msg_hdr and
> dereferenced here.

Please double check this ? if yes, should use IS_ERR()

>
> > diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
> > new file mode 100644
> > index 0000000000000..9bb59c200911b
> > --- /dev/null
> > +++ b/drivers/firmware/imx/se_ctrl.c
>
> [ ... ]
>
> > @@ -0,0 +1,417 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Copyright 2026 NXP
> > + */
>
> [ ... ]
>
> > +static int get_se_soc_info(struct se_if_priv *priv, const struct se_soc_info *se_info)
> > +{
> > +	struct se_fw_load_info *load_fw = get_load_fw_instance(priv);
> > +	struct soc_device_attribute *attr;
> > +	u8 data[MAX_SOC_INFO_DATA_SZ];
> > +	struct ele_dev_info *s_info;
> > +	struct soc_device *sdev;
> > +	int err = 0;
> > +
> > +	/*
> > +	 * This function should be called once.
> > +	 * Check if the se_soc_rev is zero to continue.
> > +	 */
> > +	guard(mutex)(&var_se_info.se_var_info_lock);
> > +	if (var_se_info.soc_rev)
> > +		return err;
>
> [Severity: Medium]
> Will this early return prevent initialization on driver rebind? When the
> driver is unbound, soc_device_unregister() removes the SoC device, but the
> global var_se_info.soc_rev is never cleared. On a subsequent bind, a
> non-zero soc_rev causes an early return, bypassing soc_device_register()
> and leaving load_fw->imem.state uninitialized.
>
> > +
> > +	err = ele_fetch_soc_info(priv, &data);
>
> [ ... ]
>
> > +	if (FIELD_GET(DEV_GETINFO_MIN_VER_MASK, var_se_info.soc_rev))
> > +		attr->revision = devm_kasprintf(priv->dev, GFP_KERNEL, "%x.%x",
> > +						FIELD_GET(DEV_GETINFO_MIN_VER_MASK,
> > +							  var_se_info.soc_rev),
> > +						FIELD_GET(DEV_GETINFO_MAJ_VER_MASK,
> > +							  var_se_info.soc_rev));
>
> [Severity: Low]
> Is this string format correct? It prints MIN_VER_MASK before MAJ_VER_MASK,
> resulting in minor.major instead of major.minor. This might break userspace
> parsing expectations.

Make sense, please fix it.

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260717-imx-se-if-v28-0-0a9659c7e69d@nxp.com?part=3
