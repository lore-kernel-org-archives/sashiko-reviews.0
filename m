Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013026.outbound.protection.outlook.com [40.107.162.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949603491C9;
	Tue, 18 Aug 2026 20:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787084284; cv=fail; b=D8sb6H2M138x5QfbowWJFKp+KQDvvf1Gv/kZctEqtY8OEqys6zLYJpOMFsh8GzvzBPvBCQanYKMi0fWyMGFAdWnIs5GG8Z+3gaNO9daqOc/4dtIEmLPS2qnFLxb3YB7O3VQPBu9HkFFnQoZ5ZxAjdPIUQMpa/PG751MoEhonDOg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787084284; c=relaxed/simple;
	bh=ihpDNlrf9fowsV8kJrHDzxQcihVKecNv/JxqHk9yErY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=UWJMmVcu3lehWN6llFHeNeRncW4EvptzFsuA+mHfh306CaQCL0hJA7SR3kRw57dWXifabuWsAnnIJYRyNVe/H5RagWQUYxnjvPj53TPN9MxiaGhLWZ140WdD6kEntzFCwD75CyHszo7jYbeF0NSTFBK6OoahDcYoAwTefPrRIgU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=KE3T4Tlp; arc=fail smtp.client-ip=40.107.162.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="KE3T4Tlp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xpjwlRNAcGL6C93mEOKCvOMc7uvqPqS5tOvObk8Vs3dNF7zpQGUmX7tEy39E6hxpOWi8fWXIUSpYiRywSQ8Cz5fd9nakU2q78sOJt4bYK/jC3txlUxlu2rxvr2AHWsCIm0G/ijBpFewRR9wIRWefhJSstqd6/R9yYiKoQ/qgkdQV/G2FNVRJ5p3aNYSDJjp1istx/0YUvCRd1WBTa9oZ2rzFlhGO9fOCtseZAIR6PEHAfIjv9DqCHwWroXc32CMiE/28u+L9IWTR3hTxaMNhFzaCSSFRYDLNvLwSDQwJ6lB3R37F4j1w341rHgT8/wt+qBuOhDktQ2eVdDvsJ8WufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/8ziWZm+K9aw4UShpwT+XUjkekXuGwJDtmAfrSAbNM4=;
 b=Q/g74fRXzPgWYXEdKTlZT6B1ju9dfNS7CJMVM7NkmC6sEi9HOU4FfOixH7S2GD3kak2xc9+HVcXqm6Qw7OFVTdjyx45E46B9KxJREuAbneHc6NHMTsOAqyQABawVwNkgLVx/czfGsi3mqDosXFDuYgmYzCqES/Spc5TPhYH+bpZ7mmq4SaMp7nQ68lESJMdGbxAiUBoaoAF2nSd74618YIzCKUSZ5TMu6E0pJpc2/DRWR5o/ErnHLK3TbrWxfK/S141YSpCswOq8yYtkkU6U0lmn4KREq3+R0aiNJJjVSrnphKoBxlXh8t2eDeUG/4lmBMOm5mhxqGue+G0s29uCnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/8ziWZm+K9aw4UShpwT+XUjkekXuGwJDtmAfrSAbNM4=;
 b=KE3T4TlpC/5Vcd+mOJF3BxvLIHRXIhHm0pCz9ASfyaQRMYCwVaIvKdmOYZGFz821WovfeeKPHCZRO7ABEt1ed+6i8IyCaKCaVInPMdqbqHQuD4Apo3Ohyr4CsCI4JBHsSEMYqJItpErBMsmsnUYmFaPJCgpjF4hxUWn4mucLsoX1r45sOKJ7w/yTXOkE/VYzjdmFiJciiiZOynwZZ3viWeZ0WjLLxy9eMMcVWuEXx8nlPuBcVmc8zo5mS3/o9eXQdxg5Uq4Mkokpfl6LjOpB8y+vEToF4/brYoluolMBifNcdN7Jhn7HQ/0jflwNovV327s94LOFdx3YM51w9cAFsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI2PR04MB10265.eurprd04.prod.outlook.com (2603:10a6:800:221::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Tue, 18 Aug
 2026 20:17:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0339.007; Tue, 18 Aug 2026
 20:17:57 +0000
Date: Tue, 18 Aug 2026 15:17:50 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Frank.Li@kernel.org" <Frank.Li@kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>
Subject: Re: [PATCH v36 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Message-ID: <aoS97oGetJSFW54a@SMW015318>
References: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
 <20260817-imx-se-if-v36-3-45c42847bfd8@oss.nxp.com>
 <20260817084817.DB1BE1F000E9@smtp.kernel.org>
 <aoNVs-TtpfQmR0Au@SMW015318>
 <GV2PR04MB12271D7E7AAD64AE668A673CC95A62@GV2PR04MB12271.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV2PR04MB12271D7E7AAD64AE668A673CC95A62@GV2PR04MB12271.eurprd04.prod.outlook.com>
X-ClientProxiedBy: SA0PR11CA0136.namprd11.prod.outlook.com
 (2603:10b6:806:131::21) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI2PR04MB10265:EE_
X-MS-Office365-Filtering-Correlation-Id: b8677906-d1ba-43c0-50e6-08defd65cb2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|19092799006|366016|1800799024|6133799003|56012099006|10067099003|4143699003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	t9BEl41mo+MUMvw2f5SB5+1BTtRtQ3mg4VXtjJ0DjigxGnzF8NhBWFy9VRsywZKZWCSzEVLYQNS8emPiri3hgvoaDilHRo8+J6bfbWDmpYjJ+w04L9+IeW74R8lMT7g0NwDXyhUQ4hJU00osls8waRH7YchHXx0bo2qSQogySpvllFRV5BiDGQGqOpTWHV71/N4UgzywjLApagmgE0KC68SyiSfIG2pR0esSlTvN7bz1iUrOHATwS2//DXO1W2/j2YMqh8eAytQfeUiFvu+gboP/t6vSZO0qJlsann9gyCw1zsYFc8nsQzvgndO2iSabtI9VyR29tpMawSo/J+g3vNY4MuRFxdYrXwE1u+vzpwUIin4M7VJ/bXyqVg+3UKaGt/VNXlhWp8ll9qdZA4xQw2ymLpEyFFaYYK9Uel7wqIBjG353Y+/fLkEYq1MqR6LK6Vj0y5dOT9sGwtaL/a4vCbsW0yN9QlySenVL+Eksw1CHTe5FqvcFAkM3sihA/f52wFkrRIol1o28uWKOt6HqBq/7we14rh8+/C3xHZB73UAaLshHYyDvOtYE0F/nB04B5YqPA2GjdLk5VXhTEbAW+B86b9kEYhI2PIILQ2dtAYs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(19092799006)(366016)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?wHBmMXPoI8ds08o15IM4i1537ynRSVg9ltIGaTROfYd8gb5X6WMrTNp79CGm?=
 =?us-ascii?Q?mYZzM1KZojWFQ++PLCmyqMySL5nHgQBZqrZWtJNmtQ6LHoTtejAvRvoFrSgo?=
 =?us-ascii?Q?loZrl2MCBUpQpUWzufPWxBnAqiwuq7mDvlfISi6J4osfsg4S9w+WaOGoBlJQ?=
 =?us-ascii?Q?W0M9L6RNI/rrFBDgc/YJKFToQj9pdN+PlhkeS2+W7NE/TjDedzN62mgqkog6?=
 =?us-ascii?Q?re+QYhP4guo8KVJeOCcTR+HdMkEgx4XvwhoIo3xe+TyfD+cMuNxQLdAy9f8p?=
 =?us-ascii?Q?DEAzlgtrwK7UtPaYL+9hxRNOmKlvcYah0i5EDXhxODaAv6y86i9wFkQ/DeZB?=
 =?us-ascii?Q?hfKYRaK7iOL+ZmdTTW0+sYvbMxx+30z1sYr0D+2vPl7b8hUaOMCmux5g3Xuv?=
 =?us-ascii?Q?woOe54beCrHzlUalvEri197Yh09l7729AfRTxxBrxMqseHj41gVVZiDO4lvc?=
 =?us-ascii?Q?oLSNUwK1PpmcxykZVzlTPIFEE/aCsw3yQRGWKpN46eNurls2sOC7p+md+TTI?=
 =?us-ascii?Q?U9tE07nqLl9b01RW64ivbDnxz6Q/zapkQo9mEOtEjwxZc2MyphFdImOspRgV?=
 =?us-ascii?Q?W/ki2mQIeu/mnAw9jhMrEC+PO9HElyYXxqpyyLKyybQeUxsSlzcQPID2EM8E?=
 =?us-ascii?Q?JTbLCleC1ZzQ0OFRiYSVSBC2san01cWB5n5eVcVKqF3QNyjIed3t7adSNfrt?=
 =?us-ascii?Q?H8xEc8/nDfK0NtJ+2J/wTlyztN5q8lMt0dBhM6hLq2FDtqT2djClUxlfv3S3?=
 =?us-ascii?Q?rVLYQBvDvwO4DEMZH4ULgvmaaR3YCi2sJGrmR2WRvKD+3LG46RMY00e21+zs?=
 =?us-ascii?Q?Z9st5XwV0ERZNxJ19pi7Cb5bll6mS1ho3OH8lz3GKQkTBtJki7827gL1sqdY?=
 =?us-ascii?Q?DzTValZnAaGLxpQBDGIXzVMxrtcRa0K/JjlH/YytWUob+UBk5fZd1Re8fUEn?=
 =?us-ascii?Q?6U5XTkW42bzCrhFV+ARdk1S6r093dYHqy+mlJuxfVfx5Bf03jyXgiqb+bZPn?=
 =?us-ascii?Q?nums74OPjQbpSbXvWFktfwRavvsgE2hs1Bl85ofLeWLQ/I0R7GpxUUrCLiP0?=
 =?us-ascii?Q?lTew73QtmwCzuH2obUKGZ2KEjJjA6jyi16MrPLLBhqwmMceDAH/rlJC4Z6OG?=
 =?us-ascii?Q?x1um/2VZbPsYcONTCv5qA0xKeFzJTEofpNY9k1hpOp59B09LMRUUFHy4YQoa?=
 =?us-ascii?Q?pIH4PDgJ8NX3ZE2mEGQ26IajgY6JhKEDime2BYu0rX50tyPO8EsFKlGiYlHL?=
 =?us-ascii?Q?vE26mGJN8yg/gAtgQMeNNNwaWot1J87UPGin5NeY5WwLGFh8ZH+gwpLBvWTV?=
 =?us-ascii?Q?pLkq2PJHDVVduNmGoXetMiwxrDGM6eh9W50VHzyV14Y9cDE8wV4cIfdJ27QU?=
 =?us-ascii?Q?QX6N9E7tDU6doNEcgXpqsYEZouqyelkOeUT2+LvjjTFP0XjExEap+vZ5smRX?=
 =?us-ascii?Q?NvRwJea1d2/AxPnz858yF73KmqCAFk3Pye4ySwHZGFvKiDbNKZKWBkEUxltL?=
 =?us-ascii?Q?lJJHDvuXz1KlR0RXxkFEdWyCoV47Z2Lhde1wliiQlPrXf4VC+aCLhsxfTVvz?=
 =?us-ascii?Q?Nzf9OEtO+MyQZenXupUZIRk9Wiji0dPpx0aw5wIAYlTRQw34bfEaQqhg5oPq?=
 =?us-ascii?Q?DiSDxB9niHsKyeWsrQ6WIZ3sGNDQP6J1NynPmmpKpTOdAiUhpB2ihgyXY6tU?=
 =?us-ascii?Q?JjWJyhD1cmxrkpWWYUVeFbKXHHRB4znYF0AnT4RGH+Apf12qRlkIqf7yOeP+?=
 =?us-ascii?Q?ExxjC5zUW/aoJlvZSlH1r82I3eZ+4VwQk3fU8Ww7TVEvxQvOBDA1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8677906-d1ba-43c0-50e6-08defd65cb2c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2026 20:17:57.8316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I4HrWqe3CBjDXNHX4XjsqlsljarwolCSwQUBKFKu1xybWhxYLdsR6GKJq918vpiWKUJ/tVY0IPz/A0B0mo6bKKbwrea7AjRf3fvdLI51rEndddbiqzbBNUf/lnu41AZ6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10265

On Tue, Aug 18, 2026 at 08:45:26AM +0000, Pankaj Gupta (OSS) wrote:
> > > > +void se_if_rx_callback(struct mbox_client *mbox_cl, void *msg) {
> > > [ ... ]
> > > > + } else if (header->tag == priv->if_defs->rsp_tag) {
> > > [ ... ]
> > > > +         se_clbk_hdl->rx_msg_sz = min(rx_msg_sz, exp_rx_msg_sz);
> > > > +         memcpy(se_clbk_hdl->rx_msg, msg, se_clbk_hdl->rx_msg_sz);
> > >
> > > [Severity: High]
> > > If the mailbox controller driver passes a pointer to a small local
> > > buffer on the IRQ stack for msg, but the untrusted firmware-provided
> > > header->size specifies a large size, does this memcpy() read
> > > out-of-bounds past the msg pointer capacity?
> >
> > Please check this also
> >
> > Frank
> >
>
> Not an issue.
> rx_msg_sz is derived from the firmware-provided header->size field.
> It is safe to use as the source length for the memcpy() calls below
> because the MU mailbox driver (imx-mailbox.c) already validates that
> header->size does not exceed the capacity of its own fixed-size
> priv->msg buffer (sizeof(imx_sc_rpc_msg_max) = 124 bytes for
> i.MX8/i.MX93, sizeof(imx_s4_rpc_msg_max) = 1020 bytes for S4
> variants).  If firmware reports an oversized length the mailbox driver
> returns -EINVAL and never invokes this callback, so rx_msg_sz here is
> always <= the capacity of the msg pointer.  The min() / min_t() calls
> below additionally clamp the copy to the destination buffer size.
>
> >
> > > --
> > > Sashiko AI review *
> > > https://sashiko.dev/#/patchset/20260817-imx-se-if-v36-0-
> > 45c42847bfd8@o
> > > ss.nxp.com?part=3
>
> NXP Confidential

Maybe it is auto added. In public email, can't use tag "NXP Confidential"

Frank
