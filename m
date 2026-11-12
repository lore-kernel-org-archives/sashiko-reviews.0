Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=40.107.130.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794503663;
	b=HYC+VyIvEOojruVlNpYQmjfy1EwCjOBccgiEW4sz3HctpuA7NqnSwEZatTBT72OBXq0k
	 V03CUz+Vm7lctMN11MNo2Kmg+DzZNbJwdAbRZgd7JBYjiFRKrf96RQjSz7yiDE5rtQO96
	 13NOMS3o2Oy+YDULr4x15YiwLBgYwvvhPQ8i6p9hA0pgXdObQU0ZdilCFdbG+dw2Gv3QS
	 73Fh84C0arJTM0rS4Ie30+pppmNb7DzEMD9uhhWDcStCx/bcGT+e83y9QaOzpEOIfiNny
	 oqzFDvHx9TvEqwzZ3p+bdNrlNHh33L74kbO9jYPsN5+wC/bo+J1TcCox8TrM1F2P+uw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503663;
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
	bh=mx+pQJtgjfqWcQMJzmxXbQTmJTwTBIc32ZDMMJGEWGQ=;
	b=VrnOLIMAg+klgeRTOhR2gBv7mTZ9sThuMCxZVdVKcAkbXUf3FauZNtPkdhnRnkCVYcNZ
	 z+7JktO85a59ofg310q8mBZelZveSI4woG7nA483ynGDshAa7npCE7DK9GycK+4b0CgR1
	 DNfHMhko50OE5e5Hc04FrSIxFFyFJZW9VjKFj2sX6VrOMz23VRfCZH/YFUAjcxhvNK+Kh
	 22kYvdBIoYN/AsF35jTwRRmNbM2rf/bCqO8R38OjyNLQUzlaWi7MmB71h2YC8f+glkmU0
	 U9exZ0EYEjfZZJp1PgNYgNfGwMiYT7K+Foy+pZmBYdfYffj682DtMEW6kXSjhbW1F8Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="KZlZb/V5";
	arc=fail smtp.remote-ip=40.107.130.51
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011051.outbound.protection.outlook.com [40.107.130.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10BB606A321;
	Thu, 12 Nov 2026 17:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F10BB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KZlZb/V5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wgjV9fiChIAJy43YQIzKgFjUKlxo7PTNHQhzSW/JQp03r06K9rw8hkCxNyw+KPSA2z1i/SIWzYa9wv3t7qfeMzKtSB0mZfrI7pvu2x8nnnvWuy3OCm07WWX68Se4E6XhXt3qc3YLigZzb5LF+mCQGx9QzWx34hLossZ1fpdeCSUgw5SDIDO8F8I8h9AOA6e49o+MmAChLupNoZSyFSHGQNA8xrc7hl81RMDygw2lCFVTNOL/WOUuMy7i4h+IEG/i9fnpDaAHbss+H9PyfzHmxEQGEiOd4lwc8KQy++e1Q2/EjQHSntCh2ddrJrwkiTYyH/6GgymLUmZlJ9M4Kb35bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2VUFLxmPvAf5/3hZ33KIVzzXH9c3+P+DFhIVVIkLc8=;
 b=MpTPBjtdRK+g5M2Uz/QEMr+UkXq6e8e3j4XJhHfzyYQrJpbh8jZfDmoD/LL7TCrnjOU+i0ZV5hByt1U7w0CJ+2iJmO8ZcFkqt006KShalUjsAiaH/CF3k8qH9qSaTopgvdOadT8HxBCGljKGPgkQ8VHd58062u6peBL0ZzEXSBaHcsm620WVQe0/KZHG0TdZWGRDb8yzvCIMC1DmgZQNrYhHozckLawNpQ97gwgK8W4LdaoxJQTq69v1Up3KSC2JTmlrOu2HHMUTkXdrLdm6wORIpPW840KUKHUEjoBCh6iyUPy846HueoA6OSqywFfo5gDrog9D8z+cdQFKqWe1QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2VUFLxmPvAf5/3hZ33KIVzzXH9c3+P+DFhIVVIkLc8=;
 b=KZlZb/V58pniu8jJtOEtZ9VJvMX/KY7j5CGwsG7mlD4wzjv7HBQ16zi0Ds0l9NnNei/CCi2brlPWxjMhf8zeMhVcd9T4Ryx24AdLAEv7CrUlH+NpiggkDU/mkCWiRCYlcx2Cp9hHWYpDVmRkwd9cS1COUEQuqcQfLRKgMuyFkm2SO97786ps1bwNy2tp/x4gUqoKnngWlMMev671SR0SNXiiqxLVdp4PKlz546Zqt6vROVAPvfwXeDaOgsk3A1URZKCltWxLXzFJD4zDZfaJ+zVFALdMj6gym2hnew3nlNw5kvaYNi/nuCDpzkoNs/uQisQcWrZ2qIoX8dTocF4Vqw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by GVXPR04MB12315.eurprd04.prod.outlook.com (2603:10a6:150:31b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 17:14:17 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 17:14:17 +0000
Date: Thu, 12 Nov 2026 12:14:09 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>,
	linux-i3c@lists.infradead.org, mfd@lists.linux.dev,
	Frank.Li@kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, lee@kernel.org
Subject: Re: [PATCH v21 3/4] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Message-ID: <avXz4X9HGmF4ajIj@lizhi-Precision-Tower-5810>
References: <20261112124437.3367252-1-lakshay.piplani@nxp.com>
 <20261112124437.3367252-4-lakshay.piplani@nxp.com>
 <sashiko-outbox-211154@kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-211154@kernel.org>
X-ClientProxiedBy: CY8PR12CA0065.namprd12.prod.outlook.com
 (2603:10b6:930:4c::9) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|GVXPR04MB12315:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e0144ec-d92a-4a3f-a5fe-08df40e06201
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|1800799024|23010399003|376014|366016|22082099003|18002099003|6133799003|11063799006|4143699003|261026140227099003|261028144727099003|261026121527099003|261021121427099003|56012099006|261022105027099003|261009223027099003|261102123227099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	n/XaeFgz5qE3vnylnZnqbRRKgk2mX+gDnQAIF+gbx9sCWq/kST6pn472ZMkNX7DLi1Dvvx/4mTtR6YInsf+0huX4L4KUYRNfPTwUchguwDeR+zn5vRXDFS5jQliH1h5jk5hd1emrzYr4bIPeafanw9AsbvQgkYEBTbAQiciaLB2R2pyce4b6T1NV7yKpmnkg1axvGgcaUg6iCLc2sl8VUffQvGWQwTjvGGRl+FvtWQdmhUBdVj1L58MjqdBSmGTKRlAe3u8ahAFu9FoZGkdeyDUoagDaQEqZ6Yudd3A7ER4hdzPkW85MPDQC1FB0NBsKL4UoQQ5ANwaWAVPr6sjGNiF0LsT7SKPOKkDGKhc/2Ia5jntzfQ/6xfWGXmuE8iwIY6ibKJqdEiANTkdREnn32gowEkSic8aO9q1rDOcuvxRbeqjMTaG5pNl08cM2cXXzF4FscKfA0MZgYPQgLn0T9qDKP+gna2v0mlqx55mlhuQHqADWhSrR/5ZbzKUUuStQ28DQmLP+XxCs0pY/V9p/7+J/hb1e6RjNtFy78sv8z7JCm+Xoeds4Dx8NV00ArCFyxdEyojaNL9ZPEOoof1vqD9Pzl+9NSOasWNpOM8ZOiFA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(23010399003)(376014)(366016)(22082099003)(18002099003)(6133799003)(11063799006)(4143699003)(261026140227099003)(261028144727099003)(261026121527099003)(261021121427099003)(56012099006)(261022105027099003)(261009223027099003)(261102123227099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?LpTkhWh924DmxIg4KbUHe4jeB1jQE1yi859qZVj2Aih4AQuUdW0Mhmp8qq?=
 =?iso-8859-1?Q?jAkrzH9IJawPN+6fUcAqU66fnS94hN7IsN0xcNpewEJmJ8ZyEHoP8jnsym?=
 =?iso-8859-1?Q?UJnBwf28A1YEMlMaH818GWNY6j8/PU77b9rSoFoPPGr78h3wwctgzth/Os?=
 =?iso-8859-1?Q?oUn0fKE8N8umSs2XY5c4Pzv6WgNXLDpYmoNJBRkwANM9x33+eapJRBw0lN?=
 =?iso-8859-1?Q?yiQw8x/IaGPNIrD6xFYMprG0oCP2ZoOtaP3pbs/CYmECmqOt9+EjxfnuOh?=
 =?iso-8859-1?Q?sAM3OFtcKJSaGkhej2vwiBJD6TMl+7uqbxLS1lWodgkbw3NJr7MoAu9Nkv?=
 =?iso-8859-1?Q?4Dii4DFa8Q5cHdvtcYeswmMmP0Kmz4TZ7v/GJaqo4RAp2Fj9JF8RbLl0e8?=
 =?iso-8859-1?Q?vOxI9dCIqiYH7v75iQilpCfFjSfsrT5ArJ/eKIoKdizYjyeQW4wXkD9zCj?=
 =?iso-8859-1?Q?cjX31e0peOhpRdqmrS0cUoXyAoTXHECLI1zjXer3AqOYOQMR3dsUUJYPia?=
 =?iso-8859-1?Q?Jn3E6V0dQ1Dt3sNBHcFC5W4NwAMY80zkE9qjDDmnUp6KFZF4TTrGwtnuBH?=
 =?iso-8859-1?Q?Pd7JfR2Yf/S6myRc7I4xpbXMaJBwMlTeeIehX9YqD/HO6GhZjmhtlujd7I?=
 =?iso-8859-1?Q?0kwL1DqZC9SrVwCwDnT++tDsOVyMEkB8LmU+uGxgwxC96xETov1mj8XV8j?=
 =?iso-8859-1?Q?ytan1Oy82aznPWgiO8711lpN4PcvTuFoArnt7OGnponfBAk4P4BgiIXWRV?=
 =?iso-8859-1?Q?RhxJGRze5PLqwhAuF4IrB52ugpw2YXYxMUfrfdaw3VH6Ot17Ra9Pmfsmdr?=
 =?iso-8859-1?Q?2vFQDbzUmM2SYKwZANhXy4rbNU3ZriejZ/JwXNTXIgKzfIA/KV3POcsCAA?=
 =?iso-8859-1?Q?mL6Fjb0xuA3YPXbi4YAOj3RFfRoqwtPPMuhGw/M1XuUa9NX7+/Ys+o4fRL?=
 =?iso-8859-1?Q?UNKBW/uDMPdhW5C+O33gLQ0GqDDEzHFS8ZK2QOxvOMjsRQ4J4ggaWgbzvr?=
 =?iso-8859-1?Q?G46WktncSk/HtE0cSb9k8G4A2vdIftiRwAco4lc3RkXp28NKBS/wuzrE1S?=
 =?iso-8859-1?Q?YwBZO0SDKo4NUlEw14XjSId0NNOpx5EQc9JqW4THiCxoa1UbYiUrOYWHhu?=
 =?iso-8859-1?Q?z+F3OePjVEdRznS9f5IsNhUsr/UiiJrIQDXh3+Yvj7pXAlPtw23ROfuVkS?=
 =?iso-8859-1?Q?KywsaglncouvbudxgCQI2PrmyXo4pskjXiiPzsEBGBl5hNj4tJ5HalCqVY?=
 =?iso-8859-1?Q?CtnEfBU9CdzSN4GSjfxDIgW7JxqtcL8AV6zcZhgMPVvTN9kd6W7D9nMvNu?=
 =?iso-8859-1?Q?wSVJjEpYYCLsk5ePWAHu25s/pyjawyf9WnNjrs1gyI6/vWjFaVILet8M4T?=
 =?iso-8859-1?Q?uHfoxf/eJuW/lSR3p4FgUG4jIz6XXVU3mNC2e0ALh82N6O0BmRtyAL9iou?=
 =?iso-8859-1?Q?Ce2AIsh8Sbx2DNe8CYo0TLQX8LK6L/5ZJF5Vq+Iq/B8jNo7md35RKlt038?=
 =?iso-8859-1?Q?B/11IDgQ7joNHnzkrvqZ+6MlKRiwkauj6h7bUZcDeTPQZU1kFF7140y7CN?=
 =?iso-8859-1?Q?+2+3vFU6kKCh5JjdPNtNW1Lvqs7SyrMuhzJG3EFBsn9aBT437eM8pB7r7H?=
 =?iso-8859-1?Q?sZwbxwHVuBCnr6Aea3Fdt6RD1eN1+3UMsEE0VyxCt3u50nLK5IqszN5PfM?=
 =?iso-8859-1?Q?TevBh4a3WGUQIJVP0c5+4ofKM4ke+pmwIDgpaa39q2secumikezWeujtLU?=
 =?iso-8859-1?Q?Ye2pT3xyUDuQbyaKde0AmRL/BrH/A85CBzZQU/+zgEtbS02drPaHWMk7J7?=
 =?iso-8859-1?Q?H8U+CF4Vi9Ymg7MHit5x+7d8DVCyvoCeDzsHZ1AXU4Q3O1xwRxmC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e0144ec-d92a-4a3f-a5fe-08df40e06201
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 17:14:17.3275
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fcw305HxRXWPGeAQc6vFVtYRfacuvDCWF47IJR0yxjg8V9genYcofADspTAfbJgXL88k19+UnXuseCzsM5fDxPXWCIsM+OSitNjrx9FCxv80uubsQl/tvWQbSS/bqV86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12315

On Thu, Nov 12, 2026 at 01:15:21PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issues to consider:
> - [High] i3c: hub: p3h2x4x: uninitialized P3H2X4X_TP_NET_CON_CONF breaks
>   port isolation
> - [High] i3c: hub: p3h2x4x: parent DAA reconciler clobbers DT address
>   reservations
> - [High] i3c: hub: p3h2x4x: broken SMBus functionality in
>   p3h2x4x_tp_smbus_funcs()
> - [High] i3c: hub: p3h2x4x: ports disconnected during probe in
>   p3h2x4x_tp_i3c_algo()
> - [Medium] i3c: hub: p3h2x4x: combined transfer check in
>   p3h2x4x_tp_i2c_xfer()
> --
>
> commit 9562a1f0e3515b7b354e8a193339c5c2e1630c85
> Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality
>
> This commit adds the I3C hub driver for the NXP P3H2x4x family, supporting
> downstream target ports configured as virtual I3C buses or SMBus adapters.
>
> > diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
> > new file mode 100644
> > index 0000000000000..a070be32ffed3
> > --- /dev/null
> > +++ b/drivers/i3c/hub/p3h2840_i3c_hub_i3c.c
> > @@ -0,0 +1,162 @@
>
> [ ... ]
>
> > +static void p3h2x4x_hub_enable_port(struct i3c_master_controller *controller)
> > +{
> > +	struct tp_bus *bus = p3h2x4x_bus_from_controller(controller);
> > +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = bus->p3h2x4x_i3c_hub;
> > +
> > +	if (p3h2x4x_i3c_hub->hub_config.tp_config[bus->tp_port].always_enable)
> > +		return;
> > +
> > +	regmap_set_bits(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP_NET_CON_CONF, bus->tp_mask);
> > +}
> > +
> > +static void p3h2x4x_hub_disable_port(struct i3c_master_controller *controller)
> > +{
> > +	struct tp_bus *bus = p3h2x4x_bus_from_controller(controller);
> > +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = bus->p3h2x4x_i3c_hub;
> > +
> > +	if (p3h2x4x_i3c_hub->hub_config.tp_config[bus->tp_port].always_enable)
> > +		return;
> > +
> > +	regmap_clear_bits(p3h2x4x_i3c_hub->regmap, P3H2X4X_TP_NET_CON_CONF, bus->tp_mask);
> > +}
>
> [Severity: High]
> Does leaving P3H2X4X_TP_NET_CON_CONF uninitialized before the registration
> loop break per-port isolation?
>
> p3h2x4x_hub_enable_port() and p3h2x4x_hub_disable_port() only set and clear
> bus->tp_mask, and neither p3h2x4x_configure_tp() nor p3h2x4x_tp_i3c_algo()
> clears P3H2X4X_TP_NET_CON_CONF beforehand or on teardown.  If any bits are
> already set in P3H2X4X_TP_NET_CON_CONF (for example on driver rebind, or on
> P3H2441/P3H2841 where target ports default to connected at power-on),
> multiple ports stay bridged onto the internal network during
> i3c_master_register_fwnode(), exposing other ports' devices to SETDASA and
> ENTDAA meant for a single port.

Suggest disable all port at probe functions.

>
> [ ... ]
>
> > +	for (tp = 0; tp < p3h2x4x->num_target_ports; tp++) {
> > +		if (!p3h2x4x_hub->tp_bus[tp].of_node ||
> > +		    p3h2x4x_hub->hub_config.tp_config[tp].mode != P3H2X4X_TP_MODE_I3C)
> > +			continue;
> > +
> > +		struct i3c_hub_controller *hub_controller =
> > +				&p3h2x4x_hub->tp_bus[tp].hub_controller;
> > +		struct i3c_master_controller *controller = &hub_controller->controller;
> > +
> > +		hub_controller->parent = parent;
> > +		hub_controller->hub = p3h2x4x_hub->hub;
> > +
> > +		dev_set_drvdata(&controller->dev, hub_controller);
> > +
> > +		ret = i3c_hub_reserve_parent_addrslots_from_dt(hub_controller,
> > +							       p3h2x4x_hub->tp_bus[tp].of_node);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	for (tp = 0; tp < p3h2x4x->num_target_ports; tp++) {
> > +		if (!p3h2x4x_hub->tp_bus[tp].of_node ||
> > +		    p3h2x4x_hub->hub_config.tp_config[tp].mode != P3H2X4X_TP_MODE_I3C)
> > +			continue;
> > +
> > +		struct i3c_master_controller *controller =
> > +				&p3h2x4x_hub->tp_bus[tp].hub_controller.controller;
> > +
> > +		ret = i3c_master_register_fwnode(controller,
> > +						 p3h2x4x_hub->dev,
> > +						 of_fwnode_handle(p3h2x4x_hub->tp_bus[tp].of_node),
> > +						 &i3c_hub_master_ops,
> > +						 false);
>
> [Severity: High]
> Won't i3c_master_reconcile_dyn_addrs() on the parent bus clobber the
> reservations made by i3c_hub_reserve_parent_addrslots_from_dt()?

You should set I3C_ADDR_SLOT_EXT_DESIRED status in
i3c_hub_reserve_parent_addrslots_from_dt(), assigned-address should mark
as I3C_ADDR_SLOT_EXT_DESIRED to avoid other i3c device use it.

>
> i3c_hub_reserve_parent_addrslots_from_dt() marks each child's
> assigned-address on parent->bus as I3C_ADDR_SLOT_I3C_DEV without a matching
> descriptor in parent->bus.devs.i3c.  When the first port runs
> i3c_master_register_fwnode() -> ... -> i3c_hub_do_daa() ->
> i3c_master_do_daa(parent), i3c_master_reconcile_dyn_addrs(parent) resets
> every I3C_ADDR_SLOT_I3C_DEV slot not in parent->bus.devs.i3c to
> I3C_ADDR_SLOT_FREE and probes it:
>
> drivers/i3c/master.c:i3c_master_reconcile_dyn_addrs() {
>     ...
> 		if (status != I3C_ADDR_SLOT_I3C_DEV || test_bit(addr, dev_dyn_addrs))
> 			continue;
> 		i3c_bus_set_addr_slot_status(&master->bus, addr, I3C_ADDR_SLOT_FREE);
> 		/* Try to add the device, but probe to see if it is really present */
> 		__i3c_master_add_i3c_dev_locked(master, addr, true);
>     ...
> }
>
> For later ports that are still disconnected, the probe sees no device and
> leaves the slot I3C_ADDR_SLOT_FREE, wiping out their reservations.  For
> devices on the connected port that already got their address via SETDASA on
> controller->bus, the probe succeeds and registers a duplicate i3c_device on
> parent->bus.
>
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret = devm_add_action_or_reset(p3h2x4x_hub->dev,
> > +					       p3h2x4x_unregister_i3c_master,
> > +					       controller);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ntwk_mask |= p3h2x4x_hub->tp_bus[tp].tp_mask;
> > +		p3h2x4x_hub->tp_bus[tp].is_registered = true;
> > +	}
> > +
> > +	/*
> > +	 * Take the routing lock used by the hub callbacks so they cannot
> > +	 * observe always_enable before the route is programmed.
> > +	 */
> > +	mutex_lock(&p3h2x4x_hub->hub->lock);
> > +
> > +	ret = regmap_write(p3h2x4x_hub->regmap,
> > +			   P3H2X4X_TP_NET_CON_CONF, ntwk_mask);
> > +	if (!ret) {
> > +		for (tp = 0; tp < p3h2x4x->num_target_ports; tp++) {
> > +			if (!(ntwk_mask & p3h2x4x_hub->tp_bus[tp].tp_mask))
> > +				continue;
> > +
> > +			p3h2x4x_hub->hub_config.tp_config[tp].always_enable = true;
> > +		}
> > +	}
> > +	mutex_unlock(&p3h2x4x_hub->hub->lock);
>
> [Severity: High]
> Does keeping always_enable false until all ports are registered leave target
> ports disconnected while downstream device drivers probe?

yes,

>
> CPU0                                  kworker (parent->wq)
> p3h2x4x_tp_i3c_algo()
>   i3c_master_register_fwnode()
>     ...
>       i3c_hub_do_daa()
>         i3c_master_do_daa(parent)
>           queue_work(..., &parent->reg_work)
>         i3c_hub_disable_port(controller)
>           regmap_clear_bits(..., tp_mask)
>                                       i3c_master_reg_work_fn()
>                                         device_add(&i3cdev->dev)
>                                           <target driver probe>
>                                             i3c_device_do_priv_xfers()
>                                               <-- port is disconnected
>   /* next port's i3c_master_register_fwnode() */
>   regmap_write(..., P3H2X4X_TP_NET_CON_CONF, ntwk_mask)
>
> Devices discovered via ENTDAA are queued on parent->reg_work and use
> parent->ops directly without calling p3h2x4x_hub_enable_port(), so their
> probes fail if they run before P3H2X4X_TP_NET_CON_CONF is written at the
> end of p3h2x4x_tp_i3c_algo().  Likewise, for statically described devices on
> controller->bus that call i3c_device_enable_ibi() during
> i3c_master_register_fwnode(), i3c_hub_enable_ibi() disconnects the port on
> exit, dropping IBIs until all remaining ports finish registering.
>
> > diff --git a/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> > new file mode 100644
> > index 0000000000000..247d0f4883b7c
> > --- /dev/null
> > +++ b/drivers/i3c/hub/p3h2840_i3c_hub_smbus.c
> > @@ -0,0 +1,352 @@
>
> [ ... ]
>
> > +static s32 p3h2x4x_tp_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
> > +{
> > +	int ret_sum = 0, ret, msg_count;
> > +	u8 rw;
> > +
> > +	struct tp_bus *bus = i2c_get_adapdata(adap);
> > +	struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = bus->p3h2x4x_i3c_hub;
> > +
> > +	guard(mutex)(&p3h2x4x_i3c_hub->etx_mutex);
> > +	guard(mutex)(&bus->port_mutex);
> > +
> > +	for (msg_count = 0; msg_count < num; msg_count++) {
> > +		rw = (msgs[msg_count].flags & I2C_M_RD) ? 1 : 0;
> > +		if (!rw) {
> > +			/* If a write message is immediately followed by a read message to
> > +			 * the same address,  consider combining them into a single transaction.
> > +			 */
> > +			if (msg_count + 1 < num &&
> > +			    msgs[msg_count].addr == msgs[msg_count + 1].addr &&
> > +			    (msgs[msg_count + 1].flags & I2C_M_RD)) {
> > +				if (msgs[msg_count].len + msgs[msg_count + 1].len >
> > +				    P3H2X4X_SMBUS_PAYLOAD_SIZE)
> > +					return -EINVAL;
>
> [Severity: Medium]
> Should this fall back to sending the write and read as separate transactions
> (or set max_comb_1st_msg_len and max_comb_2nd_msg_len in
> p3h2x4x_tp_i2c_quirks) instead of returning -EINVAL?
>
> Because p3h2x4x_tp_i2c_quirks advertises max_read_len = 84 and
> max_write_len = 84 with no combined limit, callers such as regmap-i2c issue

can set such limit to simplify the case?

> a 1- or 2-byte register write followed by an 84-byte read; both messages
> pass i2c_check_for_quirks(), but their sum exceeds
> P3H2X4X_SMBUS_PAYLOAD_SIZE (84) and fails here with -EINVAL.
>
> > +
> > +				rw = 2;
> > +				msg_count += 1;
> > +				ret_sum += 1;
> > +			}
> > +		}
> > +
> > +		ret = p3h2x4x_tp_i2c_xfer_msg(p3h2x4x_i3c_hub,
> > +					      msgs,
> > +					      bus->tp_port,
> > +					      (rw == 2) ? (msg_count - 1) : msg_count,
> > +					       rw);
> > +		if (ret)
> > +			return ret;
> > +
> > +		ret_sum++;
> > +	}
> > +	return ret_sum;
> > +}
> > +
> > +static u32 p3h2x4x_tp_smbus_funcs(struct i2c_adapter *adapter)
> > +{
> > +	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_BLOCK_DATA;
> > +}
>
> [Severity: High]
> Does advertising I2C_FUNC_SMBUS_BLOCK_DATA without handling I2C_M_RECV_LEN
> in p3h2x4x_tp_i2c_xfer_msg() corrupt SMBus block reads and leak stack memory?
>

Please check this one.

Frank

> Because p3h2x4x_tp_i2c_algorithm has no .smbus_xfer callback,
> i2c_smbus_read_block_data() and I2C_SMBUS_BLOCK_DATA read ioctls go through
> i2c_smbus_xfer_emulated(), which sets msg[1].flags |= I2C_M_RECV_LEN and
> msg[1].len = 1.  p3h2x4x_tp_i2c_xfer_msg() ignores I2C_M_RECV_LEN and reads
> only 1 byte (the block length N) into msg[1].buf[0], after which
> i2c_smbus_xfer_emulated() copies N unwritten bytes from msg[1].buf[1..N] to
> the caller (zeroes from the bounce buffer, or uninitialized stack bytes from
> msgbuf1 if kzalloc() in i2c_smbus_try_get_dmabuf() fails).
>
> Also, omitting I2C_FUNC_SMBUS_EMUL leaves standard byte, word, and I2C-block
> SMBus operations unadvertised, preventing SMBus and hwmon drivers from using
> the adapter.
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20261112124437.3367252-1-lakshay.piplani@nxp.com?part=3
