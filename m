Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011010.outbound.protection.outlook.com [52.101.70.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB554DF4D4;
	Fri,  4 Sep 2026 14:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533999; cv=fail; b=U0jAVO52psqNVKiBq+cTIiBM+bpkSGJ49LceDtvTshE1URdai3tuH7aJ9S2uuDCW6mZUI0N1AJAJPd2JpK+lVGpShOQ1hJu3qvbfcDpM2lBOgbWk5iJDlwwqhrDBRfiCcpqPRhPeqtZrqkdP0y+175bkJlQi86dCsfd3/VG8xKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533999; c=relaxed/simple;
	bh=/PbOM+ik6Q+Idyl2THZkxvydXnkVy1HWg/gGP17HaLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KePH2EroYjONs1OKu0kEdxnrR6Da20klCEF7uns2oS+suv2Ge+QeFk/PGWBG4+yby2Klf0wOkIS/u2N7R67jSsgqSZqXA8ESaga9Ii0MT7gwDFhFE9wUN2O9BzVfk3KUXx2ZYhuWN9pqJ2AYL2mI7KlRbLe+7bsWkmUmS7QjaoI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=RP+ou995 reason="signature verification failed"; arc=fail smtp.client-ip=52.101.70.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="RP+ou995"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ngcPymXwt1iPmsSBCc+9gORaF+kvX0j7M/SW/Y4mS/ITYa2w6Rulvrh64TYPK6V+JlxsuI8vsDohGwpHzxtiEoEGOho0AfFzb7f0aS+GmSIhi9fBioZh5AGH+wvT6Vlb0RnuJBYM9NFPeOexkWMz9EnKSv0If8z64m2lqDBYMYWi+peG3vnW9MHXs7h+cfisnvS3yEpPrJ3FgR1XEZnrGTmf6qHmPCxIMpmyLZM5cJT5ihlCzRMg/vSdkMT71BRKO/9aariGluLxtNcll9C1yNv7gUA5ZORbUDESW0W73MTZPWDaNMJkX5wrpepIfYMtenBEQwb1oCkXEeqAAzTI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvRfMHG5u0jtOqDR7u0zQuevLu3RooRAhK62uRY7x7c=;
 b=ye2rMBcSMaVf6+Cv5yn9yqnkDcBpxF6xy1inCfP7ZulKQlkcU8mUliH3CzJwQps6r2smyNwla39h8qU62eQ0QT0wPVV1kVi4iO/+BOiOCocFRTUsh+ffaVstoe/y/CFrdZ/PW4fGY7HDHS9vXkZH53b/popD7YfSQ+nev5oSW7+SZ2+FM1TKTZzs9xNrDmLHbEUwkP44L9wI4KfjQbsWTVwRBnHosqK4ZiqBleBnY0yuHpi8v9nGSDLn1FKjxYbfbEjw8L8mTrm/tuGi3K7N3Ry1W2RaQ9lDflHIP8qMfLdcTlhp0wRgiA96GKtBX7A7DJccZn76zMmoKKyWWSAryA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvRfMHG5u0jtOqDR7u0zQuevLu3RooRAhK62uRY7x7c=;
 b=RP+ou995DWMsuYEcKBebxvindkj+tRnVGqvc2TGzqq6scYfwMtU8YXGWm+uvrQuo6EikUVNTahsftA3qGRKQgkxPAg/HlT6rD/FhjvK1UFcqrwNuZG7pTR2otYnUqroM40i5ZU3mX2cSRPiiAbmmuuP9k4WtpPpPGVZeSO6VHEUMcY6kAGYanbfME6N8I9lmNdnfu9SXxVo4rBfL+zQaBnP50YHzWSy3nl0/1XUFMGEani/Ai7pEYaCVn05ye0f6o/rVlfwl9IM/jgQ3EangplSoKd4DysThUkS7lLNC/2R/TosRLyB3LnV4lAjzjPuf3fKnJzzrQoEGy52oSSaXKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MIWPR04MB533468.eurprd04.prod.outlook.com (2603:10a6:290:ea::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Fri, 4 Sep
 2026 14:59:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Fri, 4 Sep 2026
 14:59:53 +0000
Date: Fri, 4 Sep 2026 09:59:44 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: pankaj.gupta@oss.nxp.com, devicetree@vger.kernel.org,
	conor+dt@kernel.org, robh@kernel.org, imx@lists.linux.dev,
	Frank.Li@kernel.org
Subject: Re: [PATCH v48 5/7] firmware: imx: adds miscdev
Message-ID: <aprc4CCjSfGhP9Z0@SMW015318>
References: <20260904-imx-se-if-v48-0-dad90eec7eaf@nxp.com>
 <20260904-imx-se-if-v48-5-dad90eec7eaf@nxp.com>
 <20260904093956.1F5401F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260904093956.1F5401F00A3D@smtp.kernel.org>
X-ClientProxiedBy: CY5PR15CA0235.namprd15.prod.outlook.com
 (2603:10b6:930:66::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MIWPR04MB533468:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f950e7-1d03-4ac1-c866-08df0a952cb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|366016|1800799024|23010399003|10067099003|11063799006|6133799003|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	YLbOKFHGvCCc0hmjBK7lcgiH3fEx/wrcx8+M7NUJo4qeqv93glxYcbeaEeF2NTqbgSnGHOhuYyjNz7MvsCaEHKbPplRV+7kza4ptVRvF1spr/7t6oKnUhtCUluptg3L2H0aMuXcjQj3DoWzyG/B1r9B+/HCwyu/Pg8siespq3ckIlX/fQ+eW6UQXODOwRz4VOE58lFA/FRpPTs988/BQVlXKcW9k0OWXWZQPpq3lynd/p7uN0TPX3wvciPdtJ3qeaUCktFDbLPS2shwhhWQmn+mJiR3Lm/V+hFA6fQsdqdUwZ+T93hMuYjrNHEiARsX/2acSUbvcBi+cihMDJwS/0FgcdhP3I3gYPWQexDn8WDUB3aUrVSNwRYXoUGa31KD2VraKTBfyHHDX/Uu6+gLGK7SdnhKRzKZWjJxwz9OhAtt6NV/pn3fvf88RAnj2nlw5i0ITI5qKMmcnuHFiJ6nVLAs0oOQ41Od3H7g7zVcqzgoxqjh6/JBLyjyyvK2UDRIcrB8VD7ljdiUb9B68e3UhX+vNa2F+E9U83kxeTJCGaEOZeMoTRtszTp25TBkMNf1a7XdicCe34/Yj2iCqy17o9UyMupN+P4x71XjDJIu6RPI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Nqo7aEn7mrv/fAhHEcdS/lDrcRMs1GXA63PS2jrrD1G4n0oEN41CquIGtm?=
 =?iso-8859-1?Q?7DKDl0IeIIsNr+tiSlw62AlYQ79wxiJRKCj0puaq1q3WDQu2AGIf/s1oTo?=
 =?iso-8859-1?Q?SK9eIXCsl2e7tcfADav7V4I3n+U/b3+tzb3ayzFiTY+isrWT7ayUDnxvkt?=
 =?iso-8859-1?Q?PcwXHSlSMZ7lW+WgthinCZJyjztdXbsXmKtNRvc5DDs8v79Bp1Fjbqf7+F?=
 =?iso-8859-1?Q?s0CqUOG0dcsVcyzvbpmA6873sMSwIK3wNO3aBMuJ2IBeNkoc/FPW31HNt3?=
 =?iso-8859-1?Q?Cq1lqEurHc97hH6/quUYRMxIK/55EqdedpqjsciT+apdtgnBYgrOckU/nW?=
 =?iso-8859-1?Q?OlaY6AIWa3iKTtP0N12HOqGnIr/gFDhxp4lgN4jz25U1UKjHh1NDPS5IBW?=
 =?iso-8859-1?Q?j3JQLMnFV4n/QcLKSx8+g2l2pRzyhVnRiYZzkD5ylWuORRxfcozsgrp5NS?=
 =?iso-8859-1?Q?PhQErWp6NXSG69jQ6LRa+dOHEfjPmI9J334RceUZ4R9oLY5YoUDZRtNXNy?=
 =?iso-8859-1?Q?6Ccms6+6HsN6HRn4muIa/ELBSI9HnZi9IqCMN7sQw77rvR72f9lvuXrfe5?=
 =?iso-8859-1?Q?s8MTO11AQilAFrQcArwc6t1MWzKwvZ+VSxDcQWRnBKOp4uYOrM/jQQ7S0N?=
 =?iso-8859-1?Q?6YvdyB2O8HGhZX+YHRcjbpIoIYL4j7G5397EFlLYe8N6JlNH/3F0QvTR2K?=
 =?iso-8859-1?Q?/IXP3eGrGZiuiL6x5hysESHeK/UBAcpqnXzeYqK9LSU/BMTeOwaGWywfqL?=
 =?iso-8859-1?Q?oARbu9ScxlF5nbXslxU8+rffML/xrDO6exdRJPukcf8dl2oEedZNjDSSge?=
 =?iso-8859-1?Q?X9nirFopOJkrfTg18iKuiNIAgrP72zLSWfwfZExDIU0Th7APinpoXcvnlg?=
 =?iso-8859-1?Q?m4rTvuKddeDO5PGnDpKJmqJJiOvtwd1zokCGu8alR6mE+L5z1xVM34Sdt+?=
 =?iso-8859-1?Q?XVlXU+s2THUb71va0YwfNZyEJFgBDjC+TuHzffbompA1lRhz14gIDlOSD7?=
 =?iso-8859-1?Q?NNXfP6a6PKe3nDep3wLzOTb5shx9hN07IaBAP9VPcK14kI5st6k/AwYvLy?=
 =?iso-8859-1?Q?OXAxPcYceCoEsiXZWOGwgDR3xo1lV1q28Az/ESTgNFFJ0XS7EbkhLAVRXl?=
 =?iso-8859-1?Q?/IYcZHaXBhx6KHnx4g6fG+1nksvevOijV1WPW/uf+CCrBLtjwDPX6Y3hx/?=
 =?iso-8859-1?Q?sSAGFmvISLqnMd8qJE5d53LQFvdHmj0gI9ohOPfjENyJcKI/omkWCvAcpq?=
 =?iso-8859-1?Q?nTS1Fq76pS+YZ47zyLMJjKBHIS3t2TrCtl/VAJV4k5w71aQUoZfeTsa1ra?=
 =?iso-8859-1?Q?yFjjI+l7QLMEyf+cj5jHvEMWSFXWwVPZDPC/qzv5SL1KPUXIjd5g63+yn6?=
 =?iso-8859-1?Q?wLMbBvQNqDcYREej5P0T+Kh9n1SGOtL1ItXBXkDdKIrsM5Fl0HwpI6lL0R?=
 =?iso-8859-1?Q?b3zRknaj3DZrCU1SOeiDtsCYmfi85kR65urVxoqkC+4G1blwi03LrLX4j/?=
 =?iso-8859-1?Q?5xfgsUMXsCoeULiiw4/AAXJeTb/A6CB5no8dW1wb4LLySjDy7mtCQyyb5s?=
 =?iso-8859-1?Q?7MNP1f3CDXqQAeCO0A8R9LicLB4vAxMuG22YQgCdC6VK4RRuuZeue97nMG?=
 =?iso-8859-1?Q?645yP4z8z2kNJGkfTK66hSXILzJiDkyg3zLb5KyWgzXTKUMN5BkZzsrbNR?=
 =?iso-8859-1?Q?FLhOiQRT3QwFaj8JjxQ7TvteglccGPjVQUTp5tu6J8JLpoPTqyAk6OylEd?=
 =?iso-8859-1?Q?95thyUY4EhyI0JAB2X2bvY06ZmWo8rsSjZXFo2GErmjzWuR22md4g384KF?=
 =?iso-8859-1?Q?Fa91AHqdic5y4Sb9Ms149ahLYLb5Abaf2JRS/cBX0Rhtz0PhyZ58?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92f950e7-1d03-4ac1-c866-08df0a952cb2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 14:59:52.9338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hR22GbP/K8lNtrwAzX1EypzoK/3Q4ZdUvR5YR/eXdlgbiioJOb/SPCmsE7S7Pr9bDvs2NJk8gkRDD2Vlqx9a9+m2DM5Rt9/GwIX2nAzwszQJVo0YHFlDVIHIigJsUUwy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MIWPR04MB533468

On Fri, Sep 04, 2026 at 09:39:55AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> - [High] Permanent destruction of priv_dev_ctx's shared DMA buffer on late firmware response.
> - [High] Leaked firmware session handles due to killable wait in `close()` aborting instantly on fatal signals.
> - [High] Deadlock risk during PM suspend due to GFP_KERNEL allocation inside a required GFP_NOIO context.
> --
>
> commit 8a8db094cff29d90b76f6889f2022ca7253f3ec8
> Author: Pankaj Gupta <pankaj.gupta@nxp.com>
>
> firmware: imx: adds miscdev
>
> Adds the driver for communication interface to NXP secure-enclave hardware
> via a character driver. Handles ABI, initialization, shared memory, and
> restricted command forwarding.
>
> > diff --git a/drivers/firmware/imx/ele_base_msg.c b/drivers/firmware/imx/ele_base_msg.c
> > --- a/drivers/firmware/imx/ele_base_msg.c
> > +++ b/drivers/firmware/imx/ele_base_msg.c
> [ ... ]
> > @@ -121,9 +121,9 @@ int ele_get_info(struct se_if_priv *priv, struct ele_dev_info *s_info)
> >  	get_info_len = ELE_GET_INFO_BUFF_SZ;
> >  	if (priv->mem_pool) {
> >  		ret = se_get_mem_pool_buf(priv->priv_dev_ctx, &get_info_data,
> >  					  &get_info_addr, get_info_len);
>
> [Severity: High]
> Could this cause a system deadlock during PM suspend?
>
> The caller ele_get_info allocates its message buffers using GFP_NOIO
> specifically to prevent direct reclaim from triggering I/O to a suspended
> storage device. However, it relies on se_get_mem_pool_buf here, which
> does a standard kernel allocation.
>
> [ ... ]
> > diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele_common.c
> > --- a/drivers/firmware/imx/ele_common.c
> > +++ b/drivers/firmware/imx/ele_common.c
> [ ... ]
> > @@ -342,6 +342,7 @@ int ele_msg_rcv(struct se_if_device_ctx *dev_ctx, struct se_clbk_handle *se_clbk
> >  				if (se_clbk_hdl->rx_msg) {
> >  					/*
> >  					 * The enclave may still DMA into this
> >  					 * buffer (either a normal timeout or
> >  					 * a teardown complete_all() wakeup).
> >  					 * Quarantine the buffer and arm the
> >  					 * circuit breaker unconditionally.
> >  					 */
> >  					se_clbk_hdl->rx_msg = NULL;
> >  					se_mark_fw_busy(dev_ctx);
> >  				}
> >  				spin_unlock_irqrestore(&se_clbk_hdl->clbk_rx_lock, flags);
> >  			}
> >  			break;
>
> [Severity: High]
> Does this instantly abort the wait and arm the circuit breaker if a fatal
> signal like SIGKILL is pending?
>
> By breaking out early, it immediately marks the firmware as busy.
>
> [ ... ]
> > diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctrl.c
> > --- a/drivers/firmware/imx/se_ctrl.c
> > +++ b/drivers/firmware/imx/se_ctrl.c
> [ ... ]
> > @@ -406,6 +406,12 @@ static void cleanup_se_shared_mem(struct se_if_device_ctx *dev_ctx, bool recla
> >  	if (free_dma_buf) {
> >  		dma_free_coherent(priv->dev, MAX_DATA_SIZE_PER_USER,
> >  				  se_shared_mem_mgmt->non_secure_mem.ptr,
> >  				  se_shared_mem_mgmt->non_secure_mem.dma_addr);
> >  	}
> >
> >  	/*
> >  	 * Drop the host-side tracking unconditionally. On the reclaim path the
> >  	 * buffer has been freed. On the deliberate-leak path the buffer is
> >  	 * abandoned on purpose, so clearing the pointer here guarantees a later
> >  	 * cleanup pass (e.g. se_if_priv_release()) cannot double-free it.
> >  	 */
> >  	se_shared_mem_mgmt->non_secure_mem.ptr = NULL;
> >  	se_shared_mem_mgmt->non_secure_mem.dma_addr = 0;
> >  	se_shared_mem_mgmt->non_secure_mem.size = 0;
>
> [Severity: High]
> Are we unconditionally destroying the DMA buffer state here?
>
> Even when reclaim is false, the size and pointers are zeroed out.
> If this is called for priv_dev_ctx (which has no open/close cycle to
> reallocate it), the persistent DMA buffer becomes permanently unusable.
>
> [ ... ]
> > @@ -1149,6 +1149,7 @@ static void se_clear_fw_busy(struct se_if_priv *priv)
> >  			/*
> >  			 * Late response arrived after going_away is clear.
> >  			 * fw_busy has already been cleared atomically above;
> >  			 * reclaim the shared-memory slot now. For priv_dev_ctx
> >  			 * this is the only reclaim site (no close() path). For
> >  			 * userspace contexts cleanup_se_shared_mem() is a
> >  			 * safe no-op if the close() path already reset pos.
> >  			 */
> >  			cleanup_se_shared_mem(dev_ctx, true);
>
> [Severity: High]
> Can this permanently break internal firmware communications for priv_dev_ctx?
>
> If an internal command times out, priv_dev_ctx is set as the busy context.
> When a late response arrives, se_clear_fw_busy runs and calls
> cleanup_se_shared_mem with reclaim=true.
>
> Because cleanup_se_shared_mem zeros out the DMA pointer and size, the
> permanent DMA buffer used by priv_dev_ctx is destroyed, breaking subsequent
> operations like system suspend or firmware loading.
>
> [ ... ]
> > @@ -1331,6 +1331,10 @@ static void cleanup_dev_ctx(struct se_if_device_ctx *dev_ctx, bool is_fclose)
> >  				struct se_if_device_ctx *tx_ctx = is_fclose ? dev_ctx :
> >  							dev_ctx->priv->priv_dev_ctx;
> >
> >  				if (dev_ctx->strg_hdl && se_close_storage(tx_ctx,
> >  									  dev_ctx->strg_hdl))
> >  					dev_err(dev_ctx->priv->dev, "failed to close storage.\n");
> >  				if (dev_ctx->sess_hdl && se_close_session(tx_ctx,
> >  									  dev_ctx->sess_hdl))
> >  					dev_err(dev_ctx->priv->dev, "failed to close session.\n");
>
> [Severity: High]
> Will this skip sending the session close command and leak the firmware session
> handle if the killable wait aborted instantly above?
>
> Because ele_msg_send_rcv returns -EBUSY immediately if the circuit breaker
> was armed by a SIGKILL interrupt, se_close_storage fails instantly. The
> subsequent call to se_close_session is then also skipped due to the busy
> firmware path.
>
> An unprivileged user could trigger this leak by opening a session and
> sending SIGKILL to their own process, permanently exhausting hardware enclave
> resources.
>
> [ ... ]
> > @@ -2145,6 +2145,8 @@ int se_get_mem_pool_buf(struct se_if_device_ctx *dev_ctx, void **buf,
> >  	if (se_is_fw_busy_ctx(dev_ctx))
> >  		return -EBUSY;
> >
> >  	b_desc = kzalloc_obj(*b_desc);
> >  	if (!b_desc)
> >  		return -ENOMEM;
>
> [Severity: High]
> Does this kzalloc_obj allocation violate the GFP_NOIO context required by
> ele_get_info during suspend?
>
> The kzalloc_obj macro implicitly uses GFP_KERNEL, which can trigger direct
> memory reclaim. Since the storage device may already be suspended, flushing
> dirty pages to it will lead to an unrecoverable system deadlock.

In suspend function, call pair.

memalloc_noio_save() / memalloc_noio_restore() can fix this problem

Frank

>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260904-imx-se-if-v48-0-dad90eec7eaf@nxp.com?part=5
