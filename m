Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.9
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793001896;
	b=4fXuru2h5ksleWVxZyXhdW+QeF3+zkFW4U1bHOvuO9Eqp73IpBFIwdjCUEmktdYE8zMd
	 M3sdXTXVS1RIibdgeeC8bim/38kPfX4kwrUwEYD7sVL2Ky8rwDoeDf1lJbJOKVTckqL2u
	 TaPP3n2Od6Zp8Ngbo/T5Ta1UQ48+/p5hDc9hS4lsnZGQeAVtjJtsLR6aymRRVdKB4JDxU
	 /Wj7s0pFIsXV9YRIJdHyx3si6bNgqrPQD1+hOczVgbGYvtn6X1STUZey36RyIVcRXdArf
	 Zgis8yX0UEV7ZtfgzEOoM25rILoOkQ+FkLGnzNAcE5SnZmjSKXGXx9QZ4V9BrFxJafA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001896;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
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
	bh=AmklSRBNQz9U3fDVrFj/uUkt1eDAfBSpWRqJ7hjHPks=;
	b=1I6SsTDOwffaf8mf8NoH7XxwUeUZOmOJk9DUAlVKS1OFFhGms6Olz/HNExeppAmmuV1v
	 5IBm2PHWJ5+0GFxHjlS+IY+0i0m51RDJl4zY1AYrQOrGGqh7TVJUSzzyO2ZdbJQaC5cPX
	 Zp0H1E3QabM21PfNB79Ts4r/QJ0+Hy8M+Jy4NTnbFGWPiwokQtRTcItM2OI6q5OVsMOuI
	 zoeCttknDF8q2n0rPbLmhnPx3WZdqrStBscTEV8TTekGBhtTYZ4GOy+QiN3QnHQcBQtAR
	 myQmfsLk3SabyYeXVFVwCs2gfzCrHJQhJYBeEKxdzLFau/cpsIWteFpoGZ+easdfgqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=P3zNUR5o;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.9
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011009.outbound.protection.outlook.com [52.101.65.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C103E606A31A;
	Mon, 26 Oct 2026 08:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C103E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=P3zNUR5o
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tZ6ZVXrL8vDMbmjWQL+TzsH0DqS/H4prNm4EQoIsCtAnwCyeZfvg5I6d27ZDFTpDYu5yaH4tsxJWofXeFtQcVJhbkQDmYEk+yb3JziH+4XljY6DOgx1mFabW1t/0H3JQAwzo7BmZOO8/A3hSGiNoPI9zasdVBOYM2sRFuJg2hVgLWwrvRzem05VsizWXhZZ0u9bVpxHdVYzNDlB51pbAC77oFa90CbhAUDr/mdywhd90hhEYM0CElL/QCpF943HAGexR6lVHESDQulGTo40heON6+Z7z5p1psnvqN/0lfh6uNKkdc2klxrM3mC2C8QufUmiMycNQQHq4DTyn2kOlMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmklSRBNQz9U3fDVrFj/uUkt1eDAfBSpWRqJ7hjHPks=;
 b=NsmrWswCJbkuskhXs4DSGzucrsp4pxaMYpTVAafQWF6jgUEuEtOW8RcBrBFkggrGG75JgWcc742kkOPQWPfkB4tMIM3fToW4ajdCfnAoMpJvuKviLwkFo+ep2CFRBczBfOke2Iul5fHMGqGVL6KxEsPle4U5pt+I/eAlU8cE2URU5C4W7aV+yBWqFfb8x6TunD52JPlQYTvafUajgtMzFiYVa/APJnlrkx5oOCbQP78sz6+aJDRjaLZ4jpYKg14QbcTU/OJu8lIUI8fZ0pVivJBKoJ0G8Cd7umKzR04h8fznY6zcwR20AQRTokarrk4ypLuZvxJc6qadJJ5I9HJ4Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmklSRBNQz9U3fDVrFj/uUkt1eDAfBSpWRqJ7hjHPks=;
 b=P3zNUR5ooTwZtYXl3acqguigW0f0Urxm7TQmZI0oSIAvOMCyysWpa1/EsJ9azfLKXcFyUwP/aU+7k5tdZwhkbMVWIECvyivHVrl67zkz7fsckr874mB6MjZHTGcBs11SvR15O6ku0WRux1sj4DsQ2FTQLNCqNC2BM4J2hJbjJUImYSTs+8WAURgpicLrNv2LCL+/Wo5L5kP6C+TdVI0vN6DD4/xxULM2qSskltl1lSNKk8RURyfLcNcMDS1leZaNxVq5ChkxifVDSyJ7Q7S6GHDhypCDbPnhNPBR2fSsKbX1RlYJdj7jUMmHiBYcISCTURdx7a9VZmHa+o64k5Lkng==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AMBPR04MB12181.eurprd04.prod.outlook.com (2603:10a6:20b:75b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 08:04:53 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 08:04:53 +0000
Date: Mon, 26 Oct 2026 10:04:49 +0200
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH v5 net 2/4] net: enetc: do not rely on mEMAC hardware
 frame padding
Message-ID: <lgalu3amnzha7hmmtpyheflgqyd5jfxzqzkdeodga6fa27krgv@i3al7ufiwkbs>
References: <20261021145314.1435049-1-vladimir.oltean@nxp.com>
 <20261021145314.1435049-3-vladimir.oltean@nxp.com>
 <20261021145314.1435049-1-vladimir.oltean@nxp.com>
 <20261021145314.1435049-3-vladimir.oltean@nxp.com>
 <sashiko-outbox-181659@kernel.org>
 <sashiko-outbox-181659@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-181659@kernel.org>
 <sashiko-outbox-181659@kernel.org>
X-ClientProxiedBy: FR4P281CA0394.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cf::12) To AM0PR04MB6900.eurprd04.prod.outlook.com
 (2603:10a6:208:17d::10)
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AMBPR04MB12181:EE_
X-MS-Office365-Filtering-Correlation-Id: 17045fe3-639b-4fca-272a-08df3337d0d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|1800799024|376014|261009223027099003|261022075727099003|261022105027099003|261021121427099003|10067099003|56012099006|22082099003|18002099003|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	BXLm6T90LmtilSLeFi+gILqz6QL82saq8QyUnGL57vVeZHYPHQdiqSLWJKLwm+Ixcs+TtB8c70/AVMyim7yQHDxchF3pfoN6IsNWD21GW9F7QDN7surs2cGlFaZ1rItnZ9JCWIYOGyHDUWHVtjfjot4L/nF8k1O8jcs93IhpEKOnVueGe2u/19OQSh+ebmlZAc4zPHZdrOqjV4aoMLcL0L3C/HqCoc+mTndT045LSucB0vjC7iX2m8ZmezaUsloK5Czr5hBKYWzK/82/Ta+YGaa4B1+FHgfgdLFnD8xQXXzRk3aF218/k6g0zRxDlMYyoCItlIGjVKs/EB3Tw7yarEBxMu4QUf63G5E02bddBvKCnf+xJ/BvyoiMWePk8L0wdj3dX5VW325Wt/B1Qt5fCVgLztLIgHJn7lEXr/swqGaGciXPiKBbbj/5NVvP2kYbPL0Ku2pWUTIUVhAWfmhvMDu+JY75aPNxKGX/talv+PzImrX4SJ+tnmKXIAhq2fRdZ4yOv1aIjZ0XiUSv0xc0SFKWa/dh02OKd11yFTJv8D8FEIBQr6ZIVtWPU2gNw2TTFn3Cz5jgtU3xzCz0KeomzsD48pxURzIkEGRTpu/Di1Srv+Wi+w3/xJ7l/FVoD0VMpUkqJDlZDPfJoTTl3tOlyozIqh7MWDOEfvfArdBJ55A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(1800799024)(376014)(261009223027099003)(261022075727099003)(261022105027099003)(261021121427099003)(10067099003)(56012099006)(22082099003)(18002099003)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xOxlB2luoUfTrHsO4n7ZDaAjzYqUd2+x9pe1gQal8wYz+mnnwSkFMWraUnFP?=
 =?us-ascii?Q?d8tb+2grL6xeaZkwxPJYhhEE0Ae0PFTlsxQUCpCPEQxaWLzfLeAHVHicCwZN?=
 =?us-ascii?Q?aWCpi6eZNPWAaETL9pCi5j03rxQ1Dxs08pnEyWORD16XxMIvVFnHxEbPAxht?=
 =?us-ascii?Q?7U+O2lJLovnnLX1yzFgcnr6w5JXSOH7RpcEZrM2+SMXSziw0iBbrby+I8xjU?=
 =?us-ascii?Q?dLozCAn6yFnzwtiXwirSwrEWbIw0GqRhyY0GB+GjPGaFLsp8WUk8O1dW7AH2?=
 =?us-ascii?Q?FrI+5eJdGL1nYkkgtulyhcQRUhU+TZD68drHenVymIj+azX/fXyR0lWa9Ny/?=
 =?us-ascii?Q?eMVkz3mkonpu4cPpPgyVnyMgLSwM+KXRlHT7nUIjaSFbRwZn5tOz3/LACX3d?=
 =?us-ascii?Q?eOPhY1F4A2FDX8rwO+yRVKFZRQukf3QYpX545EdOCmtv8DzbaDa87jm8g1qt?=
 =?us-ascii?Q?V9qZ1qjz8czm0X4H2/0mgvw4B621r3VhjhUJs54+GrEgE8lDS5xdX+xlcRa3?=
 =?us-ascii?Q?U29PVCrpvrvNhVZffQFSQEMufAO3GwLeG50tCh+dbucay04yqQT2d0qDGg6l?=
 =?us-ascii?Q?iBYWVER/TrCevJJB8I9/7C9FrrRvvxqACBCTae29vC5YdmjFSmBqVlNJ5Lws?=
 =?us-ascii?Q?Yp/svVuds86pNJnPCpM473mN0glT6OR6frOW0/7e+9Bo4aQxVXCoHO10a3on?=
 =?us-ascii?Q?oEyBAlw0U+nQQUenNYQgM9nYQL3kYmiRoTo718R0UJBHpvWo69xj1mPkqG3o?=
 =?us-ascii?Q?O1AE8SyruVtwkdbirYxRMo6rbuDLhhD88VJo4pWU+/V4SD6MSrb90eAnhtVr?=
 =?us-ascii?Q?ZDXKXJQ6I2rC3490kZXXb03O+efFx+l2Y/+HdjPJtewWvL3ldUtBZpQd8Cu+?=
 =?us-ascii?Q?ZLanRaiUBWbPvrUdTzsMCqamuIaeInHtZWl5GSlg8r7/wN1VzURI2sI+cl4f?=
 =?us-ascii?Q?xRwMOLcNT98pCKCdXJ+sgxv0Ahh8H9NCWMOysYxgbUwYqP8VAZPQ2TYrigvb?=
 =?us-ascii?Q?AXJ9mgaEpSzinA/9x8U7wOtDlRTGgXRk0kkYqINToTiohZ8nH7xxBnkWjqtS?=
 =?us-ascii?Q?taT9nvD4+pAx0HOvea5SeL9hubQP9zhtuRRWTV5lhFHBOretFd/wEXgUBr2V?=
 =?us-ascii?Q?L/Pxx1CJmLFcbCnP/EV/IV4wCtwfYXTP65R9uiix+OnAdNZBHpmNj1GE8nV/?=
 =?us-ascii?Q?5p3z+gwPD6QXcOIqbjzjEhUagc4vCT1UKXKcJY6z1eLzBBf0uK8gyhp2pfqH?=
 =?us-ascii?Q?rwCx7MKNkm6t30SDoeRuvGZj3HP0hCUnJK+nfcQhva+hSQ6Di2hZUmdFY4Cv?=
 =?us-ascii?Q?NRJg9SZMJITnqFiRifA2jHzhRQukiikIeCtAo0oyAXpU8xmFKeFFNUrotiw7?=
 =?us-ascii?Q?UTlX/5+QpUMXs77Yv9vGSEAIYT3ES1/dVpT1DBiepP2V7GsJmusy2Yb236xC?=
 =?us-ascii?Q?9Gufd+vnEKJxzbCtcs4X3CBKHTpHTIYdgE9ZV/faMI7EQYOT8+6DwYf3ssPe?=
 =?us-ascii?Q?IDcqW+g33EXX1/nMZY4LqYHez5n5yg4Qa8nZukH50gV5Umh83+yaJIi1vJPR?=
 =?us-ascii?Q?TXKjp/rE5fz8xSDNKE4El0NkLpszeihA55MWB1MYJ3xXA0yGeCcl5xZS1Bwv?=
 =?us-ascii?Q?YQ8VJT+nkeoAs5MfItkw6FiJbUkM3BUM/xhQIzXRyfvWQWm3/JwfGudYJ6/t?=
 =?us-ascii?Q?m6jUVAd+yheZpyfcIoYNMVrNtZN1TZL2CM4ly86dcXw+2cUtChROnx48+nBv?=
 =?us-ascii?Q?fr/KDniRXg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17045fe3-639b-4fca-272a-08df3337d0d1
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 08:04:53.1872
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7jckekUqaYW1tRVhexTnUlCWpUl0+XyILti5r90EEIuAyxQbVuWuzeHNC1GYqBKXFDZJI2igVNsofRKtcRAjQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12181

On Thu, Oct 22, 2026 at 02:54:43PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] net: enetc: unreleased one-step timestamp lock in enetc_start_xmit()
> --
> 
> commit f785a6d3699d340412051eda6871e1a582901866
> Author: vladimir.oltean@nxp.com <vladimir.oltean@nxp.com>
> 
> net: enetc: do not rely on mEMAC hardware frame padding
> 
> This commit pads transmitted frames to ETH_ZLEN in software using
> eth_skb_pad() for non-GSO packets and a shared zero-filled DMA padding
> buffer descriptor for short GSO segments.
> 
> > diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
> > index ab4bfefda6c8f..f0f9ba94b4df6 100644
> > --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> > +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> 
> [ ... ]
> 
> > @@ -1053,6 +1088,9 @@ static netdev_tx_t enetc_start_xmit(struct sk_buff *skb,
> >  			enetc_unlock_mdio();
> >  		}
> >  	} else {
> > +		if (eth_skb_pad(skb))
> > +			return NETDEV_TX_OK;
> > +
> 
> [Severity: High]
> Can this leave ENETC_TX_ONESTEP_TSTAMP_IN_PROGRESS permanently locked when
> eth_skb_pad() fails on a short one-step PTP Sync packet?
> 
> At the beginning of enetc_start_xmit() in
> drivers/net/ethernet/freescale/enetc/enetc.c, a packet with
> ENETC_F_TX_ONESTEP_SYNC_TSTAMP acquires the bit lock:
> 
> 	if (enetc_cb->flag & ENETC_F_TX_ONESTEP_SYNC_TSTAMP) {
> 		if (test_and_set_bit_lock(ENETC_TX_ONESTEP_TSTAMP_IN_PROGRESS,
> 					  &priv->flags)) {
> 			skb_queue_tail(&priv->tx_skbs, skb);
> 			return NETDEV_TX_OK;
> 		}
> 	}
> 
> Normally, this bit is only cleared by enetc_tx_onestep_tstamp() after TX
> completion schedules priv->tx_onestep_tstamp from enetc_clean_tx_ring():
> 
> 	clear_bit_unlock(ENETC_TX_ONESTEP_TSTAMP_IN_PROGRESS, &priv->flags);
> 	skb = skb_dequeue(&priv->tx_skbs);
> 	if (skb)
> 		enetc_start_xmit(skb, priv->ndev);
> 
> An IEEE 802.3 L2 PTPv2 Sync frame is 58 bytes (shorter than ETH_ZLEN) and
> enters the non-GSO branch. If eth_skb_pad() fails with -ENOMEM, it frees
> the skb and enetc_start_xmit() returns NETDEV_TX_OK without scheduling
> priv->tx_onestep_tstamp or clearing ENETC_TX_ONESTEP_TSTAMP_IN_PROGRESS.
> 
> Because the skb was never queued to the TX ring, enetc_clean_tx_ring()
> will never run for it, leaving ENETC_TX_ONESTEP_TSTAMP_IN_PROGRESS set and
> causing all subsequent one-step Sync skbs to accumulate in priv->tx_skbs
> indefinitely. Should eth_skb_pad() be called before acquiring the
> ENETC_TX_ONESTEP_TSTAMP_IN_PROGRESS lock, or should the failure path
> release the lock and kick the work item?

This is a pre-existing issue with all other error paths from enetc_start_xmit(),
including the new one added by this change.

I will not address it as part of this series, because I already have 5
PTP timestamping fixes queued up separately and waiting for this patch
set to be accepted.
