Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.72.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792510228;
	b=vWhRa/YwcL/mXVnLntWXAHs+Ptq07859u6PMZwngkMA8r/hk6z4dGgg9ARiAFUDv8YEB
	 U68pM1qX+L/X2OeZbgli0CBldsVevgFybhEXD9FDlpqBoIxDXr7PnatnpWc2IkyY0rs2w
	 y3MWbVvCa9kyxxGmBs4BcV40W/8Umuwpl/A/VGTynBjf3DNPIVTR2dQVHaPmU0It099TF
	 1nVYnzOiWONvuOYkpruiCrnumx4+95BOFM/eT1dqgi89/UlF00ryxk8GbqMcw5PXFgHKT
	 EnioJOoljVkVzkOJ+Dug5lv536SD2bGhdC0ZxJxPRr3tubEHukQGcMC9OdOVKKMgKrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792510228;
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
	bh=APo8AQc0bcODOfQdD6mw1aGdveRoHQ6faddShXtgXn0=;
	b=EyFJpNFD16edIbOi7rUIZK4RoKjDI2udcUppXxkK95F352njRBREkrxaUjhRrgsLETXj
	 dXfhT3qO++Tlwnu+8N7pXaMPeZzMI0fiUG1NOB8XRphn0gx0sZIVThsPYxhY8Ny2BfMuu
	 XzS1fHtx8VKaymsztqMv6HwgZFUzipuhByeXCcl3bk2GH2XAxzfrdLyzgRfUv/RupXY5d
	 NySrl8wwpvMf8ei8gMtkXFw58XdBhxDif1NFOZeqizaPGHMVIypebBzodYZyobY4/KU6O
	 e+Fug680tpfBT1NqJ4iRoc/A7hNgXBafVzN6S8tnItqRaqx3YjKsCrIFMrzP9XiFHFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bTGjxXbP;
	arc=fail smtp.remote-ip=52.101.72.29
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013029.outbound.protection.outlook.com [52.101.72.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5B3160A2602;
	Tue, 20 Oct 2026 15:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5B3160A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=bTGjxXbP
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LMLTBVTCJZIe+O5lfcDi1lVI0+TNSJD/xIMKtldj9+wCfJrW2quDAgf15xVlgXKWbjgZC0rBfGzMve4SaKVa6KBGR0Ys0J4NoK34wTWT9A9qbTvNpkGw8R/SahDywdND0+AO75yjI80GQ++80uwiTA6ec4YC/8r/l4NiVh4WVmvNnykrjZsGIoVjweyG7RdR1seerUUp6DkcRY+CYccRf7MfS042Zq8sgNM7MsVMgsYNP6Z/ytYey1mtc7oalvhnwKCE9BLdfl/5XVys4FStTJcRcVs5IMY3MsxrG8NsbLaNLfaCCPdHHWuCb5BkfGgGvVevXDa3dE83LuFedb51yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXIKFtrP2PLIcpFr9exXBu18O+/9YwWUg9NcIjULsEA=;
 b=N7/g1KsLmgzhOCS9M0x//Vm/Nox0VQfLPMdQieZ7vKaRxg6bh/sScKGkMLZ5W3Gb0wXO5QhMbnWyU29igILuyHOz3ii+3bwb3sbrSTnHoyMuhaKPQMfpM3kNm/SMs0QZTAyilP5uaNZxyQiYS9etmG74aK1izPZXM566+VcLw2z6HNgt8/0t8BWt2WroMFkvYVnb0ex6EVZlzNpZHGVdj27xnvbnzLsk50MyVByjmwezDwegb2jCVruuR5PxSioEimOm4bIOHJS43TYntO9Wa/8kwL8kf8AMlVCN1GzISHOUzkperXka9IXy9YzD+9ruGyzXKSd7qNghfjisjLRu4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXIKFtrP2PLIcpFr9exXBu18O+/9YwWUg9NcIjULsEA=;
 b=bTGjxXbPR9SJL2/lU1f2Ne2hhcUT8ot6AKtNZj98+04jF43/qC23McG9KhxVhiHcOPSWFaOt2kPXGofm9d4fFdhi65mILhSTHFzy1XJqXuKmiwVqppzR9mRO5ktxb9tb4+e6hDYdsD5AP4bEXQ21gIvnRGtf6m8CIlBWPip3IHIImjXXtoE/sJAFSUHI6LSozSGl5eKVcI4cFRHJczPmlti0q8jgiSmU+ejhd8jn7q0GSWgp3YneqdNDuY5KZ5gWQqkacRYyHwoQUVBXw72yL+iTDmcYSzbKR51/rBQXdShEr7mWetv1tZSsOViHt8K8v19Fk3P7kEogjkZPuReIVg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8924.eurprd04.prod.outlook.com (2603:10a6:20b:40b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 15:30:23 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 15:30:23 +0000
Date: Tue, 20 Oct 2026 10:30:14 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>, imx@lists.linux.dev,
	Frank.Li@kernel.org, media-ci@linuxtv.org
Subject: Re: [PATCH] media: synopsys: dw-mipi-csi2rx: Fix DPHY testclr reset
 sequence
Message-ID: <ateJBnbI91hvj2r6@SMW015318>
References: <20261020-dw-csi2rx-v1-1-c58a2e5cd43d@oss.nxp.com>
 <sashiko-outbox-178465@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-178465@kernel.org>
X-ClientProxiedBy: DM6PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:5:333::32) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8924:EE_
X-MS-Office365-Filtering-Correlation-Id: a2d1bb86-cfba-4432-2e1a-08df2ebf0ee1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|23010399003|19092799006|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	dqjY+MgPcsxXObhI/+FZHlhVi6hvOIbjYleVlWk7tNvePRzldxTXnWgl/LxfxZ2tujG3/tWZ1bq/RWqTb0iox812A/SkNI8T16sVOlPdnA0UbLs9PIcQIhq/YiunAiI2gaiDC08SjWXstb2FlhNcXdnSn/frzFqV5DlfrghCllawqbo9f3+lZzR52nBJtaeNrCg1LVc18mxCVEnN9Gqhi8Fqa36VPTCRFyiOdCx7Kg2hgGDRJSawijMnt1J37vMX6AZXrpLz1Kw+FurZUXMOnM8/8E+judvkmGSsRfAyGqKNSXfgPHaeY8jz89TcMwZxJtu6vaZD1K+rAOUuNvKsfofzkM08usJzWAzBaiKL9FgRcWcQl5xMch1ywy4Ox0bIJm34fcuzAVjoyLmy2FBvQQJ8wmNBGKgrxJrQu1MR4XgPXrBGR3nbPEsairbMffAHSSMfiANBlNyNDdMAgknLKJzM6wgFkwG5REW+wRfzlP6yKdt7NX3bB4IU9NpddmnHDA7gJF/j7a0c55mc4bHyhlX06tymXbcpBPjlM28vJZomwZzjNFk5c8HrlGc2JfGe4P00niULfqacfwH/n+3MQiz/DEHcKH1arIwRIyk2s8E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(19092799006)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?x3Y3MDioGuiY5uLXuZvriIohRiWX6DZ/TPK1hQ7z2V/MJ8mgPpcs4iGVbf?=
 =?iso-8859-1?Q?vjOxDgMcBizAswv9YDAt7s4WFlP5tw0tunRVGefj9aWLaMRVQ0EX7T0nQg?=
 =?iso-8859-1?Q?3GzKZ7gSNbLuVExtfW2CeDi6WD/ZGNA017AUH7ChAaRG/1znECTpJCH/Rs?=
 =?iso-8859-1?Q?DsyvIbAR5uC/OET+SRPkX/i0YJU+RAnAZ92OdbQzAUN6blrwcku1m2BaOY?=
 =?iso-8859-1?Q?1kqHz+5jBkFFFtSn7RDBrtQG1/bTEK1oDG0FbNOFUQ++fCRAroLq+hqqzE?=
 =?iso-8859-1?Q?iDlYTBPm/7SPLdGUVrBNMm+B/Y5Ef7YbQ20Ww+U1d7FP3CjPcIZnc/94T3?=
 =?iso-8859-1?Q?r74KhVh73IJikl/TyOpJvTbEBrt8zxk7LXqY12D99m/3E9jQTEY0XKyZRk?=
 =?iso-8859-1?Q?RtDg3NgD1fbV435vz0SlrRlMEAQmi+ZemxKkR+/3wAPE0OpJX/on+Z5Rpb?=
 =?iso-8859-1?Q?aC74pW7rNRgxefVae6RC1VGe+3ursWjMEH/z1UgNVxEOUIVoTR3WQhcQfD?=
 =?iso-8859-1?Q?mZiyhxWA5i8lJEq5O5rDAhZWFlWJUDwi8+dGEbcnD5x0P597HrALzSns38?=
 =?iso-8859-1?Q?Hy0anuMurL2WdoQrMiDgBoW/nuCZM22Y24UUrASIfVoQXRkTWQdKaw7lIE?=
 =?iso-8859-1?Q?x7vfQHNa8gWBjE+qu66SDJ6HpHV9WzufxlbmtN6LTdo6m3ctorUxjauhoH?=
 =?iso-8859-1?Q?UqCABNx1AQw3TyV1Qe0lZfhKBAHSYPmW/MILPwzgMMutj+sdAV6AmeJ4uJ?=
 =?iso-8859-1?Q?JpjDICXV/Sbx32QYHPZqatZ3dqT1p3tbcwUwVw+DbEQD1tfgp0jcb9oxvb?=
 =?iso-8859-1?Q?xkREbnAe8FOeoCjM8GaouXC7vjbLL7PtFRHivPiUF03+G4PiVxpCWIjS/F?=
 =?iso-8859-1?Q?ETRH11n5BNKfJtXUDWJqEStLFz4yKUdpY6LMpp1eM+BREcbD12QBc8qKt5?=
 =?iso-8859-1?Q?5iZzPwhCyJi5fr/YQnCH31Bc/8XPeekLGFbNoUgjCI5LIjDCl+NrO5cQFV?=
 =?iso-8859-1?Q?tlMTiXeuI0hxgU7yOTUeE8LqUmbcwMn8Og4+pk4pgGe6ZTemL2osM/tLv+?=
 =?iso-8859-1?Q?Yo4hlVhq4I/ft4/tuCEJ5JjQtii6nJcDEHg1OVHHFi61hChm4rTxgbjONZ?=
 =?iso-8859-1?Q?pJkhMUhhdrajgVPmOz9BNPDC3kTq1+6Ka+3Nbs98sYlWD0Q35lLnHzG2jB?=
 =?iso-8859-1?Q?3SL37yaK8SrsmU8HSbZPfCAIcLRVxBNQx2ND8m5CJjhUEJu8jGr88VugZr?=
 =?iso-8859-1?Q?zpSIYG82OdL1axW/FGZiSkmAbKHLJ8jwhCXFQ27612XWjp4fzJQMgdpEd8?=
 =?iso-8859-1?Q?iR9+Lp6go8ZqGGpXcSJSW9ZL+wPcT0pQkSFp35z25G8fuUOHZpIXu1Ur6m?=
 =?iso-8859-1?Q?dW3S2cuKAqF9x5Xd2XlJKd717E51gSdNv/CbhwRcJsBwl/olEhEFczIt/a?=
 =?iso-8859-1?Q?qY7RnY3AnalZGntAccJFZ20tgUtSp9O84bhNPi6XJib2idYDzrBYBsbNzB?=
 =?iso-8859-1?Q?frn/gvsND4kNWgozvqyn0FY4dIyxagGHWMQlBuhO7FwDH5sIjEz/7snLbV?=
 =?iso-8859-1?Q?tSiVWcpC6eHgq2g/N5chi+t+T2JDZb0uy7kvuLawyGE57l1rbSo0ADm+/o?=
 =?iso-8859-1?Q?k1dv+uXSEXMBqPi3oCK6HqkDHMTSpOwxcPxKUr6tJZftZgL1yVDN7cqG21?=
 =?iso-8859-1?Q?qZoe9EE1BVDcqaxj6eKGrBwcw23P2EwL+/WPK00+AZd/KqtbjzdgkUJMRN?=
 =?iso-8859-1?Q?52mD6iPprCpjMLFf9RUow3wWZxGmtL2C20NRxFF2WHZezc092XC4XtaUPz?=
 =?iso-8859-1?Q?wF0N5J2n4s1BK6a3homVT74WI2Kh3BVZDSfrArqAvevd6Xx/rZZt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2d1bb86-cfba-4432-2e1a-08df2ebf0ee1
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 15:30:23.5208
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mPGmRIrSlEiap0BfCi7yexWkwI2SKH4XatfI0lYQIKWXSqUpgrrmIpS3Q/cTxMaurx2cfHcnPCcImA7xSOSfx73B+rH2hLzsIh9YAIt94hmdwCLVsvbIftDnMTfZkxGG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8924

On Tue, Oct 20, 2026 at 08:01:00AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] media: missing MMIO flush before ndelay() in imx93_csi2rx_dphy_assert_reset()
> --
>
> commit b3d3c4c8602e49d8fd933f7b1d722f45a1287b01
> Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
>
> media: synopsys: dw-mipi-csi2rx: Fix DPHY testclr reset sequence
>
> This commit updates imx93_csi2rx_dphy_assert_reset() so that the DPHY test
> clear bit is asserted first, held for 15ns, and then deasserted.
>
> > diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> > index b7247d597c9cc..b9f7ba25bd3ba 100644
> > --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> > +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> > @@ -830,18 +830,23 @@ static void imx93_csi2rx_dphy_assert_reset(struct dw_mipi_csi2rx_device *csi2)
> >  {
> >  	u32 val;
> >
> > -	/* Release Synopsys DPHY test codes from reset */
> > +	/* Put PHY in shutdown mode for configuration */
> >  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_DPHY_RSTZ, 0);
> >  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ, 0);
> >
> > +	/*
> > +	 * Apply testclr pulse to load analog programmability defaults
> > +	 * and release the test interface for configuration.
> > +	 */
> >  	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
> > -	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
> > +	val |= DPHY_TEST_CTRL0_TEST_CLR;
> >  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
> >
> > -	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
> >  	/* Wait for at least 15ns */
> >  	ndelay(15);
> > -	val |= DPHY_TEST_CTRL0_TEST_CLR;
> > +
> > +	val = dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0);
> > +	val &= ~DPHY_TEST_CTRL0_TEST_CLR;
> >  	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0, val);
> >  }
>
> [Severity: Medium]
> Should dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_TST_CTRL0) remain before
> ndelay(15) in imx93_csi2rx_dphy_assert_reset()?

Yes, please fix it. ndelay() is not necessary have mmio. So it may not
delay 15ns after value reach hardware.

Frank

>
> When streaming is started via dw_mipi_csi2rx_start() ->
> imx93_csi2rx_dphy_assert_reset(), moving the read of
> DW_MIPI_CSI2RX_PHY_TST_CTRL0 to after ndelay(15) means the posted writel()
> asserting DPHY_TEST_CTRL0_TEST_CLR is no longer flushed to the target
> register before the 15ns CPU delay loop executes.
>
> If that write remains buffered in the interconnect while ndelay(15) runs, the
> subsequent read will flush the assertion and immediately clear and write
> DPHY_TEST_CTRL0_TEST_CLR back without waiting 15ns, which could violate the
> minimum pulse width.
>
> Note that imx93_csi2rx_dphy_deassert_reset() right below this function
> specifically performs a readback before ndelay() for this reason:
>
> 	dw_mipi_csi2rx_write(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ, 0x1);
> 	/*
> 	 * ndelay() is not necessary have MMIO operation, need dummy read to
> 	 * ensure that the write operation above reaches its target.
> 	 */
> 	dw_mipi_csi2rx_read(csi2, DW_MIPI_CSI2RX_PHY_SHUTDOWNZ);
> 	ndelay(5);
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261020-dw-csi2rx-v1-1-c58a2e5cd43d@oss.nxp.com?part=1
