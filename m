Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013026.outbound.protection.outlook.com [52.101.83.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CA34DEC3F;
	Thu, 17 Sep 2026 19:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789674795; cv=fail; b=Rouk021VvXktzDMcV6kRcKNTt2dNfeiTqnXbwhw6dq0KPruTmyq42dx95GbT3hDRZZX5qkaR/fhjLcHfD3BFhiERrv83mmeVYyCIF1IE08LjGg+oSWcVgY7SK26IMUtXbL+MFT86jE/aiNrrIp+LNv82lRELOjHyTIN0MnoldOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789674795; c=relaxed/simple;
	bh=0njcSBZ3Ixt5lh3K68TZ1OpETh2oy43AQoVEb2czHOc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=cn2lUWGmQeSuVi4pLTmycUJSzGgyZY2TRK4mio+ISIPC2XJKx7gdhBU0Q7sQE+kBQd+yHLYoWQg0IrNiY9CGX4cmin7PZQrMW14H0mxCdyJmuKsCl+iwSDXWsfDGZ4FkvgRWjxmhP1uuZOkELAqfAz4IL/nreFHOxAZwePo/aFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=cFkUbY1w; arc=fail smtp.client-ip=52.101.83.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="cFkUbY1w"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eD2iEFa7x8BgBWPda1SzuHlQVR4t515HaBT90B9N3sQdkCNLJ5VPREEbcho1SeaYU5YncifVeojsJOm0pUiTU+bd+PvuJwY4cKu0UpEB4CoiUhW1mT0IqkYlHXPu3QIMUHN/Jwb55M8zx4/wVDBuXL8lc1wD+4PT62TMQEiw8bbeyrVtIzRyok5Ugoq9UZqvcyaoKzdg1O3x7l0Xa3txD1VrQj1sEejcsu6A1MmttEMFYNhqO+k+QNeL8jLnbQJiINOtcNRjmhzVCl0yHUrqiZrp8aLw7LNLf22ey0UOAyTZMsOYIX7e3RJBY68wjwKLziSirPt8b8OmByMOUgA/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3xvYu5RxZ1YaIkeihH8e4RZ8eBPo/+hwEIdKl5/o6c=;
 b=TlzA2t2kLxB9aQywjtiAYPimgC7uQQ8kHzCRcqNEWla5wsibhnXKxQftes6yXzKW9pRjr86hG+c1nJ3MEEwIWQssqnroveGvCNUpSKBRwXcaOrR2zGQJnuihSIx+f3Rve8c47Plf3zLexJmur6i9y3MJt7tp0ZjCKs1MeNtoJe4klDJjbtXyg1PHRckBD/YeDKay5398M7J++nuJs6Y7Shii2yJg+QCaccCdftBeul4Vu7U5sGXTyzZC0hcQsg2bQCIq/6hri3ui3Zjyuixfjy9ovZjcHjeyjQ5zMxjXgvlNiL5EvkWLkDhzzg37Kzh/a4Swb0/7lmPG8Liw7em/NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3xvYu5RxZ1YaIkeihH8e4RZ8eBPo/+hwEIdKl5/o6c=;
 b=cFkUbY1wmqj68IQ4hmTfkx0vU2qCSi2dNP1GWoaUfmcz1AUFkLNhyvWxi0bze2nq8GZVG7OtK6GFnB1vQNxokETGN3irTxGngXP9CcEnHNLclzfgnAw2hHO/j2iR8jwhm40FHCdvg0axmbL7ZabnXqQJMFNmE2qXXrk05AiFKWcmM75Cj+OsA2zhX2VSkzlaR7L0JA9EmsiNXCKrT0UK/P0994m6Oa+sR+ZmqRsIAkT3rmsbAEAKHACHrzE1iEVtpP1FFuT/iITwLMmlL8YGn3ULmwP6dlOxikgHTDWA+UEocpSI89vGAwY1rioDVjb/O1GIT8vzUyCfgkEHOdXDtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DU2PR04MB9129.eurprd04.prod.outlook.com (2603:10a6:10:2f4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.13; Thu, 17 Sep
 2026 19:53:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Thu, 17 Sep 2026
 19:53:08 +0000
Date: Thu, 17 Sep 2026 14:52:59 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org,
	Frank.Li@kernel.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] arm64: dts: imx8mm-var-dart: add TPM support
Message-ID: <aqxFG-PnA-L1xvo0@SMW015318>
References: <cover.1789659585.git.stefano.r@variscite.com>
 <57aacae2f4f57e877ba32d8082915d6d6bcd3803.1789659585.git.stefano.r@variscite.com>
 <20260917155033.C43521F00899@smtp.kernel.org>
 <aqw2zT8W6EvRroWj@SMW015318>
 <aqw8C2YwvXOcRYPV@Lord-Beerus.station>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqw8C2YwvXOcRYPV@Lord-Beerus.station>
X-ClientProxiedBy: CYXP220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:930:ee::11) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DU2PR04MB9129:EE_
X-MS-Office365-Filtering-Correlation-Id: c59299ce-7fa6-4c3d-ab67-08df14f54ba2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|1800799024|366016|376014|18002099003|22082099003|11063799006|56012099006|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	Rt1RBTlY4w3qZ+ST87TEh+2c4nyfTd7MWy9Znzkg9UYITfIzpon2j/TpgrjW+QEILQ7PCX/s8ORhuYoLeRTFhb0TWd9BZANpam4jMXfn8kYmuYCW/MFUHDba7ZfqUtMBN3KVD0rQJQBuxpxwfrBvXQjZGgaX2xnPGagqZe3tEwvq//1RuWIT0vzXeQ8j0VqRTux+UGyosRT+7TvXtcvDZPor70/ptMYizlStOuP5r1JbPtkm/BbXlFwBGIb44O7OTmo8MuXEZtB/N+hbnv6ccR1fYkR3XNli58M5GAO6ORpQjCSVR3LdfIL5V8NrQKR+Jacc/eTz3pBincI/+ako9EoG71PbehCGtgnNN2ohHNSyiJyTC36memfTjDh+0Ia7YDPhv7n1/C0y6AXQko3Pn2OfT00gT+iZoqDYaPl4bE5NO5cE+Z0cre0zesjJvlq+MtqI48SGoYUKJR4TFkZgGr32W2pOopDBFW87PtY2YW2O27CyxR4VXwU+1bcYjKlYTv6lPafXMlkWoxACW9MBa5aKo7SbPsfSd0a1+x0uj8jw87/HD3Bm/LzwBgd4sL3sqrcHjbmrD34z3LmT3a9yOPB7NFSEZzX1Q3TG0Q8DpQ0iNeyLN8CDLlChIWdq/NSbHoH6qy9Lt4LCNIACDSQVXQv6YYDZYUJu1kivs0DL7Qg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(1800799024)(366016)(376014)(18002099003)(22082099003)(11063799006)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5uYV3vEhnrnNqDExpMWrGn0JXyqfWdIcEnt70XlFDY2a8HC2iSGwSZbAeX66?=
 =?us-ascii?Q?h7X3L2dvk9UW0ORKICwOqVzNbZSaHRiS6bmEN1ogBUVFU7NTS6ArZte3OrWh?=
 =?us-ascii?Q?7jVbse/vCgdEKQ5gKA6CzXObFq1ufZrJwN5JQa2S+26lHsHQkvm7MsrLFXdQ?=
 =?us-ascii?Q?GGsPSeyVQdarMJ7PRBdnZO6FENqmnC4gH0G7qZ6VSi1xNdA1ffM4yB64L1Ih?=
 =?us-ascii?Q?5ma5WykXnk9BeT9+r2WDxxnPf2hrL5ON67oxSH8SkqWrVWVDZvgkEEiy5/1S?=
 =?us-ascii?Q?gszwPnj5m72Nu7hA858rmzPhKkoW4VV9HmwAG6WuxeiJC9+uSqFAEUfAVymp?=
 =?us-ascii?Q?PWTDEWCsXPWmR7ifR0G/KfVd7/rQzhqbJKOyCmHz0b55o7HdnCwCn09/YSQH?=
 =?us-ascii?Q?7c+aTu1uDwoix+90Ty2o/2DeAjOQQoYTkKVNsp0eaw/N8uFvsgEIX95KXZnG?=
 =?us-ascii?Q?k0t3JvHMubH+vUp+YZTkZL6IL0FC2G+arzm3xr9kRk5x6+3o4uqsH3TbyTcD?=
 =?us-ascii?Q?axOSf+XdipsUeQlq3zFNwC96SN/3G5AnHcWmwZ0yhexA89Y1Ak+x7+jn60m4?=
 =?us-ascii?Q?d4/+rqP3x6I5+hMiXgwrludUWSdUY+hFAYrvxmUgFxzw18bZvJx2G9jsrWRu?=
 =?us-ascii?Q?o0gIxYMmdLFMFr/lbYf93yMgrpA3ru8rHKVG3UP4nRGg9M8QAmRijVBysYi+?=
 =?us-ascii?Q?Vo2xnxB5+sXFl+MZeFl1H/nwrwyjMR6JjQIS7r5S5MHzpWyMa8wL4P3rg3AF?=
 =?us-ascii?Q?D0eMlQSFxvP4PXgvaMq+BVnEpShTTzH4B5NgH1fyegPQ5KvOXaAr7LHrIMPH?=
 =?us-ascii?Q?l5Ty9qKHA6see4ujYQuqPY4ObdJHg1BjQYXdVl3bYevWwpUEgy+2wloq7t3b?=
 =?us-ascii?Q?WeJYS+1hh30cdfrlL0j+yByWFKkhXDR9YFSVkwaCUKYq5vGvyv6lIlxiJFXX?=
 =?us-ascii?Q?o0aCHCEFbRor+7xEifFKBjWwqSuPyN/VfG+nLy/IRtSlEaTcvCE9S+/h4Roi?=
 =?us-ascii?Q?8Pdk3Z9Wd+JWRjIS9S6nk0EwGzpBrsnezcS54vXlsgkYVGj3sCZuTEsUXC5B?=
 =?us-ascii?Q?DucytAxuzF0BctKdqLUURgLUubjVIYW6Bdj8XJEzzcvsN+naXhrAP5AdIfeb?=
 =?us-ascii?Q?8UnetHIVvtbAQ8uQOdU8qMJ+BiQIQQx7011YKcj3bJk0Sku2nVpmarXvMZdX?=
 =?us-ascii?Q?eDzW0cYMUct3RX/llRiUCOR/3dn6+4dpBOxLbxYTANYRh02qRRxaI1reI2Ew?=
 =?us-ascii?Q?/ro+Cy7Rd6v2xomWMmqZPXB5NJPc8lAczH0y6N/aDVhexNjb8gZwdhfDCC6d?=
 =?us-ascii?Q?RjNfyLJ9ADTHZCFQNBKP2YE8j/34IonSOLn7BLvbvduTJwnpguEx4v+9IdjA?=
 =?us-ascii?Q?HuvlV95G/1+3cpwxbgnKEUSM7xSkkBzpCU5XDe/+8KE+trKiI6Gw+Q27fKi2?=
 =?us-ascii?Q?Lfbo/XwRDp3TUdeezKyaC2KPdIgqx3Q2bdttm6HhgjmT1tpL2hpDzvM3MQVI?=
 =?us-ascii?Q?4ew7c7ciXumBfWoyjouYjkxcWO2wdhH9P23sVlZbkQ/sxHWQfBlIzpwfSZnP?=
 =?us-ascii?Q?fGmtF4JQHJnBXUulMy2lWwtKBrYMic8YzUIeOAauYJ/Sz0Ssfi1KC+/hPAI/?=
 =?us-ascii?Q?aDOaOQ6l6Ow0yzGwK9f31ZofYqTbjrpNNUPxHMEKSiS3/WeHSVTCcrk9tRrb?=
 =?us-ascii?Q?TWKhMIOycjHcr4GU5v0BHFQIplwWtucSwyRNUNj93FxOPFrw9NPOaWIb4GTh?=
 =?us-ascii?Q?+Qt/h8Z7qICWw6tKfgyuCLm0K6fVQDcXdNQjz+e4ODSvUbOZtSi1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c59299ce-7fa6-4c3d-ab67-08df14f54ba2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 19:53:08.2244
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YMcjKRCm5RRnVSo1jU5VbY7CO8EU3T7KSQKKL4t/Z4EcbBSWMf2MXfqkbu9PwCrEaaMOjVE3sq/QxZe2tXnywB7sKiP56Xjgwh7y8nWb/VgeIO2cjrEGW1McCnjuUHT0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9129

On Thu, Sep 17, 2026 at 09:14:19PM +0200, Stefano Radaelli wrote:
> On Thu, Sep 17, 2026 at 01:51:57PM -0500, Frank Li wrote:
> >
> > tpm_tis_core.c have not parser reset-gpios. ref
> >
> > static int reset_gpio_assert(struct reset_controller_dev *rc, unsigned long id)
> > {
> >         struct reset_gpio_priv *priv = rc_to_reset_gpio(rc);
> >
> >         return gpiod_set_value_cansleep(priv->reset, 1);
> > }
> >
> > suppose it should be GPIO_ACTIVE_LOW to assert reset line
> >
> > Frank
>
> Thanks Frank.
>
> You're right, tpm_tis_i2c currently does not parse a reset control.
> I have proposed a separate patch to add optional reset support using
> the reset framework:
>
> https://patchwork.kernel.org/project/linux-integrity/patch/20260917124211.136221-1-stefano.r@variscite.com/
>
> Also, the reset line is active-low, so you are right, GPIO_ACTIVE_LOW
> is the correct polarity here.
>
> Would you prefer me to send v3 without the TPM DTS patch for now,
> and add it back once the reset support patch has been accepted?

You leave reset-gpios if binding already here. Just need fix GPIO_ACTIVE_LOW

Frank

>
> Best Regards,
> Stefano
