Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A7F48C8CA;
	Wed,  2 Sep 2026 21:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383158; cv=fail; b=M3tSqrLLoQ8fMMqYmV6yHmxx4pBoHx1tEAeqmUAIdgygmqJGLn6169dbugaJvN5PKejKf8233VxfASg2RXExxTQ7iXJr/0y8nAyeOHxg5Xe5H7OSqgo7htqk3jrENsVLvaoHcBxRf42xe5hXrkYyEFKpmRvpd08gzs6UT3+eY+c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383158; c=relaxed/simple;
	bh=LtGBulYI2AUfDcTtaddaUJA5WPyEgD1N+Lpx3LSPenw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=VCm2PEOBZQWrwmvVknp4OA6PrBjSj2WZPrCJvuiNRDxlU+HdTJeLgYECtNmFpP8qXwSlgdCbrgsPuHOsLYvP8W+0W+gNnnVNr8lu6pRvMhlKU4nalv9yw5H540qW6ydeltJz7jq/1nKSZv583t5ARVhobLf/iR38wx3RpT9n0Fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FnLk+/CC reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FnLk+/CC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t95mtn/WpDJtJzn34ubFCn97u6Oiq1e0ZEIPNi3jwuUwnZX2MKDSDjd95ei328fkqV8Jojqb1/8QO0yDaa6A1CiBW81C0HPg9uFkVGDPiN1S1hAZctdPMHA7J8/4MIYfWfvl3vPhaH/0V7xY/C0HbfM0a9RmsmaE+i45y4YYtsiGMMixdXnSm+ljg2jJyHq/iqdHMBatt19HNEAoJ0JVq7UC6Uhx+j9ngD7OCeCYs4x/ydzi643y+48OFrYu0xg6sCg3w6uSuexaCuaPEYPVa6bOSRqt4RkXbKS0rRdi1VYGo23qjCH57W1jzIH9ievP9w78SnIDU0lZWPHyhYENPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BaSAMHbp7X3Jpc3bLLdyr6zwac+CTdZxnQjhUfs1teY=;
 b=HN/KloOS+KmhTL+Zv0y0xHEX1O/OxSDTMWgvNwcHjy69q2Z0rmTH0ecKuW1H1Hei9MJU3VzUxI9HXDrUXUKPmr3O6D5dfte1MRKIRatPtLf0Ye2ly3JlGirS3250bBxg7uxsad2sbpL45T6ARKM9G2P5x1uZamFjeMkbOwaXCJPAiXkRLqanPx8qv9D2Cbbzu1l4pcUJgow3gKXgJMdLxnePmvDP1zVRJllpvHrzEukbZL+EnhqXa7rbD37lCO3ns66VZ/HEmBEdPkrCb6UqIteko/o9cHV1Kst9uKlxYWkI08yJcXYZrpSsjc4ZqQEhRRycyxFFbH3VnLRiWx4qiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BaSAMHbp7X3Jpc3bLLdyr6zwac+CTdZxnQjhUfs1teY=;
 b=FnLk+/CCRp+xkFqyhtw6iS/EDexWI0jNMTBQMlLZxQe9YhjG8AXQaurGs7zgwcdRIQq6sLW7jgfUPR9GKXwB/Ks1Q1EubfAJXRnWAO9AjRlJnfq4pQ6TokUYdRQqZ0c5rFaLg5siid2u+ZprMJR9SbtLkiRCPDwn36BhzqEZYrkhE26orMs3M0RYAp50UNpFqDEfL2y8CO7TdYJ2CgALmpjJ6iku2gjJ3JY6m1nI/o5JNLfo8E0J1BG84VPX7CLBVM7lqruCUwkwy/0WPry0svB7OVYrfH5j8OgSp8wWcZ6Wn4JEJ2B/ctc7SGhqfkWizDDV1nYVpmkK37cfFHfGnQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8692.eurprd04.prod.outlook.com (2603:10a6:20b:42b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 21:05:43 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 21:05:43 +0000
Date: Wed, 2 Sep 2026 17:05:36 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: pankaj.gupta@oss.nxp.com, Frank.Li@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v46 5/7] firmware: imx: adds miscdev
Message-ID: <apiPoIfD9QKqBWJF@lizhi-Precision-Tower-5810>
References: <20260903-imx-se-if-v46-0-aefaab525034@nxp.com>
 <20260903-imx-se-if-v46-5-aefaab525034@nxp.com>
 <20260902163521.BB3231F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902163521.BB3231F000E9@smtp.kernel.org>
X-ClientProxiedBy: CY5PR16CA0008.namprd16.prod.outlook.com
 (2603:10b6:930:10::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8692:EE_
X-MS-Office365-Filtering-Correlation-Id: b7e700c2-1638-417c-d879-08df0935f359
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|19092799006|13003099007|6133799003|3023799007|10067099003|4143699003|56012099006|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ubt6ZqM1X+e9k7rVd9Zlj0puU9PjyVKsb4I5RP/BK+D7+XMpWN6B5TODv8uMxtCDwKlvGCDasa6uGkafHgxNR6bjI99PehK56ymxxB6GO7x+Ajau2J1SkaOWp4zc3pU/0Jb/0Zm78p4oWQQgbUktWI9duNvyYATtR+0QXclGketI4vRcFWBapPv1yi2OFlJ/3WgfTRe/B8XD8yQvvQIDT0C7jCH/cy5kaVAoKLD9B/52xnV91Fq0ikHxIpF1cwnzBWTVmPra8zUV0CfspHeiCSdHHdAxa9Tv7kmx131/jZo5YxdYBBJlvFloMgzqElEkq4C3eU2aimTyQZarS5YRR5RMGkd76SL4QtJOz3KRJ2ce80RoKyu4uxg68/v/ME/fonIJGXJhHjRlJEDbPXpHCJDRkjsAjkQf+tpo1ukhho3DWAdtYPYirMcEQJXL6F2jYAZWoIlMkJxvyi14aotbttHbFpIjRUYkbR34vzTLQYuVXn5DXvyd/+eVRHish/lWSg2GiDj70dNAYcmWiZFcxtBiBznJfEBE+zfywN0h8QwguUsUq7TZn5AoMNoQF5kIhS5uVQeJ889i/qktrNC3TfmVr0BQz4EF79eIgN2PuzM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(19092799006)(13003099007)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?bkQzum0cQxvtMlwLwRYEtCNPh50jwWtu7XZYlTIx2xhCMa+2zSCocaXiDb?=
 =?iso-8859-1?Q?DrpQHLh5/DQ14uYV+Fy/8NdCcD70Uui1HVoi65M4nA900wrSYISvrV90Vk?=
 =?iso-8859-1?Q?lkDFPIO3NLq/ZDCPuYmMBX/2AMQYvRZP96cF9f3SRUDpZHXKsRukfF0NHi?=
 =?iso-8859-1?Q?NG+EO7pzgiGfixd7bvypf4oIAtT649G5BYZCJ55IrXBe3nRIE1Ks73DI/F?=
 =?iso-8859-1?Q?MrMTvRkJY8AmYgol4QEVkvK9p81C02hTbArCOjN8OrRulZqGO+pkisygbz?=
 =?iso-8859-1?Q?3PtcIj8B7uEcPry5YyILeH6tpdet+K5zUxIjgN6QdR3SJFL6uLrmW54Yhs?=
 =?iso-8859-1?Q?nTvvcYc89ZQLdXQM1UpTXTyHVb6/cJ5SZkFtTguUVz07WVfc2VB0Tr41U/?=
 =?iso-8859-1?Q?kqHtRapubLFhwHqX/rYwtjYoODb5wUt+XpgSuqRG5cdC9cH43yggpEoifk?=
 =?iso-8859-1?Q?lAJ+92QKxk5EllVDCZS3iP5b9vrfMxphCowbifEsaxrrG+8rxjLSH9ZapY?=
 =?iso-8859-1?Q?kjZFJ9UHiOJBVGhNAS01+QmTNodtE5hlUyGKCk9be1P2Dy9c9jd8q+H81e?=
 =?iso-8859-1?Q?9hTiZ2nsD+gmfjFBzMj1lF4MV+ss/35TZUpL8EnQv+FYqn2Ej1JUJrgq38?=
 =?iso-8859-1?Q?lCr8cOeqD+QAjKWaUlfHDapRjB+mC9e4Bg/1FmEOMnhr5iLvcsvEafrc+S?=
 =?iso-8859-1?Q?pMDQ8DwL1djQxWQ0DvdiyXrUTzi3C+t+gjP8QyuyBSWwOndXzcfCvZcU0+?=
 =?iso-8859-1?Q?5Z+zptcbtD9lQnGqeybn9BgHvdQzFn9fm6fs4csW3igaafKqOYD+dZOESp?=
 =?iso-8859-1?Q?9eEcx90ROeyNychYCwv46SIdXbbYIvS3BcgieAzNV9ceZDuiXuV9Lhqz1i?=
 =?iso-8859-1?Q?23cGweOrHTQZyNIjNK1094BecLTXYX5kKK+0ESlX15G78Ngp3fCXi/hNjd?=
 =?iso-8859-1?Q?159bjTICNFdLKh3BS19dn765saWCyxRPXgbpmJe7BYqmmEUApQuL3W+uvt?=
 =?iso-8859-1?Q?4QF33RiiAwD8Y/8zdJuVhM1i3B6oUkN92bK4HF/OAUmtPjSOP79QloS0qZ?=
 =?iso-8859-1?Q?hB6skHTPH6GDSIqCRFzn3lUhCVfT8Xev37aveVPx4rAuwnIiIQUnQI3wzo?=
 =?iso-8859-1?Q?M1Vrk86MbXw2iXOe4dBLStAXYTqjEdqqnywr1/QyWAxRqe59A6qSefamyZ?=
 =?iso-8859-1?Q?+GbbQ/wkchVfxiyk0KpUfglWefLRhOp7862DtveQ4trR1AeCi4pa6APPVp?=
 =?iso-8859-1?Q?Tvgway5Fsb/v4TUPNeftn2HFwxDq/lr7sU1VD0P1mOOrwd8jBPDDvr2DET?=
 =?iso-8859-1?Q?rOtjzBa8LgsntLCKEE59xbcQSjKEyjM2gd+HdGt5sAiW1hJqZYc1KWAolB?=
 =?iso-8859-1?Q?Md5YKb3HEfQnpsq4VIvpc6NglXE7MDn2DiUsVCZ8GJOiCUgIix8e7H3+rA?=
 =?iso-8859-1?Q?Z3DqQL6sUGisVNWoIE7NqyUQXIedTxQtGsEzlal+DynHXvf9HNvVa8dojy?=
 =?iso-8859-1?Q?tO5TxswPqUVOYww74H5QB0MCZDTKsFfQkjjJFa6EfbPTzFZv9Sw/waiYDi?=
 =?iso-8859-1?Q?hy+A1Em63cU5AhCpfQ3qNI1apxwuS/4isVBIu/UCFMA3Gg/NA3VzvgQr+n?=
 =?iso-8859-1?Q?uJWUYCM0URFGHGJ/4ZFDfspiCfc/NIWod1Oo/IMU3fHzqda4RGN6go/dYK?=
 =?iso-8859-1?Q?sLGhF1NqOU/mwYtxIUObtjQtcpiBBwIxrgHIof3JtBTA0h6FAQEo79Mzpv?=
 =?iso-8859-1?Q?du5r0PeEY6F731qcrs5/5UVWTzUVCu3HwX1BbQzTtubbVdTrXI1kswo/ii?=
 =?iso-8859-1?Q?ru0l7HKo2WGFHqh3kmUVs7DC1diRPPJdyGmzjRRmT4zUHkW6yN5s?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7e700c2-1638-417c-d879-08df0935f359
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 21:05:43.2978
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wjJRJjDS9V/1gEGtUFVvBtp1uPqqHiQ9aQ+BjTi94PoB/dIifF0EdGZdsbhFiytv0RI4Uqjhw1K7QXdrsommmGYkXZHmjqv2+vBcw9LIVFNzFuC41+KKS8ll59lRmw8f
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8692

On Wed, Sep 02, 2026 at 04:35:21PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
> - [High] Kernel heap out-of-bounds read when processing firmware responses due to trusting the firmware-supplied `header.size` over the actual user-specified allocation size.
> - [High] Concurrent `ELE_STORAGE_OPEN_REQ` commands bypass the command-receiver exclusivity check, allowing a process to intercept another's NVM traffic.
> - [High] Use-after-free on `priv` object due to premature `cancel_work_sync()` before `mbox_free_channel()` allows `schedule_work()` to queue work on a freed object.
> - [High] Syscall returning `-EINTR` after hardware operation is fully completed leads to lost response payloads, corrupted retries, and broken state synchronization.
> - [Low] Mixing `goto`-based error handling with `scoped_guard()` declarations in `se_if_probe_cleanup`.
> --
>
> commit afeff3ca68cac56d7230f74585096a1ade46c177
> Author: Pankaj Gupta <pankaj.gupta@nxp.com>
>
> firmware: imx: adds miscdev
>
> This commit adds the character driver interface to the NXP secure-enclave,
> allowing user-space applications to exchange messages with hardware IPs like
> EdgeLock Enclave.
>
> Link: https://sashiko.dev/#/patchset/20260902-imx-se-if-v45-0-6e400879d8ec@nxp.com?part=5
>
> > diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
> > index 10fb4f60b4293..1e7ee8100f846 100644
> > --- a/drivers/firmware/imx/ele_common.c
> > +++ b/drivers/firmware/imx/ele_common.c
> [ ... ]
> > @@ -377,9 +701,24 @@ void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg)
> >  		se_clbk_hdl = &priv->waiting_rsp_clbk_hdl;
> >  		spin_lock_irqsave(&se_clbk_hdl->clbk_rx_lock, flags);
> >  		if (!se_clbk_hdl->rx_msg) {
> > -			/* Close circuit breaker on spinlock race */
> > -			atomic_set(&priv->fw_busy, 0);
> > +			/*
> > +			 * Only schedule fw_busy_work when going_away is clear.
> > +			 * se_if_probe_cleanup() sets going_away under
> > +			 * clbk_rx_lock before calling cancel_work_sync(). If
> > +			 * going_away is already set here, teardown has already
> > +			 * run (or is running) cancel_work_sync(); scheduling
> > +			 * the work again after that point would re-queue it
> > +			 * against the freed priv object, causing a
> > +			 * use-after-free when the work executes.
> > +			 */
> > +			if (atomic_read(&priv->fw_busy) &&
> > +			    !atomic_read(&priv->going_away))
> > +				schedule_fw_busy_work = true;
> >  			spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> > +
> > +			if (schedule_fw_busy_work)
> > +				schedule_work(&priv->fw_busy_work);
>
> [Severity: High]
> Does this code risk a use-after-free on the priv object? The spinlock is
> explicitly dropped before schedule_work() is called, which widens the race
> window. If cancel_work_sync() runs concurrently in se_if_probe_cleanup()
> while the lock is dropped here, it will return immediately since the work
> hasn't been scheduled yet, allowing the object to be freed before this thread
> calls schedule_work().

schedule_work() can be call at atomic context. move it and replace
"schedule_fw_busy_work = true" may resolve this problem, because you set
going_aways under spin_lock.

>
> > diff --git a/drivers/firmware/imx/ele_fw_api.c b/drivers/firmware/imx/ele_fw_api.c
> > new file mode 100644
> > index 0000000000000..72cecc5c8e258
> > --- /dev/null
> > +++ b/drivers/firmware/imx/ele_fw_api.c
> [ ... ]
> > +int ele_uapi_allowed_fw_cmd(struct se_if_device_ctx *dev_ctx, struct se_msg_hdr *header,
> > +			    u32 tx_msg_sz, u32 rx_msg_sz)
> > +{
> [ ... ]
> > +	case ELE_STORAGE_OPEN_REQ:
> > +		/* Might be cleared as part of tear down. */
> > +		if (dev_ctx->strg_hdl) {
> > +			ret = -EEXIST;
> > +			break;
> > +		}
> > +		/*
> > +		 * Reject the storage-open request when another context is
> > +		 * already registered as the command receiver. If we let the
> > +		 * command through, FW would allocate a new storage handle and
> > +		 * start sending NVM callbacks for it; those callbacks would be
> > +		 * routed to the existing receiver (process A), not to the
> > +		 * caller (process B). This would let process A observe and
> > +		 * tamper with process B's NVM traffic. Reject early, before
> > +		 * the command reaches FW, so no handle is allocated and the
> > +		 * state stays consistent.
> > +		 */
> > +		scoped_guard(mutex, &priv->modify_lock)
> > +			if (priv->cmd_receiver_clbk_hdl.dev_ctx &&
> > +			    priv->cmd_receiver_clbk_hdl.dev_ctx != dev_ctx)
> > +				ret = -EBUSY;
> > +		if (rx_msg_sz < ELE_STORAGE_OPEN_RSP_SZ)
> > +			ret = -EINVAL;
> > +		break;
>
> [Severity: High]
> Could concurrent ELE_STORAGE_OPEN_REQ commands bypass this exclusivity check?
> The lock is dropped immediately after checking
> priv->cmd_receiver_clbk_hdl.dev_ctx, which creates a race window before the
> command receiver is actually registered. This might allow a secondary process
> to intercept the NVM traffic of another.
>
> [ ... ]
> > +void fw_api_specific_ops(struct se_if_device_ctx *dev_ctx, struct se_api_msg *rx_msg,
> > +			 bool is_cmd_interrupted)
> > +{
> [ ... ]
> > +	case ELE_STORAGE_OPEN_REQ: {
> > +		int rc;
> > +
> > +		/*
> > +		 * Record the storage handle before registering as command
> > +		 * receiver. FW has already allocated the handle; if we assigned
> > +		 * it only after a successful registration, a failing
> > +		 * set_dev_ctx_as_command_receiver() (e.g. -EBUSY) would leave
> > +		 * strg_hdl at 0 while the ioctl still returns success to
> > +		 * userspace. The kernel would then never close the handle on
> > +		 * teardown, leaking it in FW. Storing it first guarantees
> > +		 * cleanup_dev_ctx() closes it on the next close(), regardless
> > +		 * of whether registration succeeded.
> > +		 */
> > +		dev_ctx->strg_hdl = rx_msg->data[1];
> > +
> > +		if (is_cmd_interrupted) {
> > +			if (se_close_storage(dev_ctx, dev_ctx->strg_hdl))
> > +				dev_err(dev_ctx->priv->dev, "failed to close storage.\n");
> > +			dev_ctx->strg_hdl = 0;
> > +			break;
> > +		}
> > +
> > +		rc = set_dev_ctx_as_command_receiver(dev_ctx);
> > +		if (rc)
> > +			dev_err(priv->dev,
> > +				"Failed to register %s as CMD-Receiver: %d\n",
> > +				dev_ctx->devname, rc);
> > +		break;
> > +	}
>
> [Severity: High]
> If registration fails due to the race mentioned above (rc != 0), is it safe
> to only log an error without closing the storage handle and without returning
> the error to the user? The ioctl will successfully return the valid storage
> handle to the second process.


suppose should return fail to user

>
> > diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
> > index 0792e5152436b..baeb28929b2de 100644
> > --- a/drivers/firmware/imx/se_ctrl.c
> > +++ b/drivers/firmware/imx/se_ctrl.c
> [ ... ]
> > @@ -341,31 +719,144 @@ static void se_if_probe_cleanup(void *plat_dev)
> >  	if (!priv)
> >  		return;
> [ ... ]
> > +	while (true) {
> > +		dev_ctx = NULL;
> > +
> > +		scoped_guard(mutex, &priv->modify_lock) {
> > +			if (list_empty(&priv->dev_ctx_list))
> > +				goto out_done;
>
> [Severity: Low]
> Does mixing goto-based error handling with scoped_guard() macros violate the
> subsystem's LIFO cleanup definition rules? This can cause confusing ownership
> semantics and can lead to resource leaks or double frees.
>
> > +
> > +			dev_ctx = list_first_entry(&priv->dev_ctx_list,
> > +						   struct se_if_device_ctx, link);
> > +
> > +			/* pin this context so close() cannot free it under us */
> > +			kref_get(&dev_ctx->refcount);
> > +			dlink_dev_ctx(dev_ctx);
> > +		}
> > +
> > +		/*
> > +		 * Local cleanup outside the global lock avoids ABBA deadlock
> > +		 * with paths that already take dev_ctx->fops_lock first.
> > +		 */
> > +		cleanup_dev_ctx(dev_ctx, false);
> > +		kref_put(&dev_ctx->refcount, se_if_dev_ctx_release);
> > +	}
> > +out_done:
> > +
> > +	/*
> > +	 * Cancel fw_busy_work before acquiring se_if_cmd_lock. The work
> > +	 * handler, se_clear_fw_busy(), acquires dev_ctx->fops_lock. A
> > +	 * concurrent close() may hold fops_lock and then attempt to acquire
> > +	 * se_if_cmd_lock via se_close_storage(). Calling cancel_work_sync()
> > +	 * while already holding se_if_cmd_lock would therefore deadlock all
> > +	 * three threads. Canceling first, without any lock held, lets the
> > +	 * work and the close() finish independently.
> > +	 *
> > +	 * going_away was set under clbk_rx_lock earlier in this function.
> > +	 * Once set, se_if_rx_callback() will not call schedule_work() again,
> > +	 * so the work cannot be re-queued after cancel_work_sync() returns.
> > +	 */
> > +	cancel_work_sync(&priv->fw_busy_work);
> > +	/*
> > +	 * Free the mailbox channels under se_if_cmd_lock. ele_msg_send_rcv()
> > +	 * holds se_if_cmd_lock for the full duration of a synchronous
> > +	 * transaction, including the mbox_send_message() call on priv->tx_chan.
> > +	 * going_away was set above and complete_all() has already woken any
> > +	 * in-flight waiter, so any transaction in progress will unwind to
> > +	 * -ENODEV and release the lock quickly. Acquiring se_if_cmd_lock here
> > +	 * guarantees no caller is still touching the channels when they are
> > +	 * freed, and nulling the pointers under the lock prevents any sender
> > +	 * that races past the going_away check from accessing a freed channel.
> > +	 */
> > +	scoped_guard(mutex, &priv->se_if_cmd_lock) {
> > +		if (priv->rx_chan) {
> > +			mbox_free_channel(priv->rx_chan);
>
> [Severity: High]
> Could the premature cancel_work_sync() allow schedule_work() to queue work
> on a freed object? Moving cancel_work_sync() after mbox_free_channel() would
> guarantee no new work could be scheduled from the rx callback.

suppose it can be fixed after move schedule_work into lock

>
> [ ... ]
> > +static int se_ioctl_cmd_snd_rcv_rsp_handler(struct se_if_device_ctx *dev_ctx,
> > +					    void __user *uarg)
> > +{
> [ ... ]
> > +	err = ele_msg_send_rcv(dev_ctx, tx_msg, cmd_snd_rcv_rsp_info.tx_buf_sz,
> > +			       rx_msg, cmd_snd_rcv_rsp_info.rx_buf_sz);
> > +	if (err < 0) {
> > +		/*
> > +		 * -ERESTARTSYS here means the wait was interrupted by a signal
> > +		 * after the command had already been handed to - and executed
> > +		 * by - the firmware, with its response delivered into rx_msg
> > +		 * (ele_msg_send_rcv() converts only a positive, i.e. successfully
> > +		 * received, result to -ERESTARTSYS). If that response carried a
> > +		 * freshly allocated session/storage handle, record it now via
> > +		 * fw_api_specific_ops(): the handle is already live in firmware,
> > +		 * so leaving it untracked would stop cleanup_dev_ctx() from ever
> > +		 * closing it and leak the firmware resource. Validate the
> > +		 * delivered response first, using its own declared length bounded
> > +		 * by the caller's buffer, so a truncated or malformed reply is
> > +		 * not acted upon.
> > +		 */
> > +		if (err == -ERESTARTSYS) {
> > +			u32 rsp_sz = rx_msg->header.size << 2;
> > +
> > +			if (rsp_sz && rsp_sz <= cmd_snd_rcv_rsp_info.rx_buf_sz &&
> > +			    !se_val_rsp_hdr_n_status(priv, rx_msg,
> > +						     tx_msg->header.command, rsp_sz,
> > +						     tx_msg->header.ver)) {
> > +				se_dev_ctx_cpy_out_data(dev_ctx);
> > +				fw_api_specific_ops(dev_ctx, rx_msg, true);
> > +			}
> > +			/*
> > +			 * Returning -ERESTARTSYS would let the VFS transparently restart
> > +			 * the ioctl, which would re-run the command with the just
> > +			 * cleaned-up (zeroed) shared input buffers. Report -EINTR instead
> > +			 * so the syscall is not auto-restarted; userspace enters its
> > +			 * signal handler and can decide whether to reissue the command.
> > +			 */
> > +			err = -EINTR;
> > +		}
> > +
> > +		se_ioctl_cmd_snd_rcv_cleanup(dev_ctx, uarg, &cmd_snd_rcv_rsp_info);
> > +
> > +		return err;
> > +	}
>
> [Severity: High]
> Does returning -EINTR here without copying the rx_msg payload back to
> userspace cause data loss or corrupted retries? If the hardware operation
> completed successfully but was interrupted by a signal, masking success with
> an error forces userspace to discard a valid payload and potentially retry,
> which can lead to cryptographic IV reuse or leaked handles.
>
> [ ... ]
> > +	/*
> > +	 * Validate using the size the firmware declared in the response header
> > +	 * rather than cmd_snd_rcv_rsp_info.rx_buf_sz (the amount actually
> > +	 * received, clamped to the caller's buffer). If the caller supplied a
> > +	 * buffer smaller than the firmware's full response, rx_buf_sz reflects
> > +	 * the truncated copy and se_val_rsp_hdr_n_status() would fail the size

check size become meansless if firwmare can truncate it.

Frank

> > +	 * check, causing fw_api_specific_ops() to be skipped and any freshly
> > +	 * allocated session/storage handle to go unrecorded. Using the
> > +	 * firmware-declared size ensures a well-formed response is always
> > +	 * recognised and its handle is tracked for cleanup.
> > +	 *
> > +	 * Any size discrepancy between the firmware response header and the
> > +	 * userspace-supplied buffer is already logged by the mailbox receive
> > +	 * callback before control returns here.
> > +	 */
> > +	rsp_status_err =
> > +		se_val_rsp_hdr_n_status(priv, rx_msg, tx_msg->header.command,
> > +					rx_msg->header.size << 2, tx_msg->header.ver);
>
> [Severity: High]
> Does trusting the firmware-supplied header.size instead of the actual user
> allocation size cause an out-of-bounds read? Since se_val_rsp_hdr_n_status()
> reads from rx_msg->data[0] assuming the buffer size matches the firmware
> size, a maliciously small user allocation could lead to out-of-bounds access
> on the kernel heap.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260903-imx-se-if-v46-0-aefaab525034@nxp.com?part=5
