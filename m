Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010014.outbound.protection.outlook.com [52.101.69.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90DD3D813E;
	Tue, 30 Jun 2026 17:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782839204; cv=fail; b=NvXD7mYmoydEcleIHpmZGfLck4oIqksG4G0uJxOmOODSu3PQ3AYBIlxxpieDo3B8nVmGO24YxRhiZReLN4kWjnllJBnL4lnTV4EsYIgvgg5Tb3J4DTvlvE2M4PTI/OpCvCAIdX7/2lY7ZCgCsVMQLdB6MnTxDJmWxpm4r25/oaw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782839204; c=relaxed/simple;
	bh=TWL8Pvxq12i/DxS27qmINebQAn6OtCpKN7rIqvlNe50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=JXF2ZdrksuXJa5ueeHKEx7+tSzoHX9SiHl0x871n70Spn1ekMVEd1LSreVjiW9nHFXf93x+6EcqwbOb4qcVv8JlyLQtqwmlSZp6alJ8A52wJwyKfqX55DMSeNvD7NuQezz+1J3as91Jya4da/3apNwIBcY5Vx58XOKBWoQC+uyQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=b3kY2lmv reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="b3kY2lmv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pknl8efpACyxudI7xiUBDgSH682VU6bHbFVHwXEdbG3QEbJhihsx03uP6QYLOmHqgN8E/LxVdexBMGNUuDhQ3yt64wL0iKB0GBiTy4FAhO3gQphQKd6OGPNdpVE/Ci6sREqgEpXUkKLWa6gmVuTDaR3OBHyk5BUDcMI94FibOqZb3mUw8tKYDS4M2E/jwq9Wz47zaMe8WUBUilEtHzG+8i4xqQq3cd1u64KcGETuqIe1Gaxkqqe/8cqrD3TupWn0dkSPVpK6wlDxFHTeTyoEs8omAUoCkc6MKaXmq77pEbZQbN9nctl3Nt0f/L6CyWxQCYxjOwlnh17jYN5VPOCS2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GY8VZ4B1SXeneZJPYav1vG0vTgOQ1CSZVEzn2m84jys=;
 b=fHiIrkqx0Oi3OxyogTRflXaVKa5rkC6nWzRuDBMMoVCmrkyQGR05JvZsG7a3rl+h95gxygU7G1cuLtaWW4wL4KZum2w7R4dYmNiz5PlTqmGa3mTDD2Efph7JOdvKYgWuBHxqLOAjFRGP5vpt9+n6bW/wbIABU4Ft3wFISnbor0hEfS5OwttwYwJo11wh7eeOEED/FhUAaF7L+536bUQiYBf8t3DjPRyjnZoN7qO8DFVm3282M2bVUlXIt6HG05zXWkcFgGz2tar1APRvgNi1BB3ecOZdHXeGm8nxjQ428sF41Osn6//9bDv+3zEprhBdyYskkhfsgSY2xKOTJuLy/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GY8VZ4B1SXeneZJPYav1vG0vTgOQ1CSZVEzn2m84jys=;
 b=b3kY2lmvB4apdG1QJRbHYzCyCWVMZfeBlh9sirURGSlAZ8fi4oIjIy8Z4loNfVLwy10d/O96AzYxeIcjI+Ptu8JL7cIyV1QjTcmcNbZiI1mGUmvXD6VM6+9jarDkxzV2QXHy/8+AfinsIMz/4kk7Xi9HKSqEhjS70BGfVn8oj8MthMnq+ktGqzl+1fctkK79C6KFM5rcC0hUsH1BhxlRWO1BtYtKt5ywvZ7X+AhJXQRlu2mnQoxucnlEq9WS2K8BFGd15e7WokFAw+n5e4QUt+wn7P3vPBWI/Zi+G3+CnSieRbERNJYWAHmxAMcSiOlvTUF/6RBWCTzRVSMtF/4gPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DUZPR04MB10039.eurprd04.prod.outlook.com (2603:10a6:10:4d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 17:06:39 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Tue, 30 Jun 2026
 17:06:39 +0000
Date: Tue, 30 Jun 2026 13:06:32 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: tze.yee.ng@altera.com, imx@lists.linux.dev, Frank.Li@kernel.org,
	linux-i3c@lists.infradead.org
Subject: Re: [PATCH v4 2/3] i3c: master: dw: Map CCC hardware errors to I3C
 M0/M2
Message-ID: <akP3mEJMkWHycvZr@lizhi-Precision-Tower-5810>
References: <cover.1782824628.git.tze.yee.ng@altera.com>
 <56a59c5ac9a09692f9ac8a74d1d3afdce553a7d1.1782824628.git.tze.yee.ng@altera.com>
 <20260630133239.42C2F1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260630133239.42C2F1F000E9@smtp.kernel.org>
X-ClientProxiedBy: SN7P222CA0018.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::27) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DUZPR04MB10039:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb9f09d-d91a-41c6-66d4-08ded6c9f33c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|19092799006|376014|1800799024|18002099003|22082099003|11063799006|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	HisZH9GGnFcXy3pnQjr1TCwL4LuZugj0xoWOaUFUD+bi/vBeILnuwBvu3I3dLZYf01ua7tJFw2IgEoEWdgU08q5v6nYJAzACXYv4VtVNEpzQ/Jd9uSSA573bjY24E4siG8RPW7w33tManGVtj6tKQQEYySG+agHYxsfyNX1P9P23znoDfWGWkXCrDMkz5yORqYAEEEkSJ49V8/lQnHQeiJ57YTCMYaNy+ojS7HCNNGK0ZK1fJq8fQq5eYNJKMKOeoO6p3Y99KXS76z8DeIoTnQzweUHhzBX8LPWmn1OZi1VfBVodovrOyfOwkNut188PrA8dkNmcZouyUQIb2bUS8vNOBtP+Ym1TbPjibg7cwqTTsD6dQJmOrVRwRpgIhF3dXlRMlaOB1Ax3NdzWxpG5NojYAWGBGrZGIi0+wCrZEwCL3r14kwxAHxSG8mIq0WJHLt2CoV32DJ53ybOy/zPwsWbOjtLWlfRnD0JOG30UaKnzrQEzx1WsVEfkjMjGnQB0d0FUZTmJzAVUu3lNSMNQQH/SimgZszSEolZmLVbSF/h/bYII+kY90Phlj+N1C57TIcyI4xK1kE9vL3G591yY6Nv5cZ7PHKvBwRI/D/O4at8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(19092799006)(376014)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?Ff9MpTvuR5Nz14wevrdNaNrusUl73MY2vOmM5T/o877YbiKLzRTyMvLVZb?=
 =?iso-8859-1?Q?PAPT52rcndzrQMDD+3jl50EkCeOSFJOxMZGguBcSK+cf6p74pKGM0bKOci?=
 =?iso-8859-1?Q?EhvjT3BBJwu5qbl1iZGtl3QzBR/byi4vnTrvIs/IJuqz+OFsZfmtj3sDdK?=
 =?iso-8859-1?Q?ZYMH6eHpOUs6L1cdOmwkj7vFRtC/LPuqrw/GXE38s9LoqxsA/SIRBDZ/O5?=
 =?iso-8859-1?Q?KGyJ+8b5FKN8YY4yNYKFqD5UO0aBGPYF4BQB3ubBT3nQ8w1aPTIcJWrNYy?=
 =?iso-8859-1?Q?DRh8DnKmQUMverfwIOqLuggDm3a6zn0qdm39p9UGyxlp2v+BWoA2B371Ed?=
 =?iso-8859-1?Q?Xbi1gt9Zf7KZ/NKAROG5+apI5pFSNOjcbvSlH0SYMwj8E9syB4GbDbmjbl?=
 =?iso-8859-1?Q?sintP7RDXZoL5QbsHKCejGFDMrz6K2DK3cBbEsDHc5A9lXz9kSjUjjMhD7?=
 =?iso-8859-1?Q?a7VlXpZQDTLhNKFKmd8iR0wWjYaJtBxQ3nAXF818v3HIRGzvmX9hVrvSLp?=
 =?iso-8859-1?Q?gaWCg7Qhw1rH7MXSOQr4s8pu8Jgkl/XDRsu3/xAOM+VsF3Ar1q0mZ7/Ttt?=
 =?iso-8859-1?Q?FrX+HwpS4GyOFDIF/ISR7SklVkMydJG0V4GKF3t9GXUWlw1iroaoaH6COb?=
 =?iso-8859-1?Q?falccwn0ShY73RMbNVKPFJhOG7QWkVEJUkkLA4uBtTjX3SXnwJ66Btkckw?=
 =?iso-8859-1?Q?YvgVqw8QSjLTWLYuvmHUPOYBu7VipjFgx8kX+h15T9XYvQhV1Mm+os+4av?=
 =?iso-8859-1?Q?maKrt4Jhvu/LMfMXE5zQQCAB1x+N/f5N48oOB/DPtLw77QY5yraER9X1Yk?=
 =?iso-8859-1?Q?qWvrYj1HmweOxgdofjEgjmWPyvfU2oZ5O0S99EECp/Y+bFQV/IV/dKh5nV?=
 =?iso-8859-1?Q?Xds16ShVcP+5vYh43sRHsB7mfonxb8bIbN/mUKuyx8HFRN/3O8314cZ3Q1?=
 =?iso-8859-1?Q?i0ziDsAggrq5vrOY7CCIPdr1b4NAsZVggQ0WpXIRpRBFoEnjsDZYeem4h2?=
 =?iso-8859-1?Q?EOmODR1+vwr5QIV83IRTL1uhL819dAaPuru5tVPg0vqd9FqG7zTrBedXMf?=
 =?iso-8859-1?Q?7kfJGIkOezsgPAqj2EOhKb+xMIGDwZBnZio318+zN1CD3n03cCa2NqveF9?=
 =?iso-8859-1?Q?/Hj2/dJ11yfuSNh3PcS1ZB8598uY8iuu6RIlyN9nxOwT6mMCxm79KQfzT7?=
 =?iso-8859-1?Q?2NTsUx4r+Kg2aTSFplG4TUrv2YsWLlzWWLSTcE6nrOGFbIIjD8mwDA2CYH?=
 =?iso-8859-1?Q?YT5rRIFv0BcBJjpZw3/KsjjTsFz8Em99lBCa/3uIhKxH0ks0NJC1WCFWuT?=
 =?iso-8859-1?Q?K0MCqDtcHFIc5XBWkmPpgbuUNO7g64M/sbDjZYpFhTyTJQD1c+qf4B4SDA?=
 =?iso-8859-1?Q?Rm39xo39/zOP6tIoXtDx4MrWH5aqFXHqbSAoXAWs7ZWFnxdlF80FuANqXq?=
 =?iso-8859-1?Q?6mNJqq2Xa4G+9BWHxetwcBFlMyjcVaJkLCKTUyVYUTT18urrq8Ek4Xhlv2?=
 =?iso-8859-1?Q?2XYleK4c9qz2L5KCQf7ZzY/otnlx+kMiTKdcJt4wKm684TlCEP3JcRxepA?=
 =?iso-8859-1?Q?E1UTRc/uF4/xSqmf9WI2QGtvsEn1GETMQQ4IgE1BRAGFUpJhS8LstCo8/z?=
 =?iso-8859-1?Q?NpWhqSHlnkc4nh4TLaAePGzdNMITEWRyOmxzJgAOs2BnpmYWA9UvjoE/08?=
 =?iso-8859-1?Q?/ysa5K0wXhY2d4944H7riWpvSfbzTV5PZLq9AgPs3PDF1bsWFhYtKY77kZ?=
 =?iso-8859-1?Q?1yg14j3aD4gsMTVmPJVLBs4HsBhFVPUfcFZnxkfiMbqo0zMMa+RVprEVc+?=
 =?iso-8859-1?Q?hxKlliBtUJ+tnMVzSWRw//kcuftIAqU10HaPa2iJS11MAAk7f1zg?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb9f09d-d91a-41c6-66d4-08ded6c9f33c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 17:06:39.2577
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QHHk/ZL9mm40HVNa5l8yGFYRvQP1PL8Y2BJUSEzf59TJWa2owxcrb/cd1mAlvO83g7SrKN1pX5+KtaFF3PIry/iDY17/CQ+Jj+PaJl4K5h/Esyich+w6vlONYbyl6yzE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10039

On Tue, Jun 30, 2026 at 01:32:38PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] Undocumented behavioral change and silent bug fix
> --
>
> commit 5afd5fbee8dc926110284bae98310b5970134131
> Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
>
> i3c: master: dw: Map CCC hardware errors to I3C M0/M2
>
> This commit updates the DesignWare I3C master driver to map specific
> response queue errors to standard I3C error codes M0 and M2. It also returns
> -EIO for address NACKs and introduces dw_i3c_ccc_map_err() to centralize
> error mapping.
>
> > diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> > index e659ede79fc03..27d2025fcf041 100644
> > --- a/drivers/i3c/master/dw-i3c-master.c
> > +++ b/drivers/i3c/master/dw-i3c-master.c
>
> [ ... ]
>
> > @@ -743,10 +760,7 @@ static int dw_i3c_ccc_set(struct dw_i3c_master *master,
> >
> >  	ret = xfer->ret;
> >  	cmd = &xfer->cmds[0];
> > -	if (!ret)
> > -		ccc->dests[0].payload.actual_len = cmd->rx_len;
> > -	if (cmd->error == RESPONSE_ERROR_IBA_NACK)
> > -		ccc->err = I3C_ERROR_M2;
> > +	ccc->err = dw_i3c_ccc_map_err(cmd->error);
>
> [Severity: Medium]
> Is this an unrelated bug fix? The commit message mentions mapping hardware
> errors to I3C M0/M2, but it does not mention removing the assignment of
> actual_len from the transmit operation here.

Yes, don't touch .payload.actual_len in this patch


>
> >
> >  	return ret;
> >  }
>
> [ ... ]
>
> > @@ -783,8 +799,10 @@ static int dw_i3c_ccc_get(struct dw_i3c_master *master, struct i3c_ccc_cmd *ccc)
> >  		dw_i3c_master_dequeue_xfer(master, xfer);
> >
> >  	ret = xfer->ret;
> > -	if (xfer->cmds[0].error == RESPONSE_ERROR_IBA_NACK)
> > -		ccc->err = I3C_ERROR_M2;
> > +	cmd = &xfer->cmds[0];
> > +	ccc->err = dw_i3c_ccc_map_err(cmd->error);
> > +	if (!ret)
> > +		ccc->dests[0].payload.actual_len = cmd->rx_len;
>
> [Severity: Medium]
> Does this silently add the actual_len assignment to the receive operation?

The same here.

update actual_len should be new patch.

Frank

>
> Since moving this assignment from dw_i3c_ccc_set() to dw_i3c_ccc_get() is
> not documented in the commit message, should it be split into a separate
> fix or explicitly explained?
>
> >
> >  	return ret;
> >  }
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/cover.1782824628.git.tze.yee.ng@altera.com?part=2
