Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.16
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422553;
	b=4PKUJsIqLx9zZF0EWmtBt4EsYYcTkdEywqX29qJJrS4oNq7CdQQ+TWNRkACeo4FMDXHQ
	 btPpyH5smzoylDf2AWRgLGp7GbVaLTw+PMGs1XNujqfe415z3Bbj1XCEcfjFiFqej5lUu
	 7bueCqsrqkkCBu0LVgJ6e3O0mVCsj6VZjgDkmjXctpmQCJBwazRMvjKYoL9sYJ8vmXgMo
	 bDPeDAFrfV2JnywlRTWRejVoavqewaRtm2Hx71ofYaOI18hpSe+g2skbfSYyJnb3Z1FKc
	 Ig3njm9YQ8vytTWrLhXkfuoSXVqsADHH2+dTDqzp4oC/EmFbdZY69CZ7zLfPcqcBrpQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422553;
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
	bh=eajV6KPMiANpCn6RJxBadyRUu9et3qG2RT09hnlirwY=;
	b=GZqvn6whK1vHyyogvPrN8RVcAAjY1pc/8rWjV1qsGmuIwC0lnPlGIULO9GhgPmb91OcP
	 ulQ/sruxfImvHShRGdOoCEWs+Hd00Z0UAYOhtAk5m9ZEkRz4KaHEw0IICb2CNGkANnupA
	 JfE51w6EVSmWSzsWkqyCxswqulWkKlYDqW2/q4O9+/44aXry45xX/swrq36ZDNZtUh8xL
	 pIbEtQq30QTKbdpeW+xhFjc/LwJEFvXjee886idmRqPl5QvUmSiQc088jcmd9Uv3DNj/L
	 Fz9zbiMcRlaOY4f45XpPqcVdBXqhUZQ2XJ6/BacZEqQmWjKIAKBRs4PvYCHu/bisgEA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ikCxOzbq;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.69.16
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010016.outbound.protection.outlook.com [52.101.69.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2996086076;
	Mon, 19 Oct 2026 15:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF2996086076
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=ikCxOzbq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvFEfkgyR+zjejGTe2ur/oaMSaXzaDD4bd+x7Fb8J0j6jqVVX4pznX/tNLkJsuwujZfpPPnc+XsG06VIu+1n1cGiyxVA3nQztrGRsNl6SUMnra1uLCx7pB6ekkMTSWp2gVb9pPMtmIuzVjh33Mq7+OqItlRL9Cq9XwadfLW4YQTkNbg6xnjo5Vv7kBCXf4W8c4qI9R2vhqt7YeQNr7FJdyAtj/JhCcSWnFpM22Fe1LeRk9JHtL0888lHDVllAq/mhKcxcRLuhtd7iX8bt676BlOqfV/46D1bsqyHhkqFORKqu6L8NWRG+zSqsYessCfsP+UrY+ejX/J9H9B29lpseQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eajV6KPMiANpCn6RJxBadyRUu9et3qG2RT09hnlirwY=;
 b=m6wbd7offRUeom4DQ+kNKZa4fQejUxj3R937YBLYBSpxUGOGQ7BeMU95MiuYn4vNDQShIE0mS4lGpva4d4LLH1RJOL25+Ic0gw40z/XdXQ9KFf3sCieHh45Q36ht4mDyUtS/BqawS2MRDuD4hbWTgqlQirLKgiXrc8r8NXJSNVGSjSwQ7YcHSjGXx9AeMXb3ZQ0YBP5d5f+YGuG6HD46T714YT2FFIcCA8nQQQ9RYf9LhmFb3oBrVabpJJTgWUCgO9P+t+SBxSh+vEBr7phe1Z/CLLywRILLDBgpJmgLJcxiu63zzPGgSS1fekYfKgBDNjMfFl2uYJOxDzEaO5mMmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eajV6KPMiANpCn6RJxBadyRUu9et3qG2RT09hnlirwY=;
 b=ikCxOzbq6AWYwnZfvTu5YM1/fp2cUpDr1jAWJ7E3L9Z9/7SBtelZK3AwlMZACJoSxF451i7cRQtMOgMP96QxKfCanj591oDBofbblpX51g0aGs1Z0l9/FaXvSeT6Wv7H/DR+E7UGz0JmgmiZYBSpei0wiUY8ti1DQRBC8Jgvkjx9G4UUTHl0DdBuReynycVuRwIUBLMe5jg/ogvZCK2irG7XteMs9BNoXsMPZcV95bB+Y60pU5bVO5/+WeVd2pH/7PWXq0yCq7DnlTgRrDx51/Qc0aYJzyHJJSuW6SxpUimRi+6eVvagk5e9ddEbou+VlDUiDiqgB5hAI0gOH3NdfA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com (2603:10a6:208:17d::10)
 by AMBPR04MB12281.eurprd04.prod.outlook.com (2603:10a6:20b:725::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 15:09:10 +0000
Received: from AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023]) by AM0PR04MB6900.eurprd04.prod.outlook.com
 ([fe80::7fda:8431:ca1b:b023%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 15:09:10 +0000
Date: Mon, 19 Oct 2026 18:09:07 +0300
From: Vladimir Oltean <vladimir.oltean@nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
Subject: Re: [PATCH v4 net 1/8] net: enetc: consistently track dropped frames
 in enetc_xdp_xmit()
Message-ID: <s4u4qujbr64gfjqjnlbso47uh47b3ru22h4yu72awekgfhwhru@wmpadtpd67cu>
References: <20261015105536.1692348-1-vladimir.oltean@nxp.com>
 <20261015105536.1692348-2-vladimir.oltean@nxp.com>
 <20261015105536.1692348-1-vladimir.oltean@nxp.com>
 <20261015105536.1692348-2-vladimir.oltean@nxp.com>
 <sashiko-outbox-174210@kernel.org>
 <sashiko-outbox-174210@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-174210@kernel.org>
 <sashiko-outbox-174210@kernel.org>
X-ClientProxiedBy: FR5P281CA0028.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f1::10) To AM0PR04MB6900.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: AM0PR04MB6900:EE_|AMBPR04MB12281:EE_
X-MS-Office365-Filtering-Correlation-Id: d81c9374-8884-4d91-eded-08df2df2edd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|19092799006|23010399003|1800799024|376014|6133799003|18002099003|22082099003|11063799006|4143699003|10067099003|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	aklWJ6W5jHU+BcbfvwDSuywpoo9r6lQgRiFcA1iiroDj+YIvBLtpiITYcXs8Ut0WMcSGhluQplR3ZNzblm+Q4YGhe3kapBRcGPUuFAD8mfMZ8fk7+bRJ1D3qslvP0vBKe0+Fob0meCTXQ+iWZI04Nlx7xbqQ+E0QUwtUeoaPPzs9zqP3n+GPYkB9hX/mZ8j/jt9Ip+o+6ZwbpF7i8Gti/WgaK5zqw+sbMJdGyNWFjQGrEpD/wMUuvXoHTWtSQptw5KkH8wKr3BFxgzyRkTtZojYGuVQAr97/JS0QJmf1DF5m95yID88aEuuMeJzLiFUBFcg/iONCnnLg39fRIq2swEwt6r5Fw+hL1iK+5JD/POtLzgGeKvHxz089QvKbRJPEh14HDuGiHLQfrLjwC79OgP54QR3JBpGcRNYyvAtPFdtc5EQ9cqRwRnE2hYFnDoaBrvdLJfj029JUCXhTngCRwMN379ChaH/Hmntp60mlRh8KlsPFo5bLmKX2EOq4qaWrODfF/OZwdzKDy5TwZ/Uz1uvYBTwoqyRulDco0HwtzGlAS86P978ZdHqc2tJfx+KteYzQwGxfJP1AUKed+8vzUSuyknVT1JgieIemuQ2j8cE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6900.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(23010399003)(1800799024)(376014)(6133799003)(18002099003)(22082099003)(11063799006)(4143699003)(10067099003)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?f8ObImrU211NUEX7YjlNlfROuqLsm836VwDaewKOiMdib/sp7c2qpUYbBX?=
 =?iso-8859-1?Q?vHDYjIIdrtso7pubecegw1nIaug1oEdXPvLL5rQMIIuhaEwZ4+bSYLUOAf?=
 =?iso-8859-1?Q?/NXrBlTz+1e3XZWxBVWlB2mgv0TQ6u5gK5UfbNoDIjC0N2OPkA3hDIuCPO?=
 =?iso-8859-1?Q?YQbsLTAOPkvEyaHi3kpezdZStTRR+OBwdcAUN5PEecsRyl2zHnVk51lj0V?=
 =?iso-8859-1?Q?sJJqdDjJcnYXek9KeokQXNDeH/SHAk7gKPnpNIEQZt1YF8mziEoCpqMfLz?=
 =?iso-8859-1?Q?AdD2G8gzBOJK0kIHLT4dgKcXUbbcQBbOCdUw23T0X2+m6uFJU/FMY4EazU?=
 =?iso-8859-1?Q?uCAwFTw/xtFgbNY8eHBEFVLLXtBaznIQF+6drpiGJ/pK3XpkMgvnblGyWU?=
 =?iso-8859-1?Q?cwu6MTIlF9hidfEahEHbMOdHtp87tSmgyH5h52mTMdFmx7C+tdJWgWfnkO?=
 =?iso-8859-1?Q?Fh5OkdNFYTLabZwaSZ1dobjAKdMoOAEjSoXD4f29U+4xpREqZJdOjh0cFm?=
 =?iso-8859-1?Q?tqUtRB2n4VpATjB0dyVO8FH/nPQRUgnfKMpjr8k8NRiePloSfv8HtI0Goi?=
 =?iso-8859-1?Q?mni9fYAItqIsDQrsevVc0TxYTlloQ28QnZ2COR6XEocm6pJOhPHbBMXtrj?=
 =?iso-8859-1?Q?T7I16Xfd9qizBJiuuT3WdH9QWGZS0a6qepk1vtzmCFox8n+YSaLD88qVMZ?=
 =?iso-8859-1?Q?pCOo0PdRDO0qWKuLUqqNc5NBfv7ygy/246JphjX3y/MpSMthjVouFSDhEf?=
 =?iso-8859-1?Q?VUuOp4xV8ENMqczcwuv9YzDG30dIB2Pl+x4AiFuf0JcC/AdA0P0hSNIlSC?=
 =?iso-8859-1?Q?uF15oknsOYXIyC4iryLxIF69TCSUk7Lxq9GGWNMzyZg54KR29DyJaisVP4?=
 =?iso-8859-1?Q?gwV06L8pkItMdckbST94gIM333n1l4BnvJ/uf3oun5L8LW6J1sXps4Xbnn?=
 =?iso-8859-1?Q?4jggk8IEmgxFUDMvZALwsXn065AB6pa0xxaU2iSy/0TVhhZGnZu2yhQzud?=
 =?iso-8859-1?Q?RIXzEKDiyGafea6fOea5YeRc0dVQy9F5/FiUeecxY6GKUFU4I/YA2R4dT2?=
 =?iso-8859-1?Q?bQ5gh0SnPwpTWNBtkabnej+UndIgtZJFFJVqCHCs4ybd3gup0vKQ4ycanM?=
 =?iso-8859-1?Q?J6/V6nrSl4zQIiQ27DMW5AnnCnMEs5wLsqApL/TA98BTtH/QOf5Ppjy+sU?=
 =?iso-8859-1?Q?C6wcQA51Uc8XI0P+0YO8OU8FTHE3jD0sALdczvvwRKzKa7nJhE6jaNx/Cm?=
 =?iso-8859-1?Q?NBqMFAGKODQzjbyCuB2Clyfd+P3TTCluk+4fwp0NOrQP4kdx+YRh5Owc9E?=
 =?iso-8859-1?Q?sMvmEZ90huwYn86rlZ/4lemzmd0ck1OpNT9kqrH+wjazoQTMqaqtAMPJ/W?=
 =?iso-8859-1?Q?LrdQjQ8IYPMM0EGfZk1C4oyGqiv57jww/LvH8ikotCoi7vvIjBzjKvxR74?=
 =?iso-8859-1?Q?YnwriKDf/fHlqZTT9D0Sj8B+ZnfZU6tFjqK7aV2KOCrmIYa4ofGMKKmWH/?=
 =?iso-8859-1?Q?QWZYj5ayxqYStVxzea95XG0xNlVJfZiadXacc1K9rStv7pqQFfJ/zTUc8j?=
 =?iso-8859-1?Q?Hu3Altdfws1HcnNbNp7QfI29HzfywE7FSID3VvFdFjxAFkUYX9lntbrVng?=
 =?iso-8859-1?Q?l9tWcvhDbTS9NA8lg9SnCvUYvFbnE9rKm+/NtDakdK3vDqOajMYpgdg9rV?=
 =?iso-8859-1?Q?tvv8LJVsZ1/T/jvi/VfFP0zxaJrJ0AfwEPjt+MdTKOSaEtCUhm/ySZpSJY?=
 =?iso-8859-1?Q?NF3I7bMcIu+fYgiElsW3wPbrb2t/bbCZG2uXkhjO1wh4oO0djcPtVs4Prf?=
 =?iso-8859-1?Q?ZlF0w1dpxw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d81c9374-8884-4d91-eded-08df2df2edd3
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6900.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2026 15:09:10.6951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gbuowF/AAgtDTcWK2QZjc0coGz10QrSmCKgiw7dlsBeie6iewyyPjmU6RmrnucRPzSFNFQzFTL7apKPzXgJqnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12281

On Fri, Oct 16, 2026 at 10:56:55AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] enetc: Use-After-Free in enetc_xdp_xmit() racing with enetc_close() teardown
> - [High] enetc: OOB array access if CPUs exceed hardware TX rings
> - [High] enetc: TX ring corruption when XDP_REDIRECT overlaps with network stack
> --
> 
> commit 805311ddad67da52149365adfc7772abd1f8ca5b
> Author: vladimir.oltean@nxp.com <vladimir.oltean@nxp.com>
> 
> net: enetc: consistently track dropped frames in enetc_xdp_xmit()
>     
> This patch updates enetc_xdp_xmit() to consistently increment the xdp_tx_drops
> counter for all silently dropped frames. It routes early failures and batch
> failures to a common exit path to ensure statistics are updated accurately.
> 
> > diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/ethernet/freescale/enetc/enetc.c
> > index 80f0082f6c633..26abc5fafd188 100644
> > --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> > +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> > @@ -1814,15 +1814,18 @@ int enetc_xdp_xmit(struct net_device *ndev, int num_frames,
> >  	struct enetc_bdr *tx_ring;
> >  	int xdp_tx_bd_cnt, i, k;
> >  	int xdp_tx_frm_cnt = 0;
> > +	int err = 0;
> > +
> > +	tx_ring = priv->xdp_tx_ring[smp_processor_id()];
> 
> [Severity: High]
> Can tx_ring point to out-of-bounds memory here if the system has more
> possible CPUs than hardware TX rings?
> 
> During initialization, the driver configures:
> 
>     first_xdp_tx_ring = priv->num_tx_rings - num_possible_cpus();
>     priv->xdp_tx_ring = &priv->tx_ring[first_xdp_tx_ring];
> 
> If num_possible_cpus() is greater than priv->num_tx_rings,
> first_xdp_tx_ring becomes negative, leaving priv->xdp_tx_ring pointing
> out-of-bounds.
> 
> Because this patch moves the tx_ring assignment before the ENETDOWN check
> and adds an unconditional dereference of tx_ring->stats in the goto out
> path, an XDP_REDIRECT to this interface will now dereference this invalid
> pointer and crash, whereas previously it would safely return -ENETDOWN.

enetc_xdp_xmit() is only reachable via .ndo_xdp_xmit, which is only
provided by the ENETC v1 PF driver (LS1028A, <= 2 CPUs, 8 TX rings per
PSI). VSIs and ENETC v4 (i.MX95/i.MX943) don't implement
.ndo_bpf/.ndo_xdp_xmit and don't advertise xdp_features, so
priv->xdp_tx_ring is never dereferenced there, even though
enetc_alloc_msix() computes it for them as well.

> [Severity: High]
> Does this setup cause concurrent, lockless modifications of a TX ring
> that is already in use by the network stack?
> 
> When no local XDP program is loaded, enetc_num_stack_tx_queues() allocates
> all priv->num_tx_rings to the network stack. However, the driver also
> unconditionally assigns priv->xdp_tx_ring to point to the uppermost
> hardware queues.
> 
> If another interface uses XDP_REDIRECT to send frames to this device,
> enetc_xdp_xmit() executes locklessly here, concurrently modifying the
> same TX ring that the standard network stack is using under the Qdisc
> __netif_tx_lock, leading to queue corruption.

Noted, but out of scope for this series.

The fact that this driver reserves TX rings for XDP means it only
supports being an XDP_REDIRECT target when there is a BPF program
attached on RX. Thus, a change adequate for a bug fix could be to stop
advertising NETDEV_XDP_ACT_NDO_XMIT unconditionally, and only call
xdp_features_set_redirect_target() when a BPF program gets attached.

But again, that is out of scope. I've queued that patch for a later set.

> >  	if (unlikely(test_bit(ENETC_TX_DOWN, &priv->flags) ||
> > -		     !netif_carrier_ok(ndev)))
> > -		return -ENETDOWN;
> > +		     !netif_carrier_ok(ndev))) {
> > +		err = -ENETDOWN;
> > +		goto out;
> > +	}
> >  
> >  	enetc_lock_mdio();
> >  
> > -	tx_ring = priv->xdp_tx_ring[smp_processor_id()];
> > -
> >  	prefetchw(ENETC_TXBD(*tx_ring, tx_ring->next_to_use));
> 
> [ ... ]
> 
> > @@ -1853,11 +1855,13 @@ int enetc_xdp_xmit(struct net_device *ndev, int num_frames,
> >  	if (unlikely((flags & XDP_XMIT_FLUSH) || k != xdp_tx_frm_cnt))
> >  		enetc_update_tx_ring_tail(tx_ring);
> >  
> > -	tx_ring->stats.xdp_tx += xdp_tx_frm_cnt;
> > -
> >  	enetc_unlock_mdio();
> >  
> > -	return xdp_tx_frm_cnt;
> > +out:
> > +	tx_ring->stats.xdp_tx += xdp_tx_frm_cnt;
> 
> [Severity: High]
> Will this result in a use-after-free if it races with the interface teardown?
> 
> In the teardown path, enetc_close() does not wait for RCU or hold a
> synchronization lock against remote XDP_REDIRECT threads before freeing
> the TX rings:
> 
> enetc_close()
>     enetc_stop()
>         set_bit(ENETC_TX_DOWN, &priv->flags);
>     ...
>     enetc_assign_tx_resources(priv, NULL);
> 
> Since this patch changes the early ENETDOWN check to jump to the out
> label instead of returning immediately, the code will now unconditionally
> dereference tx_ring->stats here even if the interface is going down
> and the resources have already been freed.

enetc_assign_tx_resources(priv, NULL) only frees the BD ring DMA memory,
tx_swbd and TSO headers (priv->tx_res). The struct enetc_bdr and its
stats are embedded in struct enetc_int_vector, which is allocated in
enetc_alloc_msix() and freed only in enetc_free_msix(), i.e. on
.remove() after unregister_netdev(). So updating tx_ring->stats on the
-ENETDOWN path after ndo_stop() touches valid memory. There is no
use-after-free.

> > +	tx_ring->stats.xdp_tx_drops += num_frames - xdp_tx_frm_cnt;
> > +
> > +	return err ?: xdp_tx_frm_cnt;
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261015105536.1692348-1-vladimir.oltean@nxp.com?part=1
