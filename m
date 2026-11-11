Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794373522;
	b=pf4XHAPWyF6xNc/NVqGfS++0hczx9DI2kADqk8b+7xmuL894+5gDG7hgoRpY/m7fC/f8
	 XhzpVqg39e30AF59dM4rjXooY8l6udsWnSN+C7Ks4oJBhQKlO1bbO+ROBWBo6P3yJi7k6
	 xC6M6elfCCQlc5ZHxt9CoaoyVGTbPQIwnGnxCzYOg5btgCAWPkQhfaqg7kkh3FyaZe2Db
	 YdVQ1FXqupMuBNNj4E2VpJUNQakCwatqMdQUwlK6Hxo3s78QGNBcxfvfadJlBqPyiR+S6
	 2iHrfDwTPHi2sGqFdaerWUGBVLcyqmW+NqCNAtb0B0XX1xhjKzh8v2QsLyEEb2AW+ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794373522;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Content-Type:Date:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ehZ9/eP7yj8SUnBuKiVfK94RuuNNkz5OebSGMSvKc9c=;
	b=xgQg9lnl8CgPXTWFoaoR/kZQzkCxvado7VYMs+RMx7kTp5vsNKvytNTo4ZLIJPMvm1xi
	 8xxHvEVJNO4PVbGa4XSc7jKbE8ZV5yTjLcMLmuzFjff+cLfhPl503nUvIh4RBPJxc8pTY
	 Q2lgpeNltDQqwF+KBbIe7gp2V1InffYAa9CgGPj+bdmoAlGAihOs7CJsnK/qJ+scfqJMk
	 rwP0eCiPNyHNwiiGTI1JV7YFJ4tmYpJYEBys+BpjL6+CBRRgoVRFgJFgynRKKXVWiWbQX
	 DGNmeI/YwhRa3BkIK2CWQ4K6/0ratSgkC/yO6knxcwYczdMRD9qn3VkNmECC7BG8P+Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=renesas.com;
	spf=pass smtp.mailfrom=renesas.com;
	dkim=pass header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=NH2vkdoi;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.74.44
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011044.outbound.protection.outlook.com [40.107.74.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70590606A31C
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 05:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70590606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=NH2vkdoi
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SdL99gqbi7Vs2QqIHnobCUXJw5TJfbLw9tez/H9hVSIN8uGLl7TqSP9YV/v3FC0tKSHthrHH0ddvYGExIRKadFfnlEhT0vIv5OLIpFQVxJ06qdjakgYCD4psFsO0/v6UTt/uF7gA+aAPveyMm+mzRPOQ6XSirukmHNGfocYNW9fsi+w6ATZCdhtspiJST8/+371ikJSrOnjG3lA5pntlPwCvGduHiGRmmLoRnPBHaAeux3TwQdujRE1lBxdeJZYMzHdrMFWec4nn8YbTXG8U181050EMnQLCP7AYaus/SI2MJ1CT7XNO0ginwHiwBm/HBq+tq06wRW9himE3s7sAvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ehZ9/eP7yj8SUnBuKiVfK94RuuNNkz5OebSGMSvKc9c=;
 b=qfzJUAPsdDaE6Po4lLeYTQ7S1+uHVFET03mDVccub0lL1NHY1mEXG47HmPiPCA8sWb0VpXVgVC54zgkdwlnnOWEvpfliPs0tKjHtYr5O+g5Nh8uvz5LIqGvp9FJ8rnrhxDA9GoVuV/qb6uQ1BFgmXOOlCDOnhS9ZmE2JjdLzfFmgKlMrgmhoYZ7J5LmLLmDjAmW1RIJqYpcId4zC6j72e5uFtG5AlKVLsc8t3R0eEZR0rbfkZt7iaN+/9PZqyxstj0bTy2RpHM5EKng2jBW6406caf10/IsdCqTXGR7DBGvu6/MUYRD69x2GozhIcLgo1fFUBrcyYK6v9HwkW8RFzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ehZ9/eP7yj8SUnBuKiVfK94RuuNNkz5OebSGMSvKc9c=;
 b=NH2vkdoiILe0BVIcnIr35PV8Uju4FAIUGqyt3jpLYfJjccyoNkS+BEjs8/mNiSuqGuu6yc6RiP//AeCAGOzJcI6pZsH36UgqUDD8m8gDIkqIh0g78noZngPsAundEEg5SC8GTfo6WMMn35b15ZFORaUlnClGVaCzgDi10DYAr4E=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com (2603:1096:405:27d::8)
 by TYWPR01MB8805.jpnprd01.prod.outlook.com (2603:1096:400:16b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Wed, 11 Nov
 2026 05:05:15 +0000
Received: from TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d]) by TYYPR01MB15175.jpnprd01.prod.outlook.com
 ([fe80::9bfd:a110:68f1:134d%6]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 05:05:15 +0000
Message-ID: <875wy42c1g.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-sound@vger.kernel.org
Subject: Re: [PATCH 03/20] ASoC: soc-component: move snd_soc_register_[un]component() to soc-component.c
In-Reply-To: <sashiko-outbox-206296@kernel.org>
References: <878q31nttj.wl-kuninori.morimoto.gx@renesas.com>
	<874idpntsx.wl-kuninori.morimoto.gx@renesas.com>
	<sashiko-outbox-206296@kernel.org>
User-Agent: Wanderlust/2.15.9 Emacs/30.2 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 11 Nov 2026 05:05:15 +0000
X-ClientProxiedBy: TY4P286CA0056.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::8) To TYYPR01MB15175.jpnprd01.prod.outlook.com
 (2603:1096:405:27d::8)
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
X-MS-TrafficTypeDiagnostic: TYYPR01MB15175:EE_|TYWPR01MB8805:EE_
X-MS-Office365-Filtering-Correlation-Id: 5996a733-cfad-4076-9f81-08df3fb15f7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|52116014|1800799024|366016|38350700014|11063799006|4143699003|261022075727099003|56012099006|10067099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	2K3VGFLHUEJV7Rj6bRXBKri4y/FnZPk2+C49T5HhW77eukl5wxwRryN9dTk2ytAGHLKMYuz6bAu2iwCREIUzBNs5pajPzxvfyQ/cOzVMDdXzW3X8MHcnT8ZybZFGSBhSiZV+Qet+jy8cLTB/z7irhgqFDuN27ulOnboeTglVjrcBCaWw745K3KXJqKQGEUEDyglZO4XWmOd1gE8e8mFlA0AazsxBT7u2zILseuB8Nu2AfFLxbaSZmYF8WJBXnWplXS259Zm4kpyKl1/01E2eD3NjANncJ9xMvU7UyDJ9c+WPIt6jukGV8zrtJgJInwp1hwR+TUPLAQV9g7bLOkQGwtuen3SkMQzjHqC8KI5P08/qzqygu8o8vg3QnLKV4jb6f4d7SSBV7t9lAplDba7XkacBqfmR3XsfG1+mII55rpvX1ZrDtoDJprIlcyVwLCsrS0AdTEHQXmC/pJUE4kIZSVrJRMAUAosZQIzn5G0FmiZ9UpCbnPgFT94DvvDhVTA0arSLOIMTOTGuwhdJ9otdLFLfxy8/zKYqkTrR3wTbLe+K5k8JE9MhobidjHRljmZxFa2WSxQklqUu0HlAlmfSlYKQxGcwBGQv4DcQMaP/derHVnnfJlQlVQUiw+LRLuYHaC+vvKPzapkNfu0c4qMIFHSBSRKi6zCDfV5AfVpE/x5fk95BTcckwKWgihzp+y2+FfOMvDFKiRfUuDaWP6cJjQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB15175.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(52116014)(1800799024)(366016)(38350700014)(11063799006)(4143699003)(261022075727099003)(56012099006)(10067099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gdw5wXFX+BEQkTmb4w1RLRcpEAcARAc6vLYs2HN14q1MFsZ11qqjlp+Ct+zY?=
 =?us-ascii?Q?1/bZXOSSYpxWm4H2OrzU9trQeMvxKxjMbP/pDEDuQWegF9O+gycP8u6mS9ND?=
 =?us-ascii?Q?9B53yQbRIx1EeDBzEcEyXSo3cCxkjjkZ2QyNovFSyASQq7CSaaKQulyba6I0?=
 =?us-ascii?Q?t3Re4HVJBrPhMJ09T6HfRDMuRr+YZ4tZ9Yd+Bo8xB4LEFen/ozVoavP3hsQS?=
 =?us-ascii?Q?OeiDEvkP6cmdYlWr/+W4iQ+qOSFnRszHeprPlpaZaEKJaH3px7s3Cfb1cDpc?=
 =?us-ascii?Q?hrlwFXhk4A2OTEHRIdSPmIFXyrosjwe/lS10shdPtnG27R1WkoLWjvnvMy7f?=
 =?us-ascii?Q?rfYxEpZ6EtflXONPc5pAZYiR5v5HL/Dj1/BzW+WNGM3fOHngzsXAU7NjHXig?=
 =?us-ascii?Q?jCxi6vQa1W1AgmtN034LzJ7NIumvbMUwOYgOPsYfQ4eoLmr+qyZqLRMaD+H8?=
 =?us-ascii?Q?6QkjPtKj8HukTKvsSbNB6TDn7iA/furH5aUriYv1e5ca2B6zMKN7aE4y9wxZ?=
 =?us-ascii?Q?NWSwkxIS0OEA0Z6Su2v5nQpy/kEZ/cNxEWh6WmrjOopIAHSvplCaKFmi7gmT?=
 =?us-ascii?Q?HcDEV9IWvkiiOmZvuyh8e9M760RJUzFke7sXeVOyTmfJNoqVFy9G6lYSU3Mq?=
 =?us-ascii?Q?wQ43+hXUlp1l7niKd98q5TLvKQmRTC75BQ7uCN5HL/LkRZTNTN9YFhanLygx?=
 =?us-ascii?Q?EviZLd8/rw4ufGSm+EcyJxmBURlhlxENqtfFbZc/wR+tpyWyErtAWeuCP5cE?=
 =?us-ascii?Q?lWfB278HRs6u2a6UMS4Paqv5sTCkjgpDjO6TapPi/g/gTQTbG1NrFhmgJw+l?=
 =?us-ascii?Q?WHUncO/SWcxR6TW6CtG296JtvVv5tRmDc3k5xXST57/L+KsjfDu0dGA8HWZn?=
 =?us-ascii?Q?DaDHwu/ndkAVrqlqpu9m7/iczHE7vaIl4trzXA82Zez52pS+NSAED5sURdVn?=
 =?us-ascii?Q?xsBFWJ9+3tD3yuHhP/iBcG43u7O5QpSfB819WMm/+y6rXAK2teWlMzPIkikV?=
 =?us-ascii?Q?jt5x//vTVTWU5ypY02OPjock42jbibUSOyYjbMMzVjJQ+Pjbu4knE2y50JUZ?=
 =?us-ascii?Q?CmhVrlIOmhStcxU7eowK8RiHo1oqYq96Ekd7Pv8jVYUq2X3cWKIH/o58ctmy?=
 =?us-ascii?Q?N50FPnbSDWIsxdsrUx2RaE3nAa/IxDWdFDCYlxL61YGRFgK1YuZph0TaJ/vd?=
 =?us-ascii?Q?zUXhOZUokutKhJ0x9MpKv3cBjVmZcUNQBhBVXXwQLUdLe5Z+nyzMboOm0xAY?=
 =?us-ascii?Q?FMbEVoDGcSTrqiY3jFNo50hWAEgVaM+4xB065h15xJKx6OpRMJpxhlR9+s80?=
 =?us-ascii?Q?yi/39MO10HKviVlZhJZCyNL3U6u5bziKZgqjnEPOQBzD80vc+kEoXv5hyVaL?=
 =?us-ascii?Q?6yOQScsM5aNlvnwEuntQ10pBOH6XauW2sMmEtdJLc8XrMIA9RNoFjgf4N/5d?=
 =?us-ascii?Q?9N8sbPUq4aENE3lxpxwctQgno8xUPAhZPAhdo8MZs81zqP30JElL38PPoNS0?=
 =?us-ascii?Q?Z0A6dBJ0HawOErEr53ETYqYN5+n58eJQmvmeod9zM3Lk2+QmxJabV4kocIzq?=
 =?us-ascii?Q?Bu0WYTgfGDpL/1JYbGmyJGk5dil5qI6nsVJmS8U6IgIFVW43NdI7lYHKyR/U?=
 =?us-ascii?Q?h4iXB0Ve/wEcP+X0uSF977JGMqIsoWcCgagCN0eAvOleOQcj5ZTZwO2m9aui?=
 =?us-ascii?Q?7x8bjUuECmHD9bbvL4BpwxnLZUdfAYeXoeq4r68y4c8ksVOWhjnBXXitqRja?=
 =?us-ascii?Q?2sf2ikARqRfOAQOJOJoeYMC1/H8+uDI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5996a733-cfad-4076-9f81-08df3fb15f7f
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB15175.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 05:05:15.5836
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fy+YWrDoxdfM+zZ4/NPXXeKVWc8NMlq5ptQrTuUZvDTa+soCnxyp7bcKNXYILVvFFYn0WVKVoSPmk2n7nt8lICRyxsTOp04UROriDJxh5toFUSsnJuBHERTxl2YUg0eQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8805


Hi ALSA ML

> [Severity: Medium]
> This problem wasn't introduced by this patch, but can this loop cause
> snd_dmaengine_pcm_unregister() to leak dmaengine_pcm structures and DMA
> channels [1] when a device registers multiple dmaengine PCMs?
> 
> sound/soc/soc-generic-dmaengine-pcm.c:snd_dmaengine_pcm_unregister() {
>         component = snd_soc_lookup_component(dev, SND_DMAENGINE_PCM_DRV_NAME);
>         if (!component)
>                 return;
> 
>         pcm = snd_soc_component_to_priv(component);
> 
>         snd_soc_unregister_component_by_driver(dev, component->driver);
>         dmaengine_pcm_release_chan(pcm);
>         kfree(pcm);
> }
> 
> When devres releases multiple PCMs registered via
> devm_snd_dmaengine_pcm_register() on the same device, the first call to
> snd_dmaengine_pcm_unregister() removes all components matching
> SND_DMAENGINE_PCM_DRV_NAME.  Subsequent release callbacks then get NULL
> from snd_soc_lookup_component() and return early without releasing their
> DMA channels or freeing their pcm structures.

This is not related to this patch, but indeed issue.
I will solve this issue too in v2 patch.

Thank you for your help !!

Best regards
---
Kuninori Morimoto
