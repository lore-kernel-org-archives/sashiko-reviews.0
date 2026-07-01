Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013023.outbound.protection.outlook.com [40.107.159.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF41330D35
	for <sashiko-reviews@lists.linux.dev>; Wed,  1 Jul 2026 18:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782931091; cv=fail; b=Ze09T0ItUAC8+ATy3aHH85J+Nh478TSfCJ/f6Acda0ZKtCo3F9xmpTZS93qDRx1mARy1NR0+wFwJ3g3XTgE7K9d3kUvQpehAJhA3yAqFqRcdQ+JIa2K2m2sMgZeTFeSt8qhy9galh4ZRuqOr31iXrYqveLfTYKBhe83bMZPC8OI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782931091; c=relaxed/simple;
	bh=YS/bIBxQ3OtTNeXao7PUoPi4dURrRRWKSH5fINl50Xk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cFU9SAfPnxU/jdg8AJYROIZoRUPJC0qlnw3I8LdBHKIhthTHT7qxIhK+tLGQxZpsGUMQ9APceyvmAoefjdase2U89slcMx4Hc/xw6NJVZKDc7AEzIeAx6ThBemBVUMT6xKphClAW3DQuB3alxU7nbrRno8+OBozWtFmVYvE4Obo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=iL3wNyRU reason="signature verification failed"; arc=fail smtp.client-ip=40.107.159.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="iL3wNyRU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7arJSSQ8ihpKamFdlk7b8vW6yK1Sx4jk0hDClOvd/KmhDWYJeXOc1l5p5gDUa04qpl9yh65oJQjutoWy7vAz2HSibVpAHJMp9Q1mKm4Ui4AbdUpT38xqKDNrXzQWU+1a2cvmkkPP42EQndZAj34fWoEp+FAiNypJ+W19Cs3NnFUl85vNfRgj14/vhiZNcPxWvq3tyTYsv3ybRRIbXGGAozmPgZ59r/5tp4DbK74xexbSKg8LZ1X6k/HxhVnsCjFPMhJKX5aIQzYD76ibkoe1cPpRuC9F1np7N7JUYWIUe+Us+FZgO4aLRET45GppDbZQkivNf3HSrKYucBCR8c7Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UpHhaRYoae4/IdeHFC/HXvaYMZ+S4NysG9JGqY5VAiU=;
 b=qAsU49pf0HvhO2PEhunU+Na1Hzp4GnYX6SQnMPwnrlevOYDZI29lGAzBVmFoCf/7lmfzflqOaAzbEA1FXQlNDAS1/ENi7dlPC1IpLXIPB5u/xb93fdfOF/LWBUkiPxuNpCYl2/+G/N+BwoT2kGN1Rt99+dYOqSqAgPXmeh7s/xo+0XE6HrJL/RHDQGfmDxHhBvR+PqRRhwKV3WlTVLuPl52Kh+dZrKpROTdX6o1Ha5zbtm+sjCudkQ1XZlrNNmY+aknQmgL1fmyylbJ7p99z6Wn4UokBXSCl/OlX1HlzZIxu6C2rhI0OP1broJCer7pDKXXAh+V1TmwDDl4j0KbmUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UpHhaRYoae4/IdeHFC/HXvaYMZ+S4NysG9JGqY5VAiU=;
 b=iL3wNyRUSjklOvKDqURuorIfTpNwblOcwaV9Dp5uxiy3NxfdLPf5pLdFIOCL+PDVSkrR+8bLd5xwGMkYisEOXwyj69rqfvWrdE7JPosd2500/vJe4oERH4jOWnk1LIbevuCCBzcawQq7TqdWW4fJZLwnT3lhnFce9I08bBptNPY1VCxCsQNfiAq8+Qxk4BQnDBvB6OvrmDrKViWOojWqpxNcnTpxfw8bK8vF4oJD2AZ0MQlQLoP9cYVEib9tfVT7Ts4bCAgxict8M4xUozzfT+fPX/YSVYvK2zx1ReNiU3ihfca60RRwR1TroqYFWBFRzhSsTMPocvXkiH2kX8b0Aw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB9359.eurprd04.prod.outlook.com (2603:10a6:20b:4db::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Wed, 1 Jul 2026
 18:38:02 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 1 Jul 2026
 18:38:02 +0000
Date: Wed, 1 Jul 2026 14:37:56 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>, robh@kernel.org,
	Frank.Li@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v13 1/7] i3c: master: Add APIs for I3C hub support
Message-ID: <akVehNW1cF9qu43p@lizhi-Precision-Tower-5810>
References: <20260701065755.2067793-1-lakshay.piplani@nxp.com>
 <20260701065755.2067793-2-lakshay.piplani@nxp.com>
 <20260701072230.F06F81F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701072230.F06F81F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA0PR11CA0115.namprd11.prod.outlook.com
 (2603:10b6:806:d1::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB9359:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f8d5201-cd8b-4592-daf8-08ded79fe20b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|376014|366016|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info:
	XTH5uUL6TjEh+XItp4ytOXGx4tV6JD/K6ktB2XzmuQ97F0r/R4f7OOUJeVVB6nxz1TEYwSwC+zglha9GYxxOL2uhP1PMGsEIAMNKMk5g9AvAGdIOqvqqOauBQDMDMsIjlDaQEuiw6Lsr6PGcc7V1NM4R+O5lEBh/homxZ4khNMJY5MFzrpaEFZM+5M7apM2z5JPe8SlOc8dSUb/J4DJofGijrBwj+JbOL6WCX1OgipXlJKJISuilPWq1IGG/e5GAyq2bP+vqoQTICx8F2D7MQi+DbP+M4xi1PQOa8ttaE1/+Ndf5k7VgB4hwyZGs0PtWzr573uyeLZLk4YWP0ykqZEsGeU4QW+ldmUeSrwR1hwu2mo9FH5Vg8LlDTN878kBEFVuzf2Or2edZUO5igfZqtV/KvygSPmzxM+HZ41VNdmJ+Ln4H1sj9GE9CS7PBuiJEdGVi9Eku6sNyTVwIUG9cjLMqTlB2MsLQ/GrZTDfRwL7dI7HYeR/iu9be4BmKk44KM7+gblNUfuk63yL+CE2qWqtyu2FBTdDkztf1O9aTxYJ4VZ7P6wLRtz3o3sa1DTnhWTZBc4vAlJGTAVeKj0XSeGRSpvytY0R5uctm+4A09Ds=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(376014)(366016)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?oRrO42gACEdThRmAKSfcytcpINXq6WudXB+kGXcTTPDnHGDeIK/F3juUiL?=
 =?iso-8859-1?Q?w1bomw4Qtp5X2P2diEFPUfmSjHONOaM7A3Rq9NmCpPq4dob05wR3e1/VCj?=
 =?iso-8859-1?Q?QUtpqabwmIFO2it7aX4HMboPRysK1b2+tJxItnBEt0giOZ4O2MCnvFZE6u?=
 =?iso-8859-1?Q?3n0n5weOJ6Ab73axY8bjppdgjLdHdeTTAKVLf6bm995UWCXpj9Rhdz9dM+?=
 =?iso-8859-1?Q?2yqaEOZq36KSEKE3uZstdg1OfswEcb4mF6AFKPHY5Lh4fOIQYKrP+tAkvj?=
 =?iso-8859-1?Q?njTtTLXV46+l4nn+IJ8/cOV6Jf65QrTD5UooJp9XyPZWucrIFVxolTS5lr?=
 =?iso-8859-1?Q?0L6dPWnj6sNwgo46YKyfL25II3PZH0j1zuu7YbMyJJNA1g6RPiSsXN8VJQ?=
 =?iso-8859-1?Q?glZf1vaUOd6BwQn1DAl+tZ8zguhG3144qQBJus9xZvLRzJHL2DAOqzwPfn?=
 =?iso-8859-1?Q?SJQRIUNdV3za54IArUg27X1tn1USwmFFz9vrYEcxdPyvFEsOKKJLLzI9jn?=
 =?iso-8859-1?Q?D3Pf9qrwDTLBH16/OCMrk17SwjVyOV/+jwo5i82LA/5AsJT0zYHrGscpFj?=
 =?iso-8859-1?Q?HYtqBK61DDjBarqiuZodKCV9WLe8fhGuhGlz0LDVELYNuRdtFB1T4MHX1V?=
 =?iso-8859-1?Q?CnUVsdUSTutSYZoR8wHvrkiCm71ZCm3BxZHEfQEDW7Xxb15IYAzaQEX7s9?=
 =?iso-8859-1?Q?X90sn4RB19hYvSVEU+WJum1TNFiIYcq+OpqEXanklpUGwG3I3LWM6b56sw?=
 =?iso-8859-1?Q?SiOK10wJ5IoZP4aLqym4FTVldLJ+cw8OLKPRZNQhkRb5cqkDM9hG9rB9Ta?=
 =?iso-8859-1?Q?EuCWcu1HVbYX2zVST7eCBQG72QScuI//o26gpQu2dubLqNWKoKzDCFow7H?=
 =?iso-8859-1?Q?WaUPtoC0FpJj0EX3MbkO3vKmIWCLFb2WzNLV7O9sRUZrV5+FT9fVpuZViT?=
 =?iso-8859-1?Q?QfKCGvPlZdxaYqcrChvz/tGzqdb/oFK+wVK1V98N+ki/yOfYCeTITtpp+H?=
 =?iso-8859-1?Q?b+we81OPSL3A9XXH9QiU2Dqb57KmlPl7iICrLYbpKUIwQzMo1ElCyvd7y1?=
 =?iso-8859-1?Q?wghb5cbKZPDb+AAw+4VUVW7gsBrW3si0FTaXEYkXt1CWL9Q/1/iay7s626?=
 =?iso-8859-1?Q?e/N3IwuVc9DTdKBc5ZVeXxGMYFBP2K3fG+7GfXdTROpxvuf3R16Pf2AjMr?=
 =?iso-8859-1?Q?OOfZ3j/I0+ybrpAA2W7s4rKwSp2PKyImYkpmxNdmW5e5ygofq5jnD9UavM?=
 =?iso-8859-1?Q?IXJQh/yjq75SJsH8rVX7kB8ALwtaGOIR/xPhNIGvzQy4MPHlr3X72DYfCH?=
 =?iso-8859-1?Q?xgVWmBk0O+ELtP3dKme60j5XAW/U/gr0tGuNNOOmiSLjqfu41M2GluJn9M?=
 =?iso-8859-1?Q?RXexQ2dl4JpvJdt8kzluliQb2GOTafuz3X8ODoOkErL1tQ7eoJZ0Tk4NX0?=
 =?iso-8859-1?Q?7xQzTKJ//op0BuPzq3hNaUFdLmg1pk8pgCzWUqDBJVGcCn6Ouuyec28LOA?=
 =?iso-8859-1?Q?EVhvbVB03piNZsw38zDRageCelhlsW8qRVmUnuFOLPkYdfMY+BPBrVIRi4?=
 =?iso-8859-1?Q?DCsf0h3oT+wdHMewTLR2WPFI2jalIrVQ7J/Nezn+P3tQZuxqFqUcA/tFh8?=
 =?iso-8859-1?Q?JvREZCvTISiRuFc0rmEsOhdqB2lbRYj/l20n+fpHYxltpYBZMffS2tzL6U?=
 =?iso-8859-1?Q?Es4gYC1T4eme4IVgT8okj2BTZIvRQqfKpNwUaglCywDHQrrHZvxeZcQap7?=
 =?iso-8859-1?Q?YzBjxIxxioLELD3zplZAucVwhfdbwRyxbvVQkgjp0mwu/9r5v/W0xjpw+x?=
 =?iso-8859-1?Q?14DP+Ctd+KytnLPbqkd3lY+WajSNk+kCbmQ7CBBwP7Am9ldPH6NO?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f8d5201-cd8b-4592-daf8-08ded79fe20b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2026 18:38:02.7238
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lfZggIVfl8vkdoaQVoaqImvIuEawHpLgzNUT6gcogvszZ/0gga0EQ3HzC9BeOR1RKx4ymQrUMHactxqaNNDOBeAmV+0VedraWZA9phgXAhPs8AdSAfYqFVtpdG1AcDT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9359

On Wed, Jul 01, 2026 at 07:22:30AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] Exported APIs interact with controller hardware without taking a Runtime PM reference.
> - [Medium] `i3c_master_supports_ccc_cmd` incorrectly returns true for masters that do not implement CCC command sending.
> --
>
> commit b5579dc49beffe04e3498fcfb290372e74bd88f0
> Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> i3c: master: Add APIs for I3C hub support
>
> This commit adds helper functions for attaching and detaching I3C devices,
> checking CCC support, sending CCC commands, and managing address slot states.
> These additions prepare the subsystem for I3C hub support.
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index f1be38a640ca1..3e7b7f7f97cfb 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> [ ... ]
> > @@ -1775,6 +1790,83 @@ static int i3c_master_attach_i3c_dev(struct i3c_master_controller *master,
> >  	return 0;
> >  }
> >
> > +/**
> > + * i3c_master_direct_attach_i3c_dev_locked() - Attach an I3C device to a master
> [ ... ]
> > +int i3c_master_direct_attach_i3c_dev_locked(struct i3c_master_controller *master,
> > +					    struct i3c_dev_desc *dev)
> > +{
> > +	int ret;
> > +
> > +	if (WARN_ON(i3c_dev_get_master(dev) != master))
> > +		return -EINVAL;
> > +
> > +	ret = i3c_master_get_i3c_addrs(dev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/* Do not attach the master device itself. */
> > +	if (master->this != dev && master->ops->attach_i3c_dev) {
> > +		ret = master->ops->attach_i3c_dev(dev);
>
> [Severity: High]
> Should this function call i3c_master_rpm_get() to take a runtime PM
> reference before invoking the controller's attach_i3c_dev callback?
>
> Since the I3C subsystem sets pm_suspend_ignore_children(&master->dev, true),
> maintaining an active runtime PM reference on the hub device does not
> automatically resume the parent controller. If an I3C hub calls this on a
> parent master that is runtime suspended, accessing the hardware registers
> could lead to bus faults or hangs.
>
> > +		if (ret) {
> > +			i3c_master_put_i3c_addrs(dev);
> > +			return ret;
> > +		}
> > +	}
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_direct_attach_i3c_dev_locked);
> > +
> > +/**
> > + * i3c_master_direct_detach_i3c_dev_locked() - Detach an I3C device from a master
> [ ... ]
> > +void i3c_master_direct_detach_i3c_dev_locked(struct i3c_dev_desc *dev)
> > +{
> > +	struct i3c_master_controller *master = i3c_dev_get_master(dev);
> > +
> > +	/*
> > +	 * We don't attach devices to the controller until they are
> > +	 * addressable on the bus, so skip detach for unaddressed devices.
> > +	 */
> > +	if (!dev->info.static_addr && !dev->info.dyn_addr)
> > +		return;
> > +
> > +	/* Do not detach the master device itself. */
> > +	if (master->this != dev && master->ops->detach_i3c_dev)
> > +		master->ops->detach_i3c_dev(dev);
>
> [Severity: High]
> Similar to the attach path, does this detach callback require the parent
> master to be resumed?
>
> If the parent controller is runtime suspended, invoking detach_i3c_dev
> without first taking a runtime PM reference might access suspended hardware.
>
> > +
> > +	dev->common.master_priv = NULL;
> > +	i3c_master_put_i3c_addrs(dev);
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_direct_detach_i3c_dev_locked);
> [ ... ]
> > @@ -2548,6 +2640,50 @@ static void i3c_master_reconcile_dyn_addrs(struct i3c_master_controller *master)
> >  	}
> >  }
> >
> > +/**
> > + * i3c_master_supports_ccc_cmd() - check CCC command support
> [ ... ]
> > +bool i3c_master_supports_ccc_cmd(struct i3c_master_controller *master,
> > +				 const struct i3c_ccc_cmd *cmd)
> > +{
> > +	if (!master || !cmd)
> > +		return false;
> > +
> > +	if (!master->ops->supports_ccc_cmd)
> > +		return true;
>
> [Severity: Medium]
> Is it safe to default to true without verifying that the controller
> actually implements master->ops->send_ccc_cmd?
>
> If a controller lacks send_ccc_cmd, it does not support sending any CCC
> commands. The core will return -EOPNOTSUPP in i3c_master_send_ccc_cmd_locked(),
> but returning true here might cause a hub controller to falsely advertise
> CCC support for its downstream devices.
>
> > +
> > +	return master->ops->supports_ccc_cmd(master, cmd);
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_supports_ccc_cmd);
> > +
> > +/**
> > + * i3c_master_send_ccc_cmd() - send a CCC command
> [ ... ]
> > +int i3c_master_send_ccc_cmd(struct i3c_master_controller *master,
> > +			    struct i3c_ccc_cmd *cmd)
> > +{
> > +	int ret;
> > +
> > +	i3c_bus_maintenance_lock(&master->bus);
> > +	ret = i3c_master_send_ccc_cmd_locked(master, cmd);
>
> [Severity: High]
> Does this function need to take a runtime PM reference before calling
> i3c_master_send_ccc_cmd_locked()?
>
> Like the attach/detach helpers, if an I3C hub calls this on a parent master
> that is suspended, this could lead to hardware access while suspended.

This one need fixed. i3c_master_rpm_get() need be called before
i3c_bus_maintenance_lock();

Frank

>
> > +	i3c_bus_maintenance_unlock(&master->bus);
> > +
> > +	return ret;
> > +}
> > +EXPORT_SYMBOL_GPL(i3c_master_send_ccc_cmd);
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260701065755.2067793-1-lakshay.piplani@nxp.com?part=1
