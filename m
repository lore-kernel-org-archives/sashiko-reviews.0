Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010017.outbound.protection.outlook.com [52.101.69.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A30A43DED9
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 20:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789589011; cv=fail; b=F7tCDaywqQu6iPJZcIDMtDsme50lnmhf9W3AtpSfffVm3CfcgH3HmXY47J5pbHKAKmIm/LeZ0ZKnbAkG7P6Lox3fmj0byNJUEEij9nb1iAr45VmaHMmyMmS7TlWQqo9S3JQIJHSbx+NYz5Ih1MgsKxguEeuIwhuuiTomznYy6vg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789589011; c=relaxed/simple;
	bh=jaeOPbNeZjpjMcjbJID0y7R5hr92Qpc8qRvApZKmKAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fM9iK2jvSKNFcEPLvBTkF9bOVoc6ptNtwyC0KEOgoY6bdx/U8jlnd1k0qK0KYQWMW4EJvQA0PUf25r7tbXOlv+4o+edANSju5XoRsj07/1CyVPa2AggpxCFzRHd2opm1Lgo+G9NMVa4qQSsdfA2suT1eU32zrn1wzYkoaN73ZRA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=fail (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qEgXMoYH reason="signature verification failed"; arc=fail smtp.client-ip=52.101.69.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qEgXMoYH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ecB/8+KcGrp1YxjY5XFpp2ppimXZT+I9uwjjj1UwQmzlTAzkI1iCKeH7msV16M7yl1HX/XiSw5jSSxmsiYSOJa3QEQiQ7CYk92/nUXy7VhMz9QKrqnowKDSLU0mRL+3aUKFUzbswpjNMM1ZeUgHFSGX9MJGy/sLbqJBJR+6ZDmoSBG0IdagKPfsFYIaeXcXSReJwgWT9rl2RjAhF8uFcSviTJmoqcb+/FuB0oRSymd+Vod6OfW6huFq9VEArPiRvAZCCSjgbTAcuPcI8MHk0JRVJ37iXTrBszOXyN8UnJTi+aEXoup44yEQ6wr6oErn2aG2ThKkMjTaGX4CBaJi+JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UIqusawCs1sKnr3/72Wmt5neUBcWbx/owzXueos/p5Q=;
 b=jXAPniVkZpSGE4vj0e1kaB0W6DOiXl0ZrugnMe7PnpUs2oTQ/mbhODDt2Z7L32ZLqmiu3ScNeZRTl9LEyXqZOY7XBFYV5iBj04v2rKrCb1buPnS4KcJYoDgU4VVAGC4dpwUSAQUC5XBhFQ1kS+2sAilWHzXlmMseQw+04Ab1JpemsqNmFGg0Uvfh4Nswv94Na2/DQSTjy6AiUokD/KHELujarxu0wXD31GuzhwKS5+OUr0LxT2+ubmSCfqglh1fN2fgIq97AnXUmI3Vad5nf2jtYTbX8uI+MLTi6Sq5lyUZ2iy66THOfZJCTUk44GYxAq5h0MlaEWXAybwfw60ZjlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UIqusawCs1sKnr3/72Wmt5neUBcWbx/owzXueos/p5Q=;
 b=qEgXMoYHvOAzNFdz794NcABJWuudWcuCYjAtQbQNZRIlnzhyRE+R+m8uYvZyYkA47q/+cyy5Du+kYlRIYc8GbwLNiNMDZNMt84lAsrLFJxDdBBZsilsTP4UbP5q8mzn8oSZCsgSfTMZBmVMyux80rUuijlhCxLMRg+buOOvS0U4DTs5WUz7tbAUa9U+/V/H+AXaQj50C/C7KOk6G1CFQLj1LucfXbHUMXfnCVzZOGjnMdCsTUaN2JYh5MkVVIcGQ4GZwjwq7la873RyOLSF+JGSQ3uhRfYYifD39RdYVVohL00xiuDHz0yd3HOpkkjN0Odihzmd53djV3ygrFoPj+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAWPR04MB9988.eurprd04.prod.outlook.com (2603:10a6:102:38b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Wed, 16 Sep
 2026 20:03:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.012; Wed, 16 Sep 2026
 20:03:10 +0000
Date: Wed, 16 Sep 2026 16:03:03 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Wentao Liang <vulab@iscas.ac.cn>, Frank.Li@kernel.org,
	linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH] i3c: master: Fix of_node reference leak in
 i3c_master_register()
Message-ID: <aqr19zvkGvMqRi2B@lizhi-Precision-Tower-5810>
References: <20260916160358.2081087-1-vulab@iscas.ac.cn>
 <20260916161616.7B6B31F000FF@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260916161616.7B6B31F000FF@smtp.kernel.org>
X-ClientProxiedBy: PH0PR07CA0055.namprd07.prod.outlook.com
 (2603:10b6:510:e::30) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAWPR04MB9988:EE_
X-MS-Office365-Filtering-Correlation-Id: 222c7bca-60fa-453b-d568-08df142d8859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|23010399003|376014|1800799024|366016|56012099006|11063799006|4143699003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	b5xnp4gd0tE82vkEd8I4JLWDE62gQO4fir1J74GPMX0uGiCNR6b26C+hly802cR9Rfn8Io+n61LoZ8zlsCc1GWBIQDQLnRewdbgv2tYatVNRQX/at36jq4i+rM7mcIvGTHjX0uv5h5Hcse5QYne5e6Ntpwp963S1+q7Hl0FhuCgyDY+jSc/sQyq1R5Snrdu/wji7DI5pksLCKTkHXS1Pk/EAxouymYbRTYFyM4fp0FYJvcOWFOMfrd8ykTdTBuCCT/eFCXvJ44hX3pn+N37mUeNRjv55mzHFf96lDc59VO/VJeq1GbZqNbVq21IGytFWmY95o+MdSVOw8RLpQP6PwWSMeDtd4V7CkVX8M74Dbrjon/pyl9YgVyObG1BByh8n7o0DqWKv5eKhJZq8mnbLhbWiULyI96Xkwd03kcHEY9vCjgpJDo6zwxZW4DxjTM8YwvuP6apxs5KpIuxoYbL3eb3xonk39cuuRb7QLz9c9fS0/oEppfXJHIi9vNR48L9R4ykGVPyx2ktEz7LCcklLoVWJIkHLqHvIFGnTr9zazjLfbjoN9SOKAR4heGncO7Xgi8y2YLPaHDKxiY5JnT3mIG7NJJLzuZP7Op7KTRfAkzw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(23010399003)(376014)(1800799024)(366016)(56012099006)(11063799006)(4143699003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?zevB+0WpkBF1c/MIDdzbZNDCkgitqMeIIVlpzyl8mt8r8pmM4Q0UEacRxA?=
 =?iso-8859-1?Q?NoyraI/F3VAcIP8hF6xUsyk4dYYfOkV8ZFMhhV3hC3EiqMl7bCGbyx1EzG?=
 =?iso-8859-1?Q?52S+okUG3vLzA0AhgiAgsUNh3zFasFu3mtpju1DG9o4blVW1LAy/lmgtMI?=
 =?iso-8859-1?Q?FuTzJMKXIUtdntijO8953nno7fMc3qWODq7T9scNENwfH1aoXgVhGQmRnw?=
 =?iso-8859-1?Q?MjEmAnnLpr8KQDJnmO7TGYvm3yuk7HK1NkQ7vPNpYtOn4BUOHxJWV3Zf+Y?=
 =?iso-8859-1?Q?dMJQdJIIO0B+OraXD9uegiHJsPHxJ7hlgtmktGcY+/fL+ydXoArcSKaSp4?=
 =?iso-8859-1?Q?WiSCBrwAaw1M5H45ZPOC+l1MtuZnJUUWsoCBt++jb1jMFwectJTBzBi0AH?=
 =?iso-8859-1?Q?/7vkeeY0sCCF2+ixjigvKOsGjnnmpqmaGleDtxonSzwwI1xa96jyDz7aI2?=
 =?iso-8859-1?Q?nqOlso8SNp2RkaNKpiOEcj2PctQ7LOZshssycFuZVmpiP7a2mLQzZiAZAx?=
 =?iso-8859-1?Q?O6A+ikRflMiBzczDUMmvziqPldIoMOjGjRNjVCOqJ5sYx1ovUtevTK/608?=
 =?iso-8859-1?Q?Aq0PcXdWQjwNE+Oa8mde730wEoqD0mUXcrsxweBg5UoSAYZow7PaYBOQSU?=
 =?iso-8859-1?Q?VywIzQLgusWNnNK3hZ/WvKOMAv7mxrlqEqhXyXQNqQDQmkATxQlMZ2zBkd?=
 =?iso-8859-1?Q?ZYhXAMwWeT15L78Jxm6w4aU90PAlChVBhyMZ847Y4dmIN2TLViHk7sck6s?=
 =?iso-8859-1?Q?XhSYum/JtspKUvsGHSbwZ3kg8loYsYMC2XdKvWcsmAeSKAeZrEMii/5N/j?=
 =?iso-8859-1?Q?tvOFmANQ348ibV8EpwYaJHl6Ye1/pwK2swu+xWSkkR57NjHJn0+CFS7Gz/?=
 =?iso-8859-1?Q?6c8kfEida8R3S24ejGiLzdyf3e6yxcBTqRHvH6cIDtrnd895fWV+H3B8DT?=
 =?iso-8859-1?Q?pBArXoDjldanqvZoAi1kMIJehocXWoXdQwKeBML7nSkS6GMBXKIKZWBk9E?=
 =?iso-8859-1?Q?3uytt9Si2yzqWd3ir0JSlgnS1KGyOVNZvKbODM2dy6W9vmrfO+X6LxU0uC?=
 =?iso-8859-1?Q?0GK6SuhtmCAFLsf2mKiG2RfRWVP6DWwYpu3zsFGV8p235HpLwINVWyzQZd?=
 =?iso-8859-1?Q?ZmY5uZxVYpKqQi/CQtk9i82WTwYB9A1u08N62ws4UT3Ma0+8lZCM4BzWGT?=
 =?iso-8859-1?Q?yQx/43NuPakQl8ZQVmZRTwgMrcrEEDaVp1EDYC2Je0odmnk2ZnCRVJ8MtF?=
 =?iso-8859-1?Q?bcqJEzG+l1LHwJEKTePdYw5miFrGVjRK6BdsIqOcT3D31ZOZYgQ7QHYRY/?=
 =?iso-8859-1?Q?/INtDSY/UfdewgdeIEfRxWPkkmjzBgsXTOXd70tvIpEZEzLCzuVjc0io28?=
 =?iso-8859-1?Q?OT+0X0PIIH8vxj8zs7yiPibnuSp8eETSx1SsXVM9WE+SU3bNzowD7KdF98?=
 =?iso-8859-1?Q?YTKkrN8fL7mzyXLtrTyI3adYMRx6VYoy3mQ2O3D3xEfagO/CamPb1+rSkr?=
 =?iso-8859-1?Q?C4OjoRceW62JahRwvV4w0O1041aedDh5DRpxSOeaydDP162+LCrRwcIYUv?=
 =?iso-8859-1?Q?T5Lc0wg5BxiFWTkgPvoouBfGo3AS+vfo846HIAgF+JLhOzhgJQqwutpB1s?=
 =?iso-8859-1?Q?Mp7SR8b2UU9k/OGQMbDy6qS8SuWRE6d6TlDYwVx4ErPML+LVrOhvScRPTe?=
 =?iso-8859-1?Q?z35XPCYe6aYUqoEVXRJTWhMPHrjK6ZjGIabWn+ewXmiFnK1hkTvY25VxGs?=
 =?iso-8859-1?Q?X8MqVHbR6gZxl2BEjUuHAyMNEIvsIbEEGVzdLwuciy8Pq3h1TsTsnbRLwK?=
 =?iso-8859-1?Q?Gp3aum3f2PQGmcHcl2DQ9JArolsx+3XMevo0edFQ1wBkefnFwz3x?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 222c7bca-60fa-453b-d568-08df142d8859
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 20:03:10.5218
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WlNr3hvvQ4EuGbuQulgvJbufXrIKyoUqB5CpgJlIkkiW1Bem3obbGmX5dusrwFWSvSFPg83QZDKaL0BgAP2LMpepfb8s7ClybIVQ6/3PhhnJxs2jXmGSo+umlcStXUKW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9988

On Wed, Sep 16, 2026 at 04:16:15PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [Medium] i3c: API mismatch in error path leaves fwnode reference leaked on ACPI
> --
>
> commit b1e59a31437144668b1fb151fcdcb4359e796610
> Author: Wentao Liang <vulab@iscas.ac.cn>
>
> i3c: master: Fix of_node reference leak in i3c_master_register()
>
> This commit attempts to fix a node reference leak in the error path of
> i3c_master_register() when i3c_master_rpm_get() fails. It drops the reference
> before device_initialize() is called.
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index afcd7a21a3e66..1909d40387879 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -3685,8 +3685,10 @@ int i3c_master_register(struct i3c_master_controller *master,
> >  	INIT_LIST_HEAD(&master->boardinfo.i3c);
> >
> >  	ret = i3c_master_rpm_get(master);
> > -	if (ret)
> > +	if (ret) {
> > +		of_node_put(master->dev.of_node);
>
> [Severity: Medium]
> Does this code correctly release the fwnode reference on non-DT systems like
> ACPI?
>
> The node for master->dev is acquired earlier in i3c_master_register()
> using the generic fwnode API:
>
> 	device_set_node(&master->dev, fwnode_handle_get(dev_fwnode(parent)));
>
> Since of_node_put() only operates on Open Firmware nodes, won't this result in
> a leaked reference on platforms utilizing ACPI or software nodes?
>
> Should this use fwnode_handle_put(dev_fwnode(&master->dev)) instead, matching
> the cleanup sequence implemented in i3c_masterdev_release()?

Beside this, why other error branch in this function needn't call
fwnode_handle_put()

Frank
>
> >  		return ret;
> > +	}
> >
> >  	device_initialize(&master->dev);
> >
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260916160358.2081087-1-vulab@iscas.ac.cn?part=1
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
